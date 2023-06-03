USE sqlDB;
DROP PROCEDURE IF EXISTS userProc1;
DELIMITER $$
CREATE PROCEDURE userProc1(IN userName VARCHAR(10))
BEGIN
	SELECT *FROM userTbl WHERE name=userName;
END $$
DELIMITER ;
CALL userProc1('조관우');

-- 2개
DROP PROCEDURE IF EXISTS userProc2;
DELIMITER $$
CREATE PROCEDURE userProc2(
IN userBirth INT,
IN userHeight INT)
BEGIN
	SELECT *FROM userTbl 
    WHERE birthYear > userBirth AND height > userHeight;
END $$
DELIMITER ;
CALL userProc2(1970,178);

-- 출력 매개 변수
DROP PROCEDURE IF EXISTS userProc3;
DELIMITER $$
CREATE PROCEDURE userProc3(
IN txtValue CHAR(10),
OUT outValue INT)
BEGIN
	INSERT INTO testTBL VALUES(NULL,txtValue);
	SELECT MAX(id) INTO outValue FROM testTBL;
END $$
DELIMITER ;
CREATE TABLE IF NOT EXISTS testTBL(
	id INT AUTO_INCREMENT PRIMARY KEY,
    txt CHAR(10));

CALL userProc3('테스트값',@myValue);
SELECT CONCAT('현재 입력된 ID 값 ==>',@myValue);

DROP PROCEDURE IF EXISTS ifelseProc;
DELIMITER $$
CREATE PROCEDURE ifelseProc(
IN userName VARCHAR(10))
BEGIN
	DECLARE bYear INT;
    SELECT birthYear into bYear FROM userTbl
    WHERE name=userName;
    IF (bYear>=1980) THEN SELECT '아직 젊군요.';
    ELSE
    SELECT '나이가 지긋하시네요.';
    END IF;
END $$
DELIMITER ;
CALL ifelseProc('조용필');

DROP PROCEDURE IF EXISTS caseProc;
DELIMITER $$
CREATE PROCEDURE caseProc(
IN userName VARCHAR(10))
BEGIN
	DECLARE bYear INT;
    DECLARE tti CHAR(3);
    SELECT birthYear into bYear FROM userTbl
    WHERE name=userName;
    CASE
    WHEN(bYear%12=0) THEN SET tti='원숭이';
    WHEN(bYear%12=1) THEN SET tti='닭';
    WHEN(bYear%12=2) THEN SET tti='개';
    WHEN(bYear%12=3) THEN SET tti='돼지';
    WHEN(bYear%12=4) THEN SET tti='쥐';
    WHEN(bYear%12=5) THEN SET tti='소';
    WHEN(bYear%12=6) THEN SET tti='호랑이';
    WHEN(bYear%12=7) THEN SET tti='토끼';
    WHEN(bYear%12=8) THEN SET tti='용';
    WHEN(bYear%12=9) THEN SET tti='뱀';
    WHEN(bYear%12=10) THEN SET tti='말';
    ELSE SET tti='양';
    END CASE;
    SELECT CONCAT(userName,'의 띠==>',tti);
END $$
DELIMITER ;
CALL caseProc('김범수');

DROP PROCEDURE IF EXISTS errorProc;
DELIMITER $$
CREATE PROCEDURE errorProc()
BEGIN
    DECLARE i INT;
    DECLARE hap INT;
    DECLARE savehap INT;
    DECLARE EXIT HANDLER FOR 1264
    BEGIN 
    SELECT CONCAT('INT 오버플로 직접의 합계-->',savehap);
    SELECT CONCAT('1+2+3+...+',i,'=오버플로');
    END;
    SET i=1;
    SET hap=0;
    WHILE (TRUE)DO
		SET savehap=hap;
        SET hap=hap+i;
        SET i=i+1;
	END WHILE;
END $$
DELIMITER ;
CALL errorProc();

SELECT routine_name, routine_definition FROM INFORMATION_SCHEMA.ROUTINES
WHERE routine_schema='sqldb' AND routine_type='PROCEDURE';

SELECT parameter_mode, parameter_name, dtd_identifier FROM INFORMATION_SCHEMA.PARAMETERS
WHERE specific_name='userProc3';

SHOW CREATE PROCEDURE sqldb.userProc3;

DROP PROCEDURE IF EXISTS nameProc;
DELIMITER $$
CREATE PROCEDURE nameProc(
IN tblName VARCHAR(20))
BEGIN
    SELECT * FROM tblName;
END $$
DELIMITER ;
CALL nameProc('userTBL');

DROP PROCEDURE IF EXISTS nameProc;
DELIMITER $$
CREATE PROCEDURE nameProc()
BEGIN
    PREPARE myQuery FROM 'SELECT * FROM usertbl';
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;
CALL nameProc();
