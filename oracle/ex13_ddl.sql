-- ex13_ddl.sql

/*
    
    수업 과정
    1. 초반 DML (ex01 - ex12)
    2. DDL (ex13 ~ ) Table 제작
    3. 후반 DML
    ------------------
    4. 데이터 설계
    5. 간단 프로젝트 1day
    ------------------
    6. PL/SQL
    ------------------ 
    7. DB 프로젝트 4~6day

    
    DDL: Data Definition Language
    - 데이터 정의어: DB의 구조를 생성/관리하는 명령어
    - DataBase Object (Table, View, User, Index)
        a. CREATE - 생성
        b. ALTER - 수정
        c. DROP - 삭제

    테이블 생성하기 -> 테이블 구조(Schema) 설계 
    -> Column 정의 -> 컬럼명, 자료형, 길이, 제약사항 정의
    
    CREATE TABLE 테이블명 (
        컬럼 선언,
        컬럼명 자료형(길이) NULL 제약사항
    );
    
    제약사항, Constraint
    - DB 무결성을 보장하기 위한 장치
    - 해당 컬럼에 들어갈 데이터에 대한 조건
        1. 조건에 만족하면? 저장
        2. 조건에 만족 못 하면? 오류
    
    
    1. NOT NULL
        - 해당 컬럼이 반드시 값을 가져야한다.
        - 해당 컬럼에 값이 없으면 에러 발생
        - 필수값
        
    2. PRIMARY KEY, PK
        - UNIQUE (유일성): PK로 지정된 컬럼의 값은 테이블 내에서 어떠한 경우에도 중복될 수 없습니다.
        - NOT NULL : PK로 지정된 컬럼은 데이터가 비어있는 상태(NULL)로 저장될 수 없습니다.
        - 개체 무결성(Entity Integrity) 유지: 테이블의 모든 데이터 행(Row)을 서로 고유하게 식별해 내기 위한 대표 제약조건입니다.
        - 테이블당 1개의 PK 제약조건 (단, 복합키 가능): 하나의 테이블에는 오직 한 개의 PK 제약조건만 설정할 수 있습니다.
        - 문법적으로 PK 없이 테이블을 만들 수 있으나, 데이터의 신뢰성과 성능을 위해 반드시 생성하는 것이 관계형 모델의 기본 원칙
        
    3. FOREIGN KEY, FK
    
    4. UNIQUE, 유일성
        - 레코드간의 중복값을 가질 수 없다.
        - NULL을 가질 수 있다. -> 식별자 X
    
    5. CHECK
        - 시용자 정의형
        - 제약 조건 정의 ->
            
    6. DEFAULT
        - 기본
    
    
    제약 사항을 만드는 방법 -> 코드 관리
    
    1. 컬럼 수준에서 만드는 방법
        - 컬럼을 선언할 때 동시에 제약사항도 같이 만드는 방식
    
    2. 테이블 수준에서 만드는 방법
        - 컬럼 선언과 제약사항 선언을 분리해서 만드는 방식
        
    3. 외부에서 만드는 방법
        - 테이블을 먼저 제약조건 없이 단순 컬럼 구조로 만든 후
        ALTER TABLE ... ADD CONSTRAINT 구문을 통해 나중에 제약조건을 추가하는 방식입니다.
*/

-- 3. 외부에서 만드는 방법
DROP TABLE tblMemo;

CREATE TABLE tblMemo (
    seq NUMBER(3),
    name VARCHAR2(30),
    memo VARCHAR2(2000),
    regdate DATE
);

ALTER TABLE tblMemo 
    ADD CONSTRAINT tblMemo_seq_pk PRIMARY KEY(seq);

ALTER TABLE tblMemo 
    ADD CONSTRAINT tblMemo_name_uq UNIQUE(name);

--Memo Table
--2. 테이블 수준에서 만드는 방법
DROP TABLE tblMemo;

CREATE TABLE tblMemo (
    seq NUMBER(3),          
    name VARCHAR2(30),    
    memo VARCHAR2(2000),   
    regdate DATE,           
    
    CONSTRAINT tlbMemo_seq_pk PRIMARY KEY(seq),
    CONSTRAINT tlbMemo_name_uq UNIQUE(name)
);

--Memo Table
--1. 컬럼 수준에서 만드는 방법

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
    seq NUMBER(3) CONSTRAINT tlbMemo_seq_pk PRIMARY KEY,          --메모번호
    name VARCHAR2(30),      --작성자
    memo VARCHAR2(2000),    --메모
    regdate DATE            --작성일
);

--Memo Table

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
    seq NUMBER(3) PRIMARY KEY,       
    name VARCHAR2(30) DEFAULT '익명',     
    memo VARCHAR2(2000) NOT NULL, 
    regdate DATE    
);

-- NULL 일부러 정의
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (1, NULL, '메모입니다.', SYSDATE);
-- 정의를 포기
INSERT INTO tblMemo (seq, memo, regdate) VALUES (2, '메모입니다.', SYSDATE);

SELECT * FROM tblMemo;

---------------------------------------------------------------------

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
    --컬럼명 자료형(길이) NULL 제약사항
    seq NUMBER(3) PRIMARY KEY,          --메모번호
    name VARCHAR2(30),      --작성자
    memo VARCHAR2(2000) NOT NULL,    --메모
    regdate DATE,            --작성일
    --중요도 (1->3 순서)
   priority NUMBER(1) CHECK (priority >= 1 AND priority <= 3),
    --카테고리(할일, 공부, 약속)
    category VARCHAR2(10) CHECK (category IN('할일', '약속', '공부'))
);

INSERT INTO tblMemo (seq, name, memo, regdate, priority, category) VALUES (1, '홍길동', '메모입니다.', SYSDATE, 2, '할일');

INSERT INTO tblMemo (seq, name, memo, regdate, priority, category) VALUES (2, '홍길동', '메모입니다.', SYSDATE, 1, '공부');

INSERT INTO tblMemo (seq, name, memo, regdate, priority, category) VALUES (3, '홍길동', '메모입니다.', SYSDATE, 5, '공부');

INSERT INTO tblMemo (seq, name, memo, regdate, priority, category) VALUES (4, '홍길동', '메모입니다.', SYSDATE, 2, '게임');

SELECT * FROM tblMemo;