-- ex14_sequence.sql

/*

    시퀀스, Sequence
    - DB Object(테이블, 제약사항, 시퀀스 등)
    - DB Object -> 생성/수정/삭제 -> DDL
    - 일련 번호를 생성하는 객체

*/

CREATE SEQUENCE seqNum;

SELECT seqNum.NEXTVAL FROM dual;

CREATE SEQUENCE seqMemo;

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (seqMemo.NEXTVAL, '홍길동', '메모입니다.', SYSDATE);

SELECT * FROM tblMemo;

SELECT seqMemo.NEXTVAL FROM dual;

SELECT seqMemo.CURRVAL FROM dual;

/*

    시퀀스 객체 생성하기
    - CREATE SEQUENCE 시퀀스명;
    
    - 시퀀스명
        INCREMENT BY n  : 증감치
        START WITH n    : 시작값
        MAXVALUE n      : 최댓값
        MINVALUE n      : 최솟값
        CYCLE           : 순환구조
        CACHE n;        : 캐시

*/

DROP SEQUENCE seqTest;

CREATE SEQUENCE seqTest INCREMENT BY 10 START WITH 100;

CREATE SEQUENCE seqTest MAXVALUE 10 CYCLE CACHE 9;

CREATE SEQUENCE seqTest INCREMENT BY -1 MINVALUE -10;

SELECT seqTest.NEXTVAL FROM dual;

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (seqTest.NEXTVAL, '홍길동', '메모입니다.', SYSDATE);

SELECT * FROM tblMemo;
