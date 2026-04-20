-- ========================================
-- Revenue Analysis Queries
-- ========================================

-- 1. Total Revenue
SELECT 
    SUM(total_amount) AS total_revenue
FROM Finance.Payment;

-- 2. Revenue by Branch
SELECT 
    b.branch_name,
    SUM(p.total_amount) AS revenue
FROM Finance.Payment p
JOIN Operation.Branch b ON p.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY revenue DESC;

-- 3. Revenue by Vehicle Class
SELECT 
    vc.class_name,
    SUM(p.total_amount) AS revenue
FROM Finance.Payment p
JOIN Rental.Rental r ON p.rental_id = r.rental_id
JOIN Vehicle.Vehicle v ON r.vehicle_id = v.vehicle_id
JOIN Vehicle.Vehicle_Class vc ON v.vehicle_class_id = vc.vehicle_class_id
GROUP BY vc.class_name
ORDER BY revenue DESC;

-- 4. Monthly Revenue Trend
SELECT 
    YEAR(payment_date) AS year,
    MONTH(payment_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM Finance.Payment
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY year, month;