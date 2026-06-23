-- ==========================================
-- CLASSICMODELS SALES ANALYSIS PROJECT
-- SECTION 1: DATA EXPLORATION
-- ==========================================
-- ==========================================
-- DATABASE OVERVIEW
-- ==========================================
-- Show all tables in the database
SHOW TABLES;

-- ==========================================
-- TABLE STRUCTURE EXPLORATION
-- ==========================================
-- CUSTOMER TABLE STRUCTURE
DESCRIBE customers;

-- Total Customers
SELECT
    COUNT(*) AS total_customers
FROM
    customers;

-- Total Orders
SELECT
    COUNT(*) AS total_orders
FROM
    orders;

-- Total Products
SELECT
    COUNT(*) AS total_products
FROM
    products;

-- Total Payments
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
-- CREDIT LIMIT EXPLRATION
-- ==========================================
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
    count(*) AS customer_with_no_credit
FROM
    customers
WHERE
    creditLimit = 0;