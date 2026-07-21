-- Drop and Create Database
DROP DATABASE IF EXISTS Online_Retail_Store;

CREATE DATABASE Online_Retail_Store;
USE Online_Retail_Store;

-- ==========================================
-- Customers Table
-- ==========================================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50)
);

-- ==========================================
-- Products Table
-- ==========================================
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- ==========================================
-- Orders Table
-- ==========================================
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ==========================================
-- Order Details Table
-- ==========================================
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ==========================================
-- Payments Table
-- ==========================================
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ==========================================
-- Insert Customers
-- ==========================================
INSERT INTO customers (customer_id, name, email, phone, city)
VALUES
(1, 'A', 'a@gmail.com', '1234567890', 'Delhi'),
(2, 'B', 'b@gmail.com', '9876543210', 'Jaipur'),
(3, 'C', 'c@gmail.com', '9123456780', 'Jodhpur');

-- ==========================================
-- Insert Products
-- ==========================================
INSERT INTO products
VALUES
(101, 'Laptop', 'Electronics', 55000.00, 10),
(102, 'Mouse', 'Electronics', 500.00, 50),
(103, 'Keyboard', 'Electronics', 1500.00, 30),
(104, 'Headphone', 'Electronics', 2500.00, 20);

-- ==========================================
-- Insert Orders
-- ==========================================
INSERT INTO orders
VALUES
(1001, 1, '2026-07-10', 56000.00),
(1002, 2, '2026-07-11', 2500.00),
(1003, 3, '2026-07-12', 500.00);

-- ==========================================
-- Insert Order Details
-- ==========================================
INSERT INTO order_details
VALUES
(1, 1001, 101, 1, 55000.00),
(2, 1001, 102, 2, 500.00),
(3, 1002, 104, 1, 2500.00),
(4, 1003, 102, 1, 500.00);

-- ==========================================
-- Insert Payments
-- ==========================================
INSERT INTO payments
VALUES
(1, 1001, 'UPI', 'Success', '2026-07-10'),
(2, 1002, 'Card', 'Success', '2026-07-11'),
(3, 1003, 'Cash', 'Pending', '2026-07-12');

-- ==========================================
-- Show All Tables
-- ==========================================
SHOW TABLES;

-- ==========================================
-- Display Customer Orders
-- ==========================================
SELECT
    c.name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- ==========================================
-- Best Selling Products
-- ==========================================
SELECT
    p.product_name,
    SUM(od.quantity) AS TotalSold
FROM products p
INNER JOIN order_details od
ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY TotalSold DESC;

-- ==========================================
-- Total Sales
-- ==========================================
SELECT
    SUM(total_amount) AS TotalSales
FROM orders;

-- ==========================================
-- Pending Payments
-- ==========================================
SELECT *
FROM payments
WHERE payment_status = 'Pending';

-- ==========================================
-- Low Stock Products
-- ==========================================
SELECT *
FROM products
WHERE stock < 20;

-- ==========================================
-- Customer Wise Total Spending
-- ==========================================
SELECT
    c.name,
    SUM(o.total_amount) AS TotalSpent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY TotalSpent DESC;