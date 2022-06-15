create user sample2 identified by tiger
default tablespace users

grant create session to sample2 with admin option;

grant create table to sample2 with admin option;

alter user sample2 quota unlimited on users;