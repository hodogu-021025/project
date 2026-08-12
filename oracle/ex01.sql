SELECT
    *
FROM
    dba_users
ORDER BY
    username;

--Ctrl + Enter -> 줄 실행
show user;

-- 한줄 주석

/*
여러줄 주석
*/

-- 현재 작업 중인 파일 -> 스크립트 -> *.sql

-- 현재 스키마가 가지고 있는 테이블 목록을 가져와라
SELECT
    *
FROM
    tabs;

SELECT
    *
FROM
    employees;


/*

    사람 -> 언어,SQL -> Oracle
    - 구조화된 질의 언어
    - SQL, Query
    - RDBMS 조작 언어
    
    1. SQL과 RDBMS는 서로 독립적으로 관리된다.
        - SQL -> 모든 RDBMS에서 사용하는 공통 언어
        - Oracle RDB -> Oracle 회사
        
    2. 표준 SQL, ANSI-SQL
        - 모든 RDB에 적용 가능한 SQL
        
    3. 제조사별(DBMS) SQL
        - 특정 RDB에서만 적용 가능한 SQL
        - 확장된 문법
        - Oracle -> PL/SQL
        - MS-SQL -> T-SQL
    
    오라클 수업과정 = ANSI-SQL(80%) + PL/SQL(5%) + DB 설계(15%)

    ANSI-SQL
    
    1. DDL: Data Definition Language
        - 데이터 정의어: DB의 구조를 생성/관리하는 명령어
        - DataBase Object (Table, View, User, Index)
            a. CREATE - 생성
            b. ALTER - 수정
            c. DROP - 삭제
    
    2. DML: Data Manipulation Language
        - 데이터 조작어: Table에서 Data를 CRUD하는 명령어
            a. SELECT - C
            b. INSERT - R
            c. UPDATE - U
            d. DELETE - D
    
    
    3. DCL: Data Control Language
        - 데이터 제어어: 보안 관리, 계정 관리, 트랜젝션 관리 등...
            a. COMMIT
            b. ROLLBACK
            c. GRANT
            d. REVOKE
    
    -------------------------------------------------------
    
    4. DQL: Data Query Language
        - DML 중 SELECT문을 따로 부르는 표현
    
    5. TCL: Transaction Control Language
        - DCL 중 COMMIT/ROLLBACK문을 따로 부르는 표현


    Oracle Incoding
    - DB의 데이터를 보조 기억 장치에 저장한다. -> File I/O
    - 현재는 UTF-8 사용
    
    SQL -> 대소문자 구분 X
    - 팀작업 -> 자율적 + 내부 규칙 정하기
    - 키워드: 대문자
    - 식별자: 소문자
    
*/
--Ctrl + F7
SELECT
    *
FROM
    tblcountry;