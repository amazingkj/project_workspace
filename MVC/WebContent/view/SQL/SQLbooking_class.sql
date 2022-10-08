create table booking_class(
bc_no number(38)

);

create sequence bc_no_seq
start with 1
increment by 1
nocache;

insert into booking_class values();


drop table booking_class;
drop sequence bc_no_seq

select * from booking_class