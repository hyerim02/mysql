-- 임시 테이블 생성
USE employees;
CREATE TEMPORARY TABLE IF NOT EXISTS temptbl (id INT, name CHAR(5));
CREATE TEMPORARY TABLE IF NOT EXISTS employees (id INT, name CHAR(5));
DESCRIBE temptbl;
DESCRIBE employees;
-- 데이터 입력
INSERT INTO temptbl VALUES (1,'This');
SELECT * FROM temptbl;
INSERT INTO employees VALUES (2,'MySQL');
SELECT * FROM employees;

-- Workbench2에서 접근
USE employees;
SELECT * FROM temptbl;
SELECT * FROM employees;

-- 삭제
DROP TABLE temptbl;