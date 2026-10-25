CREATE DATABASE SHOP_DB;
USE SHOP_DB;

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(30)
);

CREATE TABLE Product
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    price DECIMAL(10,2),
    quantity INT
);

SHOW DATABASES;
SHOW TABLES;
DESC Customer;
DESC Product;

ALTER TABLE Customer
ADD address VARCHAR(100);

DESC Customer;

ALTER TABLE Customer
MODIFY phone VARCHAR(20);

DESC Customer;

ALTER TABLE Customer
RENAME COLUMN city TO customer_city;

DESC Customer;

ALTER TABLE Customer
DROP COLUMN address;

DESC Customer;

INSERT INTO Customer
(customer_name, email, phone, customer_city)
VALUES
('Rahul', 'rahul@gmail.com', '9876501234', 'Hyderabad'),
('Priya', 'priya@gmail.com', '9876501235', 'Chennai'),
('Arjun', 'arjun@gmail.com', '9876501236', 'Bengaluru'),
('Sneha', 'sneha@gmail.com', '9876501237', 'Delhi'),
('Karthik', 'karthik@gmail.com', '9876501238', 'Mumbai');

SELECT * FROM Customer;

INSERT INTO Product
(product_name, category, price, quantity)
VALUES
('Smartphone', 'Electronics', 25000.00, 12),
('Headphones', 'Electronics', 1200.00, 30),
('Monitor', 'Electronics', 8500.00, 15),
('Bookshelf', 'Furniture', 6500.00, 10),
('Study Table', 'Furniture', 9500.00, 7);

SELECT * FROM Product;

UPDATE Customer
SET phone = '9999901234'
WHERE customer_id = 1;

SELECT * FROM Customer;

UPDATE Product
SET price = 27000.00
WHERE product_id = 1;

SELECT * FROM Product;

UPDATE Product
SET price = 1500.00,
    quantity = 35
WHERE product_id = 2;

SELECT * FROM Product;

DELETE FROM Customer
WHERE customer_id = 5;

SELECT * FROM Customer;

DELETE FROM Product
WHERE product_id = 5;

SELECT * FROM Product;

SELECT * FROM Customer;
SELECT * FROM Product;

TRUNCATE TABLE Customer;
TRUNCATE TABLE Product;

DROP TABLE Product;
DROP TABLE Customer;

DROP DATABASE SHOP_DB;
