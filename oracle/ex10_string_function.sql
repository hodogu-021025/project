--ex09_string_function.sql

/*

    문자열 함수
    1. UPPER:   대문자 변환
    2. LOWER:   소문자 변환
    3. INITCAP: 첫 글자만 대문자 -> 소문자
    
*/

SELECT
    'aBcDeF',
    UPPER('aBcDeF'), --ABCDEF
    LOWER('aBcDeF'), --abcdef
    INITCAP('aBcDeF')--Abcdef
FROM dual;

SELECT
    name,
    substr(name, 1, 3),
    substr(name, 2)
FROM tblCountry;

SELECT NAME FROM tblInsa;

SELECT COUNT(*) FROM tblInsa WHERE SUBSTR(name, 1, 1) = '김';
SELECT COUNT(*) FROM tblInsa WHERE SUBSTR(name, 1, 1) = '이';
SELECT COUNT(*) FROM tblInsa WHERE SUBSTR(name, 1, 1) = '박';
SELECT COUNT(*) FROM tblInsa WHERE SUBSTR(name, 1, 1) = '최';
SELECT COUNT(*) FROM tblInsa WHERE SUBSTR(name, 1, 1) = '정';

--case + count
SELECT
    COUNT(CASE WHEN SUBSTR(name, 1, 1) = '김' THEN 1 END) 김씨,
    COUNT(CASE WHEN SUBSTR(name, 1, 1) = '이' THEN 1 END) 이씨,
    COUNT(CASE WHEN SUBSTR(name, 1, 1) = '박' THEN 1 END) 박씨,
    COUNT(CASE WHEN SUBSTR(name, 1, 1) = '최' THEN 1 END) 최씨,
    COUNT(CASE WHEN SUBSTR(name, 1, 1) = '정' THEN 1 END) 정씨
FROM tblInsa;

/*

    문자열 길이
    - number length(컬럼명)

*/

SELECT name, length(name) FROM tblCountry;

-- WHERE(조건절)에서 사용
SELECT name, length(name)
    FROM tblCountry
        WHERE length(name) = 2;
       
-- ORDER BY 
SELECT
    name,
    LENGTH(name) AS name_length
FROM tblCountry
    ORDER BY name_length DESC;
    
/*

    문자열 검색
    - instr() == indexOf() + lastIndexOf()
    - 검색어의 위치를 반환
    - number instr(컬럼명, 검색어)
    - number instr(컬럼명, 검색어, 시작위치)
    - number instr(컬럼명, 검색어, 시작위치, -1)

*/
    
SELECT
    '안녕하세요. 홍길동님',
    INSTR('안녕하세요. 홍길동님', '홍길동') r1,
    INSTR('안녕하세요. 홍길동님', '아무개') r2,
    INSTR('안녕하세요. 홍길동님. 홍길동님. 홍길동님', '홍길동') r3,
    INSTR('안녕하세요. 홍길동님. 홍길동님. 홍길동님', '홍길동', 11) r4,
    INSTR('안녕하세요. 홍길동님. 홍길동님. 홍길동님', '홍길동', -1) r5
FROM dual;    

/*

    Padding Function
    - lpad(): left padding -> VARCHAR2 LPAD(컬럼명, 개수, 문자)
    - rpad(): right padding -> VARCHAR2 RPAD(컬럼명, 개수, 문자)

*/

SELECT
    'A',
    LPAD('A', 5),
    RPAD('A', 5),
    LPAD('A', 5, 'B')
FROM dual;


/*

    공백 제거
    - TRIM()
    - LTRIM()
    - RTRIM()

*/

SELECT
    TRIM('   하나   둘    셋    ')
FROM dual;


/*

    문자열 치환
    - REPLACE() -> REPLACE(문장, 치환할 단어, 변경될 단어)
    - REGEXP_REPLACE() -> REGEXP_REPLACE(name, '정규식', '바꿀문자')

*/

SELECT
    REPLACE('홍길동', '홍', '김'),
    REPLACE('홍길동', '최', '김'),
    REPLACE('홍길홍', '홍', '김')
FROM dual; 

SELECT
    name, tel,
    REGEXP_REPLACE(name, '김[김-힣]{2}', '김OO') AS r1,
    REGEXP_REPLACE(name, '([김-힣])[가-힣]{2}', '\100') AS r2
FROM tblInsa;

/*

    문자열 치환
    - decode() -> VARCHAR DECODE()

*/

SELECT
    CASE
        WHEN gender = 'm' THEN '남자'
        WHEN gender = 'f' THEN '여자'
    END AS g1,
    DECODE(gender, 'm', '남자', 'f', '여자') AS g2
FROM tblComedian;









