create table ranking(
r_no number(38),
r_id varchar2(50), --회원가입한 아이디랑 동일(외래키 사용?)
r_sum number(38),
r_avg number(38),
r_putting number(38),
r_maxrange number(38),
r_avgrange number(38),
r_province varchar2(50)
);

create sequence r_no_seq
start with 1
increment by 1
nocache;


create sequence test_r_no
start with 1
increment by 1
nocache;

--여기까지 실행
--예시용 입력 자료 

insert into ranking values(test_r_no.nextval,'id1',0,0,1.5,100,100,'서울');
insert into ranking values(test_r_no.nextval,'id2',3,0,1.5,100,100,'서울');
insert into ranking values(test_r_no.nextval,'id3',-1,0,1.5,100,100,'서울');
insert into ranking values(test_r_no.nextval,'id4',-4,0,1.5,100,100,'경기');
insert into ranking values(test_r_no.nextval,'id5',4,0,1.5,100,100,'경기');
insert into ranking values(test_r_no.nextval,'id6',-3,0,1.5,100,100,'경기');
insert into ranking values(test_r_no.nextval,'id7',1,0,1.5,100,100,'인천');
insert into ranking values(test_r_no.nextval,'id8',2,0,1.5,100,100,'인천');


--예시용 입력자료 끝


alter table ranking add r_province varchar2(50);

drop table ranking;

drop sequence r_no_seq;

insert into ranking values(r_no_seq.nextval,0,0,0,0,0,0,0,0);

select r_id from ranking order by r_sum asc;
select * from ranking order by r_sum asc;

select count(*) from ranking; --테이블 내 레코드 개수 반환


drop sequence test_r_no;





insert into ranking values(test_r_no.nextval,'id1',0,0,1.5,100,100);
insert into ranking values(test_r_no.nextval,'id2',3,0,1.5,100,100);
insert into ranking values(test_r_no.nextval,'id3',-1,0,1.5,100,100);
insert into ranking values(test_r_no.nextval,'id4',-4,0,1.5,100,100);
insert into ranking values(test_r_no.nextval,'id5',4,0,1.5,100,100);
insert into ranking values(test_r_no.nextval,'id6',-3,0,1.5,100,100);
insert into ranking values(test_r_no.nextval,'id7',1,0,1.5,100,100);
insert into ranking values(test_r_no.nextval,'id8',2,0,1.5,100,100);

update ranking set r_sum=4 where r_id='id5';

update ranking set r_province='서울' where r_id='id1';
update ranking set r_province='서울' where r_id='id2';
update ranking set r_province='서울' where r_id='id3';
update ranking set r_province='경기' where r_id='id4';
update ranking set r_province='경기' where r_id='id5';
update ranking set r_province='경기' where r_id='id6';
update ranking set r_province='인천' where r_id='id7';
update ranking set r_province='인천' where r_id='id8';

update ranking set r_sum=1 where r_no=9;
update ranking set r_sum=1 where r_no=10;
update ranking set r_sum=1 where r_no=12;
update ranking set r_sum=1 where r_no=13;

select rownum,r_id from ranking order by r_sum asc;

delete from ranking;







1. scboard
 1) sc_name 컬럼 제거
 -> alter table scboard drop column sc_name;

2. ranking
 1) 컬럼 제거 : r_avg, r_putting, r_maxrange, r_avgrange
 -> alter table ranking drop column r_avg;
     alter table ranking drop column r_putting;
     alter table ranking drop column r_maxrange;
     alter table ranking drop column r_avgrange;

3. score_card
 1) 컬럼명 수정 : s_avgscore -> s_sumscore
 -> alter table score_card rename column s_avgscore to s_sumscore;
 2) 컬럼 추가 : s_updated number(38) default 0;
 -> alter table score_card add s_updated number(38) default 0;

