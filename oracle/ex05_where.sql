-- ex05_where.sql

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
    
    실행 순서
    FROM -> WHERE -> SELECT

    BETWEEN
    - WHERE 절에서 조건으로 많이 사용
    - 컬럼명 BETWEEN 최솟값 AND 최댓값
    - 범위 비교
    - 가독성 향상
    
    IN
    - WHERE 절에서 조건으로 많이 사용
    - 열거형 비교
    - 컬럼명 IN (VALUE, VALUE, VALUE ...)
    - 가독성 향상
    
    LIKE
    - WHERE 절에서 조건으로 많이 사용
    - 패턴 비교
    - 칼럼명 LIKE '패턴 문자열'

        패턴 문자열의 구성 요소
        1. _ : 임의의 문자 1개(.)
        2. % : 임의의 문자 N개, 0~무한대(.*)
    
    NULL
    - SQL은 피연산자로 NULL을 가질 수 없다.
    
    IS NULL
    - WHERE 절에서 많이 사용
    - NULL 조건
    - 컬럼명 IS NULL
*/

SELECT * FROM tblTodo WHERE completedate IS NOT NULL;

SELECT * FROM tblCountry WHERE population IS NULL;

-- 직원명: 김oo
SELECT * FROM tblInsa;
SELECT * FROM tblInsa WHERE name LIKE '김__';
SELECT * FROM tblInsa WHERE ssn LIKE '______-2______';



-- tblInsa
SELECT * FROM tblInsa WHERE buseo = '개발부' OR buseo = '홍보부' OR buseo = '총무부';
SELECT * FROM tblInsa WHERE buseo IN ('개발부', '홍보부');

SELECT *
    FROM employees
        WHERE first_name >= 'H';
        
SELECT *
    FROM employees
        WHERE first_name BETWEEN 'H' AND 'J';

DESC tblInsa;
SELECT * FROM tblInsa WHERE ibsadate <= '2010-01-01';
SELECT * FROM tblInsa WHERE ibsadate BETWEEN '2010-01-01' AND '2010-12-12';
    
SELECT *
    FROM tblInsa
        WHERE basicpay BETWEEN 1500000 AND 2000000;

SELECT *
    FROM tblCountry
        WHERE 가져오고 싶은 행을 찾기 위한 조건;
        
SELECT *
    FROM tblCountry
        WHERE continent <> 'AS';
        
-- tblComedian
SELECT * FROM tblComedian;
-- 1. weight가 60 이상, height가 170 미만
SELECT *
    FROM tblComedian
        WHERE weight >= 60 and height < 170;
-- 2. 몸무게가 70 미만인 여자
SELECT *
    FROM tblComedian
        WHERE GENDER = 'f'and weight < 60;

-- tblInsa
SELECT * FROM tblInsa;
-- 3. buseo가 '개발부', basicpay가 150 이상
SELECT *
    FROM tblInsa
        WHERE buseo = '개발부' and basicpay >= 1500000;
        
-- 4. basicpay + sudang 이 200 이상인 직원
SELECT *
    FROM tblInsa
        WHERE (basicpay + sudang) >= 2000000;
