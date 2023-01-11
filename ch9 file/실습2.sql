CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
DROP TABLE IF EXISTS mixedtbl;
CREATE TABLE mixedtbl
( userID  CHAR(8) NOT NULL ,
  name    VARCHAR(10) NOT NULL,
  addr     char(2)
);
INSERT INTO mixedtbl VALUES('LSG', '이승기', '서울');
INSERT INTO mixedtbl VALUES('KBS', '김범수', '경남');
INSERT INTO mixedtbl VALUES('KKH', '김경호', '전남');
INSERT INTO mixedtbl VALUES('JYP', '조용필',  '경기');
INSERT INTO mixedtbl VALUES('SSK', '성시경', '서울');
INSERT INTO mixedtbl VALUES('LJB', '임재범',  '서울');
INSERT INTO mixedtbl VALUES('YJS', '윤종신',  '경남');
INSERT INTO mixedtbl VALUES('EJW', '은지원', '경북');
INSERT INTO mixedtbl VALUES('JKW', '조관우', '경기');
INSERT INTO mixedtbl VALUES('BBK', '바비킴',  '서울');


ALTER TABLE mixedtbl
	ADD CONSTRAINT PK_mixedtbl_userID
		PRIMARY KEY (userID);

ALTER TABLE mixedtbl
	ADD CONSTRAINT UK_mixedtbl_name
		UNIQUE (name) ;

SHOW INDEX FROM mixedtbl;

SELECT addr FROM mixedtbl WHERE name = '임재범';