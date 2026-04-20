
-- Query 1: Total Revenue by Month
SELECT order_month, 
       ROUND(SUM(payment_value), 2) AS total_revenue,
       COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Query 2: Top 5 States by Number of Orders
SELECT customer_state,
       COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(payment_value), 2) AS total_revenue
FROM orders
GROUP BY customer_state
ORDER BY total_orders DESC
LIMIT 5;

-- Query 3: Average Order Value per Customer
SELECT customer_unique_id,
       COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(payment_value), 2) AS total_spent,
       ROUND(AVG(payment_value), 2) AS avg_order_value
FROM orders
GROUP BY customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;

-- Query 4: Revenue by Product Category
SELECT product_category_name_english,
       COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(payment_value), 2) AS total_revenue
FROM orders
GROUP BY product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 5: Average Delivery Days by State
SELECT customer_state,
       ROUND(AVG(delivery_days), 1) AS avg_delivery_days,
       COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE delivery_days IS NOT NULL
GROUP BY customer_state
ORDER BY avg_delivery_days ASC;

-- Query 6: Revenue by Seller City
SELECT seller_city,
       COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(payment_value), 2) AS total_revenue
FROM orders
GROUP BY seller_city
ORDER BY total_revenue DESC
LIMIT 10;
