--ex11_casting_function.sql

/*

    SQL
    유연한 문법을 제공
    자료형 판정에 대해서 유연함 -> 자동 형변환
    
    형변환 함수 -> 오라클 함수
    1. VARCHAR2 TO_CHAR(숫자형 [,형식문자열])
    2. VARCHAR2 TO_CHAR(날짜형 [,형식문자열])
    3. NUMBER TO_NUMBUR
    4. DATE TO_DATE
    
    1. VARCHAR2 TO_CHAR(숫자형 [,형식문자열])
    
    형식문자열 구성 요소
    a. 9: 숫자 1개를 문자 1개로 바꾸는 역할
    b. 0: 숫자 1개를 문자 1개로 바꾸는 역할
    c. $: 달러 기호
    d. L: 통화 기호
    e. .: 소수점
    f. ,: 자릿수
*/

SELECT
    weight,
    TO_CHAR(weight),
    TO_CHAR(weight, '99999'),
    TO_CHAR(weight, '00000'),
    TO_CHAR(weight, 'FM99999'),  -- FM: 공백제거
    TO_CHAR(weight, 'FM00000')
FROM tblComedian;


SELECT
    3.14,
    TO_CHAR(3.14, '9.99'),
    TO_CHAR(3.14, '99.9')
FROM dual;

/*

    VARCHAR2 TO_CHAR(날짜형 [,형식문자열])

    형식문자열 구성요소
    a. yyyy
    b. yy
    c. month
    d. mon
    e. mm
    f. day
    g. dy
    h. ddd
    i. dd 
    j. d
    k. hh
    l. hh24
    m. mi
    n. ss
    o. am(pm)

*/

SELECT sysdate FROM dual;

SELECT TO_CHAR(sysdate, 'yyyy') FROM dual;
SELECT TO_CHAR(sysdate, 'yy') FROM dual;
SELECT TO_CHAR(sysdate, 'month') FROM dual;
SELECT TO_CHAR(sysdate, 'mon') FROM dual;
SELECT TO_CHAR(sysdate, 'mm') FROM dual;
SELECT TO_CHAR(sysdate, 'day') FROM dual;
SELECT TO_CHAR(sysdate, 'dy') FROM dual;
SELECT TO_CHAR(sysdate, 'ddd') FROM dual;
SELECT TO_CHAR(sysdate, 'dd') FROM dual;
SELECT TO_CHAR(sysdate, 'd') FROM dual;
SELECT TO_CHAR(sysdate, 'hh') FROM dual;
SELECT TO_CHAR(sysdate, 'hh24') FROM dual;
SELECT TO_CHAR(sysdate, 'mi') FROM dual;
SELECT TO_CHAR(sysdate, 'ss') FROM dual;
SELECT TO_CHAR(sysdate, 'am') FROM dual;
SELECT TO_CHAR(sysdate, 'pm') FROM dual;

-- ISO
SELECT
    sysdate,
    TO_CHAR(sysdate, 'yyyy-mm-dd'),
    TO_CHAR(sysdate, 'hh24-mi-ss')
FROM dual;

SELECT
    name, ibsadate,
    TO_CHAR(ibsadate, 'yyyy-mm-dd') AS 입사일,
    TO_CHAR(ibsadate, 'day') AS 요일,
    CASE
        WHEN to_char(ibsadate, 'd') IN ('7', '1') THEN '주말입사'
        ELSE '평일입사'
    END
FROM tblInsa;

-- 3. NUMBER TO_NUMBUR

-- 4. DATE TO_DATE(문자형)

SELECT * FROM tblInsa WHERE ibsadate >= '2010-01-01';

SELECT ibsadate, '2020-01-01' FROM tblInsa;

SELECT 
    ibsadate,
    '2020-01-01',
    TO_DATE('2020-01-01', 'yyyy-mm-dd') -- 권장
FROM tblInsa;

