SELECT * FROM member

INSERT INTO member(mem_no, mem_id, mem_pw, mem_name)
VALUES(9,'nice','123','�̼���')

commit;

SELECT 
       mem_name
  FROM
 WHERE ���̵� = ��
   AND  ��� = ��
   
--���̵�� ����� ��ġ�ϴ� ��쿡�� ��� ����� �� �� �ִ�.
--�����͸� �߰��� �� commit�� ���� ������ ���� DB table�� �ݿ����� ����
--�ڽ� ������ �ٶ� ���� ����� �ִ� �� ó�� ���������� �ܺο��� �����ϸ� �� �� �ִ�.

   
SELECT 
       mem_name
  FROM member
 WHERE mem_id =: mid
   AND mem_pw =: mpw
   
