-- ========================================
-- Revenue Analysis Queries
--
-- NOTE: an earlier version of this file queried a "Finance.Payment"
-- table that does not exist in the schema (see 04_Database_Construction/
-- 01_ddl_schema.sql). Revenue is billed through Finance.Invoice
-- (branch_id, total_amount, invoice_date), which is what these
-- queries use. Finance.Rental_Payment records how an invoice was
-- actually paid, not the billed amount itself.
-- ========================================

-- 1. Total Revenue
SELECT
    SUM(total_amount) AS total_revenue
FROM Finance.Invoice;

-- 2. Revenue by Branch
SELECT
    b.branch_name,
    SUM(inv.total_amount) AS revenue
FROM Finance.Invoice inv
JOIN Operation.Branch b ON inv.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY revenue DESC;

-- 3. Revenue by Vehicle Class
SELECT
    vc.class_name,
    SUM(inv.total_amount) AS revenue
FROM Finance.Invoice inv
JOIN Rental.Rental r ON inv.rental_id = r.rental_id
JOIN Vehicle.Vehicle v ON r.vehicle_id = v.vehicle_id
JOIN Vehicle.Vehicle_Class vc ON v.vehicle_class_id = vc.vehicle_class_id
GROUP BY vc.class_name
ORDER BY revenue DESC;

-- 4. Monthly Revenue Trend
SELECT
    YEAR(invoice_date) AS year,
    MONTH(invoice_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM Finance.Invoice
GROUP BY YEAR(invoice_date), MONTH(invoice_date)
ORDER BY year, month;

-- 5. Revenue by Rental Duration Type
SELECT
    res.rental_duration_type,
    COUNT(DISTINCT r.rental_id) AS completed_rentals,
    SUM(inv.total_amount) AS revenue,
    CAST(SUM(inv.total_amount) / NULLIF(COUNT(DISTINCT r.rental_id), 0) AS DECIMAL(10,2)) AS avg_revenue_per_rental
FROM Finance.Invoice inv
JOIN Rental.Rental r ON inv.rental_id = r.rental_id
JOIN Rental.Reservation res ON r.reservation_id = res.reservation_id
GROUP BY res.rental_duration_type
ORDER BY revenue DESC;
