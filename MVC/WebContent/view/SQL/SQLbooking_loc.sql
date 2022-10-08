create table booking_loc(  --골프장 예약
bl_no number(38),
bl_people varchar2(50),  --예약인원
bl_date varchar2(50) --예약날짜, date에 시간도 포함하는게 좋아보임
);

create sequence bl_no_seq
start with 1
increment by 1
nocache;

insert into booking_loc values();

select * from booking_loc order by desc;
