-- ex19_having.sql

/*
[WITH subquery_name AS (subquery)]
    SELECT column_list
    FROM table_name
    [WHERE search_condition]
    [GROUP BY group_by_expression]
    [HAVING search_condition]
    [ORDER BY order_expression [ASC | DESC]];
    
    SELECT column_list     -- 원하는 컬럼을 지정 > 해당 컬럼만 가져와라~
    FROM table_name        -- 데이터 소스, 어떤 테이블로부터 데이터를 가져올지
    WHERE search_condition -- 행 조건 지정 > 원하는 행만 가져와라~
    Group By group_by_expression -- 그룹을 나눈다
    HAVING search_condition -- 원하는 그룹을 지정 > 해당 그룹만 가져오기
    ORER BY order_expression [ASC | DESC] -- 레코드 정렬
    
    4. select
    1. from
    2. where
    3. Group by
    5. ORDER BY
    
    from + where
    - from: 모든 레코드 가져온다
    - where : 레코드 마다 검사
    
    group by + having
    - group by: 그룹을 생성한다
    - having : 그룹마다 검사
*/

SELECT buseo, COUNT(*) FROM tblInsa WHERE city IN ('서울', '인천') GROUP BY buseo HAVING COUNT(*) > 5;

SELECT COUNT(*) FROM tblInsa WHERE city IN ('서울', '인천');

/*

    SQL
    1. Main Query, 쿼리
        - 하나의 문장안에 하나의 SELECT INSERT UPDATE DELETE

    2. Sub Query, 서브쿼리
        - 하나의 문장안에 또 다른 문장이 들어있는 쿼리
        - 메인쿼리 <- 서브쿼리(대부분 SELECT)
        - SELECT <- SELECT
        - INSERT <- SELECT
        - UPDATE <- SELECT
        - DELETE <- SELECT

*/

--tblCountry
--권장 X
SELECT MAX(population) FROM tblCountry;
SELECT NAME FROM tblCountry WHERE population = 120660;

--권장
SELECT name FROM tblCountry WHERE population = (SELECT MAX(population) FROM tblCountry);


--tblInsa
SELECT * FROM tblInsa WHERE basicpay >= (SELECT AVG(basicpay) FROM tblComedian);


/*

    서브쿼리 삽입 위치
    
    1. WHERE절
    2. SELECT절
    3. FROM절
    
    a. 반환값이 1행 1열
    b. 반환값이 N행 1열
    c. 반환값이 1행 N열
    d. 반환값이 N행 N열
*/



