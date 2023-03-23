create table auth_user(
    u_no number(5) primary key,
    u_id varchar2(20 char) UNIQUE NOT NULL,
    u_logintype number(2) not null
);
create sequence auth_user_seq;
insert into auth_user values(auth_user_seq.nextval, 'id1', 1);
insert into auth_user values(auth_user_seq.nextval, 'id2', 1);
select * from auth_user;



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