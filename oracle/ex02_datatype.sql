/*
    Oracle 자료형
    - 변수(X), 제어문(X) -> SQL: 프로그래밍 언어 X
  
    1. 숫자형
        - 정수/실수
            a. number
            - (유효 숫자)38개까지 표현
            - 1 ~ 22byte
            - number: 정수/실수
            - number(precision): 전체 자릿수, 정수형
            - number(precision, scale): 소수이하 자릿수 -> 정수형, 실수형
    
    
    2. 문자형
        - 문자 + 문자열 = String(Java)  
        - char vs nchar -> n의 의미?
        - char vs varchar -> var의 의미?
        
        a. char
            - 고정 자릿수 문자열
            - char(n): 최대 n자리 문자열, n(Byte)
                - 최소 크기: 1 byte
                - 최대 크기: 2000 byte
            - Data INSERT INTO 후 남은 공간은 공백으로 채운다. -> 항상 n자리 생성
            - 고정 문자열 -> 전화번호, 우편번호, 주민번호, 이름 등
            
        b. nchar
            - n: national -> Oracle Incoding(UTF-8)과 상관없이 해당 Column을 UTF-16(1byte)으로 적용
            - nchar(n): 최대 n자리 문자열, n(문자수)
                - 최소 크기: 1문자
                - 최대 크기: 1000문자
            
        c. varchar2(varchar)
            - 가변 자릿수 문자열 -> Column의 크기 가변 
            - varchar2(n): 최대 n자리 문자열, n(Byte)
                - 최소 크기: 1 byte
                - 최대 크기: 4000 byte
            - Data INSERT INTO 후 남은 공간은 비운다.
            - 가변 문자열 -> 자기소개, 주소 등
            
        d. nvarchar2
            - n: national -> Oracle Incoding(UTF-8)과 상관없이 해당 Column을 UTF-16(1byte)으로 적용
            - nvarchar2(n): 최대 n자리 문자열, n(문자수)
                - 최소 크기: 1문자
                - 최대 크기: 2000문자
                
        e. clob, nclob
            - Character Large Object
            - 대용량 텍스트
            - 4TB
            - 느리다
    
    3. 날짜/시간형
        a. date
            - 년월일시분초
            
            
        b. timestamp
            - 년월일시분초 + 밀리초 + 나노초
        
        c. interval
            - 시간
            - 틱값
        
    4. 이진 데이터형
        - 비 텍스트 데이터
        - 이미지, 영상, 음악, 실행 파일, 압축 파일 둥...
        - 느려서 잘 사용 X
        ex) 게시판(+첨부파일) -> DB에서는 첨부파일의 이름을 저장(문자열)
        a. blob
        
    =========정리=========
    1. 숫자: number
    2. 문자열: varchar2
    3. 날짜/시간: data
    ======================
    
    DDL
    
    CREATE TABLE 테이블명 (
        Column 선언,
        Column 선언,
        Column 선언,
        Column_Name 자료형    
    );
*/

-- Table 삭제: DROP
DROP TABLE tblType;

-- Table 생성: CREATE
-- camel case + 헝가리언 표기법
CREATE TABLE tblType (
    -- 1. num number
    -- 2. num number(3) -- 유효 자리 수: 3자리 -> -999 ~ 999
    -- 3. num number(4,2)     -- 유효 4자리 수(정수 2자리, 소수 2자리)
    
    --txt CHAR(10) -- 10byte -> UTF-8(영어:1byte, 한글:3byte, 특수기호:1byte)
    --txt VARCHAR2(10) -- 10byte -> UTF-8(영어:1byte, 한글:3byte, 특수기호:1byte)
    
    --txt1 CHAR(10),
    --txt2 VARCHAR2(10)
    
    txt NCHAR(10)
);

-- SELECT -> Table 데이터 확인하기
SELECT * FROM tblType;

-- Table에 데이터(행:row), 레코드(record) 추가하기
-- INSERT INTO 테이블명 (Column Name) values (value);
INSERT INTO tblType (num) VALUES (100); -- Oracle의 정수형 리터럴
INSERT INTO tblType (num) VALUES (3.14); -- Oracle의 실수형 리터럴
INSERT INTO tblType (num) VALUES (3.56); -- 자리수 자를 때 반올림
INSERT INTO tblType (num) VALUES (-651); -- 999 ~ 999
INSERT INTO tblType (num) VALUES (10000); -- 유효 자리수 넘을 시 Overflow 발생
INSERT INTO tblType (num) VALUES (99.99);
INSERT INTO tblType (num) VALUES (1234567890123456789012412421412421412421421412412412421421412421434567890123456789012345678);

INSERT INTO tblType (txt) VALUES ('ABC');
INSERT INTO tblType (txt) VALUES ('ABCDEFGHIJ');
INSERT INTO tblType (txt) VALUES ('홍길동');
INSERT INTO tblType (txt) VALUES ('홍길동!');

INSERT INTO tblType (txt1,txt2) VALUES ('ABC', 'ABC');

INSERT INTO tblType (txt) VALUES ('ABC');
INSERT INTO tblType (txt) VALUES ('ABCDEFGHIJ');
INSERT INTO tblType (txt) VALUES ('가나다라마바사아자차');

INSERT INTO hr.tblType (hr.tblType.txt) VALUES ('가나다');
