USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8), 
  name    VARCHAR(10),
  birthYear   INT,  
  addr	  CHAR(2), 
  mobile1	CHAR(3), 
  mobile2   CHAR(8), 
  height    SMALLINT, 
  mDate    DATE 
);
CREATE TABLE buytbl 
(  num int AUTO_INCREMENT PRIMARY KEY,
   userid  CHAR(8),
   prodName CHAR(6),
   groupName CHAR(4),
   price     INT ,
   amount   SMALLINT
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL,'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL,'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);

-- 기본키
ALTER TABLE usertbl
	ADD CONSTRAINT PK_usertbl_userID
	PRIMARY KEY (userID);
-- 확인 
DESC usertbl;-- not null 잘 설정됨   

-- 외래키
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID);-- 에러남 usertbl에 바비킴 없음
    
-- 삭제하고 다시
DELETE FROM buytbl WHERE userid = 'BBK';
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID);   
-- 외래 키 잠시 비활성
SET foreign_key_checks = 0;
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
SET foreign_key_checks = 1;

-- 잘못 입력한 것 때문에 에러남
ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL) );
-- 수정하고 다시
UPDATE usertbl SET birthYear=1979 WHERE userID='KBS';
UPDATE usertbl SET birthYear=1971 WHERE userID='KKH';

ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL) );
    
-- 데이터 입력 
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');   

-- ID변경
SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SET foreign_key_checks = 1;
-- 조인
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userid = U.userid ;

SELECT COUNT(*) FROM buytbl;
-- 외부 조인
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buytbl B
     LEFT OUTER JOIN usertbl U
        ON B.userid = U.userid
   ORDER BY B.userid ;
   
-- 다시 바비킴 원래대로
SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'BBK' WHERE userID='VVK';
SET foreign_key_checks = 1;

-- 아이디 자동으로 변경
ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl 
	ADD CONSTRAINT FK_usertbl_buytbl
		FOREIGN KEY (userID)
		REFERENCES usertbl (userID)
		ON UPDATE CASCADE;
-- 다시 변경하고 바뀌었는지 확인
UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userid = U.userid
  ORDER BY B.userid;
-- 외래 키 제약 조건 때문에 삭제되지 않아서 설정함
ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl 
	ADD CONSTRAINT FK_usertbl_buytbl
		FOREIGN KEY (userID)
		REFERENCES usertbl (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE;
-- 확인
DELETE FROM usertbl WHERE userID = 'VVK';
SELECT * FROM buytbl ;
-- CHECK제약 조건은 무시하고 삭제함
ALTER TABLE usertbl
	DROP COLUMN birthYear ;

