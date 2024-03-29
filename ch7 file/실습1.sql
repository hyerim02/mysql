-- sqldb초기화
DROP DATABASE IF EXISTS sqldb;
CREATE DATABASE sqldb;
USE sqldb;
CREATE TABLE usertbl
( userID	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디
  name		VARCHAR(10) NOT NULL, -- 이름
  birthYear	INT NOT NULL, -- 출생년도
  addr		CHAR(2) NOT NULL,-- 지역이름 
  mobile1	CHAR(3),-- 휴대폰 국번
  mobile2	CHAR(8),-- 나머지 번호
  height	SMALLINT,-- 키
  mDate		DATE-- 화원가입일
);
CREATE TABLE buytbl
(num		INT AUTO_INCREMENT NOT NULL PRIMARY KEY,-- 순번
userID		CHAR(8) NOT NULL,-- 아이디
prodName	CHAR(6) NOT NULL,-- 물품명
groupName   CHAR(4),-- 분류
price		INT NOT NULL,-- 단가
amount		SMALLINT NOT NULL, -- 수량
FOREIGN KEY (userID) REFERENCES usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

SELECT * FROM usertbl;
SELECT * FROM buytbl;

USE sqldb;
SET @myVar1=5;
SET @myVar2=3;
SET @myVar3=4.25;
SET @myVar4='가수 이름==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT @myVar4, Name FROM usertbl WHERE height >180 ;

SET @myVar1=3;
PREPARE myQuery
FROM 'SELECT Name, height FROM usertbl ORDER BY height LIMIT ? ';
EXECUTE myQuery USING @myVar1;
