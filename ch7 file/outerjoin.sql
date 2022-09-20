USE sqldb;
SELECT U.userID,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) AS '연락처' FROM usertbl U
	LEFT OUTER JOIN buytbl B
    ON U.userID=B.userID
ORDER BY U.userID; 

SELECT U.userID,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) AS '연락처' FROM usertbl U
	LEFT OUTER JOIN buytbl B
    ON U.userID=B.userID
    WHERE B.prodName IS NULL
ORDER BY U.userID; 