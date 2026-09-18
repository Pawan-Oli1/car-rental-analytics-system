-- ========================================
-- Customer Insights Queries
--
-- NOTE: this file was empty in an earlier version of the repo.
-- Written against the schema in 04_Database_Construction/01_ddl_schema.sql.
-- ========================================

-- 1. Top 10 Customers by Total Spend
SELECT TOP 10
    c.customer_id,
    c.first_name + ' ' + c.last_name AS customer_name,
    COUNT(DISTINCT inv.invoice_id) AS invoices,
    SUM(inv.total_amount) AS total_spend
FROM Finance.Invoice inv
JOIN Customer.Customer c ON inv.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spend DESC;

-- 2. Customer Segmentation: One-Time vs. Repeat Renters
SELECT
    CASE WHEN rental_count = 1 THEN 'One-Time' ELSE 'Repeat' END AS customer_segment,
    COUNT(*) AS customer_count,
    SUM(rental_count) AS total_completed_rentals
FROM (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM Rental.Rental
    WHERE rental_status = 'Completed'
    GROUP BY customer_id
) AS per_customer
GROUP BY CASE WHEN rental_count = 1 THEN 'One-Time' ELSE 'Repeat' END;

-- 3. Revenue and Rental Volume by Customer Age Bracket
--    (validates the BR-02 young-renter surcharge segment against actual
--    rental volume and spend)
SELECT
    CASE
        WHEN DATEDIFF(YEAR, c.date_of_birth, GETDATE()) BETWEEN 20 AND 24 THEN '20-24 (Young Renter)'
        WHEN DATEDIFF(YEAR, c.date_of_birth, GETDATE()) BETWEEN 25 AND 34 THEN '25-34'
        WHEN DATEDIFF(YEAR, c.date_of_birth, GETDATE()) BETWEEN 35 AND 49 THEN '35-49'
        ELSE '50+'
    END AS age_bracket,
    COUNT(DISTINCT r.rental_id) AS completed_rentals,
    SUM(inv.total_amount) AS revenue
FROM Rental.Rental r
JOIN Customer.Customer c ON r.customer_id = c.customer_id
JOIN Finance.Invoice inv ON inv.rental_id = r.rental_id
WHERE r.rental_status = 'Completed'
GROUP BY
    CASE
        WHEN DATEDIFF(YEAR, c.date_of_birth, GETDATE()) BETWEEN 20 AND 24 THEN '20-24 (Young Renter)'
        WHEN DATEDIFF(YEAR, c.date_of_birth, GETDATE()) BETWEEN 25 AND 34 THEN '25-34'
        WHEN DATEDIFF(YEAR, c.date_of_birth, GETDATE()) BETWEEN 35 AND 49 THEN '35-49'
        ELSE '50+'
    END
ORDER BY revenue DESC;

-- 4. Customers with Rental-Time Extra Charges (late fees, cleaning, damage, etc.)
--    Sourced from Finance.Rental_Charge_Detail, since these post-rental
--    charges are not currently rolled into Finance.Invoice_Line
--    (see the DDL/DML review notes on Invoice vs. Rental.rental_total).
SELECT
    c.customer_id,
    c.first_name + ' ' + c.last_name AS customer_name,
    ct.charge_name,
    COUNT(*) AS times_charged,
    SUM(cr.charge_unit_rate * rcd.charge_quantity) AS total_charged
FROM Finance.Rental_Charge_Detail rcd
JOIN Rental.Rental r ON rcd.rental_id = r.rental_id
JOIN Customer.Customer c ON r.customer_id = c.customer_id
JOIN Finance.Charge_Rate cr ON rcd.charge_rate_id = cr.charge_rate_id
JOIN Finance.Charge_Type ct ON cr.charge_type_id = ct.charge_type_id
GROUP BY c.customer_id, c.first_name, c.last_name, ct.charge_name
ORDER BY total_charged DESC;

-- 5. Average Booking Lead Time (days between reservation creation and pickup)
SELECT
    CAST(AVG(DATEDIFF(HOUR, reservation_date, pickup_datetime) / 24.0) AS DECIMAL(6,2)) AS avg_lead_time_days,
    MIN(DATEDIFF(HOUR, reservation_date, pickup_datetime) / 24.0) AS min_lead_time_days,
    MAX(DATEDIFF(HOUR, reservation_date, pickup_datetime) / 24.0) AS max_lead_time_days
FROM Rental.Reservation
WHERE reservation_status IN ('Completed', 'Confirmed');
