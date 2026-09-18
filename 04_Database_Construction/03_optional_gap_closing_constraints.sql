--============================================================
-- Optional Gap-Closing Constraints (apply separately, after review)
--
-- These implement BR-44, BR-48, and BR-49 from business_rules.md.
-- They are kept OUT of 01_ddl_schema.sql on purpose: 02_dml_sample_data.sql
-- will not load cleanly underneath them as the sample data currently
-- stands.
--
-- CONCRETE COMPATIBILITY ISSUE FOUND IN THE SAMPLE DATA:
--   Of the 112 sample vehicles, 10 have registration_status = 'Expired'
--   in Vehicle.Vehicle_Registration, and several of the 'Active' rows
--   have registration_expiry_date values already in the past relative
--   to today (the dataset was authored against an earlier "current"
--   date). trg_RequireActiveRegistration_Reservation below would reject
--   the entire Reservation insert batch the moment it hits a reservation
--   for one of those vehicles, and Vehicle.trg_EnforceStatusRules would
--   likewise block any UPDATE that tries to move one of those vehicles
--   to 'Available' without a currently-valid insurance row.
--
-- To use these triggers with the existing sample data, first refresh
-- the stale dates (e.g. shift every date column in the DML forward by
-- the same interval, or update Vehicle_Registration/Vehicle_Insurance
-- so every vehicle referenced by a reservation has a currently-active,
-- unexpired record) -- or apply this script to a fresh database before
-- loading any sample data that depends on lapsed records.
--============================================================


--------------------------------------------------------------
-- BR-44 + BR-48: Vehicle status transitions and the insurance
-- precondition are combined into ONE trigger on purpose. Two
-- separate AFTER UPDATE triggers on the same table fire in an
-- order SQL Server does not guarantee, which is exactly the
-- fragility already present elsewhere in this schema (see the
-- three independent AFTER UPDATE triggers on Rental.Rental in
-- 01_ddl_schema.sql). Keeping related checks in a single trigger
-- avoids adding to that problem.
--------------------------------------------------------------
CREATE OR ALTER TRIGGER Vehicle.trg_EnforceStatusRules
ON Vehicle.Vehicle
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Nothing to check if status didn't change on any row
    IF NOT EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.vehicle_id = d.vehicle_id
        WHERE i.status <> d.status
    )
        RETURN;

    ----------------------------------------------------------
    -- BR-44: status change must follow the allowed transition map
    --   Available   -> Reserved, Rented, Maintenance
    --   Reserved    -> Rented, Available
    --   Rented      -> Available, Maintenance
    --   Maintenance -> Available
    --   Retired     -> (no transitions out)
    --
    -- Note: the original business-rule draft listed a
    -- "Reserved -> Cancelled" transition, but Vehicle.status has
    -- no 'Cancelled' value (see CK_Vehicle_Status) -- a cancelled
    -- reservation returns the vehicle to 'Available' (BR-09/BR-10),
    -- so that's the transition modeled here.
    ----------------------------------------------------------
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.vehicle_id = d.vehicle_id
        WHERE i.status <> d.status
          AND NOT EXISTS (
              SELECT 1
              FROM (VALUES
                  ('Available',  'Reserved'),
                  ('Available',  'Rented'),
                  ('Available',  'Maintenance'),
                  ('Reserved',   'Rented'),
                  ('Reserved',   'Available'),
                  ('Rented',     'Available'),
                  ('Rented',     'Maintenance'),
                  ('Maintenance','Available')
              ) AS allowed(from_status, to_status)
              WHERE allowed.from_status = d.status
                AND allowed.to_status   = i.status
          )
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50002, 'ERROR: Invalid vehicle status transition (BR-44). See Vehicle.trg_EnforceStatusRules for the allowed transition map.', 1;
    END

    ----------------------------------------------------------
    -- BR-48: moving a vehicle TO 'Available' requires at least one
    -- insurance record that is currently active and unexpired
    ----------------------------------------------------------
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.vehicle_id = d.vehicle_id
        WHERE i.status = 'Available'
          AND d.status <> 'Available'
          AND NOT EXISTS (
              SELECT 1
              FROM Vehicle.Vehicle_Insurance vi
              WHERE vi.vehicle_id = i.vehicle_id
                AND vi.policy_status = 'Active'
                AND vi.policy_expiry_date > GETDATE()
          )
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50003, 'ERROR: Vehicle cannot be set to Available without at least one active, unexpired insurance policy (BR-48).', 1;
    END
END;
GO


--------------------------------------------------------------
-- BR-49: a vehicle cannot be assigned to a reservation or rental
-- unless its registration is active and unexpired. Enforced at
-- both points where a vehicle_id is assigned, for defense in depth.
--------------------------------------------------------------
CREATE OR ALTER TRIGGER Rental.trg_RequireActiveRegistration_Reservation
ON Rental.Reservation
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1
            FROM Vehicle.Vehicle_Registration vr
            WHERE vr.vehicle_id = i.vehicle_id
              AND vr.registration_status = 'Active'
              AND vr.registration_expiry_date >= CAST(GETDATE() AS DATE)
        )
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50004, 'ERROR: Vehicle cannot be assigned to a reservation without active, unexpired registration (BR-49).', 1;
    END
END;
GO

CREATE OR ALTER TRIGGER Rental.trg_RequireActiveRegistration_Rental
ON Rental.Rental
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1
            FROM Vehicle.Vehicle_Registration vr
            WHERE vr.vehicle_id = i.vehicle_id
              AND vr.registration_status = 'Active'
              AND vr.registration_expiry_date >= CAST(GETDATE() AS DATE)
        )
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50005, 'ERROR: Vehicle cannot be assigned to a rental without active, unexpired registration (BR-49).', 1;
    END
END;
GO
