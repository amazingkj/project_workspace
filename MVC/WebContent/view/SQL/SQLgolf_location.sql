create table golf_location(  --골프장
l_no number(38),
l_category varchar2(50),  --필드/연습장 구분
l_name varchar2(50),  --골프장명
l_addr varchar2(50),  --주소
l_phone varchar2(50),  --전화번호
l_email varchar2(50),  --이메일
l_price varchar2(50)  --가격
);

create sequence l_no_seq
start with 1
increment by 1
nocache;

insert into golf_location values();

select * from golf_location order by desc;





