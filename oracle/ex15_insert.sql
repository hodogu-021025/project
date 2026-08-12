-- ex15_insert.sql

/*

    INSERT
    - 테이블에 데이터를 추가하는 방식
    
    INSERT INTO 테이블명 (컬럼리스트) VALUES (값리스트);
    

*/

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
    seq NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30) DEFAULT '익명',
    memo VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE NOT NULL
);

DROP SEQUENCE seqMemo;
CREATE SEQUENCE seqMemo;

-- 원본 테이블의 정의된 컬럼 순서대로 컬럼리스트와 값리스트를 작성
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (seqMemo.NEXTVAL, '홍길동', '메모입니다', SYSDATE);

-- 단축
-- (seq, name, memo, regdate) -> 생략 가능
INSERT INTO tblMemo VALUES (seqMemo.NEXTVAL, '홍길동', '메모입니다', SYSDATE);

INSERT INTO tblMemoCopy SELECT * FROM tblMemo;

SELECT * FROM tblMemo;

-------------------------------------------------------------------------------
--8.
--tblMemo테이블 > 복사 > 새테이블 생성(tblMemoCopy)
create table tblMemoCopy (
);

create table tblMemo(
    seq number(3) primary key,
    name varchar2(30)default '익명',
    memo varchar2(2000),
    regdate date default sysdate not null
    
);

select * from tblMemo;
-- insert.. --1. 홍길동 메모입니다. 26/08/12

insert into tblMemoCopy select * from tblMemo; -- sub Query

select * from tblMemoCopy;

delect from tblMemoCopy;

insert into tblMemoCopy select * from tblMemo where memo is null;

select * from tblMemoCopy;

insert into 영업부 select * from tblInsa where buseo = '영업부';

--9.
--tblMemo테이블 > 복사 > 새테이블 생성(tblMemoCopy)
-- 테이블 생성(컬럼복사)
drop table tblMemoCopy;

create table tblMemoCopy
as
select * from tblMemo;

desc tblMemoCopy;

select * from tblMemoCopy;