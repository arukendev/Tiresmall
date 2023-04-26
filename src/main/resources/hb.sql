create table branch (
b_id varchar2(20 char) primary key,
b_sortation varchar2(20 char) not null,
b_area varchar2(30 char) not null,
b_addr varchar2(100 char) not null,
b_name varchar2(20 char) not null,
b_time varchar2(50 char) not null,
b_service varchar2(100 char) not null,
b_mapdata varchar2(2000 char) not null,
b_manager varchar2(20 char) ,
b_managernumber varchar2(13 char) ,
b_branchname varchar2(20 char) ,
b_branchnumber varchar2(13 char) ,
b_cr varchar2(20 char)  ,
b_email varchar2(30 char),	
b_file varchar2(2000 char)
);


오재호 가데이터 ----------------------------------
insert into branch values('1','직영점(당일장착점)','대전광역시	서구','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','1','042-545-8008','3','4','5','6','a.jpg');
insert into branch values('2','제휴장착점','대전광역시	유성구','죽동 707-2번지','타이어테크','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어, 금호타이어,넥센타이어, 타이어렌탈전문점, 휠얼라이먼트, 합성오일 전문점','36.369228, 127.338054','1','010-4417-2220','3','4','5','6');
insert into branch values('3','제휴장착점','충청남도	논산시','시민로 262 논산타이어 (내동)','타이어테크 시청점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1900937, 127.0954606','1','2','3','4','5','6','a.jpg');
insert into branch values('4','제휴장착점','충청남도	논산시','연무읍 왕릉로13번길 38 타이어테크 연무점','타이어테크 연무점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1188693, 127.0984388','1','2','3','4','5','6','a.jpg');
insert into branch values('5','제휴장착점','충청남도	논산시','해월로252 타이어테크 반월점 (로얄카)','타이어테크 반월점 (로얄카)','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국,금호,넥센타이어,각종수입타이어,타이어 렌탈,휠얼라이먼트,경정비','36.208517, 127.0937896','1','010-7267-2220','3','4','5','6','a.jpg');
insert into branch values('6','제휴장착점','충청남도	논산시','시민로 262 논산타이어 (내동)','타이어테크 시청점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1900937, 127.0954606','1','2','3','4','5','6','a.jpg');
insert into branch values('7','제휴장착점','충청남도	논산시','연무읍 왕릉로13번길 38 타이어테크 연무점','타이어테크 연무점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1188693, 127.0984388','1','2','3','4','5','6','a.jpg');
insert into branch values('8','직영점(당일장착점)','충청남도	논산시','해월로252 타이어테크 반월점 (로얄카)','타이어테크 반월점 (로얄카)','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국,금호,넥센타이어,각종수입타이어,타이어 렌탈,휠얼라이먼트,경정비','36.208517, 127.0937896','1','010-7267-2220','3','4','5','6','a.jpg');
insert into branch values('9','제휴장착점','충청남도	논산시','시민로 262 논산타이어 (내동)','타이어테크 시청점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1900937, 127.0954606','1','2','3','4','5','6','a.jpg');
insert into branch values('10','제휴장착점','충청남도	논산시','연무읍 왕릉로13번길 38 타이어테크 연무점','타이어테크 연무점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1188693, 127.0984388','1','2','3','4','5','6','a.jpg');
insert into branch values('11','제휴장착점','충청남도	논산시','해월로252 타이어테크 반월점 (로얄카)','타이어테크 반월점 (로얄카)','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국,금호,넥센타이어,각종수입타이어,타이어 렌탈,휠얼라이먼트,경정비','36.208517, 127.0937896','1','010-7267-2220','3','4','5','6','a.jpg');
insert into branch values('12','제휴장착점','충청남도	논산시','시민로 262 논산타이어 (내동)','타이어테크 시청점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1900937, 127.0954606','1','2','3','4','5','6','a.jpg');
insert into branch values('13','제휴장착점','충청남도	논산시','연무읍 왕릉로13번길 38 타이어테크 연무점','타이어테크 연무점','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.1188693, 127.0984388','1','2','3','4','5','6','a.jpg');
insert into branch values('14','제휴장착점','충청남도	논산시','해월로252 타이어테크 반월점 (로얄카)','타이어테크 반월점 (로얄카)','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국,금호,넥센타이어,각종수입타이어,타이어 렌탈,휠얼라이먼트,경정비','36.208517, 127.0937896','1','010-7267-2220','3','4','5','6','a.jpg');







