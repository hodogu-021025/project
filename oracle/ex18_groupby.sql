-- ex18_groupby.sql

/*

    [WITH subquery_name AS (subquery)]
    [WHERE search_condition]
    [GROUP BY group_by_expression]
    [HAVING search_condition]
    [ORDER BY order_expression [ASC | DESC]];
    
    SELECT 각 절
    1. 해당 절이 무슨 일?
    2. 각 절의 실행 순서
    
    SELECT column_list      -- 원하는 Column을 지정: 해당 Column만 가져와
    FROM table_name         -- 데이터 소스: 어떤 테이블로부터 데이터를 가져오는지
    WHERE search_condition  -- 행 조건 지정: 원하는 행을 찾는다
    ORDER BY order_expression [ASC | DESC]  -- 레코드 정렬
    

    작성 순서: SELECT / FROM / WHERE / GROUP BY / ORDER BY
    실행 순서: FROM -> WHERE -> SELECT -> GROUP BY -> ORDER BY
    
    GROUP BY
    - 특정 칼럼으로 레코드들을 그룹으로 나눈다
    
*/

SELECT * FROM tblInsa;

--tblInsa 직위별 평균 급여
SELECT AVG(basicpay) FROM tblInsa;

SELECT DISTINCT jikwi FROM tblInsa;

SELECT * FROM tblInsa WHERE jikwi = '부장';
SELECT * FROM tblInsa WHERE jikwi = '과장';
SELECT * FROM tblInsa WHERE jikwi = '대리';
SELECT * FROM tblInsa WHERE jikwi = '사원';

SELECT jikwi, ROUND(AVG(basicpay)) FROM tblInsa GROUP BY jikwi;

SELECT COUNT(*), buseo FROM tblInsa GROUP BY buseo;

SELECT
    CASE 
        WHEN SUBSTR(ssn, 8, 1) IN ('1', '3') THEN '남자'
        WHEN SUBSTR(ssn, 8, 1) IN ('2', '4') THEN '여자'
    END AS 성별,
    COUNT(*) AS 인원수,
    sum(basicpay) AS 급여합,
    AVG(basicpay) AS 평균급여,
    MAX(basicpay) AS 최대급여,
    MIN(basicpay) AS 최소급여
FROM tblInsa
GROUP BY SUBSTR(ssn, 8, 1);

SELECT
    CASE
        WHEN jikwi IN ('과장', '부장') THEN 1
        ELSE 2
    END
FROM tblInsa;


SELECT
    COUNT(*)
FROM tblInsa
GROUP BY basicpay;

SELECT
    TRUNC(basicpay / 100000)
FROM tblInsa
GROUP BY TRUNC(basicpay / 100000);

SELECT
    CASE
        WHEN completedate IS NOT NULL THEN 1
        ELSE 2
    END
FROM tblTodo;