--FAQ(작성중)
create table faq (
    f_no number(5) primary key,
    f_sortation varchar2(20 char) not null,
    f_title varchar2(100 char) not null,
    f_txt varchar2(2000 char) not null,
    f_date date not null
)
create sequence faq_seq;
insert into faq values(faq_seq.nextval, '회원', '테스트용 인서트', '테스트용 안쪽 txt 내용물입니다', sysdate);
select * from faq;