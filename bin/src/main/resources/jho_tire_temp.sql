/* 타이어 브랜드 테이블 (민석좌가 보내줌) */
create table tire_brand(
    tb_name varchar2(100 char) primary key,
    tb_ea number(2) not null,           --1은 출력 0은 미출력
    tb_order number(3) not null        --순서 출력
);

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



/* 타이어 그룹 테이블 (칼럼 수정해주세요) */ 
create table tire_group (
	tg_id number(4) primary key,
	tg_brand varchar2(20 char) not null,
	tg_name varchar2(30 char) not null,
	tg_img varchar2(200 char) default 'noimg',
	tg_text varchar2(100 char) not null,		
	tg_dcrate number(3) default 0,		/* dc rate 할인율 */
	tg_print number(1) not null,	/* 출력 여부 */
	tg_sedan number(1) not null,	/* 승용차 추천 1(t)/0(f) */
	tg_suv number(1) not null		/* suv 추천 1(t)/0(f)		tg_recommend로 해서 0(sedan) or 1(suv)로 해도 될지도?? */
)
/* tb_name이랑  tg_brand 연결 (민석좌가 보내줌)*/
alter table tire_group
add CONSTRAINT FK_tire_brand
    FOREIGN KEY(tg_brand)
    REFERENCES tire_brand(tb_name)
    ON DELETE CASCADE;


drop table tire_group;

create sequence tire_group_seq

select * from tire_group



/* 타이어 아이템 테이블 (칼럼 수정 해주세요.)*/
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
)
/* tg_id랑 ti_tg_id 연결 (민석좌가 보내줌) */
alter table tire_item
add CONSTRAINT FK_tire_item
    FOREIGN KEY(ti_tg_id)
    REFERENCES tire_group(tg_id)
    ON DELETE CASCADE;
    
create sequence tire_item_seq;

drop table tire_item;

select * from tire_item;

select * from tire_group, (select ti_tg_id from tire_item where ti_pricefac < 200000 group by ti_tg_id) where tg_id = ti_tg_id
select ti_tg_id from tire_item where ti_pricefac < 200000 group by ti_tg_id
