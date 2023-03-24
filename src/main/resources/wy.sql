create table auth_user(
	u_no number(5) primary key,
    u_id varchar2(20 char) UNIQUE NOT NULL,
    u_logintype number(2) not null
);
create sequence auth_user_seq;
create sequence auth_password_seq;
create sequence auth_userInfo_seq;

insert into auth_user values(auth_user_seq.nextval, 'test', 1);
insert into auth_password values(auth_password_seq.nextval, 2 , 'test' , 'qqq', sysdate);
insert into auth_userinfo values(auth_userinfo_seq.nextval, 2 , '홍길동' ,01012345678,sysdate, 1);

select * from auth_user;
select * from auth_password;
select * from auth_userinfo;
ALTER TABLE auth_userInfo ADD i_email VARCHAR(25) NOT NULL;
delete from auth_user where u_no=1;
    
create table auth_password(
	pw_no number(5) not null,
    pw_salt varchar2(20 char) not null,
    pw_password varchar2(20 char) not null,
    pw_update date not null,
      
     CONSTRAINT fk_code FOREIGN KEY(pw_no)
    REFERENCES auth_user(u_no) ON DELETE CASCADE
);

create table auth_userInfo(
	i_no number(5) not null,
    i_name varchar2(10 char) not null,
    i_phonenum varchar2(15 char) UNIQUE NOT NULL,
    i_newdate date not null,
    i_grade number(2) not null,			-- 1 : 일반  /  2 : 업체 / 3 : 관리자
      
     CONSTRAINT fk_info FOREIGN KEY(u_no)
    REFERENCES auth_user(u_no) ON DELETE CASCADE
);