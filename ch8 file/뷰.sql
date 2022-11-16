USE tabledb;
SELECT userID, name, addr FROM usertbl;

USE tabledb;
CREATE VIEW v_usertbl
AS
	SELECT userid, name, addr FROM usertbl;
SELECT * FROM v_usertbl;  -- 뷰를 테이블이라고 생각해도 무방