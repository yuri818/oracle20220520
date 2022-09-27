CREATE OR REPLACE PROCEDURE proc_memberinsert(pmem_id IN varchar, pmem_pw IN varchar
,pmem_name IN varchar, pmem_zipcode IN varchar, pmem_address IN varchar, result OUT number)
IS
--¼±¾ðºÎ
BEGIN
    INSERT INTO member(mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address)
    VALUES(seq_member_no.nextval, pmem_id,pmem_pw,pmem_name,pmem_zipcode,pmem_address);
    commit;
    result := 1;
END;
/
