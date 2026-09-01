CREATE TABLE employees_2 (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary numeric(10, 2),
    joining_date DATE NOT NULL,
    age INT
);
SELECT * FROM EMPLOYEES_2;

COPY
EMPLOYEES_2 (employee_id, first_name, last_name, department, salary, joining_date, age)
FROM 'C:/Users/fisba/Desktop/SQL_COURSE/employee_data.csv'
DELIMITER ','
CSV HEADER;

-- SQL TASK OPERATORS ASSINGMENT

-- QUESTION AND ANSWER:

SELECT * FROM EMPLOYEES_2;

SELECT * FROM EMPLOYEES_2 ORDER BY employee_id ASC;

-- 1. Display all employees whose salary is greater than 50,000.
SELECT * FROM employees_2
WHERE salary>=50000;

-- 2. Display employees whose age is between 25 and 35.
SELECT * FROM employees_2
WHERE age BETWEEN 25 and 35;

-- 3. Display all employees from the HR department.
SELECT * FROM employees_2
WHERE department='HR';

-- 4. Increase the salary of employees earning 40,000 or less by 5,000.
UPDATE employees_2
SET salary=salary+5000
WHERE salary=40000;

-- 5. Increase the salary of employees who join after 1-1-2022 by 2,000.
UPDATE employees_2
SET salary = salary+2000
WHERE joining_date >'1-1-2022';

-- 6. Display employees who belong to the HR or IT department.
SELECT * FROM employees_2
WHERE department IN ('IT', 'HR');

-- 7. Display employees whose name starts with the letter 'A'.
SELECT * FROM employees_2 
WHERE first_name LIKE 'A%';

-- 8. Increase the salary of IT employees by 10% if their salary is less than 60,000.
UPDATE employees_2
SET salary=(salary*1.10)
WHERE department='IT' AND salary <=60000;

-- 9. Increase the salary of employees who join after 1-12-2019 by 10,000.
UPDATE employees_2
SET salary = salary+10000
WHERE department='IT';


-- 10. Display Finance employees whose salary is between 40,000 and 70,000.
SELECT * FROM employees_2
WHERE department='Finance' AND salary BETWEEN 40000 and 70000;

-- 11. Increase the salary of employees in the HR and Sales departments by 3,000.
UPDATE employees_2
SET salary=salary+3000
WHERE department IN ('HR','Sales');

-- 12. Display employees whose salary is greater than 50,000 and joined after 1-12-2022.
SELECT * FROM employees_2
WHERE salary >= 50000 AND joining_date > '1-12-2022';

-- 13. Display employees who belong to HR, IT, or Finance and age less than 30.
SELECT * FROM employees_2
WHERE age<=30 AND department IN ('HR', 'IT', 'Finance');

-- 14. Decrease the salary of employees earning more than 80,000 by 2,500.
UPDATE employees_2
SET salary=salary-2500
WHERE salary>=80000;

-- 15. Display employees whose names start with 'S' or 'M' and whose salary is greater than 60,000.
SELECT * FROM employees_2
WHERE (first_name LIKE 'S%' OR first_name LIKE 'M%') AND salary>=60000

