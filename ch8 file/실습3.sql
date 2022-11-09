-- 테이블 만들기
CREATE DATABASE IF NOT EXISTS compressDB;
USE compressDB;
CREATE TABLE normalTBL(emp_no int, first_name VARCHAR(14));
CREATE TABLE compressTBL(emp_no int, first_name VARCHAR(14))
ROW_FORMAT=COMPRESSED;
-- 데이터 입력
INSERT INTO normalTBL
SELECT emp_no, first_name FROM employees.employees;
INSERT INTO compressTBL
SELECT emp_no, first_name FROM employees.employees;
-- 상태 비교
SHOW TABLE STATUS FROM compressDB;