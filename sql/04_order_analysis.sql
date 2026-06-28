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

-- TOP 10 CUSTOMERS BY NUMBER OF ORDERS
SELECT
    c.customerNumber,
    c.customerName,
    COUNT(o.orderNumber) AS total_orders
FROM
    customers AS c
    INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
GROUP BY
    c.customerNumber,
    c.customerName
ORDER BY
    total_orders DESC
LIMIT
    10;

--HIGHEST COUNTRIES BY ORDERS
SELECT
    c.country,
    COUNT(o.orderNumber) AS total_orders
FROM
    customers AS c
    INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
GROUP BY
    c.country
ORDER BY
    total_orders DESC
LIMIT
    10;

-- ORDERS BY SALES REPRESENTATIVE
SELECT
    e.employeeNumber,
    e.firstName,
    e.lastName,
    COUNT(o.orderNumber) AS total_orders
FROM
    customers AS c
    INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
    INNER JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY
    e.employeeNumber,
    e.firstName,
    e.lastName
ORDER BY
    total_orders DESC;

-- customer whith null orders
SELECT
    c.customerNumber,
    c.customerName
FROM
    orders AS o
    RIGHT JOIN customers AS c ON o.customernumber = c.customernumber
WHERE
    o.orderdate IS NULL;

--
-- high quarter orders
SELECT
    QUARTER(orderdate),
    count(*) AS total_orders
FROM
    orders
GROUP BY
    QUARTER(orderDate)
ORDER BY
    total_orders DESC;