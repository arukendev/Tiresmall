alter table notice rename column n_data to n_date;

insert into notice values(notice_seq.nextval, '매장', '고마워 재현아', 'ㅋㅋ', sysdate);

select * from notice;


select * from notice where n_title like '%고%' and n_sortation like '%%';

create table auth(
    a_id varchar2(30char) primary key,
    a_pw varchar2(20char) not null,
    a_name varchar2(15char) not null,
    a_phone varchar2(13char) not null,
    a_address varchar2(100char) not null,
    a_date date not null
)

select * from auth;

insert into auth values('wm', '123', '박영웅', '010-8968-9002', '서울 종로구 종각 솔데스크 802호', sysdate);
insert into auth values('wm2', '123', '박영웅2', '010-8968-9002', '서울 종로구 종각 솔데스크 802호', sysdate);
insert into auth values('wm3', '123', '박영웅3', '010-8968-9002', '서울 종로구 종각 솔데스크 802호', sysdate);

create table notice(
    n_no number(5) primary key,
    n_sortation varchar2(20 char) not null,
    n_title varchar2(100 char) not null,
    n_txt varchar2(2000 char) not null,
    n_date date not null
)

select * from notice;
drop taBLE NOTICE;

delete from faq;
drop table faq;

create table faq(
    f_no number(5) primary key,
    f_sortation varchar2(20 char) not null,
    f_title varchar2(100 char) not null,
    f_txt varchar2(2000 char) not null,
    f_date date not null
)

create sequence faq_seq;

insert into faq values(faq_seq.nextval, '회원', '테스트용 인서트', '테스트용 안쪽 txt 내용물입니다', sysdate);

select * from faq;

drop table qna cascade constraint purge

create table qna(
    q_no number(5) primary key,
    q_title varchar2(100 char) not null,
    q_txt varchar2(2000 char) not null,
    q_date date not null,
    q_id varchar2(30 char) not null,
    q_reply_has number(1) default 0 not null,
    constraint a_q_id
    foreign key(q_id)
    references auth (a_id)
    on delete cascade
);
drop table qna;
create sequence qna_seq;
insert into qna values(qna_seq.nextval, 'qna 1대1 문의 테스트 제목', 'qna 내용 테스트', sysdate, 'wm', default);
insert into qna values(qna_seq.nextval, 'qna 1대1 문의 테스트 제목22', 'qna 내용 테스트11', sysdate, 'wm2',default);
insert into qna values(qna_seq.nextval, 'qna 1대1 문의 테스트 제목33', 'qna 내용 테스트22', sysdate, 'wm2',default);
insert into qna values(qna_seq.nextval, 'qna 1대1 문의 테스트 제목44', 'qna 내용 테스트33', sysdate, 'wm3',default);
insert into qna values(qna_seq.nextval, 'qna 1대1 문의 테스트 제목55', 'qna 내용 테스트44', sysdate, 'wm3',default);

select q_no, q_title, q_txt, q_date, q_id, q_reply_has, a_id, a_name
from qna, auth where q_id = a_id order by q_no
delete qna;
select *from qna;
create table qna_reply(
    q_reply_no number(5) primary key,
    q_reply_txt varchar2(2000char) not null,
    q_reply_date date not null,
    q_reply_board_no number(5) not null,
    constraint reply_q_id
    foreign key(q_reply_board_no)
    references qna (q_no)
    on delete cascade
);
drop table qna_reply cascade constraint purge;
select q.*, a.a_id, a.a_name, qr.q_reply_board_no
from qna q, auth a, qna_reply qr where q.q_id = a.a_id and q.q_no = qr.q_reply_board_no order by q_no

insert into qna_reply values(qna_reply_seq.nextval,'굿',sysdate,62);
create sequence qna_reply_seq;
select * from qna_reply;
delete qna_reply;


			select q.*, a.a_id, a.a_name
			from qna q, auth a where q.q_id = a.a_id and
            a_name = '' and
            a_id = '' and
            q_title like '%'||?||'%'
            order by q_no;
delete qna_reply;
       drop table qna_reply;     
select q.*, a.a_id, a.a_name
			from qna q, auth a 
            where q.q_id = a.a_id and
            a_name = '박영웅2' and
            a_id = 'wm2' and
            q_title like '%%'
            order by q_no;            
    
        
select q_no, q_title, q_txt, q_date, q_id, q_reply_has, a_id, a_name
from qna, auth where q_id = a_id order by q_no        

select count(*)
		from notice
		where n_title like  '%테%'
        
select * from 
(select rownum as rn, n_no, n_sortation, n_title, n_txt, n_date from(
select * from notice where n_title like '%%' and n_sortation = '매장' order by n_no desc)
)where rn >= 2 and rn <=3;

select count(*)
		from faq
		where f_title like  '%테%'
        
       
        
        select count(*)
		from qna, auth
		where q_id = a_id
        and q_title like '%%'
        and q_id like '%%'
        and a_name like '%%'
        
        
        
        select *
		from qna, auth
		where
        q_id = a_id and
        q_title like '%%'
        and q_id like '%%'
        and a_name like '%%'
        
        select * from qna;
        select * from auth;
        
        select * from
        (select rownum as rn, q_no, q_title, q_txt, q_date,q_reply_has, a_id, a_name
        from(select * from qna q, auth a where q.q_id = a.a_id
        and q.q_title like '%대%' and a.a_id = 'wm2' and a.a_name = '박영웅2' order by q_no))
        where rn >= 1 and rn <= 2;
