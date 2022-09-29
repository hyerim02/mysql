USE sqldb;
SELECT userID, SUM(price*amount) AS '총구매액' FROM buytbl
GROUP BY userID
ORDER BY SUM(price*amount) DESC;

SELECT B.userID, U.name, SUM(price*amount) AS '총구매액'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userID=U.userID
GROUP BY B.userID,U.name
ORDER BY SUM(price*amount) DESC;

SELECT U.userID, U.name, SUM(price*amount) AS '총구매액'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userID=U.userID
GROUP BY U.userID,U.name
ORDER BY SUM(price*amount) DESC;

SELECT U.userID, U.name, SUM(price*amount) AS '총구매액',
CASE
WHEN (SUM(price*amount)>=1500) THEN '최우수고객'
WHEN (SUM(price*amount)>=1000) THEN '우수고객'
WHEN (SUM(price*amount)>=1) THEN '일반고객'
ELSE '유령고객'
END AS '고객등급'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userID=U.userID
GROUP BY U.userID,U.name
ORDER BY SUM(price*amount) DESC;
