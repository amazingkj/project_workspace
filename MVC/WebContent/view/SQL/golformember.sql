create table golformember(
m_no number(38),
m_name varchar2(50),
m_id varchar2(50),
m_pw varchar2(50),
m_phone varchar2(50),
m_addr varchar2(50),
m_email varchar2(50),
m_gender varchar2(50),
m_date date -- 회원가입일 
);



drop table golformember;


create sequence m_no_seq
start with 1
increment by 1
nocache;


insert into golformember values();

select * from golformember order by m_no desc;

--test용 insert
create sequence test_m_no
start with 1
increment by 1
nocache;

insert into golformember(m_no, m_name, m_id, m_pw, m_phone, m_addr, m_email, m_gender, m_date)
values(m_no.nextval,'가가가','a1','b1','010','home','c@d.e','male',date);
insert into golformember values(test_m_no.nextval,'나나나','a2','b2','010','home','c@d.e','2',sysdate);
insert into golformember values('김지인','amazingkj','1234','010-3138-7981','home','c@d.e','male',sysdate);


insert into golformember values(test_m_no.nextval,'나나나','11','11','010','home','c@d.e','2',sysdate);

select count(*) from golformember;  --테이블 내 저장된 레코드 개수 반환


select m_no_seq.nextval from dual;



/* 테이블 다시 짜야함 > 프로필 사진 파일 등록 기능 필요 */

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



drop table golformemberNew;


create sequence m_golf_seq
start with 1
increment by 1
nocache;

select * from golformemberNew order by m_no desc;

insert into golformemberNew 
values(m_golf_seq.nextval,'나나나','11','11','010','home','c@d.e','2','nofile',sysdate,1,'nocont',sysdate);

select count(*) from golformemberNew;  --테이블 내 저장된 레코드 개수 반환

select m_golf_seq.nextval from dual;


insert into golformemberNew (m_id,m_pw,m_phone,m_email,m_gender,m_date,m_state) 
values ('h','hi','010-2222-2222','ddd@ggg.gg','2',sysdate,1);

drop SEQUENCE m_golf_seq;





















