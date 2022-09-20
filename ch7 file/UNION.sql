USE sqldb;
SELECT stdName, addr FROM stdtbl
	UNION ALL
SELECT clubName,roomNo FROM clubtbl;    

SELECT name, CONCAT(mobile1,mobile2) AS '전화번호' FROM usertbl
WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);
SELECT name, CONCAT(mobile1,mobile2) AS '전화번호' FROM usertbl
WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);