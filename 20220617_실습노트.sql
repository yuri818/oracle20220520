DELETE FROM member

--commit;
--������ ��ȣ�� �ʱ�ȭ ���� ����

SELECT mem_no,mem_id,mem_pw,mem_name,mem_zipcode,mem_address
  FROM member
  
���̵�� ����� ��� ��ġ�ϸ� mem_name
����� Ʋ���� 0 ��ȯ
���̵� �������� ������ -1

SELECT
       CASE WHEN mem_id=: id THEN 
        CASE WHEN mem_pw=: pw THEN mem_name
        ELSE '0'
        END
       ELSE '-1'
       END as mem_name
  FROM member

--Stop�ϴ� ��

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



