--아이디
create table auth_user(
    u_no number(5) primary key,
    u_id varchar2(20 char) UNIQUE NOT NULL,
    u_logintype number(2) not null
);
create sequence auth_user_seq;
insert into auth_user values(auth_user_seq.nextval, 'id1', 1);
select * from auth_user;

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
insert into auth_password values(auth_password_seq.nextval, 1 , 'test' , 'pw1', sysdate);
select * from auth_password;

--회원정보
create table auth_userInfo(
	i_no number(5) primary key,
    u_no number(5) NOT NULL,
    i_name varchar2(10 char) not null,
    i_phonenum varchar2(15 char) UNIQUE NOT NULL,
    i_newdate date not null,
    i_grade number(2) not null,
    i_email VARCHAR(25) NOT NULL,
    CONSTRAINT fk_info FOREIGN KEY(u_no)
    REFERENCES auth_user(u_no) ON DELETE CASCADE
);
create sequence auth_userInfo_seq;
insert into auth_userinfo values(auth_userinfo_seq.nextval, 1 , 'name1' , 111, sysdate, 1, 'mail1', 'carbrand1', 'carname1', 1, 1);
select * from auth_userinfo;

--1:1문의
create table qna (
    q_no number(5) primary key,
    q_title varchar2(200 char) not null,
    q_txt varchar2(2000 char) not null,
    q_date date not null,
    q_u_no number(5) not null,
    q_reply_has number(1) default 0 not null,
    constraint qna_constraint
    foreign key (q_u_no)
    references auth_user (u_no)
    on delete cascade
);
create sequence qna_seq;
insert into qna values(qna_seq.nextval, 'name1_title1', 'name1_txt1', sysdate, 1, default);
insert into qna values(qna_seq.nextval, 'name1_title2', 'name1_txt2', sysdate, 1, default);
insert into qna values(qna_seq.nextval, 'name1_title3', 'name1_txt3', sysdate, 1, default);
insert into qna values(qna_seq.nextval, 'name2_title1', 'name2_txt1', sysdate, 2, default);
insert into qna values(qna_seq.nextval, 'name2_title2', 'name2_txt2', sysdate, 2, default);
insert into qna values(qna_seq.nextval, 'name2_title3', 'name2_txt3', sysdate, 2, default);
select * from qna;

insert
		into qna
		values(
			qna_seq.nextval,
			'title',
			'txt',
			sysdate,
			1,
			default
		);

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
insert into qna_reply values(qna_reply_seq.nextval, 'name1_reply', sysdate, 191);
insert into qna_reply values(qna_reply_seq.nextval, 'name2_reply', sysdate, ??);
select * from qna_reply;