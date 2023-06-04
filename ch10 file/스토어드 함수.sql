SET GLOBAL log_bin_trust_function_creators=1;

USE sqlDB;
DROP FUNCTION IF EXISTS userFunc;
DELIMITER $$
CREATE FUNCTION userFunc(value1 INT,value2 INT)
	RETURNS INT
BEGIN
	RETURNS value1+value2;
END $$
DELIMITER;
SELECT userFunc(100,200);