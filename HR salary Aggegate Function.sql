CREATE DATABASE HRSalaryLab;
USE HRSalaryLab;

CREATE TABLE departments (
    dept_id    INT           AUTO_INCREMENT PRIMARY KEY,
    dept_name  VARCHAR(50)   NOT NULL UNIQUE,
    location   VARCHAR(50)   NOT NULL
);

CREATE TABLE employees (
    emp_id              INT            AUTO_INCREMENT PRIMARY KEY,
    emp_name            VARCHAR(80)    NOT NULL,
    dept_id             INT            NOT NULL,
    job_title           VARCHAR(60)    NOT NULL,
    employment_type     VARCHAR(15)    NOT NULL,
    hire_date           DATE           NOT NULL,
    salary              DECIMAL(10,2)  NOT NULL,
    performance_rating  DECIMAL(2,1)   NULL,
    status              VARCHAR(15)    NOT NULL DEFAULT 'Active',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salary_payments (
    payment_id   INT            AUTO_INCREMENT PRIMARY KEY,
    emp_id       INT            NOT NULL,
    pay_month    DATE           NOT NULL,
    basic_pay    DECIMAL(10,2)  NOT NULL,
    bonus        DECIMAL(10,2)  NOT NULL DEFAULT 0,
    deductions   DECIMAL(10,2)  NOT NULL DEFAULT 0,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE leave_records (
    leave_id    INT          AUTO_INCREMENT PRIMARY KEY,
    emp_id      INT          NOT NULL,
    leave_type  VARCHAR(15)  NOT NULL,
    start_date  DATE         NOT NULL,
    days        INT          NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Insert department data
INSERT INTO departments (dept_name, location) VALUES
('Human Resources',        'Hyderabad'),
('Finance',                'Bengaluru'),
('Information Technology', 'Pune'),
('Marketing',              'Mumbai'),
('Operations',             'Chennai'),
('Legal',                  'Delhi');

-- Insert employee data
INSERT INTO employees
(emp_name, dept_id, job_title, employment_type, hire_date, salary, performance_rating, status)
VALUES
('Aarav Sharma',    1, 'HR Manager',            'Full-time', '2019-03-15',  98000, 4.6, 'Active'),
('Ananya Reddy',    1, 'HR Executive',          'Full-time', '2022-06-10',  45000, 4.2, 'Active'),
('Meera Nair',      1, 'HR Executive',          'Full-time', '2025-01-20',  41000, NULL, 'Active'),
('Karan Mehta',     1, 'Recruiter',             'Contract',  '2024-08-12',  39000, 3.9, 'Active'),
('Vikram Patel',    2, 'Finance Manager',       'Full-time', '2018-05-21', 105000, 4.7, 'Active'),
('Sneha Iyer',      2, 'Accountant',            'Full-time', '2021-04-12',  52000, 4.1, 'Active'),
('Rohan Gupta',     2, 'Financial Analyst',     'Full-time', '2020-09-18',  68000, 4.3, 'Active'),
('Divya Rao',       2, 'Accountant',            'Full-time', '2023-07-05',  49000, 3.7, 'Active'),
('Aditya Kumar',    3, 'IT Manager',            'Full-time', '2017-02-14', 130000, 4.8, 'Active'),
('Ishita Das',      3, 'Software Engineer',     'Full-time', '2021-10-11',  85000, 4.5, 'Active'),
('Nikhil Verma',    3, 'Software Engineer',     'Full-time', '2022-03-08',  79000, 4.2, 'Active'),
('Pallavi Singh',   3, 'Data Analyst',          'Full-time', '2023-06-19',  72000, 4.1, 'Active'),
('Siddharth Jain',  3, 'Software Engineer',     'Contract',  '2025-04-07',  73000, NULL, 'Active'),
('Aditi Shah',      3, 'QA Engineer',           'Full-time', '2024-01-22',  61000, 3.8, 'Active'),
('Simran Kaur',     4, 'Marketing Manager',     'Full-time', '2020-02-17',  95000, 4.4, 'Active'),
('Rahul Sinha',     4, 'Digital Marketer',      'Full-time', '2022-11-14',  56000, 4.1, 'Active'),
('Zoya Khan',       4, 'Brand Executive',       'Full-time', '2023-05-09',  50000, 3.6, 'Resigned'),
('Manish Yadav',    5, 'Operations Manager',    'Full-time', '2019-07-16',  93000, 4.5, 'Active'),
('Kavitha Rao',     5, 'Logistics Coordinator', 'Full-time', '2021-12-20',  46000, 3.9, 'Active'),
('Arjun Bose',      5, 'Supply Chain Analyst',  'Full-time', '2020-08-24',  63000, 4.2, 'Active'),
('Farhan Sheikh',   5, 'Warehouse Supervisor',  'Contract',  '2025-10-13',  38000, NULL, 'Active');

-- Insert leave records
INSERT INTO leave_records (emp_id, leave_type, start_date, days) VALUES
(1,  'Earned', '2026-07-08', 2),
(2,  'Casual', '2026-07-16', 1),
(2,  'Sick',   '2026-08-22', 3),
(6,  'Casual', '2026-07-24', 2),
(6,  'Earned', '2026-09-09', 4),
(7,  'Earned', '2026-09-23', 5),
(9,  'Casual', '2026-07-28', 1),
(10, 'Sick',   '2026-08-06', 2),
(10, 'Casual', '2026-09-20', 1),
(11, 'Earned', '2026-07-29', 3),
(12, 'Casual', '2026-08-14', 1),
(14, 'Sick',   '2026-09-04', 2),
(15, 'Sick',   '2026-08-19', 3),
(16, 'Casual', '2026-07-11', 1),
(16, 'Earned', '2026-08-26', 4),
(18, 'Casual', '2026-09-26', 1),
(19, 'Sick',   '2026-09-13', 2),
(20, 'Casual', '2026-08-30', 1);

-- Check table record counts
SELECT (SELECT COUNT(*) FROM departments)     AS departments,
       (SELECT COUNT(*) FROM employees)       AS employees,
       (SELECT COUNT(*) FROM salary_payments) AS payments,
       (SELECT COUNT(*) FROM leave_records)   AS leaves;

-- Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Count active employees
SELECT COUNT(*) AS active_employees
FROM employees
WHERE status = 'Active';

-- Count employees and employees with ratings
SELECT COUNT(*)                  AS all_employees,
       COUNT(performance_rating) AS employees_with_a_rating
FROM employees;

-- Count distinct job titles and departments with staff
SELECT COUNT(DISTINCT job_title) AS different_job_titles,
       COUNT(DISTINCT dept_id)   AS departments_with_staff
FROM employees;

-- Calculate monthly salary bill
SELECT SUM(salary) AS monthly_salary_bill
FROM employees
WHERE status = 'Active';

-- Calculate average salary
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees
WHERE status = 'Active';

-- Find lowest and highest salaries
SELECT MIN(salary) AS lowest_salary,
       MAX(salary) AS highest_salary
FROM employees
WHERE status = 'Active';

-- Summary of active employees' salaries
SELECT COUNT(*)               AS headcount,
       SUM(salary)            AS total_salary,
       ROUND(AVG(salary), 2)  AS average_salary,
       MIN(salary)            AS lowest_salary,
       MAX(salary)            AS highest_salary
FROM employees
WHERE status = 'Active';

-- Calculate monthly and yearly payroll
SELECT SUM(salary)      AS monthly_payroll,
       SUM(salary) * 12 AS yearly_payroll
FROM employees
WHERE status = 'Active';

-- Compare average rating calculations
SELECT ROUND(AVG(performance_rating), 2)            AS avg_rating_ignoring_null,
       ROUND(SUM(performance_rating) / COUNT(*), 2) AS sum_divided_by_all_rows
FROM employees;

-- Find first and latest hire dates and alphabetical names
SELECT MIN(hire_date) AS first_joiner_date,
       MAX(hire_date) AS latest_joiner_date,
       MIN(emp_name)  AS first_name_alphabetically,
       MAX(emp_name)  AS last_name_alphabetically
FROM employees;

-- Find the highest-paid active employee
SELECT emp_name, job_title, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE status = 'Active'
);