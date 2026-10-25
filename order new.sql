-- UNIT 1 & UNIT 3: INTRODUCTION, DDL, & SCHEMA CONSTRAINTS
-- Topics Covered: CREATE DATABASE, USE, CREATE TABLE, Data Types, Constraints

CREATE DATABASE COLLEGE_STORE_DB;
USE COLLEGE_STORE_DB;

-- 1. Create the Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    membership_type VARCHAR(20) DEFAULT 'Regular',
    city VARCHAR(50) NOT NULL
);

-- 2. Create the Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- 3. Create the Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE NOT NULL,
    order_quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- DDL ALTER Practice
ALTER TABLE Customers ADD phone_number VARCHAR(15);
ALTER TABLE Customers DROP COLUMN phone_number;


-- UNIT 2: DATA MODIFICATION (DML) & SAFE UPDATES

-- A. INSERT: Sample data
INSERT INTO Customers
(customer_name, email, membership_type, city) VALUES
('Rahul Kumar', 'rahul@gmail.com', 'Premium', 'Hyderabad'),
('Priya Sharma', 'priya@gmail.com', 'Regular', 'Chennai'),
('Arjun Reddy', 'arjun@gmail.com', 'Premium', 'Bengaluru'),
('Sneha Rao', 'sneha@gmail.com', 'Regular', 'Delhi'),
('Kiran Patel', 'kiran@gmail.com', 'Regular', 'Mumbai');

INSERT INTO Products
(product_name, category, price, stock_quantity) VALUES
('Gaming Laptop', 'Electronics', 75000.00, 12),
('Bluetooth Mouse', 'Electronics', 1500.00, 35),
('USB Keyboard', 'Electronics', 2500.00, 20),
('Office Table', 'Furniture', 9500.00, 8),
('Bookshelf', 'Furniture', 7000.00, 6),
('Expired Stock', 'Discontinued', 400.00, 0);

INSERT INTO Orders
(customer_id, product_id, order_date, order_quantity) VALUES
(1, 1, '2026-10-01', 1),
(1, 2, '2026-10-02', 3),
(2, 4, '2026-10-03', 1),
(3, 1, '2026-10-04', 2),
(4, 5, '2026-10-05', 1),
(5, 2, '2026-10-06', 4);

-- B. SAFE UPDATES & CONDITIONAL UPDATES
SET SQL_SAFE_UPDATES = 0;

-- Increase all Electronics prices by 5%
UPDATE Products
SET price = price * 1.05
WHERE category = 'Electronics';

-- C. DELETE: Remove obsolete records
DELETE FROM Products
WHERE stock_quantity = 0 AND category = 'Discontinued';

SET SQL_SAFE_UPDATES = 1;


-- UNIT 4 & UNIT 5: AGGREGATION, GROUPING, JOINS & REPORTING

-- Basic Query Check
SELECT * FROM Customers;
SELECT * FROM Products;

-- Report 1: Customer count by city
SELECT city, COUNT(*) AS customer_count
FROM Customers
GROUP BY city;

-- Report 2: Inventory evaluation
SELECT
    category,
    COUNT(*) AS unique_products,
    SUM(stock_quantity) AS total_items_stocked,
    AVG(price) AS average_unit_price,
    MIN(price) AS cheapest_item_price,
    MAX(price) AS peak_item_price
FROM Products
GROUP BY category;

-- Report 3: HAVING clause
SELECT category, AVG(price) AS average_price
FROM Products
GROUP BY category
HAVING AVG(price) > 5000.00;

-- Report 4: INNER JOIN across three tables
SELECT
    o.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    o.order_quantity,
    p.price AS unit_price,
    (o.order_quantity * p.price) AS total_order_revenue
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id
INNER JOIN Products p
    ON o.product_id = p.product_id
ORDER BY total_order_revenue DESC;
