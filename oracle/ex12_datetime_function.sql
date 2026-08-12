-- ex12_datetime_function.sql

/*

    날짜시간 함수
    
    SYSDATE
    - 시스템의 시간을 반환
    - DATE SYSDATE

*/

SELECT sysdate FROM dual;

/*

    날짜 연산
    1. 시각 - 시각 = 시간
    2. 시각 + 시간 = 시각
    3. 시각 - 시간 = 시각

*/

-- 1. 시각 - 시각 = 시간
-- 현재 - 입사일 = 근무일
SELECT 
    name, TO_CHAR(ibsadate, 'yyyy-mm-dd') AS 입사일,
    ROUND(SYSDATE - ibsadate) AS 근무일수,
    ROUND((SYSDATE - ibsadate) * 24) AS 근무시수,
    ROUND((SYSDATE - ibsadate) * 24 * 60) AS 근무분수
FROM tblInsa;

/*

    2. 시각 + 시간 = 시각
    3. 시각 - 시간 = 시각

*/

SELECT
    SYSDATE,
    SYSDATE + 100 AS "100일 후",
    SYSDATE - 100 AS "100일 전",
    TO_CHAR(SYSDATE + (3/24), 'hh24:mi:ss') AS "3시간 뒤",
    TO_CHAR(SYSDATE - (30/60/24), 'hh24:mi:ss') AS "30분 전"
FROM dual;


/*

    날짜 연산(년, 월)
    
    시각 - 시각 = 시간(월)
    MONTHS_BETWEEN(date, date)

*/
SELECT
    name,
    ROUND(SYSDATE - ibsadate) AS 근무일수,
    ROUND(MONTHS_BETWEEN(SYSDATE, ibsadate)) AS 근무개월수
FROM tblInsa;

SELECT
    SYSDATE,
    ADD_MONTHS(SYSDATE, 20),
    ADD_MONTHS(SYSDATE, -10),
    ADD_MONTHS(SYSDATE, 30 * 12)
FROM dual;

/*

    시각 - 시각 = 시간 의 결과값이
    1. 일, 시, 분, 초 -> 연산자(-)
    2. 년, 월 -> MONTHS_BETWEEN()
    
    시각 += 시간(*) = 시각 의 결과값이
    1. 일, 시, 분, 초 -> 연산자(+,-)
    2. 년, 월 -> ADD_MONTHS()
    
*/

-- NULL 함수 -> NULL VALUE
-- 1. NVL
-- 2. NVL2
SELECT
    name, population,
    CASE
        WHEN population IS NULL THEN 0
        ELSE population
    END,
    NVL(population, 0),
    NVL2(population, 10000, 0)
FROM tblCountry;