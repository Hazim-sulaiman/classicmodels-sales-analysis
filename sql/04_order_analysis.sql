-- ==========================================
-- CLASSICMODELS SALES ANALYSIS PROJECT
-- SECTION 2: ORDER ANALYSIS
-- ==========================================
-- ==========================================
-- ORDER STATUS ANALYSIS
-- ==========================================
SELECT
    STATUS,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY
    STATUS
ORDER BY
    total_orders DESC;

-- ORDERS BY YEAR
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

-- MONTHLY ORDER TREND BY YEAR
SELECT
    YEAR(orderDate) AS order_year,
    MONTH(orderDate) AS month_number,
    MONTHNAME(orderDate) AS month_name,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY
    YEAR(orderDate),
    MONTH(orderDate),
    MONTHNAME(orderDate)
ORDER BY
    order_year,
    month_number;

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

-- CUSTOMERS WITHOUT ORDERS
SELECT
    c.customerNumber,
    c.customerName
FROM
    orders AS o
    RIGHT JOIN customers AS c ON o.customernumber = c.customernumber
WHERE
    o.orderdate IS NULL;

-- ORDERS BY QUARTER
SELECT
    QUARTER(orderdate),
    count(*) AS total_orders
FROM
    orders
GROUP BY
    QUARTER(orderDate)
ORDER BY
    total_orders DESC;

-- AVERAGE ORDERS PER CUSTOMER
SELECT
    ROUND(AVG(total_orders), 2) AS average_orders_per_customer
FROM
    (
        SELECT
            customerNumber,
            COUNT(*) AS total_orders
        FROM
            orders
        GROUP BY
            customerNumber
    ) AS customer_orders;

-- Late Shipment Rate
SELECT
    ROUND(
        SUM(
            CASE
                WHEN shippedDate > requiredDate THEN 1
                ELSE 0
            END
        ) * 100 / COUNT(*),
        2
    ) AS late_shipment_percentage
FROM
    orders
WHERE
    shippedDate IS NOT NULL;

-- ORDERS BY DAY OF WEEK
SELECT
    count(*) AS total_orders,
    dayname(orderdate)
FROM
    orders
GROUP BY
    dayname(orderdate)
ORDER BY
    total_orders DESC;

-- MONTHLY ORDER TREND BY YEAR
SELECT
    YEAR(orderDate) AS order_year,
    MONTH(orderDate) AS month_number,
    MONTHNAME(orderDate) AS month_name,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY
    YEAR(orderDate),
    MONTH(orderDate),
    MONTHNAME(orderDate)
ORDER BY
    order_year,
    month_number;

-- CUSTOMER ORDER DISTRIBUTION
SELECT
    c.customerNumber,
    c.customerName,
    COUNT(o.orderNumber) AS total_orders
FROM
    customers AS c
    LEFT JOIN orders AS o ON c.customerNumber = o.customerNumber
GROUP BY
    c.customerNumber,
    c.customerName
ORDER BY
    total_orders DESC;

-- FIRST VS REPEAT CUSTOMERS
SELECT
    c.customerNumber,
    c.customerName,
    COUNT(o.orderNumber) AS total_orders,
    CASE
        WHEN COUNT(o.orderNumber) = 1 THEN 'First Order'
        ELSE 'Repeat Order'
    END AS order_type
FROM
    customers AS c
    LEFT JOIN orders AS o ON c.customerNumber = o.customerNumber
GROUP BY
    c.customerNumber,
    c.customerName
ORDER BY
    total_orders DESC;