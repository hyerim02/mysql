USE sqldb;
SELECT * FROM usertbl;
SELECT name, height FROM usertbl WHERE height >=180 AND height<=183;
SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 183;
SELECT name, addr FROM usertbl WHERE addr='경남' OR addr='전남' OR addr='경북';
SELECT name, addr FROM usertbl WHERE addr IN ('경남' ,'전남' ,'경북');
SELECT name, height FROM usertbl WHERE name LIKE '김%';
SELECT name, height FROM usertbl WHERE name LIKE '_종신';