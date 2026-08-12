-- ex17_delete.sql

/*

    DELETE
    - 원하는 행을 삭제하는 명령어
    - 컬럼의 행을 삭제
    
    DELETE [FROM] 테이블명 [WHERE]
    
*/

COMMIT;
ROLLBACK;

SELECT * FROM tblCountry;

DELETE FROM tblCountry WHERE name = '중국'; 
DELETE FROM tblCountry;