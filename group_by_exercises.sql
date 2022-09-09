USE employees;
SHOW tables;

SELECT emp_no, AVG(salary)
FROM salaries
GROUP by emp_no



/*In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? Answer that in a comment in your SQL file.*/

#SELECT DISTINCT title
#FROM titles
#7

/* Write a query to to find a list of all unique last names of all employees 
that start and end with 'E' using GROUP BY.*/

#SELECT COUNT(last_name)
#FROM employees
#WHERE last_name LIKE 'e%e'
#GROUP BY last_name

/*Write a query to to find all unique combinations of first and last names of all employees whose last 
names start and end with 'E'.*/
#SELECT first_name, last_name
#WHERE last_name LIKE 'e%e'
#GROUP BY first_name, last_name

/*Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code.*/
#SELECT last_name
#FROM employees
#WHERE last_name LIKE '%q%'
#AND last_name NOT LIKE '%qu%'
#GROUP BY last_name

/*Add a COUNT() to your results (the query above) to find the number of employees with the same last name.*/

#SELECT last_name, COUNT(*) 
#FROM employees
#WHERE last_name LIKE '%q%'
#AND last_name NOT LIKE '%qu%'
#GROUP BY last_name

/*Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY 
to find the number of employees for each gender with those names.*/

/* 
SELECT first_name, gender, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
*/

/* Using your query that generates a username for all of the employees, generate a count employees for each unique username. 
Are there any duplicate usernames? BONUS: How many duplicate usernames are there?*/

/*SELECT
    LOWER(
		CONCAT(
		SUBSTR(first_name,1, 1),
        SUBSTR(last_name, 1, 4),
        '_',
        SUBSTR(birth_date, 6, 2),
        SUBSTR(birth_date, 3, 2)
        )
	) AS username, 
    COUNT(*)
FROM employees
GROUP BY username;*/

/* BONUS: How many duplicate usernames are there?*/
#13251

/* SELECT
    LOWER(
		CONCAT(
		SUBSTR(first_name,1, 1),
        SUBSTR(last_name, 1, 4),
        '_',
        SUBSTR(birth_date, 6, 2),
        SUBSTR(birth_date, 3, 2)
        )
	) AS username, 
    COUNT(*) AS unique_username
FROM employees
GROUP BY username
HAVING unique_username >1;*/

/* BONUS: Determine the historic average salary for each employee. When you hear, read, or think "for each" with 
regard to SQL, you'll probably be grouping by that exact column.*/







