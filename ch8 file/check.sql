-- 출생연도가 1900년 이후 그리고 2020년 이전, 이름은 반드시 넣어야 함.
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID  CHAR(8) PRIMARY KEY,
  name    VARCHAR(10) , 
  birthYear  INT CHECK  (birthYear >= 1900 AND birthYear <= 2020),
  mobile1	char(3) NULL, 
  CONSTRAINT CK_name CHECK ( name IS NOT NULL)  
);
-- 휴대폰 국번 체크
ALTER TABLE userTbl
	ADD CONSTRAINT CK_mobile1
	CHECK  (mobile1 IN ('010','011','016','017','018','019')) ;
    