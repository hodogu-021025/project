-- ex06_column.sql

SELECT name, jikwi, buseo FROM tblInsa;

-- 연산
SELECT name || '님' FROM tblInsa;

-- 상수
SELECT name, 100 FROM tblInsa;
SELECT 100 FROM tblInsa;

SELECT name, length(name) FROM tblInsa;

/*

    Java Stream -> list.stream().distinct().forEach();
    
    distinct
    - Column List 에서 사용
    - 레코드의 중복값 제거
    - distinct 컬럼명 X
    - distinct 컬럼리스트 O
    
*/

-- tblCountry
-- 각 나라의 대륙?
SELECT name, continent FROM tblCountry;
SELECT DISTINCT continent FROM tblCountry;

/*

    case 문
    - 조건문 역할
    - 컬럼값 조작
    - 자바ㅣ 다중 if문 or switch문

*/

SELECT last || first AS name, gender, 
    -- 자바 if문
    CASE
        WHEN gender = 'm' THEN '남자'
        WHEN gender = 'f' THEN '여자'
    END AS gender_name,
    
    -- 자바 switch문
    CASE gender
        WHEN 'm' THEN '남자'
        WHEN 'f' THEN '여자'
    END AS gender_name2
    
FROM tblComedian;

SELECT 
    name, continent,
    CASE
        WHEN continent = 'AS' THEN '아시아'
        WHEN continent = 'EU' THEN '유럽'
        WHEN continent = 'AF' THEN '아프리카'
        ELSE continent
    END AS continent_name
FROM tblCountry;

SELECT
    LAST || FIRST AS name, weight,
    CASE
        WHEN weight > 90 THEN '과체중'
        WHEN weight > 50 THEN '정상체중'
        ELSE '저체중'
    END AS state,
    CASE
        WHEN weight BETWEEN 50 AND 90 THEN '정상'
        ELSE '주의'
    END AS state2
FROM tblComedian;
    

