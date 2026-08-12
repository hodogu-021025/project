--ex08_number_function.sql

/*

    Java
    - Math.random()
    - Math.XXX()

    수학 함수
    
    round()
    - 반올림 함수
    - number round (컬럼명)
    - number round (컬럼명, 소수이하 자릿수): 정수 or 실수 반환  
*/

SELECT * FROM tblType;
DELETE FROM tblType WHERE txt <> 'ABC';

SELECT ROUND(3.14) FROM tblType;

/*
    FLOOR()
    - 절삭 함수 -> 소수 이하 버린다.
    - 무조건 내림 함수
*/

SELECT
    FLOOR(3.2),
    FLOOR(3.9)
FROM dual;

/*
    CEIL()
    - 무조건 올림 함수
    - 정수 반환
*/
SELECT
    CEIL(3.2),
    CEIL(3.9)
FROM dual;


SELECT
    ABS(10), ABS(-10),
    POWER(2,2), POWER(2,9),
    SQRT(4), SQRT(9.9)
FROM dual;


