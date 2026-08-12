-- ex21_join.sql
/*
    관계형 데이터베이스 시스템이 지양하는 것들 > 테이블을 잘못 만들면 발생
    
    1. 테이블에 기본키(pk)가 없는 상태 > 데이터를 조작 불가능 (레코드 식별 불가능)
    
    2. null이 많은 상태의 테이블 > 공간 낭비 + sql 작업 불편
    
    3. 하나의 속성(컬럼) 값이 원자값이 아닌 상태 > 더 이상 쪼개지지 않는 값을 넣어야 한다
    
    4. 데이터가 중복되는 상태 > 데이터 관리 불편 (일관성 저하)
*/
 -- 2.
 -- 회원 테이블
 
 create table tblUser (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    hobby varchar2(100)
);

insert into tblUser (id, name, hobby) values('hong', '홍길동', '독서');
insert into tblUser (id, name, hobby) values('dog', '강아지', null);
insert into tblUser (id, name, hobby) values('cat', '고양이', '런닝');
insert into tblUser (id, name, hobby) values('test', '테스트', '코딩, 여행,런닝,독서');
insert into tblUser (id, name, hobby) values('hello', '아무개', '그림책독서');

-- 독서가 취미?
select * from tblUser where hobby = '독서';
select * from tblUser where hobby like '%독서%';
select * from tblUser where instr(hobby, '독서')>0;

-- 독서(x) > 책읽기 (0)
update tblUser set hobby = '책읽기' where hobby = '독서';
update tblUser set hobby = '책읽기' where hobby like '%독서%';

drop table tblUser;

 create table tblUser (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    hobby1 varchar2(100),
    hobby2 varchar2(100),
    hobby3 varchar2(100)
);

insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('dog', '강아지', null, null,null);
insert into tblUser values('cat', '고양이', '러닝', '여행', '독서');

select * from tblUser where hobby1= '독서' or hobby2 = '독서' or hobby3 ='독서';

insert into tblUser values('cat', '고양이', '러닝', '여행', '독서');
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);
insert into tblUser values('hong', '홍길동', '독서', null, null);

-- 쇼핑몰 > 판매 테이블
create table tblShop (
    seq number primary key, -- 판매번호(pk)
    id varchar2(30) not null, -- 고객 아이디
    name varchar2(30) not null, -- 고객명
    tel varchar2(15) not null, -- 연락처
    item varchar2(50) not null, -- 상품명
    qty number not null,  -- 수량
    regdate date default sysdate not null -- 판매시작
);

insert into tblShop
    values (1, 'hong', '홍길동', '010-1234-5678', '마우스', 1, default);

insert into tblShop
    values (2, 'test', '테스트', '010-5656-5615', '키보드', 1, default);

insert into tblShop
    values (3, 'hong', '홍길동', '010-5567-7441', '태블릿', 1, default);

select * from tblShop where name = '홍길동';
-------------------------------------------------------------------------------

--tblShop > 개선
 drop table tblShop;
 
 create table tblShop (
    seq number primary key, -- 판매번호(pk)
    item varchar2(50) not null, -- 상품명
    qty number not null,  -- 수량
    regdate date default sysdate not null, -- 판매시작
    id varchar2(30) not null        -- 구매고객 아이디
);

 create table tblUser (
    id varchar2(30) primary key, -- 고객 아이디(pk)
    name varchar2(30) not null, -- 고객명
    tel varchar2(15) not null -- 연락처
);

insert into tblUser values('hong', '홍길동','010-5544-5545');
insert into tblUser values('dog', '강아지','010-5656-5445');
insert into tblUser values('cat', '고양이','010-2356-7841');

insert into tblShop values (1, '마우스', 1, default, 'hong');
insert into tblShop values (2, '키보드', 1, default, 'cat');
insert into tblShop values (3, '태블릿', 1, default, 'hong');
insert into tblShop values (4, '모니터', 1, default, 'dog');
insert into tblShop values (5, '노트북', 1, default, 'cat');




















