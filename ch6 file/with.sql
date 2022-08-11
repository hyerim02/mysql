USE sqldb;
SELECT userid AS '사용자', SUM(price*amount) AS '총구매액' FROM buyTBL GROUP BY userid;
WITH abc(userid,total)
AS (SELECT userid,SUM(price*amount) FROM buyTBL GROUP BY userid)
SELECT * FROM abc ORDER BY total DESC;
WITH cte_userTBL(addr,maxHeight)
AS (SELECT addr,MAX(Height) FROM usertbl GROUP BY addr)
SELECT AVG(maxHeight*1.0) AS '각 지역별 최고키의 평균' FROM cte_userTBL;