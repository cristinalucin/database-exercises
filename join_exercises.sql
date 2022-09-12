USE employees;

/*
JOIN example data base
#1
-- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;
SELECT *
FROM roles, users;

SELECT *
FROM roles;

SELECT *
FROM users;


#2
-- Use join, left join, and right join to combine results from the users and roles tables 
-- as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT *
FROM roles as r
JOIN users as u ON r.id = u.role_id;

SELECT *
FROM roles as r
LEFT JOIN users as u ON r.id = u.role_id;

SELECT *
FROM roles as r
RIGHT JOIN users as u ON r.id = u.role_id;
#3
-- Although not explicitly covered in the lesson, aggregate functions like count can be 
-- used with join queries. Use count and the appropriate join type to get 
-- a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.

SELECT r.id, r.name, COUNT(u.id) AS 'Number of users'
FROM roles as r
LEFT JOIN users as u ON r.id = u.role_id
GROUP BY r.id;
*/

##EMPLOYEE DATABASE

#1 USE employees;

#2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along 
# with the name of the current manager for that department.

/*
SELECT d.dept_name as department_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
JOIN departments AS d USING(dept_no)
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
SELECT t.title AS title, 
COUNT(de.emp_no) AS 'Count'
FROM dept_emp de
JOIN titles t
ON de.emp_no = t.emp_no
	AND t.to_date > CURDATE()
    AND de.to_date > CURDATE()
JOIN departments d
ON de.dept_no = d.dept_no
	AND d.dept_name = 'Customer Service'
GROUP BY title
*/


#5 Find the current salary of all current managers.
/*
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', s.salary AS 'Salary'
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN dept_manager as dm
ON e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN departments as d
ON dm.dept_no = d.dept_no
ORDER BY d.dept_name
*/

#6 Find the number of current employees in each department.
/*
SELECT d.dept_no AS department_number,
d.dept_name AS  department_name,
COUNT(de.emp_no) AS num_employees
FROM departments as d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
	AND de.to_date > CURDATE()
GROUP BY department_number, department_name
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

#10 Determine the average salary for each department. Use all salary information and round your results
/*
SELECT d.dept_name AS department_Name, ROUND(AVG(s.salary)) AS average_salary
FROM salaries as s
JOIN dept_emp as de
ON s.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
GROUP BY department_Name
ORDER BY average_salary DESC
*/

#11 #BONUS Find the names of all current employees, their department name, and their current manager's name.

/*
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, d.dept_name AS department_name, CONCAT(e2.first_name,' ', e2.last_name) AS manager_name
FROM departments as d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
JOIN employees as e
ON de.emp_no = e.emp_no
LEFT JOIN dept_manager AS dm 
ON de.dept_no = dm.dept_no
LEFT JOIN employees AS e2 ON dm.emp_no = e2.emp_no
WHERE de.to_date > CURDATE() AND dm.to_date > CURDATE()
