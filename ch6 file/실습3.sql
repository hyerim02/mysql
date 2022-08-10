USE sqldb;
CREATE TABLE bigTbl1(SELECT * FROM employees.employees);
CREATE TABLE bigTbl2(SELECT * FROM employees.employees);
CREATE TABLE bigTbl3(SELECT * FROM employees.employees);
DELETE FROM bigTbl1;
DROP TABLE bigTbl2;
TRUNCATE TABLE bigTbl3;