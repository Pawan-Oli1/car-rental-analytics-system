-- ========================================
-- Fleet Utilization Queries
--
-- NOTE: this file was empty in an earlier version of the repo.
-- Written against the schema in 04_Database_Construction/01_ddl_schema.sql.
-- ========================================

DECLARE @WindowStart DATE = '2025-12-01';
DECLARE @WindowEnd   DATE = '2026-06-30';

-- 1. Utilization Rate by Vehicle Class
--    (total rented days across rentals overlapping the window)
--    / (fleet size in that class * days in window)
SELECT
    vc.class_name,
    COUNT(DISTINCT v.vehicle_id) AS fleet_size,
    SUM(DATEDIFF(DAY, r.rental_start, ISNULL(r.rental_end, @WindowEnd))) AS total_rented_days,
    DATEDIFF(DAY, @WindowStart, @WindowEnd) AS window_days,
    CAST(
        SUM(DATEDIFF(DAY, r.rental_start, ISNULL(r.rental_end, @WindowEnd))) * 100.0
        / NULLIF(COUNT(DISTINCT v.vehicle_id) * DATEDIFF(DAY, @WindowStart, @WindowEnd), 0)
    AS DECIMAL(5,2)) AS utilization_pct
FROM Vehicle.Vehicle v
JOIN Vehicle.Vehicle_Class vc ON v.vehicle_class_id = vc.vehicle_class_id
LEFT JOIN Rental.Rental r
    ON r.vehicle_id = v.vehicle_id
   AND r.rental_start <= @WindowEnd
   AND ISNULL(r.rental_end, @WindowEnd) >= @WindowStart
GROUP BY vc.class_name
ORDER BY utilization_pct DESC;

-- 2. Top 10 Most-Utilized Vehicles (by completed rental count)
SELECT TOP 10
    v.vehicle_id,
    v.make,
    v.model,
    vc.class_name,
    b.branch_name AS current_branch,
    COUNT(r.rental_id) AS completed_rentals,
    SUM(DATEDIFF(DAY, r.rental_start, r.rental_end)) AS total_days_rented
FROM Rental.Rental r
JOIN Vehicle.Vehicle v ON r.vehicle_id = v.vehicle_id
JOIN Vehicle.Vehicle_Class vc ON v.vehicle_class_id = vc.vehicle_class_id
JOIN Operation.Branch b ON v.branch_id = b.branch_id
WHERE r.rental_status = 'Completed'
GROUP BY v.vehicle_id, v.make, v.model, vc.class_name, b.branch_name
ORDER BY completed_rentals DESC, total_days_rented DESC;

-- 3. Idle Vehicles (never rented)
SELECT
    v.vehicle_id,
    v.make,
    v.model,
    vc.class_name,
    b.branch_name,
    v.status,
    v.created_at
FROM Vehicle.Vehicle v
JOIN Vehicle.Vehicle_Class vc ON v.vehicle_class_id = vc.vehicle_class_id
JOIN Operation.Branch b ON v.branch_id = b.branch_id
WHERE NOT EXISTS (
    SELECT 1 FROM Rental.Rental r WHERE r.vehicle_id = v.vehicle_id
)
ORDER BY b.branch_name, v.vehicle_id;

-- 4. Average Rental Duration by Vehicle Class (completed rentals only)
SELECT
    vc.class_name,
    COUNT(r.rental_id) AS completed_rentals,
    AVG(DATEDIFF(DAY, r.rental_start, r.rental_end) * 1.0) AS avg_rental_duration_days
FROM Rental.Rental r
JOIN Vehicle.Vehicle v ON r.vehicle_id = v.vehicle_id
JOIN Vehicle.Vehicle_Class vc ON v.vehicle_class_id = vc.vehicle_class_id
WHERE r.rental_status = 'Completed'
GROUP BY vc.class_name
ORDER BY avg_rental_duration_days DESC;

-- 5. Current Fleet Status Snapshot
SELECT
    status,
    COUNT(*) AS vehicle_count,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS DECIMAL(5,2)) AS pct_of_fleet
FROM Vehicle.Vehicle
GROUP BY status
ORDER BY vehicle_count DESC;

-- 6. Vehicles Currently Open in Maintenance, Longest-Running First
SELECT
    v.vehicle_id,
    v.make,
    v.model,
    mr.maintenance_type,
    mr.maintenance_status,
    mr.maintenance_date,
    DATEDIFF(DAY, mr.maintenance_date, GETDATE()) AS days_in_maintenance
FROM Vehicle.Maintenance_Record mr
JOIN Vehicle.Vehicle v ON mr.vehicle_id = v.vehicle_id
WHERE mr.maintenance_status IN ('Pending', 'Scheduled')
ORDER BY days_in_maintenance DESC;
