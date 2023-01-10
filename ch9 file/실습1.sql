-- <실습 1> --
-- 테이블 만들기--
USE sqldb;
CREATE TABLE  tbl1
	(	a INT PRIMARY KEY,
		b INT,
		c INT
	);
SHOW INDEX FROM tbl1;    
-- unique 제약 조건 테이블 만들기--
CREATE TABLE  tbl2
	(	a INT PRIMARY KEY,
		b INT UNIQUE,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM tbl2;

-- unique만 지정--
CREATE TABLE  tbl3
	(	a INT UNIQUE,
		b INT UNIQUE,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM tbl3;

-- unique에 클러스터형 인덱스 지정--
CREATE TABLE  tbl4
	(	a INT UNIQUE NOT NULL,
		b INT UNIQUE ,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM tbl4;

-- UNIQUE NOT NULL,PRIMARY KEY 모두 지정--
CREATE TABLE  tbl5
	(	a INT UNIQUE NOT NULL,
		b INT UNIQUE ,
		c INT UNIQUE,
		d INT PRIMARY KEY
	);
SHOW INDEX FROM tbl5;

-- 클러스터형 인덱스는 행 데이터를 자신의 열을 기준으로 정렬--
-- 테이블 만들기--

CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    varchar(10) NOT NULL,
  birthYear   int NOT NULL,
  addr	  nchar(2) NOT NULL 
 );


INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울');
SELECT * FROM usertbl;

-- userID primary key제거하고 name을 primary key로 지정
ALTER TABLE usertbl DROP PRIMARY KEY ;
ALTER TABLE usertbl 
	ADD CONSTRAINT pk_name PRIMARY KEY(name);
SELECT * FROM usertbl;