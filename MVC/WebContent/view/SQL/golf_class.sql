-- 골프 클래스 테이블 생성
create table golf_class(
c_no number(38) primary key  --클래스 고유번호
, c_title varchar2(100) not null --클래스명
, c_teacher varchar2(20) not null --클래스 강사명
, c_career varchar2(200) not null --강사 소개 또는 경력사항
, c_phone varchar2(30) not null --클래스 전화번호
, c_gender varchar2(20) not null --강사 성별
, c_kind varchar2(30) not null --클래스 종류(STANDARD, DELUXE, PREMIUM 중 하나)
, c_info varchar2(50) not null --클래스 기본항목(라운딩 몇회)
, c_desc varchar2(200) not null --클래스 패키지 설명
, c_time varchar2(100) not null --1회당 레슨시간(분)
, c_count number(38) not null --레슨 횟수
, c_price varchar2(50) not null --가격
, c_addr varchar2(50) not null --클래스 지역
, c_image varchar2(200) not null --이미지 경로
);

select * from golf_class order by c_no desc;

delete from golf_class where c_no=3;

drop table golf_class

--class_no_seq 시퀀스생성
create sequence class_no_seq
start with 1--1부터 시작
increment by 1 --1씩 증가
nocache;

select class_no_seq.nextval from dual;

drop sequence class_no_seq

delete from golf_class

--골프 클래스 insert문
insert into golf_class values(
class_no_seq.NEXTVAL, 
'답답한 연습장이 아닌 필드에서 모든 골프 레슨을 펼쳐 드립니다.',
'이광용',
'안녕하세요 진심은 통한다 ! 이광용프로입니다.
진심을 다해 노력하며 열심히 알려드리겠습니다.',
'010-1111-1111',
'남성',
'STANDARD',
'라운딩 골프 레슨 1회',
'1. 라운딩 시작 1시간전 연습장 레슨\r\n
2. 비디오 분석\r\n
3.라운딩 후 피드백\r\n
4. 연습방법 고지\r\n',
'360분',
'1',
'640,000원',
'용인',
'./images/class/1_2.jpg'
);

-- 수강중인 골프 클래스 테이블 생성
create table class_ing(
m_id varchar2(50) 
,c_no number(38)
);

drop table class_ing;
select * from class_ing;

--외래키 설정
alter table class_ing
add constraint ing_mid_fk foreign key(m_id)
references GOLFORMEMBERNEW(m_id);

alter table class_ing
add constraint ing_cno_fk foreign key(c_no)
references golf_class(c_no);

commit;