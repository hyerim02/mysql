USE sqldb;
SELECT * FROM usertbl;
SELECT * FROM usertbl WHERE name = '김경호';
SELECT userID, Name FROM usertbl WHERE birthYear >=1970 AND height >=182;
SELECT userID, Name FROM usertbl WHERE birthYear >=1970 OR height >=182;