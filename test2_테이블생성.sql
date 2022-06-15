create table test2(
mem_id varchar2(10) constraints test2_pk primary key
,mem_name nvarchar2(10)
,mem_name2 varchar2(10)
)

insert into test2(mem_id, mem_name, mem_name2) values('yuri2','ÁÖ¸ÔÁã°í ÀÏ¾î¼­','À¯¸®')
