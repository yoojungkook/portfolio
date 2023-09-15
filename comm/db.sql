--- 오라클 계정 생성
create user comm identified by 1234;

--- 오라클 계정 권한 부여
grant connect, resource, dba to comm;

--- 커밋
commit;

--- 회원 테이블
create table member(
    no              number                  primary key,        -- 회원 번호
    id              varchar2(50)            unique,             -- 아이디
    password        varchar2(50)            not null,           -- 비밀번호
    name            varchar2(30)            not null,           -- 이름
    email           varchar2(50)            unique,           -- 이메일
    birth           date                    not null,           -- 생일
    phone           varchar2(30)            unique,           -- 폰 번호
    autonomy        varchar2(10)            not null,           -- 서울 자치구(25개 중 하나)
    mDate           date                    default sysdate,    -- 생성 날짜
    photo           varchar2(200),                              -- 프로필 사진 이름(xxx.jpg)
    lastLog         date,                                       -- 마지막 로그인 날짜
    logout          date                                        -- 최근 로그아웃 날짜
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

서울 자치구
1. 강남구
2. 강동구
3. 강북구
4. 강서구
5. 관악구
6. 광진구
7. 구로구
8. 금천구
9. 노원구
10. 도봉구
11. 동대문구
12. 동작구
13. 마포구
14. 서대문구
15. 서초구
16. 성동구
17. 성북구
18. 송파구
19. 양천구
20. 영등포구
21. 용산구
22. 은평구
23. 종로구
24. 중구
25. 중랑구;

create table region(
                       no      number(2)       primary key,
                       name    varchar2(20)    not null
);

INSERT INTO REGION VALUES(1, '서울특별시');

create table seoul_autonomy(
                               no          number(2)       primary key,
                               name        varchar2(30)    not null,
                               regionNo    number(2)       references region(no)
);

create sequence seoul_no;

INSERT INTO SEOUL_AUTONOMY VALUES(seoul_no.nextval, '중랑구', 1);

SELECT R.NO, R.NAME, S.NO, S.NAME
FROM REGION R, SEOUL_AUTONOMY S
WHERE R.NO = S.REGIONNO
ORDER BY S.NO;
