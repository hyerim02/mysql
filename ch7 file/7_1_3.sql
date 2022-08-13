USE sqldb;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;
SELECT CAST(AVG(amount) AS SIGNED INTEGER )AS '평균 구매 개수' FROM buytbl;
SELECT CONVERT(AVG(amount), SIGNED INTEGER )AS '평균 구매 개수' FROM buytbl;
SELECT CAST('1998$02$18' AS DATE);
SELECT CAST('1998/02/18' AS DATE);
SELECT CAST('1998%02%18' AS DATE);
SELECT CAST('1998@02@18' AS DATE);
SELECT num, CONCAT(CAST(price AS CHAR(10)),'X', CAST(amount AS CHAR(4)),'=') AS 
'단가X수량', 
price*amount AS '구매액' 
FROM buytbl;
SELECT '100'+'200'; #문자와 문자를 더했지만 정수로 변환되서 연산됨
SELECT CONCAT('100','200'); #문자와 문자 연결 
SELECT CONCAT(100,'200'); #정수와 문자 연결했지만 정수가 문자로 바뀜
SELECT 1>'2mega';#1>2 거짓 0
SELECT 3>'2mega';#3>2 참 1
SELECT 0='mega2';#0=0 참 1