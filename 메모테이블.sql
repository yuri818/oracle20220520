create table memo(
  no number(5) constraints memo_no_pk primary key,
  from_id varchar2(10) not null,
  to_id varchar2(10) not null,
  memo_content varchar2(4000),
  create_date varchar2(30),
  read_yn varchar2(1)
)

where from_id = 'tomato'

where to_id = 'banana'