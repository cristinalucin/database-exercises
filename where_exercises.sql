USE employees;
SHOW tables;
DESCRIBE employees;



/*Create a file named where_exercises.sql. Make sure to use the employees database.

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
Enter a comment with the number of records returned.
#709 Records
SELECT COUNT(*) FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya'

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
but use OR instead of IN. Enter a comment with the number of records returned. Does it match 
number of rows from Q2?

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?*/