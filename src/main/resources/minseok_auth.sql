create table auth(
    a_id varchar2(30 char) PRIMARY key,
    a_pw varchar2(20 char),
    a_Sortation varchar2(10 char),  -- 회원관리자 구분
    a_name varchar2(20 char),
    a_phone varchar2(20 char),
    a_address varchar2(50 char),
    a_date DATE not null        --만든날
);

create table my_car(
    mc_number varchar2(50 char) PRIMARY key,    --차번호
    mc_id varchar2(50 char )not null,           --회원id랑 일치 시켜줄 id
    mc_model varchar2(50 char )not null,        --차 모델명
    mc_brand varchar2(50 char )not null,        --차브랜드
    mc_year number(8)not null,                  --차연식
    CONSTRAINT FK_CARID
    FOREIGN KEY(mc_id)
    REFERENCES auth(a_id)
    ON DELETE CASCADE
);

alter table my_car drop CONSTRAINT FK_CARID;

insert into auth  values('mz1004','mz1004','관리자','mz','01012341234','서울',sysdate);
insert into auth  values('ms1004','ms1004','관리자','민석','01012341234','충청남도',sysdate);
insert into auth  values('yw1004','yw1004','일반','영웅','01012341234','대구 두산위브더제니스',sysdate);
insert into auth  values('wm3','yw1004','일반','영웅','01012341234','대구 두산위브더제니스',sysdate);
insert into auth  values('wm2','yw1004','일반','영웅','01012341234','대구 두산위브더제니스',sysdate);
insert into auth  values('jh1004','jh1004','일반','재현','01012341234','인천',sysdate);
insert into auth  values('hg1004','hg1004','일반','한길','01012341234','서울',sysdate);
insert into auth  values('gn1004','gn1004','일반','건우','01012341234','부산',sysdate);
insert into auth  values('1','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('2','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('3','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('4','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('5','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('6','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('7','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('8','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('9','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('10','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('11','ms1004','일반','민석','01012341234','충청남도',sysdate);
insert into auth  values('12','ms1004','일반','민석','01012341234','충청남도',sysdate);

insert into my_car values('12가232','ms1004','페라리911','페라리','1999');
insert into my_car values('12가233','mz1004','페라리911','페라리','1999');
insert into my_car values('12가234','yw1004','페라리911','페라리','1999');
insert into my_car values('12가235','wm3','페라리911','페라리','1999');
insert into my_car values('12가236','wm2','페라리911','페라리','1999');
insert into my_car values('12가237','jh1004','페라리911','페라리','1999');
insert into my_car values('12가238','hg1004','페라리911','페라리','1999');
insert into my_car values('12가239','gn1004','페라리911','페라리','1999');


select * from auth;


select * from auth a  left OUTER JOIN my_car mycar
 ON a.a_id = mycar.mc_id;
 

select * from auth a, my_car mycar
where a.a_id = mycar.mc_id(+);

ALTER TABLE my_car DROP FOREIGN KEY;
alter table my_car drop foreign key;


select * from auth ;
delete auth;
drop table auth;
drop table my_car;


select * from auth,my_car
where a_id=mc_id;




update auth set a_Sortation ='일반' where a_id = 'wm2';



select * from (select 
	rownum as rn,a_id,a_Sortation,a_name,a_phone,a_address,a_date,mc_number,
    mc_id,mc_model,mc_brand,mc_year
	 from (select * from auth a left OUTER JOIN my_car mycar
		on a.a_id = mycar.mc_id  where
		
			a.a_name like '%%' 
           
			order by a.a_date desc)
			)where rn >= 1 and rn <= 7;
	
    
    select * from auth a left OUTER JOIN my_car mycar
		on a.a_id = mycar.mc_id  where
			a.a_id like '%%'  and
			a.a_name like '%영웅%' 
            and a.a_Sortation = '일반'
			order by a_date desc;




------------------------------------------------------------------------
--tire페이지~~~  재호좌 참고

create table tire_group (
	tg_id number(4) primary key,
	tg_brand varchar2(20 char) not null,
	tg_name varchar2(30 char) not null,
	tg_img varchar2(200 char) default 'noimg',
	tg_text varchar2(100 char) not null,		
	tg_dcrate number(3) default 0,		/* dc rate 할인율 */
	tg_print number(1) not null,        /* 출력 여부 */
	tg_sedan number(1) not null,	/* 승용차 추천 1(t)/0(f) */
	tg_suv number(1) not null		/* suv 추천 1(t)/0(f)		tg_recommend로 해서 0(sedan) or 1(suv)로 해도 될지도?? */
);

create table tire_item (            
	ti_id number(5) primary key,		
	ti_tg_id number(4) not null,		/* tire_group 테이블 pk 참조하는 것 */
	ti_hg number(3) not null,			/* 하중 */
	ti_speed varchar2(2 char) not null,	/* 속도계수 		하중 + 속도계수 = 마킹이 됨. */ 
	ti_width number(3) not null,		/* 단면폭 */
	ti_ratio number(2) not null,		/* 편평비 */
	ti_inch number(2) not null,			/* 인치 */
	ti_stock number(5) not null,		/* 재고량 */
	ti_pricegp number(8) not null,		/* 기표가격 */	
	ti_pricefac number(8) not null,		/* 공장가격 */
	ti_vat number(7) not null			/* 부가세 */
);
alter table tire_item
add CONSTRAINT FK_tire_item
    FOREIGN KEY(ti_tg_id)
    REFERENCES tire_group(tg_id)
    ON DELETE CASCADE; 

create sequence tire_group_seq;
create sequence tire_item_seq;

ALTER SEQUENCE TIRE_GROUP_seq INCREMENT BY 30;  --시퀀스 증가해서 오류 고치기  다시 1로 바꿔줘야한다.
ALTER SEQUENCE tire_item_seq INCREMENT BY 1;


select * from tire_group;
select * from tire_item;


drop table tire_group;
drop table tire_item;

select * from tire_group;


select * from tire_group tg left OUTER JOIN tire_item ti
	on tg.tg_id = ti.ti_tg_id 
   
    
select count(*) from tire_item 
where ti_tg_id = (select tg_id from tire_group where tg_id='1');
    
   select count(*)
		from tire_group 
		where 	
        tg_brand like '%%' and
		tg_name like '%%' 
        
        
        
        
--------------------------------------------------------------------------
---타이어 브랜드
create table tire_brand(
    tb_name varchar2(100 char) primary key,
    tb_ea number(2) not null,           --1은 출력 0은 미출력
    tb_order number(3) not null        --순서 출력
);

create table tire_brand(
    tb_id number(4) primary key,
    tb_name varchar2(100 char) not null,
    tb_ea number(2) not null,           --1은 출력 0은 미출력
    tb_order number(3) not null        --순서 출력
);
create tb_id_seq;


drop table tire_brand;


insert into tire_brand values('넥센타이어','1','1');
insert into tire_brand values('금호타이어','1','2');
insert into tire_brand values('미쉐린타이어','1','3');
insert into tire_brand values('콘티넨탈타이어','1','4');
insert into tire_brand values('한국타이어','1','5');
insert into tire_brand values('요코하마타이어','1','6');
insert into tire_brand values('브리지스톤타이어','1','7');
insert into tire_brand values('굳이어타이어','1','8');
insert into tire_brand values('던롭타이어','1','9');
insert into tire_brand values('피렐리타이어','1','10');
insert into tire_brand values('BF굿리치타이어','1','11');

alter table tire_group                --타이어 그룹 fk연결
add CONSTRAINT FK_tire_brand
    FOREIGN KEY(tg_brand)
    REFERENCES tire_brand(tb_name)
    ON DELETE CASCADE; 



select * from tire_brand;

drop table tire_brand;

select count(*) from tire_group left OUTER JOIN tire_item
	on  tg_id = ti_tg_id where tg_brand = '넥센타이어'
    
    select * from tire_group left OUTER JOIN tire_item
	on  tg_id = ti_tg_id

delete from tire_brand where tb_name= 'BF굿리치타이어';



--타이어 수정페이지
select * from tire_group left OUTER JOIN tire_item
	on tg_id = ti_tg_id where tg_id = 1;

update product_order set o_step = '배송준비중' where o_no = '117';

