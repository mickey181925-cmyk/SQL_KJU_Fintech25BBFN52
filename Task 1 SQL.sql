CREATE DATABASE student;
USE student;
CREATE TABLE details(student_id INT,name VARCHAR(50),age INT,city VARCHAR(30),marks INT);
INSERT INTO details(student_id,name,age,city,marks)
VALUES
(001,'Namitha',19,'Hyderabad',90),
(002,'Neha',22,'Chennai',75),
(003,'Neeraja',19,'Hennur',85),
(004,'Shreya',23,'Kerala',75),
(005,'Riya',25,'Banglore',91);
SELECT *FROM details;