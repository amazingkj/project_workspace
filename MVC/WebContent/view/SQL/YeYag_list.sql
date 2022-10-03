create table YeYag_list(
y_no number(38) primary key --번호
,y_name varchar2(100) --골프장 이름
,y_list number(38) -- 골프장구분
,y_price number(38) -- 골프장가격
,y_usepeople number(38) --골프장 사용가능한 인원
,y_area varchar2(100)-- 지역
,y_img varchar2(100) -- 골프장 이미지
, y_info varchar2(100) -- 골프장 설명
,y_url varchar2(2000)-- url지정
);

select * from YeYag_list

drop table YeYag_list

delete YeYag_list

insert into YeYag_list values (1,'잭 니클라우스 GC 코리아',1,169000,5,'인천','/MVC/images/yeyag/JACK.jpg','JACK NICKLAUS GOLF CLUB KOREA','/MVC/YeYag_main2.do');
insert into YeYag_list values (2,'해슬리 나인브릿지',2,180000,5,'경기도','/MVC/images/yeyag/Qcc.jpg','HAESLEY NINE BRIDGE','/MVC/YeYag_main.do');
insert into YeYag_list values (3,'골드레이크',3,150000,5,'전라도','/MVC/images/yeyag/goldlakecc.jpg','GOLD LAKE CC','/MVC/YeYag_main1.do');
insert into YeYag_list values (4,'소노 펠리체 CC',4,200000,5,'인천','/MVC/images/yeyag/SONO.jpg','SONO FELICE COUNTRY CLUB','/MVC/YeYag_main3.do');


