
/* 프로필 사진 파일 등록 기능 필요 해서 테이블을 다시 짬 */

create table golformemberNew(
m_no number(38),
m_name varchar2(50),
m_id varchar2(50) primary key,
m_pw varchar2(50) not null,
m_phone varchar2(50) not null,
m_addr varchar2(50),
m_email varchar2(50),
m_gender varchar2(10),
m_file varchar2(50),
m_date date,
m_state number(10),
m_delcont varchar2(50),
m_deldate date
);


create sequence m_golf_seq
start with 1
increment by 1
nocache;




/*여기부터는 필요시에만 */


select * from golformemberNew order by m_no desc;


insert into golformemberNew 
values(m_golf_seq.nextval,'나나나','11','11','010','home','c@d.e','2','nofile',sysdate,1,'nocont',sysdate);


select count(*) from golformemberNew;  --테이블 내 저장된 레코드 개수 반환


select m_golf_seq.nextval from dual;

insert into golformemberNew (m_no,m_id,m_pw,m_phone,m_email,m_gender,m_date,m_state) 
values (m_golf_seq.nextval,'test','test','010-2332-2332','ddd@test.gg','male',sysdate,1);


select * from golformemberNew where m_id='11' and m_state=1;
select * from golformemberNew where m_id='h' and m_state=1;
select * from golformemberNew;


/*테이블 드랍*/
drop table golformemberNew;

/*시퀀스 드랍*/
drop SEQUENCE m_golf_seq;



select m_pw from golformemberNew where m_email='jiin724@naver.com';
select m_id,m_pw from golformemberNew where and m_email='jiin724@naver.com' and m_state=1

select m_id,m_pw from golformemberNew where m_email='jiin724@naver.com' and m_state=1





