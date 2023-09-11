--- 오라클 계정 생성
create user comm identified by 1234;

--- 오라클 계정 권한 부여
grant connect, resource, dba to comm;

--- 커밋
commit;

--- 회원 테이블
create table member(
    no              number                  primary key,
    id              varchar2(50)            unique,
    password        varchar2(50)            not null
);
insert into member values(seq_member_no.nextval, 'abcd', '1234');

--- 회원 테이블 no 시퀀스
create sequence seq_member_no;