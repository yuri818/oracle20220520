DELETE FROM member

--commit;
--시퀀스 번호는 초기화 되지 않음

SELECT mem_no,mem_id,mem_pw,mem_name,mem_zipcode,mem_address
  FROM member
  
아이디와 비번이 모두 일치하면 mem_name
비번이 틀리면 0 반환
아이디가 존재하지 않으면 -1

SELECT
       CASE WHEN mem_id=: id THEN 
        CASE WHEN mem_pw=: pw THEN mem_name
        ELSE '0'
        END
       ELSE '-1'
       END as mem_name
  FROM member

--Stop하는 법

SELECT
       mem_name
  FROM (
        SELECT
               CASE WHEN mem_id=: id THEN 
                CASE WHEN mem_pw=: pw THEN mem_name
                ELSE '0'
                END
               ELSE '-1'
               END as mem_name
          FROM member
        ORDER BY mem_name desc
       )
 WHERE rownum = 1



SELECT * FROM member