--------------------------(order table)-------------------------       
create table product_order (
    o_no number(10) primary key,                -- pk
    o_sortation varchar2(10 char) not null,     -- 회원 / 비회원으로 처리
    o_ordernumber varchar2(30 char) not null,   -- 주문 번호 결제일시date + UUID로 처리
    o_orderdate date not null,                  -- 주문 일시
    o_ordername varchar2(20 char) not null,     -- ex)(2본 / 4본) // (2ea / 4ea)
    o_product varchar2(100 char) not null,      -- ex) (pk/2) 타이어 테이블 (pk / 개수)
    o_price number(10) not null,                -- 총 가격
    o_paymethod varchar2(10 char) not null,     -- 지불 방법 무통장/ 현장결제
    o_deliverymethod varchar2(10 char),         -- 추후 삭제하던지 있던지
    o_step varchar2(10 char) not null,          -- 결제완료/ 결제대기/결제취소/배송준비중/배송중/배송완료 radio로 처리
    o_storeshop varchar2(100 char) not null,    -- 장착점 ( 관리자 페이지에선 배송지로 처리)
    o_tireinstalldate date not null,            -- 장착예정일
    o_name varchar2(20 char) not null,          -- 구매자 이름
    o_phone number(11) not null,                -- 구매자 전화번호
    o_email varchar2(30 char),                  -- 구매자 이메일
    o_caryear varchar2(5 char),                 -- 연식
    o_carbrand varchar2(15 char),               -- 브랜드
    o_carname varchar2(30 char),                -- 자동차 이름 ( 위 3가지는 null 가능 없을시 request 에서 기술해달라고 요청)
    o_carnumber varchar2(10 char) not null,     -- 자동차 번호판 (필수)
    o_request varchar2(1000 char)               -- 차종을 선택할 수 없는 경우 이곳에 차량정보를 적어주세요!
);

drop table product_order;

select count(*)
		from product_order
		where o_orderdate BETWEEN TO_DATE('2023-03-7', 'YYYY-MM-DD') 
        AND TO_DATE('2023-03-14', 'YYYY-MM-DD') + 1
        and o_name like '%%'
        and o_phone like '%%'
        and o_ordernumber like'%%';


insert into product_order values(o_no_seq.nextval, '회원', '20230320121215VB224D', sysdate, '4EA', '1/2,2/2', 431000,'현장결제', '직영점', '결제완료', '직영점', '2023/03/20', '박영웅', 01089689002, 'dgyo1209@naver.com', '2022', '현대', '그랜저ig', '12가3456', null);
insert into product_order values(o_no_seq.nextval, '비회원', '20230308191215OC554E', sysdate, '2EA', '4/2', 215000, '현장결제', '직영점', '결제완료', '직영점', '2023/03/8', '박재준', 01037509002, 'wownsgk12@naver.com', null, null, null, '12무1112', '15년식 기아 k5하이브리드입니다');
    create sequence o_no_seq;
----------(tire)-----------------------    
create table tire(
    t_no number(10) primary key,
    t_hg varchar2(100 char) not null,
    t_speed varchar2(50 char) not null,
    t_code varchar2(50 char),
    t_brand varchar2(30 char) not null,
    t_name varchar2(50 char) not null,
    t_img varchar2(1000 char),
    t_size varchar2(500 char) not null,
    t_stock number(5) not null
)

create sequence t_no_seq;        

------------------------------------------
create table qna(
    q_no number(5) primary key,
    q_title varchar2(100 char) not null,
    q_txt varchar2(2000 char) not null,
    q_date date not null,
    q_u_no number(5) not null,
    q_reply_has number(1) default 0 not null,
    constraint u_q_no
    foreign key(q_u_no)
    references auth_user (u_no)
    on delete cascade
);

select * from qna;

create sequence qna_seq;

create table qna_reply(
    q_reply_no number(5) primary key,
    q_reply_txt varchar2(2000char) not null,
    q_reply_date date not null,
    q_reply_board_no number(5) not null,
    constraint reply_q_id
    foreign key(q_reply_board_no)
    references qna (q_no)
    on delete cascade
);

create sequence qna_reply_seq;

create table faq(
    f_no number(5) primary key,
    f_sortation varchar2(20 char) not null,
    f_title varchar2(100 char) not null,
    f_txt varchar2(2000 char) not null,
    f_date date not null
)

create sequence faq_seq;

create table notice(
    n_no number(5) primary key,
    n_sortation varchar2(20 char) not null,
    n_title varchar2(100 char) not null,
    n_txt varchar2(2000 char) not null,
    n_date date not null
);

create sequence notice_seq;

select q_no, q_title, q_txt, q_date, q_u_no, q_reply_has, u_id, i_name, au.u_no
		from qna q, auth_user au, auth_userinfo aui
		where q.q_u_no = au.u_no
		and au.u_no = aui.u_no;

-----------(event)------------------
create table event(
    e_no number(5) primary key,                 -- pk
    e_title varchar2 (100 char) not null,       -- 제목
    e_date date default sysdate not null ,      -- 업로드 날짜
    e_content varchar2 (100 char) not null,     -- 내용
    e_duration date not null,                   -- 기간(마감일)
    e_popup number(1) not null,                 -- 팝업 유무 (1/0)
    e_mainimg varchar2 (2000 char) not null,    -- 메인 이미지
    e_detailimg varchar2 (4000 char) not null,  -- 상세 이미지
    e_status varchar2 (5 char) not null         -- 상태 (진행중/마감/예정)
);
create sequence event_seq;

insert into event values(event_seq.nextval,'이벤트제목', sysdate,'내용','2023-03-16',1,'mainimg','detail','진행중');

select * from event;

select * from
        (select rownum as rn, e_no, e_title, e_date, e_content, e_duration,e_popup,e_mainimg,e_detailimg,e_status
        from(
        select * from event e
        )
        )
        where rn >= 1 and rn <= 3;
