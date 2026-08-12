-- ex16_update.sql

/*

    UPDATE
    - 원하는 행의 원하는 컬럼값으로 수정하는 명령어
    
    구문
    UPDATE 테이블명 SET 컬럼명 = 값 [,컬럼명=값]  x N [WHERE절]

*/

COMMIT;
ROLLBACK;

SELECT * FROM tblCountry;


UPDATE tblCountry SET capital = '세종';
UPDATE tblCountry SET capital = '세종' WHERE name = '대한민국';

UPDATE tblMemo SET memo = '새로운 메모' WHERE seq = 1;

SELECT * FROM tblMemo;