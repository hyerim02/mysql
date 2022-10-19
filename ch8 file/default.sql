DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID  	char(8) NOT NULL PRIMARY KEY,  
  name    	varchar(10) NOT NULL, 
  birthYear	int NOT NULL DEFAULT -1,
  addr	  	char(2) NOT NULL DEFAULT '서울',
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL DEFAULT 170, 
  mDate    	date NULL
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID	char(8) NOT NULL PRIMARY KEY,  
  name		varchar(10) NOT NULL, 
  birthYear	int NOT NULL ,
  addr		char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL, 
  mDate	date NULL 
);
ALTER TABLE userTBL
	ALTER COLUMN birthYear SET DEFAULT -1;
ALTER TABLE userTBL
	ALTER COLUMN addr SET DEFAULT '서울';
ALTER TABLE userTBL
	ALTER COLUMN height SET DEFAULT 170;

-- default 문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO userTBL VALUES ('LHL', '이혜리', default, default, '011', '1234567', default, '2022.12.12');
-- 열이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다
INSERT INTO userTBL(userID, name) VALUES('KAY', '김아영');
-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO userTBL VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2023.5.5');
SELECT * FROM userTBL;