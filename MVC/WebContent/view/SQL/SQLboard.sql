create table board(
b_no number(38),
b_title varchar2(100),  --글제목
b_writer varchar2(100),  --글쓴이
b_cont varchar2(3000),  --글내용
b_view number(38),  --조회수
b_like number(38),  --좋아요개수
b_bad number(38)  --싫어요개수
);

create sequence b_no_seq
start with 1
increment by 1
nocache;

insert into board values();

select * from board order by desc;




