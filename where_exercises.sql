USE employees;
SHOW tables;
DESCRIBE employees;

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'


/*Create a file named where_exercises.sql. Make sure to use the employees database.

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
Enter a comment with the number of records returned.
#709 Records
SELECT COUNT(*) FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya'

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
but use OR instead of IN. Enter a comment with the number of records returned. Does it match 
number of rows from Q2?
#468 Records
SELECT COUNT(*)
FROM employees
WHERE first_name='Irina' OR first_name='Vidya' OR first_name='Maya'

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, 
and who is male. Enter a comment with the number of records returned.
#297 records

SELECT *
FROM employees
WHERE first_name IN ('Irina','Vidya','Maya')
	AND gender = 'M'

Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number 
of employees whose last name starts with E.
#7330 Records

SELECT COUNT(*)
FROM employees
WHERE last_name LIKE 'E%'

Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with 
the number of employees whose last name starts or ends with E. How many employees have a last name that 
ends with E, but does not start with E?
# 165,450 employees start and end with E
# 24,292 employees last names ends with E

SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%E%' 
## or %E (ends with E)

Find all current or previous employees employees whose last name starts and ends with 'E'. 
Enter a comment with the number of employees whose last name starts and ends with E. How many employees' 
last names end with E, regardless of whether they start with E?
#899 start and end with E
##24,292 end with E

SELECT COUNT(*)
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name Like '%E'

Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
#135,214
SELECT COUNT(*)
FROM employees
WHERE hire_date LIKE '199%'

Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
#789 records returned
SELECT *
FROM employees
WHERE hire_date LIKE '%12-25'

Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment 
with the number of employees returned.

#346 Rows Returned
SELECT *
FROM employees
WHERE hire_date LIKE '%12-25'
	AND hire_date LIKE '199%'

Find all current or previous employees with a 'q' in their last name. Enter a comment with the 
number of records returned.
#1873 Returned
SELECT *
FROM employees
WHERE last_name LIKE '%q%'

Find all current or previous employees with a 'q' in their last name but not 'qu'. How many 
employees are found?
#547 records
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'

*/