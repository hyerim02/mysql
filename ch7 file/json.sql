USE  sqldb;
SELECT JSON_OBJECT('name',name,'height',height) AS 'JSON값' FROM usertbl WHERE height>=180;