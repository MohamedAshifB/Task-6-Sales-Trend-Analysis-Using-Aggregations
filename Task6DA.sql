CREATE DATABASE online_sales;

USE online_sales;

CREATE TABLE online_sales (
    transaction_id INT,
    date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(255),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
    region VARCHAR(100),
    payment_method VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month
FROM 
    online_sales
GROUP BY 
    YEAR(date), MONTH(date);
SHOW COLUMNS FROM online_sales;


SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(amount) AS monthly_revenue
FROM 
    online_sales
GROUP BY 
    YEAR(date), MONTH(date)
ORDER BY 
    year, month;
    
    show columns from online_sales;

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(total_revenue) AS monthly_revenue
FROM 
    online_sales
GROUP BY 
    DATE_FORMAT(date, '%Y-%m')
ORDER BY 
    monthly_revenue DESC
LIMIT 3;

SELECT 
    product_category,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    product_category
ORDER BY 
    total_revenue DESC;

SELECT 
    MONTH(date) AS order_month,
    SUM(total_revenue) AS monthly_revenue
FROM 
    online_sales
WHERE 
    YEAR(date) = 2023
GROUP BY 
    MONTH(date)
ORDER BY 
    order_month;

SELECT 
    region,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS order_count
FROM 
    online_sales
GROUP BY 
    region
ORDER BY 
    total_revenue DESC;
    
    
    SELECT 
    payment_method,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    payment_method
ORDER BY 
    total_revenue DESC;