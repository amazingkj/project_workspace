create table golf_class(  --강좌
c_no number(38),
c_name number(38),  --강좌명
c_phone number(38),  --강사폰번호
c_teacher number(38),  --강사명
c_career01 number(38),  --강사커리어, 길면 02,03으로 연장
c_gender number(38),  --강사성별
c_time number(38),  --1회당 강의시간
c_price number(38),  --강좌가격
c_schedule number(38),  --강좌일정
c_addr number(38)  --주요강의지역
);

create sequence c_no_seq
start with 1
increment by 1
nocache;

insert into golf_class values();

select * from golf_class order by desc;

