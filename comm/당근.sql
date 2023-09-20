--- 회원 테이블
create table member(
                       no              number                  primary key,        -- 회원 번호
                       id              varchar2(50)            unique,             -- 아이디
                       password        varchar2(50)            not null,           -- 비밀번호
                       name            varchar2(30)            not null,           -- 이름
                       email           varchar2(50)            unique,             -- 이메일
                       birth           date                    not null,           -- 생일
                       phone           varchar2(30)            unique,             -- 폰 번호
                       autonomy        varchar2(10)            not null,           -- 서울 자치구(25개 중 하나)
                       mDate           date                    default sysdate,    -- 생성 날짜
                       photo           varchar2(200),                              -- 프로필 사진 이름(xxx.jpg)
                       lastLog         date,                                       -- 마지막 로그인 날짜
                       logout          date                                        -- 최근 로그아웃 날짜
);


-- 지역 테이블
create table region(
                       no      number(2)       primary key,
                       name    varchar2(20)    not null
);


--- 지역 상세 테이블
create table autonomy(
                         no          number          primary key,
                         name        varchar2(30)    not null,
                         regionNo    number(2)       references region(no)
);


--- 거래 흥미 카테고리
create table trade_category(
                               no          number(2)       primary key,
    -- 예: 가전제품, 전자제품, 요리기구 등
                               name        varchar2(30)    unique,
                               interest    number          default 0
);


-- 거래 게시판
create table trade_board(
    -- 번호
                            no          number          primary key,
    -- 회원 번호(회원만 거래 게시판 글 작성 가능)
                            memberNo    number          references member(no) on delete set null,
    -- 거래 게시판 제목
                            title       varchar2(100)   not null,
    -- 거래 게시판 내용
                            content     varchar2(100)   not null,
    -- 거래 게시글 지역
                            autonomyNo  number          references seoul_autonomy(no),
    -- 거래 게시판에 넣은 사진을 저장하는 공간 dir주소(주소 예: c:\comm\member\{member.name}\trade\{trade.no}\{이미지들}
    -- c:\comm\member\{member.name}\prpo\properties.prop
                            photoDir    varchar2(100),
    -- 거래 게시글 생성일
                            mDate       date            default sysdate,
    -- 거래 게시글 수정일
                            eDate       date            default sysdate,
    -- 거래 완료일
                            tDate       date,
    -- 거래 완료 상대방
                            tMemberNo   number          default null,

                            constraint fk_tMemberNo foreign key(tMemberNo) references member(no) on delete set null
);

insert into trade_board(no, memberNo, title, content, autonomyNo) values(0, 2, 'hello', 'world', 1);

update trade_board set tMemberNo = 100 where no = 0;