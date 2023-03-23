--아이디
create table auth_user(
    u_no number(5) primary key,
    u_id varchar2(20 char) UNIQUE NOT NULL,
    u_logintype number(2) not null
);
create sequence auth_user_seq;
insert into auth_user values(auth_user_seq.nextval, 'id1', 1);
insert into auth_user values(auth_user_seq.nextval, 'id2', 1);
select * from auth_user;
drop table auth_user;

--패스워드
create table auth_password(
    pw_no number(5) primary key,
    u_no number(5) NOT NULL,
    pw_salt varchar2(20 char) not null,
    pw_password varchar2(20 char) not null,
    pw_update date not null, 
    CONSTRAINT fk_code FOREIGN KEY(u_no)
    REFERENCES auth_user(u_no) ON DELETE CASCADE
);
create sequence auth_password_seq;
insert into auth_password values(auth_password_seq.nextval, 2, 'test', 'qw1', sysdate);
insert into auth_password values(auth_password_seq.nextval, 3, 'test', 'qw2', sysdate);
select * from auth_password;
drop table auth_password;

--회원정보
create table auth_userInfo(
	i_no number(5) primary key,
    u_no number(5) NOT NULL,
    i_name varchar2(10 char) not null,
    i_phonenum varchar2(15 char) UNIQUE NOT NULL,
    i_newdate date not null,
    i_grade number(2) not null,
    CONSTRAINT fk_info FOREIGN KEY(u_no)
    REFERENCES auth_user(u_no) ON DELETE CASCADE
);
create sequence auth_userInfo_seq;
insert into auth_userinfo values(auth_userinfo_seq.nextval, 2, '이름하나', 01011112222, sysdate, 1);
insert into auth_userinfo values(auth_userinfo_seq.nextval, 3, '이름둘', 01033334444, sysdate, 1);
select * from auth_userinfo;
drop table auth_userinfo;

--1:1문의
create table qna (
    q_no number(5) primary key,
    q_title varchar2(200 char) not null,
    q_txt varchar2(2000 char) not null,
    q_date date not null,
    q_id varchar2(20 char) not null,
    q_reply_has number(1) default 0 not null,
    constraint qna_constraint
    foreign key (q_id)
    references auth_user (u_id)
    on delete cascade
);
create sequence qna_seq;
insert into qna values(qna_seq.nextval, '제목1', '내용1', sysdate, 'id1', default);
insert into qna values(qna_seq.nextval, '제목2', '내용2', sysdate, 'id1', default);
insert into qna values(qna_seq.nextval, '제목3', '내용3', sysdate, 'id1', default);
select * from qna;
drop table qna;

--1:1문의댓글
create table qna_reply (
    q_reply_no number(5) primary key,
    q_reply_txt varchar2(2000char) not null,
    q_reply_date date not null,
    q_reply_board_no number(5) not null,
    constraint qna_reply_constraint
    foreign key (q_reply_board_no)
    references qna (q_no)
    on delete cascade
);
create sequence qna_reply_seq;
insert into qna_reply values(qna_reply_seq.nextval, '답변입니다', sysdate, 33);
insert into qna_reply values(qna_reply_seq.nextval, '답변입니다', sysdate, 32);
insert into qna_reply values(qna_reply_seq.nextval, '답변입니다', sysdate, 31);
select * from qna_reply;
drop table qna_reply;

--계정 가데이터
/*
create table ask_account (
aa_id varchar2(20 char) primary key,
aa_pw varchar2(20 char) not null
);
insert into ask_account values('id', 'pw');
select * from ask_account;
drop table ask_account;
*/

--비회원주문 가데이터
/*
create table ask_nonmember (
an_number number(20) primary key
);
insert into ask_nonmember values('1');
select * from ask_nonmember;
drop table ask_nonmember;
*/

--1:1문의 가데이터
/*
create table ask (
a_number number(5) primary key,
a_owner_fk varchar2(20 char) not null,
a_sortation varchar2(20 char) not null,
a_title varchar2(20 char) not null,
a_text varchar2(2000 char) not null,
a_date date not null,
a_status varchar2(20 char) not null
);
create sequence ask_seq;
alter table ask
add constraint ask_constraint
foreign key (a_owner_fk)
references ask_account (aa_id)
on delete cascade;
insert into ask values(ask_seq.nextval, 'id', '상품', '상품문의입니다', '상품문의내용', sysdate, '답변대기');
insert into ask values(ask_seq.nextval, 'id', '결제', '결제문의입니다', '결제문의내용', sysdate, '답변대기');
insert into ask values(ask_seq.nextval, 'id', '장착', '장착문의입니다', '장착문의내용', sysdate, '답변대기');
insert into ask values(ask_seq.nextval, 'id', '기타', '기타문의입니다', '기타문의내용', sysdate, '답변대기');
select * from ask;
drop table ask;
*/

--1:1문의댓글 가데이터
/*
create table ask_reply (
ar_number number(5) primary key,
ar_number_fk number(5) not null,
ar_text varchar2(2000 char) not null,
ar_date date not null,
    constraint ask_reply_constraint
    foreign key (ar_number_fk)
    references ask (a_number)
    on delete cascade
);
create sequence ask_reply_seq;
insert into ask_reply values(ask_reply_seq.nextval, 121, '내용', sysdate);
select * from ask_reply;
drop table ask_reply;
*/