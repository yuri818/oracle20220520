SELECT mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address
  FROM member

edit member

SELECT length(mem_id), length('tomato '),length('to mato') FROM member
 WHERE mem_id = 'tomato'
 


SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id = 'tomato')
                



