create table tier(
t_bronze varchar2(50),
t_silver varchar2(50),
t_gold varchar2(50),
t_platinum varchar2(50),
t_diamond varchar2(50),
);

insert into tier values('bronze','silver','gold','platinum','diamond');

select * from tier order by desc;

