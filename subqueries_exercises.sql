#3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
    
    
    
    
    
    
    
    
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

3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

4. Find all the current department managers that are female. List their names in a comment in your code.

5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

Hint You will likely use multiple subqueries in a variety of ways
Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.
*/