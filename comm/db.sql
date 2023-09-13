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
    password        varchar2(50)            not null,
    name            varchar2(30)            not null,
    email           varchar2(50)            not null,
    birth           date                    not null,
    phone           varchar2(30)            not null,
    postcode        number                  not null,   -- 우편번호
    roadAddress     varchar2(100)           not null,   -- 도로명 주소
    jibunAddress    varchar2(100)           not null,   -- 지번 주소
    detailAddress   varchar2(100)           DEFAULT '없음', -- 상세 주소
    extraAddress    varchar2(100)           DEFAULT '없음', -- 참고 항목
    mDate           date                    default sysdate,
    photo           varchar2(200), -- path경로 컬럼
    lastLog         date,          -- 마지막 로그인 날짜
    logout          date           -- 최근 로그아웃 날짜
);
insert into member values(seq_member_no.nextval, 'abcd', '1234');

--- 회원 테이블 no 시퀀스
create sequence seq_member_no;

--- 게시판 테이블
CREATE TABLE BOARD(
    NO              NUMBER              PRIMARY KEY,
    ID              VARCHAR2(50)        DEFAULT 'NoN',
    PASSWORD        VARCHAR2(50)        DEFAULT '',
    TITLE           VARCHAR2(50)        NOT NULL,
    CONTENT         VARCHAR2(50)        NOT NULL
);
alter table board add (wdate date default sysdate);
alter table board add (views number default 0);

--- 게시판 테이블 no 시퀀스
create sequence seq_board_no;

INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '1', '1-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '2', '2-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '3', '3-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '4', '4-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '5', '5-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '6', '6-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '7', '7-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '8', '8-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '9', '9-1', sysdate);
INSERT INTO BOARD(no, title, content, wdate) VALUES(SEQ_BOARD_NO.NEXTVAL, '10', '10-1', sysdate);