SELECT ADDDATE('2025-01-01', INTERVAL 31 DAY),ADDDATE('2025-01-01', INTERVAL 1 MONTH);
SELECT SUBDATE('2025-01-01', INTERVAL 31 DAY),SUBDATE('2025-01-01', INTERVAL 1 MONTH);
SELECT ADDTIME('2025-01-01 23:59:59','1:1:1'),ADDTIME('15:00:00', '2:10:10');
SELECT SUBTIME('2025-01-01 23:59:59','1:1:1'),SUBTIME('15:00:00', '2:10:10');
SELECT YEAR(CURDATE()), MONTH(CURDATE()),DAY(CURDATE());
SELECT HOUR(CURTIME()),MINUTE(CURTIME()),SECOND(CURTIME()),MICROSECOND(CURTIME());
SELECT DATE(NOW()),TIME(NOW());
SELECT DATEDIFF('2025-01-01',NOW()),TIMEDIFF('23:23:59','12:11:10');
SELECT DAYOFWEEK(CURTIME()),MONTHNAME(CURTIME()),DAYOFYEAR(CURTIME());
SELECT LAST_DAY('2025-02-01');
SELECT MAKEDATE(2025,38);
SELECT MAKETIME(12,11,1);
SELECT PERIOD_ADD(22501,11),PERIOD_DIFF(202501,202312);
SELECT QUARTER('2025-07-07');
SELECT TIME_TO_SEC('1:0:0');