-- ==========================================
-- CLASSICMODELS SALES ANALYSIS PROJECT
-- SECTION 2: ORDER ANALYSIS
-- ==========================================
-- ==========================================
-- ORDER STATUS ANALYSIS
-- ==========================================
-- TOTAL ORDERS BY STATUS
-- TOTAL ORDERS BY YEAR
SELECT
    YEAR(orderDate) AS order_year,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY
    YEAR(orderDate)
ORDER BY
    order_year;

SELECT
    MONTH(orderDate) AS month_number,
    MONTHNAME(orderDate) AS month_name,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY
    MONTH(orderDate),
    MONTHNAME(orderDate)
ORDER BY
    total_orders DESC;