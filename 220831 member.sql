SELECT * FROM member
 WHERE mem_id LIKE '%'||'toma'||'%'
 

SELECT * FROM member
 WHERE mem_name LIKE '%'||'��'||'%'
 

SELECT mem_id, mem_name, '��������' as btn FROM member

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual