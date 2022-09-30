USE sqldb;
PREPARE myQuery FROM 'SELECT * FROM usertbl WHERE userID="EJW"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;

USE sqldb;
DROP TABLE IF EXISTS myTable;
CREATE TABLE myTable (id INT AUTO_INCREMENT PRIMARY KEY, mDate DATETIME);
SET @curDATE=CURRENT_TIMESTAMP();
PREPARE myQuery FROM 'INSERT INTO myTable VALUES(NULL,?)';
EXECUTE myQuery USING @curDATE;
DEALLOCATE PREPARE myQuery;
SELECT * FROM myTable;