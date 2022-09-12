USE employees;

#9 Determine the average salary for each department. Use all salary information and round your results

SELECT d.dept_name AS Department_Name, AVG(s.salary)
FROM dept_emp as de
JOIN salaries as s
ON de.emp_no = s.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE s.to_date = '9999-01-01'
	AND de.to_date = '9999-01-01'
GROUP BY Department_Name


#2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along 
# with the name of the current manager for that department.

/*
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, d.dept_name as department_name
FROM employees as e
JOIN dept_manager as dm
ON e.emp_no = dm.emp_no
RIGHT JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
*/

# 3 Find the name of all departments currently managed by women.

/*
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Manager_name
FROM employees as e
JOIN dept_manager as dm
ON e.emp_no = dm.emp_no
RIGHT JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE e.gender = 'F'
	AND dm.to_date = '9999-01-01'
ORDER BY Department_Name
*/

#4 Find the current titles of employees currently working in the Customer Service department.
/*
SELECT t.title AS Title, COUNT(t.title) AS number_of_employees
FROM titles as t
JOIN dept_emp as de
ON t.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE t.to_date = '9999-01-01'
	AND de.dept_no = 'd009'
GROUP BY Title
ORDER BY Title
*/
/*
SELECT d.dept_name as Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary AS Salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no
JOIN dept_manager AS dm
ON s.emp_no = dm.emp_no
JOIN departments AS d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
	AND s.to_date = '9999-01-01'
*/

#6 Find the number of current employees in each department.
/*
SELECT d.dept_no AS department_number,
d.dept_name AS  department_name,
COUNT(de.emp_no) AS num_employees
FROM departments as d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY department_number
ORDER BY department_number
*/

# 7
/*
SELECT d.dept_no AS department_number,
d.dept_name AS  department_name,
COUNT(de.emp_no) AS num_employees,
AVG(s.salary) AS average_salary
FROM departments as d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
JOIN salaries as s
ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
	AND s.to_date = '9999-01-01'
GROUP BY department_number
ORDER BY average_salary
*/

#8 Who is the highest paid employee in the Marketing department?
/*
SELECT e.first_name AS first_name, e.last_name AS last_name, s.salary AS salary
FROM employees AS e
JOIN salaries as s
ON e.emp_no = s.emp_no
JOIN dept_emp AS de
ON s.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd001'
ORDER BY s.salary DESC
*/

#9 Which current department manager has the highest salary?

/*
SELECT e.first_name AS first_name,e.last_name AS last_name, s.salary AS salary, d.dept_name AS dept_name
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
JOIN dept_manager as dm
ON s.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
	AND s.to_date = '9999-01-01'
*/