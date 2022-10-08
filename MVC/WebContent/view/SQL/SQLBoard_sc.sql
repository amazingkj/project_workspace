--스코어카드 업로드 게시판 테이블 생성
create table scboard(
sc_no number(38)
,sc_id varchar2(50)
,sc_name varchar2(50)
,sc_title varchar2(50)
,sc_playdate varchar2(50)
,sc_cont varchar2(4000)
,sc_file varchar2(100)
,sc_hit number(38) default 0
,sc_ref number(38)  --원본글과 관리자 답변글을 묶어주는 글 그룹번호값
,sc_step number(38)
,sc_level number(38)  --답변글 정렬순서
,sc_date date
);


create sequence test_scboard_seq
start with 1
increment by 1
nocache;

select * from scboard order by sc_no desc;


--여기까지만 진행
drop table scboard;
drop sequence test_scboard_seq;

delete from scboard;

insert into scboard(sc_no,sc_name,sc_title,sc_pwd,sc_cont,sc_file,sc_date) values(test_scboard_seq,?,?,?,?,?,sysdate);


