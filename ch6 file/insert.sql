USE sqldb;
CREATE TABLE testTbl1(id int, userName char(3),age int);
INSERT INTO testTbl1 VALUES(1,'홍길동',25);
INSERT INTO testTbl1(id,userName) VALUES(2,'설현');
INSERT INTO testTbl1(userName,age,id) VALUES('하니',26,3);
SELECT * FROM testTbl1