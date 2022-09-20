USE sqldb;
SELECT * FROM buytbl
	CROSS JOIN usertbl;
USE employees;
SELECT COUNT(*) AS '데이터개수' FROM employees
	CROSS JOIN titles;