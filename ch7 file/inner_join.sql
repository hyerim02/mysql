USE sqldb;
SELECT * FROM buytbl
	INNER JOIN usertbl
    ON buytbl.userID=usertbl.userID
WHERE buytbl.userID='JYP';    
USE sqldb;
SELECT * FROM buytbl
	INNER JOIN usertbl
    ON buytbl.userID=usertbl.userID
ORDER BY num;    
USE sqldb;
SELECT buytbl.userID,name,prodName,addr,CONCAT(mobile1,mobile2) AS '연락처' FROM buytbl
	INNER JOIN usertbl
    ON buytbl.userID=usertbl.userID
ORDER BY num;  
USE sqldb;
SELECT B.userID,U.name,prodName,addr,CONCAT(mobile1,mobile2) AS '연락처' FROM buytbl B
	INNER JOIN usertbl U
    ON B.userID=U.userID
ORDER BY num;  