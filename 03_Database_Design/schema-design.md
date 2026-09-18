# Database Schema Design

## Overview

The Car Rental Analytics & Management System is built as a single SQL Server
database (`CarRentalDB`) organized into five schemas: `Vehicle`, `Customer`,
`Rental`, `Finance`, and `Operation`. Each schema groups the tables for one
area of the business; there is no separate "Employee" schema — staff records
live in `Operation.Employee`.

The full, authoritative table definitions are in
[`04_Database_Construction/01_ddl_schema.sql`](../04_Database_Construction/01_ddl_schema.sql),
column-by-column documentation is in
[`02_Data_Model/data-dictionary.md`](../02_Data_Model/data-dictionary.md)
(generated directly from the DDL), and the rules the schema enforces are in
[`01_Business_Context/business_rules.md`](../01_Business_Context/business_rules.md).
This document is the plain-language summary of how those pieces fit together;
it does not replace them.

The design supports both operational workflows (booking, checkout, billing)
and analytical reporting (see `05_SQL_Analytics/`).

---

## Schemas at a Glance

| Schema | Covers |
|---|---|
| `Vehicle` | Fleet inventory, classes/types/fuel lookups, purchase, registration, insurance, warranty, inspections, damage, maintenance, inter-branch transfers |
| `Customer` | Renter profiles, driver's licenses, addresses, saved payment methods |
| `Rental` | Reservations and the rentals created from them |
| `Finance` | Rates, charges, taxes, promotions, estimates, invoices, payments, refunds |
| `Operation` | Branches, operating hours, employees and roles, expenses |

---

## Core Business Flow

1. A customer creates a **reservation** for a vehicle at a pickup branch (optionally a different drop-off branch), for an hourly/daily/weekly/monthly duration.
2. A priced **rental estimate** can be generated for that reservation (base rate + surcharges + tax − discounts), pulling from `Finance.Vehicle_Rate` for the vehicle's class and branch.
3. At pickup, the reservation is fulfilled into a **rental** (`Rental.Rental`), linked to the customer and the vehicle. A check-out inspection is recorded.
4. During and at the end of the rental, extra charges (late fees, cleaning, damage, fuel, mileage, etc.) can be billed against it, and a check-in inspection is recorded at return.
5. When the rental is marked `Completed`, a trigger (`trg_GenerateInvoice_AfterRentalCompletion`) automatically generates the **invoice** — subtotal, tax, discount, and total — from the reservation's estimate and any rental-time charges.
6. **Payment(s)** are recorded against the rental (a trigger auto-inserts an initial payment on completion; additional payments/methods can be recorded manually), and **refunds** can be issued against a payment, capped at the amount originally paid (BR-40).

---

## Key Entity Relationships

**Reservation & Rental**
- `Rental.Reservation` → `Customer.Customer` (many-to-one)
- `Rental.Reservation` → `Vehicle.Vehicle` (many-to-one)
- `Rental.Reservation` → `Operation.Branch`, twice — pickup branch (required) and drop-off branch (optional) (many-to-one each)
- `Rental.Rental` → `Rental.Reservation` (one-to-one — enforced by `UQ_Rental_ReservationId`; a reservation produces at most one rental)
- `Rental.Rental` → `Customer.Customer` (many-to-one)
- `Rental.Rental` → `Vehicle.Vehicle` (many-to-one)

**Vehicle**
- `Vehicle.Vehicle` → `Vehicle.Vehicle_Class`, `Vehicle.Vehicle_Type`, `Vehicle.Fuel_Type`, `Vehicle.Vehicle_Purchase`, `Operation.Branch` (many-to-one each — every vehicle belongs to exactly one class/type/fuel type, has one purchase record, and is currently assigned to one branch)
- `Vehicle.Vehicle` → `Vehicle.Vehicle_Registration`, `Vehicle.Vehicle_Insurance`, `Vehicle.Vehicle_Warranty` (one-to-many — a vehicle can have a history of these over time)
- `Vehicle.Vehicle` → `Vehicle.Inspection` → `Vehicle.Damage` (one-to-many, then one-to-many — each inspection can log multiple damage findings)
- `Vehicle.Vehicle` → `Vehicle.Maintenance_Record` (one-to-many), bridged to the triggering inspection via `Vehicle.Maintenance_Inspection`
- `Vehicle.Vehicle_Transfer` records inter-branch moves (many-to-one to both `Vehicle.Vehicle` and `Operation.Branch`)

**Finance**
- `Rental.Reservation` → `Finance.Rental_Estimate` (one-to-many), which draws its rate from `Finance.Vehicle_Rate` and its applied charges/taxes/promotions from the `Finance.Estimate_Charge` / `Finance.Estimate_Tax` / `Finance.Estimate_Promotion` bridge tables
- `Rental.Rental` → `Finance.Rental_Charge_Detail` (one-to-many — actual charges billed during/after the rental, e.g. late fees, damage, fuel, mileage)
- `Rental.Rental` → `Finance.Invoice` (generated once, by trigger, when the rental completes)
- `Rental.Rental` → `Finance.Rental_Payment` (one-to-many — a rental can have more than one payment recorded against it)
- `Finance.Rental_Payment` → `Finance.Refund` (one-to-many, capped by BR-40)
- `Finance.Invoice` → `Finance.Invoice_Line` (one-to-many line items)

**Customer & Operation**
- `Customer.Customer` → `Customer.License`, `Customer.Customer_Address`, `Customer.Customer_Payment_Method` (one-to-many each)
- `Operation.Branch` → `Operation.Branch_Address`, `Operation.Operating_Hours`, `Operation.Employee`, `Operation.Branch_Expenses` (one-to-many each)
- `Operation.Employee` → `Operation.Employee_Role` (many-to-one)

---

## Design Highlights

- Five focused schemas rather than one flat namespace, so related tables are easy to find and permission on
- Consistent use of surrogate `IDENTITY` primary keys, with foreign keys enforcing every relationship above at the database level
- Enum-style columns (`status`, `*_status`, `*_type`) are backed by `CHECK` constraints rather than left as free text, so invalid states can't be inserted
- Financial correctness is enforced procedurally as well as structurally: `usp_CreateRentalEstimate`, `usp_FinalizeRental`, and `trg_GenerateInvoice_AfterRentalCompletion` compute pricing and generate invoices consistently rather than relying on the application layer to get the math right
- `03_optional_gap_closing_constraints.sql` documents two rules (BR-44/48/49) that are captured here but were deliberately **not** added to the base schema, because portions of the sample data predate them — see that file's header for the specific rows

---

## ER Diagram

See [`er-diagram.pdf`](./er-diagram.pdf) for the full entity-relationship diagram.
