USE sqlDB;
CREATE VIEW v_userbuytbl
AS
   SELECT U.userid AS 'USER ID', U.name AS 'USER NAME', B.prodName AS 'PRODUCT NAME', 
		U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
      FROM usertbl U
	INNER JOIN buytbl B
	 ON U.userid = B.userid;
     
    
SELECT `USER ID`, `USER NAME` FROM v_userbuytbl; -- 주의! 백틱을 사용한다.    

ALTER VIEW v_userbuytbl
AS
   SELECT U.userid AS '사용자 아이디', U.name AS '이름', B.prodName AS '제품 이름', 
		U.addr, CONCAT(U.mobile1, U.mobile2)  AS '전화 번호'
      FROM usertbl U
          INNER JOIN buytbl B
             ON U.userid = B.userid ;
             

SELECT `이름`,`전화 번호` FROM v_userbuytbl;

DROP VIEW v_userbuytbl;

USE sqlDB;
CREATE OR REPLACE VIEW v_usertbl
AS
	SELECT userid, name, addr FROM usertbl;

DESCRIBE v_usertbl;

UPDATE v_usertbl SET addr = '부산' WHERE userid='JKW' ;

INSERT INTO v_usertbl(userid, name, addr) VALUES('KBM','김병만','충북') ;

-- 집계함수 사용한 뷰
CREATE VIEW v_sum
AS
	SELECT userid AS 'userid', SUM(price*amount) AS 'total'  
	   FROM buytbl GROUP BY userid;

SELECT * FROM v_sum;

SELECT * FROM INFORMATION_SCHEMA.VIEWS
     WHERE TABLE_SCHEMA = 'sqldb' AND TABLE_NAME = 'v_sum';

CREATE VIEW v_height177
AS
	SELECT * FROM usertbl WHERE height >= 177 ;

SELECT * FROM v_height177 ;

DELETE FROM v_height177 WHERE height < 177 ;

INSERT INTO v_height177 VALUES('KBM', '김병만', 1977 , '경기', '010', '5555555', 158, '2023-01-01') ;

ALTER VIEW v_height177
AS
	SELECT * FROM usertbl WHERE height >= 177
	    WITH CHECK OPTION ;

INSERT INTO v_height177 VALUES('WDT', '서장훈', 2006 , '서울', '010', '3333333', 155, '2023-3-3') ;

CREATE VIEW v_userbuytbl
AS
  SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS mobile
   FROM usertbl U
      INNER JOIN buytbl B
         ON U.userid = B.userid ;

INSERT INTO v_userbuytbl VALUES('PKL','박경리','운동화','경기','00000000000','2023-2-2');

DROP TABLE IF EXISTS buytbl, usertbl;

SELECT * FROM v_userbuytbl;

CHECK TABLE v_userbuytbl;