insert into branch values('test123','직영점(당일장착점)','대전광역시	서구','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','한국타이어','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test1235','직영점(당일장착점)','대전광역시	서구','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','한국타이어','010-3121-3453','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test1236','제휴장착점','대전광역시	서구','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','신길타이어','010-2343-1232','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test1237','직영점(당일장착점)','대전광역시	대덕구','믿음로 121','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','조선타이어','010-7875-7654','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test1238','제휴장착점','인천광역시	계양구','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','신념타이어','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test1239','직영점(당일장착점)','경기도	고양시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','타이어장착소','010-7875-7654','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test1230','제휴장착점','경기도	안산시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','대한타이어','010-3554-2312','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12301','제휴장착점','경기도	수원시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','타이어스어빌리티','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12302','직영점(당일장착점)','제주도		서귀포시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','타이어라이프','010-9987-1162','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12303','제휴장착점','제주도	제주시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','스피드휠','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12304','직영점(당일장착점)','강원도		강릉시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-3554-2312','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12305','제휴장착점','서울특별시	강남구','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-3554-2312','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12306','직영점(당일장착점)','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12307','제휴장착점','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12308','직영점(당일장착점)','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-3121-3453','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12309','제휴장착점','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12310','직영점(당일장착점)','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-2343-1232','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12311','제휴장착점','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-2245-4166','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12312','직영점(당일장착점)','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-3554-2312','김영식','youngsik@gmail.com','a.jpg');
insert into branch values('test12313','직영점(당일장착점)','충청북도	제천시','신갈마로 83 (갈마동)','타이어쇼핑몰','평일 : 08:30 ~ 19:00 / 토요일 08:30 ~ 16:00 (일요일 휴무)','한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장','36.3417632, 127.3663178','김영식','010-545-8008','풀스로틀타이어','010-2123-4566','김영식','youngsik@gmail.com','a.jpg');





delete from branch where b_id = '1';
delete from branch where b_id = '2';
delete from branch where b_id = '3';
delete from branch where b_id = '4';
delete from branch where b_id = '5';


alter table branch modify b_managernumber varchar2(13char);

delete branch;

drop table branch;


		select count(*)
		from branch
		where b_branchname like '%%'

select * from branch;

select * from branch where b_branchname like '%%'
		select *
		from
		(select rownum as rn, b_id, b_sortation, b_area, b_addr, b_name , b_time ,
		b_service , b_mapdata, b_manager , b_managernumber , b_branchname,
		b_branchnumber ,b_cr ,b_email,b_file
		from(
		select * from branch where b_branchname like '%%'
		)
		) where rn &gt;= #{start} and rn &lt;= #{end}

		
-------------------------------------------------------------------------
	create table Car(
		c_id varchar2(20 char) primary key,
		c_name varchar2(20 char) not null,
		c_year1 varchar2(9 char) not null,
		c_year2 varchar2(9 char) not null,
		c_option varchar2(20 char) not null,
		c_brand varchar2(20 char) not null,
		c_ft varchar2(40 char) not null,
		c_bt varchar2(40 char) not null,
		c_print varchar2(40 char) not null,
		c_file varchar2(2000 char)
);
		
		
insert into Car values('159345','X101','2014','2016','에어백','대우','12313154','2534533','출력','a.jpg');
insert into Car values('154344','X202','2013','2017','아기유모차','기아','12313154','2534533','출력','b.jpg');
insert into Car values('15346','X203','2012','2018','선루프','BMW','12313154','2534533','출력','c.jpg');
insert into Car values('12595935','X101','2014','2016','에어백','대우','12313154','2534533','출력','a.jpg');
insert into Car values('512459994','X202','2013','2017','아기유모차','기아','12313154','2534533','출력','b.jpg');
insert into Car values('1492596','X203','2012','2018','선루프','BMW','12313154','2534533','출력','c.jpg');
insert into Car values('1925396','X203','2012','2018','선루프','BMW','12313154','2534533','출력','c.jpg');
insert into Car values('1923596','X203','2012','2018','선루프','BMW','12313154','2534533','출력','c.jpg');
insert into Car values('1942596','X203','2012','2018','선루프','BMW','12313154','2534533','출력','c.jpg');
insert into Car values('19274596','X203','2012','2018','선루프','BMW','12313154','2534533','출력','c.jpg');
insert into Car values('1926596','X203','2012','2018','선루프','BMW','12313154','2534533','출력','c.jpg');

		
		
