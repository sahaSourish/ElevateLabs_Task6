# creating table
CREATE TABLE online_sales (
    order_id VARCHAR(50) primary key,
    customer_id VARCHAR(50),
    order_date date,
    amount DECIMAL(6, 2),
    product_id VARCHAR(100)
);

# to show all the data present in the table created
SELECT * FROM sourishdb.online_sales;

#Total Orders by Customers
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_spent
FROM online_sales
GROUP BY customer_id
ORDER BY total_spent DESC;

# Average Order Amount
SELECT 
    AVG(amount) AS average_order_amount
FROM online_sales;

# Monthly Revenue & Order Volume
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

# Top Month by Revenue
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY order_year, order_month
ORDER BY total_revenue DESC;

# Top 5 Products by Revenue
SELECT 
    product_id,
    COUNT(*) AS total_orders,
    SUM(amount) AS revenue
FROM online_sales
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 5;

# Orders in a Date Range
SELECT *
FROM online_sales
WHERE order_date BETWEEN '2022-12-01' AND '2022-12-15';

# Daily Sales Trend
SELECT 
    order_date,
    SUM(amount) AS daily_sales
FROM online_sales
GROUP BY order_date
ORDER BY order_date;
