USE sqldb;
CREATE TABLE testTbl3(id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl3 SELECT emp_no,first_name,last_name FROM employees.employees;
SELECT * FROM testTbl3;
USE sqldb;
CREATE TABLE testTbl4(SELECT emp_no,first_name,last_name FROM employees.employees);
SELECT * FROM testTbl4;
