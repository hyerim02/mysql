INSERT INTO memberTBL VALUES ('Figure','연아','경기도 군포시 당정동');
SELECT * FROM memberTBL ;
UPDATE memberTBL SET memberAddress='서울 강남구 역삼동' WHERE memberName='연아';
SELECT * FROM memberTBL ;
# 회원 데이터에서 행 데이터를 삭제할 경우 다른 테이블에 지워진 데이터와 날짜 기록
CREATE TABLE deletedMemberTBL( 
    memberID CHAR(8), 
    memberName CHAR(5),
    memeberAddress CHAR(20),
    deleted DATE -- 삭제한 날짜
);

# 백업 테이블에서 지원진 데이터가 기록되는 트리거 생성
DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL -- 트리거 이름
  AFTER DELETE -- 삭제 후 작동하게 지정
  ON memberTBL -- 트리거를 부착할 테이블
  FOR EACH ROW -- 각 행마다 적용
BEGIN
   -- OLD 테이블의 내용을 백업 테이블에 삽입
   INSERT INTO deletedMemberTBL
          VALUES (OLD.memberID,OLD.memberName,OLD.memberAddress,CURDATE());
END//
DELIMITER ; 

SELECT * FROM memberTBL ;
DELETE FROM memberTBL WHERE memberName='당탕이';
SELECT * FROM memberTBL ;
SELECT * FROM deletedMemberTBL ;