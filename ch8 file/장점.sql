SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM usertbl U
  INNER JOIN buytbl B
     ON U.userid = B.userid ;
     
CREATE VIEW v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM usertbl U
	INNER JOIN buytbl B
	 ON U.userid = B.userid ;
     

SELECT * FROM v_userbuytbl WHERE name = '김범수';     