--golforboard mvc 계층형 게시판 

/*** 댓글하고 게시물 파일 첨부 때문에 테이블 다시 짜야함 */

create table golforboard( --테이블 생성
  b_no number(38) primary key --게시물 번호
 ,m_id varchar2(100) not null --글쓴이
 ,b_title varchar2(200) not null --글제목
 ,b_pwd varchar2(50) not null --비번
 ,b_cont varchar2(4000) not null --글내용
 ,b_hit number(38) default 0 --조회수
 ,b_ref number(38) --원본글과 관리자 답변글을 묶어주는 글 그룹번호값
 ,b_step number(38) --원본글이면 0,첫번째 답변글이면 1,두번째 답변글이면 2,원본글과 답변글을 구분하는 번호값이면서 몇번째 답변글인가를 알려준다.
 ,b_level number(38) --답변글 정렬순서
 ,b_date date --글 등록날짜
 ,b_like number(38) default 0
);


delete golforboard;

alter table golforboard MODIFY b_pwd varchar2(50) NULL;
--b_pwd 의 데이터 형식을 varchar(50) 으로 지정하고 NULL값을 허용한다.

alter table golforboard RENAME COLUMN b_name TO m_id;

alter table golforboard add constraint golforboard_m_id_fk
foreign key(m_id) references golformemberNew(m_id);






alter table golforboard add b_like number(38) default 0;

select * from golforboard order by b_no desc;

--boardT_no_seq 시퀀스 생성
create sequence board_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache;

-- 시퀀스 다음 번호값 확인
select board_no_seq.nextval from dual;




--게시물 입력 
insert into golforboard (b_no,b_name,b_title,b_pwd,b_cont,b_ref,b_step,b_level,b_date) 
VALUES (board_no_seq.nextval,'이름','제목','1111','내용입니다',board_no_seq.nextval,0,0,sysdate);

insert into golforboard (b_no,b_name,b_title,b_pwd,b_cont,b_ref,b_step,b_level,b_date) 
VALUES (board_no_seq.nextval,'이름2','제목2','1111','내용입니다2',board_no_seq.nextval,0,0,sysdate);



-- 검증
select count(b_no) from golforboard where b_title like "ㄴ";

select * from 
(select rowNum rNum,b_no,b_name,b_title,b_hit,b_ref,b_step,b_level,b_date,b_like
from (select * from golforboard where b_title  like '%1%' or b_cont like '%1%'));


select golformemberNew.m_id,golforboard.b_name from golformemberNew,golforboard;