select * from Car;

		
drop table Car;




	select *
		from
		(select rownum as rn,
		c_id,c_name,c_year1,c_year2,c_option,c_brand,c_ft,c_bt,c_file
		from(
		select * from
		Car where
		c_name like '%'||#{carnameInput}||'%'
		)
		) where rn &gt;= #{start} and rn &lt;= #{end}


		
SELECT  COUNT(c_brand) AS cb_ea
FROM car
GROUP BY c_brand
		

select rownum as rn,
		c_id,c_name,c_year1,c_year2,c_option,c_brand,c_ft,c_bt,c_file from Car




create table car_brand(
	cb_id number(5)primary key,
	cb_name varchar2(50 char) not null,		
	cb_img varchar2(1000 char)		
);
create
		
		
		
		SELECT *
FROM Car c
INNER JOIN car_brand cb ON c.c_brand = cb.cb_name
ORDER BY cb.cb_order ASC;
		
		select count(*)
		from Car
		where c_name
		like
		'%%'
		
SELECT  COUNT(*) AS cb_ea
FROM car
GROUP BY c_brand
		
		
		SELECT DISTINCT c_brand FROM car;
		
		
		
		alter table car
add CONSTRAINT FK_car
    FOREIGN KEY(c_brand)
    REFERENCES car_brand(cb_name)
    ON DELETE CASCADE; 
 

insert into car_brand values('대우','');
insert into car_brand values('BMW','');
insert into car_brand values('기아','');
insert into car_brand values('람보르기니','');
insert into car_brand values('미니','');
insert into car_brand values('현대','');
insert into car_brand values('쉐보레(대우)','');
insert into car_brand values('르노삼성','');
insert into car_brand values('쌍용','');
insert into car_brand values('닛산','');
insert into car_brand values('렉서스','');
insert into car_brand values('로터스','');
insert into car_brand values('링컨','');
insert into car_brand values('마세라티','');
insert into car_brand values('맥라렌','');
insert into car_brand values('미쓰미시','');
insert into car_brand values('벤틀리','');
insert into car_brand values('볼보','');
insert into car_brand values('사브','');
insert into car_brand values('스바루','');
insert into car_brand values('시토로엥','');
insert into car_brand values('아우디','');
insert into car_brand values('애스턴마틴','');
insert into car_brand values('인피니티','');
insert into car_brand values('재규어','');
insert into car_brand values('지프','');
insert into car_brand values('캐딜락','');
insert into car_brand values('크라이슬러','');
insert into car_brand values('토요타','');
insert into car_brand values('페라리','');
insert into car_brand values('포드','');
insert into car_brand values('포르쉐','');
insert into car_brand values('푸조','');
insert into car_brand values('피아트','');
insert into car_brand values('혼다','');







select * from car_brand;

drop table car_brand;





  SELECT rownum as rn,
           c.c_id, c.c_name, c.c_year1, c.c_year2, c.c_option,
           cb.cb_name as c_brand, c.c_ft, c.c_bt, c.c_print, c.c_file, cb.cb_order
    FROM Car c
    INNER JOIN car_brand cb ON c.c_brand = cb.cb_name
    WHERE c.c_name LIKE '%%'
     
    ORDER BY cb.cb_order ASC


