--ex03_select.sql
/*
        
    1. INSERT: 1회
    2. SELECT: N회
    3. UPDATE: 0~N회
    4. DELETE: 1회
    
    SELECT 
    - DML, DQL
    - 특정 테이블로부터 원하는 데이터를 가져온다. 읽기
    
    
    SELECT 구문
    - **절 -> 각각 기능
    
    [WITH subquery_name AS (subquery)]
    [WHERE search_condition]
    [GROUP BY group_by_expression]
    [HAVING search_condition]
    [ORDER BY order_expression [ASC | DESC]];
    
    SELECT 각 절
    1. 해당 절이 무슨 일?
    2. 각 절의 실행 순서
    
    SELECT column_list  원하는 Column을 지정 -> 해당 Column만 가져와
    FROM table_name     데이터 소스: 어떤 테이블로부터 데이터를 가져오는지
    
    실행 순서
    SELECT -> FROM
    
*/

SELECT * FROM tblCountry; -- * : all

SELECT name FROM tblCountry; -- 단일 Column

SELECT capital, name    -- 다중 Column
FROM tblCountry;

SELECT name, name    -- 같은 Column 여러번 호출
FROM tblCountry;

-- hr.employees -> 처음 보는 Table -> Table schema -> 어떤 Column?
-- 1. DDL 확인 (CREATE TABLE employees 찾기)
-- 2. Table 명세서
-- 3. 직접 테이블 객체 확인

-- 중요도 2 >>>>> 1 > 3

-- DESCRIBE
DESC employees;
