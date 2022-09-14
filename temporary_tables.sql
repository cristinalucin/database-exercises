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

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

#c. Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;

#d. What is another way you could have ended up with this same table?
#created the table with a full name CONCAT in the temporary table


#2 Create a temporary table based on the payment table from the sakila database.

##Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of 
## cents of the payment. For example, 1.99 should become 199.

USE mirzakhani_1938;

CREATE TEMPORARY TABLE sakila_payments AS (
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM sakila.payment
);

SELECT *
FROM sakila_payments
LIMIT 50;

ALTER TABLE sakila_payments ADD amount_in_pennies INT NOT NULL;

UPDATE sakila_payments SET amount_in_pennies = amount*100;

##3 Find out how the current average pay in each department compares to the overall current pay for everyone at the 
## company. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, 
## what is the best department right now to work for? The worst?

#4
/*
USE mirzakhani_1938;

#Create temporary table

CREATE TEMPORARY TABLE salaries_compare AS (
SELECT d.dept_name, s.salary
FROM employees.dept_emp de
JOIN employees.departments d ON de.dept_no = d.dept_no
JOIN employees.salaries s ON de.emp_no = s.emp_no
WHERE de.to_date > CURDATE() AND s.to_date > CURDATE()
);

ALTER TABLE salaries_compare ADD total_avg DECIMAL(10, 2);
UPDATE salaries_compare SET total_avg = (SELECT AVG(salary) FROM employees.salaries WHERE to_date > CURDATE());

ALTER TABLE salaries_compare ADD std_current_salaries DECIMAL(10, 2);
UPDATE salaries_compare SET std_current_salaries = (SELECT STD(salary) FROM employees.salaries WHERE to_date > curdate());

ALTER TABLE salaries_compare ADD zscore DECIMAL(10, 2);
UPDATE salaries_compare SET zscore = (salary - total_avg) / std_current_salaries;

#Create current table

SELECT dept_name, 
		AVG(salary) as 'salary', 
		AVG(total_avg) as mean, 
        AVG(std_current_salaries) as 'standard deviation',
        AVG(zscore) as 'zscore'
FROM salaries_compare
GROUP BY dept_name
ORDER BY zscore DESC;

SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;

/*

ALTER TABLE current_info ADD overall_average FLOAT (10,2)
ALTER TABLE current_info ADD overall_STD FLOAT (10,2)
ALTER TABLE current_info ADD zscore FLOAT (10,2);

UPDATE current_info SET overall_average = (SELECT avg_salary FROM overall_aggregates)
UPDATE current_info SET overall_std = (SELECT std_salary FROM overall_aggregates);
*/








