#U#se the employees database. Write the SQL code necessary to do this
SHOW DATABASES;
USE employees;
##List all the tables in the database. Write the SQL code necessary to accomplish this.
SHOW TABLES;

##Explore the employees table. What different data types are present on this table?
DESCRIBE dept_manager;
# The types of data on this table are integer, string, date

##Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
#emp_no and dept_manager contain employee numbers, employees contains ID numbers, birth dates, and hire dates;
#salaries contains employee ID numbers and salaries 

##Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
#Departments and Titles contain primarily string data

##Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
#Most tables contain a date type column--they seem more important within employees (date of hire), salaries
# (date started salary/ended salary) and Titles (Date assumed title)

##What is the relationship between the employees and the departments tables? 
DESCRIBE dept_emp;
#employees and departments don't have a direct relationship but dept_emp provides a relationship between
#the information in employees and departments (employee # and Department #)

##Show the SQL that created the dept_manager table:
SHOW CREATE TABLE dept_manager;
# CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1