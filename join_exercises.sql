USE employees;
DESCRIBE employees;

# 5. Find the current salary of all current managers.

SELECT DISTINCT CONCAT_WS(' ', e.first_name, e.last_name) AS name, d.dept_name AS department_name, s.salary AS salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
JOIN dept_manager as dm
ON s.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'



#2
/*
USE join_example_db;
SELECT u.name AS name, r.id as role
FROM users as u
JOIN roles as r
ON u.role_id = r.id
*/

#3
/*
USE join_example_db;
SELECT r.name as role_name, COUNT(u.id) as num_of_users
FROM roles as r
LEFT JOIN users as u
ON r.id = u.role_id
GROUP BY role_name*/

#EMPLOYEES DATABASE

#Using the example in the Associative Table Joins section as a guide, 
#write a query that shows each department along with the name of the current manager for that department.

/*SELECT CONCAT (e.first_name, ' ', e.last_name) AS Department_Manager, d.dept_name AS Department_Name
FROM employees as e
JOIN dept_manager as dm
ON e.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
*/

#3. Find the name of all departments currently managed by women.

/* SELECT CONCAT (e.first_name, ' ', e.last_name) AS Department_Manager, d.dept_name AS Department_Name
FROM employees as e
JOIN dept_manager as dm
ON e.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
AND e.gender = 'F'
*/

#4. Find the current titles of employees currently working in the Customer Service department.

/*
SELECT CONCAT(COUNT(t.emp_no) as Employee_ID), t.title as Job_title, d.dept_name AS department_name
FROM titles as t
JOIN dept_emp as de
ON t.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE t.to_date = '9999-01-01'
AND d.dept_name LIKE 'Customer Service'
GROUP BY Job_title
*/

# 5. Find the current salary of all current managers.

/*
SELECT CONCAT_WS(' ', e.first_name, e.last_name) AS name, d.dept_name AS department_name, s.salary AS salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
JOIN dept_manager as dm
ON s.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY name
*/





