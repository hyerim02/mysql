USE sqldb;
SELECT S.stdName,S.addr,C.clubName,C.roomNo FROM stdtbl S
	LEFT OUTER JOIN stdclubtbl SC
    ON S.stdName=SC.stdName
    LEFT OUTER JOIN clubtbl C 
    ON SC.clubName=C.clubName
    ORDER BY S.stdName;
    
USE sqldb;
SELECT C.clubName,C.roomNo,S.stdName,S.addr FROM stdtbl S
	LEFT OUTER JOIN stdclubtbl SC
    ON SC.stdName=S.stdName
    RIGHT OUTER JOIN clubtbl C 
    ON SC.clubName=C.clubName
    ORDER BY C.clubName;  
    
SELECT S.stdName,S.addr,C.clubName,C.roomNo FROM stdtbl S
	LEFT OUTER JOIN stdclubtbl SC
    ON S.stdName=SC.stdName
    LEFT OUTER JOIN clubtbl C 
    ON SC.clubName=C.clubName
UNION
SELECT C.clubName,C.roomNo,S.stdName,S.addr FROM stdtbl S
	LEFT OUTER JOIN stdclubtbl SC
    ON SC.stdName=S.stdName
    RIGHT OUTER JOIN clubtbl C 
    ON SC.clubName=C.clubName;     