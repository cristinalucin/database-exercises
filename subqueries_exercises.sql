# 4. Find all the current department managers that are female. List their names in a comment in your code.
USE employees;

SELECT CONCAT(first_name, ' ', last_name) full_name
FROM employees
WHERE gender = 'F'



/*
#1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT *
FROM employees e1
JOIN dept_empt de ON e1.emp_no = de.emp_no
	AND de.to_date > CURDATE()
WHERE e1.hire_date = (
						SELECT e.hire_date
						FROM employees e
						WHERE e.emp_no = 101010
							
					)
*/
/*
#2 Find all the titles ever held by all current employees with the first name Aamod.
USE employees;

SELECT DISTINCT title
FROM titles
WHERE emp_no IN	(	
			
            SELECT emp_no
			FROM employees
			WHERE first_name = 'Aamod'
		)
	AND to_date > CURDATE()

*/
/*
#3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

USE employees;

SELECT *
FROM employees
WHERE emp_no IN (
				SELECT emp_no
				FROM dept_emp
				WHERE to_date < CURDATE()
                )
*/