-- ex04_operator.sql

/*

    연산자, Operator
    
    1. 산술 연산자
    - +, -, *, /
    - %(없음) -> 함수 제공 mod()

    2. 문자열 연산자
    - ||
    
    3. 비교 연산자
    - >, >=, <, <=
    - =(==), <>(!=)
    - 논리값 반환 -> boolean X
        3-1. 조건 상황 존재 -> 내부적으로는 참/거짓 판단 가능
        3-2. 논리 상태를 시각적으로 표현 불가능
    - 조건절에서 많이 사용
    
    4. 논리 연산자
    - and(&&), or(||), not(!)
    
    5. 대입 연산자
    - =
    - upadate 문
    - 복합 대입 연산자(+=, -=..) djqtdma
    - num += 10 (X)
    - num = num + 10 (O)
    
    6. 3항 연산자
    - 없음
    - 제어문도 없음
    
    7. 증감 연산자
    - 없음
    
    8. SQL 연산자
    - Java: instanceof
    - SQL: in, between, like, is 등...
    
*/

SELECT * FROM tblCountry;

SELECT 
    area / population
    FROM tblCountry;
    
SELECT
    name, capital,
    name || capital
FROM tblCountry;
    
    
SELECT 
    area > 10
    FROM tblCountry;
    
-- 대다수 언어의 모든 연산자는 피연산자로 null을 가질 수 없다.
-- 10 + 0 = 10
-- 10 + null = null (연산 불가능)

SELECT
    population,
    population + 100
FROM tblCountry;

-------------------------

/*

    Column명 바꾸기
    1. 테이블의 컬럼명을 실제로 수정하기
    2. SELECT 실행 후 -> 결과 테이블, 결과 셋
                      -> 결과셋의 컬럼명을 수정하기
                      -> 원본 테이블에는 영향을 주지 않는다.
    테이블/컬럼 -> 별칭(Alias)
    - 별칭은 원본명과 동시에 사용될 수 없다.
    
    테이블 별칭
    - SQL 작성을 간결하게
    
    하나의 테이블내에서 같은 컬럼명이 2개이상
    1. 물리적 테이블(DB, 원본) -> 불가능
    2. 결과셋 불러오기는 가능
    3. 결과셋 재사용은 불가능
    결론 -> 무조건 컬럼명을 유일하게 (별칭)
*/

--hr 스키마 생략 이유? 현재 접속한 유저가 hr이여서
SELECT name, capital FROM tblCountry;
SELECT name, capital FROM hr.tblCountry;

--테이블 별칭 부여
SELECT c.name, c.capital FROM tblCountry c;

SELECT c.name, c.capital FROM tblCountry c;



SELECT
    tblMen.name AS men,
    tblWomen.name AS women
FROM tblMen INNER JOIN tblWomen
    ON tblMen.couple = tblWomen.name;


SELECT
    name,
    name AS name2
FROM tblCountry;

CREATE TABLE tblType2 (
    num number,
    num number
);


SELECT
    name AS 국가명,
    capital AS 수도명
FROM tblCountry;


SELECT  
    name AS 국가명,
    population AS 인구수,
    area AS 면적,
    area / population AS 인당국토면적
FROM tblCountry;

SELECT name FROM tblMen;
SELECT name FROM tblWomen;

SELECT * FROM tblMen INNER JOIN tblWomen ON tblMen.couple = tblWomen.name;



