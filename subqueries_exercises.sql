USE employees;

#1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
/*
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

/*
# 4. Find all the current department managers that are female. List their names in a comment in your code.

USE employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE gender = 'F'
	AND emp_no IN (
		SELECT emp_no
		FROM dept_manager dm
		)
        
# 'Isamu Legleitner'
/*'Shirish Ossenbruggen'
'Karsten Sigstam'
'Krassimir Wegerle'
'Rosine Cools'
'Leon DasSarma'
'Peternela Onuegbe'
'Rutger Hofmeyr'
'Sanjoy Quadeer'
'Hilary Kambil'
'Tonny Butterworth'
'Marjo Giarratana'
'Xiaobin Spinelli'
*/

#5
/*
SELECT *
FROM employees 
WHERE emp_no IN (
		SELECT emp_no
				FROM salaries
				WHERE salary > (SELECT AVG(salary) FROM salaries)
					AND emp_no IN (
							SELECT emp_no
							FROM dept_emp
							WHERE to_date > CURDATE()
									)
					AND to_date > CURDATE()
				);		
*/

/*8 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built 
in function to calculate the standard deviation.) What percentage of all salaries is this? (78)
USE employees;

SELECT * FROM salaries
    WHERE to_date > CURDATE() 
    AND salary >= (
					(SELECT MAX(salary) FROM salaries) - (SELECT ROUND(STD(salary)) FROM salaries))
    AND salary <= (SELECT MAX(salary) FROM salaries) 
    
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