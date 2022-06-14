DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
   SELECT * FROM memberTBL WHERE memberName='당탕이' ;
   SELECT * FROM productTBL WHERE productName='냉장고' ;
END//
DELIMITER ; 
CALL myProc() ; 