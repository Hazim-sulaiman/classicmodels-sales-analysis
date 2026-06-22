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
-- customer table structure
DESCRIBE customers;
-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;
-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;
-- Total Products
SELECT COUNT(*) AS total_products
FROM products;
-- Total Payments
SELECT COUNT(*) AS total_payments
FROM payments;