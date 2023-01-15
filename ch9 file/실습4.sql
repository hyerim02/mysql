CREATE DATABASE IF NOT EXISTS indexdb;

USE indexdb;
SELECT COUNT(*) FROM employees.employees;

CREATE TABLE emp SELECT * FROM employees.employees ORDER BY RAND();
CREATE TABLE emp_c SELECT * FROM employees.employees ORDER BY RAND();
CREATE TABLE emp_se SELECT * FROM employees.employees ORDER BY RAND();


SELECT * FROM emp LIMIT 5;
SELECT * FROM emp_c LIMIT 5;
SELECT * FROM emp_se LIMIT 5;

SHOW TABLE STATUS;

ALTER TABLE emp_c ADD PRIMARY KEY(emp_no);
ALTER TABLE emp_se ADD INDEX idx_emp_no (emp_no);

SELECT * FROM emp LIMIT 5;
SELECT * FROM emp_c LIMIT 5;
SELECT * FROM emp_se LIMIT 5;

ANALYZE TABLE emp, emp_c, emp_se;

SHOW INDEX FROM emp;
SHOW INDEX FROM emp_c;
SHOW INDEX FROM emp_se;
SHOW TABLE STATUS;

/*
NET STOP MySQL
NET START MySQL
*/

USE indexdb;

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp WHERE emp_no = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후에 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_c WHERE emp_no = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_se WHERE emp_no = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_c WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_c WHERE emp_no < 500000 LIMIT 1000000; -- 전체 데이터를 읽음
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; 
SELECT * FROM emp_c IGNORE INDEX(PRIMARY) WHERE emp_no < 500000 LIMIT 1000000; 
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read';

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; 
SELECT * FROM emp_c LIMIT 1000000; -- 전체 데이터를 읽음
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; 

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_se WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_se IGNORE INDEX(idx_emp_no) WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_se  WHERE emp_no < 400000 LIMIT 500000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SELECT * FROM emp_se  WHERE emp_no < 60000 LIMIT 500000;

SELECT * FROM emp_c WHERE emp_no = 100000;

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_c WHERE emp_no*1 = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SELECT * FROM emp_c WHERE emp_no = 100000 / 1 ;

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM emp_c WHERE emp_no = 100000 / 1 ;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SELECT * FROM emp ;

ALTER TABLE emp ADD INDEX idx_gender (gender);
ANALYZE TABLE emp; -- 생성한 인덱스를 통계에 적용시킴
SHOW INDEX FROM emp;

SELECT * FROM emp WHERE gender = 'M' LIMIT 500000;

SELECT * FROM emp IGNORE INDEX (idx_gender) WHERE gender = 'M' LIMIT 500000;