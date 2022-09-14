/*
#1 Using the example from the lesson, create a temporary table called employees_with_departments that 
contains first_name, last_name, and dept_name for employees currently with that department. 
Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", 
it means that the query was attempting to write a new table to a database that you can only read.

a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the 
	lengths of the first name and last name columns
b. Update the table so that full name column contains the correct data
c. Remove the first_name and last_name columns from the table.
d. What is another way you could have ended up with this same table?
*/
USE mirzakhani_1938;

CREATE TEMPORARY TABLE employees_with_departments AS (
SELECT e.first_name, e.last_name, d.dept_name
FROM employees.employees e
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
);

SELECT *
FROM employees_with_departments;

# a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the 
# lengths of the first name and last name columns

ALTER TABLE employees_with_departments ADD full_name VARCHAR (30);

#b. Update the table so that full name column contains the correct data

SELECT *
FROM employees_with_departments;

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

SELECT *
FROM employees_with_departments;

#c. Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;

#d. What is another way you could have ended up with this same table?
#created the table with a full name CONCAT in the temporary table


#2 Create a temporary table based on the payment table from the sakila database.

##Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of 
## cents of the payment. For example, 1.99 should become 199.

USE mirzakhani_1938;

CREATE TEMPORARY TABLE sakila_payments AS (
SELECT *
FROM sakila.payment
);

SELECT *
FROM sakila_payments
LIMIT 50;

ALTER TABLE sakila_payments ADD amount_in_pennies INT;

SELECT *
FROM sakila_payments
LIMIT 50;

UPDATE sakila_payments SET amount_in_pennies = amount*100;










