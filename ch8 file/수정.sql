USE tabledb;
-- 추가
ALTER TABLE usertbl
	ADD hompage VARCHAR(30)
    	DEFAULT 'http://www.hanbit.co.kr'
        NULL;
-- 삭제   
ALTER TABLE usertbl    
	DROP COLUMN mobile1;
    
-- 이름 및 형식 변경    
ALTER TABLE usertbl    
	CHANGE COLUMN name uName VARCHAR(20) NULL;
    
-- 제약 조건 추가 및 삭제
ALTER TABLE usertbl    
	DROP PRIMARY KEY;