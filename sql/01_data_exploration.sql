-- ==========================================
-- CLASSICMODELS SALES ANALYSIS PROJECT
-- SECTION 1: DATA EXPLORATION
-- ==========================================
-- ==========================================
-- DATABASE OVERVIEW
-- ==========================================
-- SHOW ALL TABLES IN THE DATABASE
SHOW TABLES;

-- ==========================================
-- TABLE STRUCTURE EXPLORATION
-- ==========================================
-- CUSTOMER TABLE STRUCTURE
DESCRIBE customers;

-- TOTAL CUSTOMERS
SELECT
    COUNT(*) AS total_customers
FROM
    customers;

-- TOTAL ORDERS
SELECT
    COUNT(*) AS total_orders
FROM
    orders;

-- TOTAL PRODUCTS
SELECT
    COUNT(*) AS total_products
FROM
    products;

-- TOTAL PAYMENTS
SELECT
    COUNT(*) AS total_payments
FROM
    payments;

-- ==========================================
-- CUSTOMER EXPLORATION
-- ==========================================
-- CUSTOMERS BY COUNTRY
SELECT
    country,
    COUNT(*) AS total_customers
FROM
    customers
GROUP BY
    country
ORDER BY
    total_customers DESC;

-- ==========================================
-- CREDIT LIMIT EXPLORATION
-- ==========================================
-- TOP CUSTOMERS BY CREDIT LIMIT
SELECT
    customerName,
    country,
    creditLimit
FROM
    customers
ORDER BY
    creditLimit DESC;

-- CREDIT LIMIT STATISTICS
SELECT
    MAX(creditLimit) AS max_credit_limit,
    MIN(creditLimit) AS min_credit_limit,
    ROUND(AVG(creditLimit), 2) AS avg_credit_limit
FROM
    customers;

-- CUSTOMERS WITH NO CREDIT LIMIT
SELECT
    COUNT(*) AS customers_with_no_credit
FROM
    customers
WHERE
    creditLimit = 0;

-- CUSTOMERS BY CREDIT LIMIT RANGE
SELECT
    CASE
        WHEN creditLimit >= 100000 THEN 'High Credit'
        WHEN creditLimit >= 50000 THEN 'Medium Credit'
        WHEN creditLimit > 0 THEN 'Low Credit'
        ELSE 'No Credit'
    END AS credit_limit_range,
    COUNT(*) AS total_customers
FROM
    customers
GROUP BY
    credit_limit_range
ORDER BY
    total_customers DESC;