SELECT NVL(COUNT(*), 0) AS cb_ea
FROM car
INNER JOIN car_brand ON car.c_brand = car_brand.cb_name
GROUP BY car.c_brand, car_brand.cb_order
ORDER BY TO_NUMBER(car_brand.cb_order) ASC



SELECT COALESCE(COUNT(car.c_id), 0) AS cb_ea
FROM car_brand
LEFT JOIN car ON car_brand.cb_name = car.c_brand
GROUP BY car_brand.cb_name, car_brand.cb_order
ORDER BY TO_NUMBER(car_brand.cb_order) ASC;


SELECT *
FROM (
    SELECT rownum as rn,
           c.c_id, c.c_name, c.c_year1, c.c_year2, c.c_option,
           c.c_brand, c.c_ft, c.c_bt, c.c_print, c.c_file,
           cb.cb_name, cb.cb_order
    FROM Car c
    INNER JOIN car_brand cb ON c.c_brand = cb.cb_name
    WHERE c.c_name LIKE '%%'
         

    ORDER BY TO_NUMBER(cb.cb_order) ASC, c.c_brand ASC
) 
WHERE rn &gt;= #{start} and rn &lt;= #{end}




SELECT *
FROM (
    SELECT rownum as rn,
           c.c_id, c.c_name, c.c_year1, c.c_year2, c.c_option,
           c.c_brand, c.c_ft, c.c_bt, c.c_print, c.c_file,
           cb.cb_name, cb.cb_order
    FROM Car c
    INNER JOIN car_brand cb ON c.c_brand = cb.cb_name
    WHERE c.c_name LIKE '%%'
      
           
    ORDER BY TO_NUMBER(cb.cb_order) ASC, c.c_brand ASC
) 



SELECT *
FROM (
    SELECT rownum as rn,
           c.c_id, c.c_name, c.c_year1, c.c_year2, c.c_option,
           c.c_brand, c.c_ft, c.c_bt, c.c_print, c.c_file,
           cb.cb_name, cb.cb_order
    FROM Car c
    INNER JOIN car_brand cb ON c.c_brand = cb.cb_name
    WHERE c.c_name LIKE '%%'
    ORDER BY TO_NUMBER(cb.cb_order) ASC, c.c_brand ASC
)  WHERE rn >= 1 and rn <= 30




select * from car;
select * from car_brand;



select * from(
SELECT rownum as rn, c_id, c_name, c_year1, c_year2, c_option,
           c_brand, c_ft, c_bt, c_print, c_file,
           cb_name, cb_order
FROM (
	SELECT c.*, cb.*
    FROM Car c
    INNER JOIN car_brand cb ON c.c_brand = cb.cb_name
    WHERE c.c_name LIKE '%%'
    ORDER BY TO_NUMBER(cb.cb_order) ASC, c.c_brand ASC
)
)  WHERE rn >= 1 and rn <= 3







-----------------------------------------------------------



insert into Car values('8','T7','2022','2023','폭스바겐','225/45R17','225/45R17','1','a.jpg');
insert into Car values('7','페이스맨','2013','2016','파워핸들,블랙박스','미니','225/45R17','225/45R17','1','a.jpg');
insert into Car values('6','T7','2022','2023','폭스바겐','225/45R17','225/45R17','1','a.jpg');
insert into Car values('5','T7','2022','2023','폭스바겐','225/45R17','225/45R17','1','a.jpg');
insert into Car values('4','T7','2022','2023','폭스바겐','225/45R17','225/45R17','1','a.jpg');
insert into Car values('3','T7','2022','2023','폭스바겐','225/45R17','225/45R17','1','a.jpg');
insert into Car values('2','T7','2022','2023','에어백','폭스바겐','225/45R17','225/45R17','1','a.jpg');
insert into Car values('1','T7','2022','2023','에어백','폭스바겐','225/45R17','225/45R17','1','a.jpg');

		







