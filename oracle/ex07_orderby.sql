-- ex07_orderby.sql

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
    

    작성 순서: SELECT / FROM / WHERE / ORDER BY
    실행 순서: FROM -> WHERE -> SELECT -> ORDER BY
    
    ORDER BY
    - ORDER BY 컬럼명      //asc
    - ORDER BY 컬럼명 ASC  //ascending, 오름차순
    - ORDER BY 컬럼명 DESC //descending, 내림차순
    - ORDER BY 컬럼명 [,컬럼명]
    - ORDER BY
    
    ** 원본 테이블에 저장된 레코드의 순서는 랜덤이다.
    
    
    함수, Function
    1. 내장 함수 Built-in Function
    2. 사용자 정의 함수, User Function -> ANSI-SQL(X), PL/SQL(O)
*/

SELECT * FROM tblInsa;

SELECT * FROM tblInsa ORDER BY name ASC;
SELECT * FROM tblInsa ORDER BY basicpay DESC;

SELECT * FROM tblInsa ORDER BY buseo ASC, city DESC;


--tblInsa
-- 남자 -> 여자순으로 정렬
SELECT
    name, ssn
FROM tblInsa     
    ORDER BY
    CASE
        WHEN ssn LIKE '%-1%' THEN 1
        WHEN ssn LIKE '%-2%' THEN 2
    END ASC;

/*

    함수, Function
    1. 내장 함수 Built-in Function
    2. 사용자 정의 함수, User Function -> ANSI-SQL(X), PL/SQL(O)
    
    통계 함수, Aggregation Function
    - Java Stream -> count(), sum(), average(), max(), min()
    
    SQL 집계 함수
    1. count()
    2. sum()
    3. average()
    4. max()
    5. min()

*/

/*
    1. count()
    - 결과셋의 레코드 수를 반환
    - number count(*)   NULL 유무 상관없이 카운트
    - number count(특정 컬럼명)  NULL을 예상하고 카운트
    - null 값은 제외
*/

SELECT * FROM tblCountry;
SELECT COUNT(*) FROM tblCountry;


SELECT COUNT(*) - COUNT(tel) FROM tblInsa;

-- ** 자주 사용하는 패턴
-- 남자수와 여자수를 1개의 테이블로 가져오기
SELECT
    COUNT(CASE
        WHEN gender = 'm' THEN 1
    END),
    COUNT(CASE
            WHEN gender = 'f' THEN 1
    END)
FROM tblComedian;

SELECT COUNT(*) FROM tblInsa WHERE buseo = '홍보부';

SELECT
    COUNT(CASE WHEN buseo = '홍보부' THEN 1 END) AS 홍보부,
    COUNT(CASE WHEN buseo = '기획부' THEN 1 END) AS 기획부,
    COUNT(CASE WHEN buseo = '개발부' THEN 1 END) AS 개발부,
    COUNT(CASE WHEN buseo IN ('기획부', '개발부', '홍보부') THEN 1 END) AS 나머지부서
FROM tblInsa;

/*
    2. sum()
    - 해당 컬럼의 합을 구한다.
    - number sum(특정 컬럼명)
    - sum(*) -> 사용 불가
    - 숫자형 컬럼에만 사용 가능
*/

SELECT * FROM tblCountry;
SELECT SUM(population) AS 면적총합 FROM tblCountry;

SELECT 
    SUM(basicpay) AS 지출급여함,
    SUM(sudang) AS 지출수당합,
    SUM(basicpay) + SUM(sudang) AS 총지출,
    sum(basicpay + sudang) AS 총지출
FROM tblInsa;

/*
    3. average()
    - 해당 칼럼의 평균값 반환
    - number avg(특정 칼럼명)
    - avg(*) 사용 불가
    - 숫자형 칼럼만 사용 가능
*/
SELECT SUM(population) / 14 FROM tblCountry;
SELECT avg(population) FROM tblCountry;

-- 회사 -> 성과금 지급 -> 출처 -> 1팀의 공로
-- 1. 균등 지급 -> 총 지급액 / 모든직원수 = sum() / count(*)
-- 2. 차등 지급 -> 총 지급액 / 1팀 직원수 = sum() / count(1팀) = avg()

/*

    4. max()
        - 최댓값 반환
        - object MAX(특정 컬럼명)
    
    5. min()
        - 최솟값 반환
        - object MIN(특정 컬럼명)
    
    - 숫자형, 문자형, 날짜형 모두 적용
    
*/



-- 직원들의 이름과 전체 직원 수를 가져오세요.
SELECT * FROM tblInsa;

SELECT name, COUNT(name) FROM tblInsa; // 동시에 X

SELECT name FROM tblInsa;
SELECT COUNT(name) FROM  tblInsa;







