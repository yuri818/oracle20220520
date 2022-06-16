SELECT mem_no, mem_id, mem_pw
      ,mem_name, mem_zipcode, mem_address
  FROM member
ORDER BY mem_no desc

  
SELECT mem_no, mem_id, mem_pw
      ,mem_name, mem_zipcode, mem_address
  FROM member
 WHERE mem_id = 'test'

SELECT mem_no, mem_id, mem_pw
      ,mem_name, mem_zipcode, mem_address
  FROM member
 WHERE mem_id = 'kiwi'

SELECT 
       zipcode, address
  FROM zipcode_t
 WHERE dong LIKE '%'||'¿ª»ï'||'%'

SELECT 
       zipcode, address
  FROM zipcode_t
 WHERE dong LIKE '%'||'´ç»ê'||'%'




