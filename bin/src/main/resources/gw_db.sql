-- 타이어 테스트 테이블

create table tire_test(
ti_width number(3) not null,
ti_ratio number(3) not null,
ti_inch number(3)not null
)

insert into tire_test values(1,1,1);
insert into tire_test values(2,2,1);
insert into tire_test values(3,3,1);
insert into tire_test values(4,4,1);
insert into tire_test values(5,5,1);

select * from tire_test;

select * from tire_test where
	ti_width = 1 and ti_ratio = 1 and ti_inch= 1
	