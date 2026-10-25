CREATE DATABASE COLLEGE_DB;
USE COLLEGE_DB;

CREATE TABLE students
(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    city VARCHAR(30),
    marks INT
);

INSERT INTO students (student_id, name, age, city, marks)
VALUES
(1, 'RAHUL', 20, 'Hyderabad', 88),
(2, 'PRIYA', 21, 'Chennai', 76),
(3, 'SNEHA', 19, 'Bengaluru', 92),
(4, 'KARTHIK', 22, 'Delhi', 81),
(5, 'DIVYA', 20, 'Mumbai', 74),
(6, 'ARJUN', 18, 'Chennai', 89),
(7, 'PALLAVI', 22, 'Hyderabad', 67),
(8, 'ROHAN', 21, 'Bengaluru', 96),
(9, 'MEGHA', 18, 'Delhi', 65),
(10, 'VIKRAM', 23, 'Mumbai', 85);

SELECT * FROM students;

SELECT name, marks FROM students;

SELECT * FROM students
WHERE age = 20;

SELECT * FROM students
WHERE marks > 80;
