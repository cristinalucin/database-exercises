USE employees;

#1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
/*
SELECT *
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE to_date > CURDATE()
AND hire_date =
						(SELECT hire_date
						FROM employees 
						WHERE emp_no = 101010)
							
					)
*/

/*
#2 Find all the titles ever held by all current employees with the first name Aamod.

SELECT DISTINCT title
FROM titles
WHERE to_date > CURDATE()
AND emp_no IN	(	
            SELECT emp_no
			FROM employees
			WHERE first_name = 'Aamod'
		)		)
*/

/*
USE employees;
SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (
					SELECT emp_no
                    FROM dept_emp
                    WHERE to_date LIKE '9999%'
*/

/*
# 4. Find all the current department managers that are female. List their names in a comment in your code.

USE employees;
/*
#4 Find all the current department managers that are female. List their names in a comment in your code.

SELECT first_name, last_name
from employees
WHERE gender = 'F'
AND emp_no IN (
				SELECT emp_no
                FROM dept_manager
                WHERE to_date > CURDATE()
                )
                
# 'Isamu','Legleitner' 'Karsten','Sigstam''Leon','DasSarma' 'Hilary','Kambil'


*/

#5
/*
#5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT *
FROM employees
WHERE emp_no IN (
					SELECT emp_no
                    FROM salaries
                    WHERE to_date > CURDATE()
                    AND salary > (
									SELECT AVG(SALARY)
                                    FROM salaries
#154543
*/

/*6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built 
in function to calculate the standard deviation.) What percentage of all salaries is this?

USE employees;

SELECT (
	SELECT
	COUNT(*)
    FROM salaries
    WHERE to_date > CURDATE() 
	    AND 
    salary >= ((SELECT MAX(salary) FROM salaries WHERE to_date > CURDATE()) 
    - (SELECT STD(salary) FROM salaries WHERE to_date > CURDATE())))
    
 / (SELECT COUNT(*) FROM salaries WHERE to_date > CURDATE()) * 100;
    
/*
BONUS 1
/* BONUS 1 Find all the department names that currently have female managers.*/
/*
SELECT dept_name
FROM departments
WHERE dept_no IN (
					SELECT dept_no
					FROM dept_manager
                    WHERE to_date > CURDATE()
						AND emp_no IN (
										SELECT emp_no
										FROM employees
										WHERE gender = 'F'
                        )
				)
*/

/* BONUS 2
SELECT first_name, last_name
FROM employees
WHERE emp_no = (
		SELECT emp_no
		FROM salaries
		WHERE salary = (SELECT MAX(salary) FROM salaries)
)
*/

/*
#BONUS 3 Find the department name that the employee with the highest salary works in.

SELECT dept_name
FROM departments
WHERE dept_no IN (
					SELECT dept_no
					FROM dept_emp
                    WHERE emp_no = (
										SELECT emp_no
                                        FROM salaries
                                        WHERE salary = (SELECT MAX(salary) FROM salaries)
                                        )
				)
*/