��������) �����Ͽ� �ش����ڿ� 01�� �ٿ��� 4�ڸ� ��ȣ�� �����, ȭ���Ͽ� 11, �����Ͽ� 21,
����Ͽ� 31, �ݿ��Ͽ� 41, ����Ͽ� 51, �Ͽ��Ͽ� 61�� �ٿ��� 4�ڸ� ��ȣ�� ����ٰ� �� ��,
��ȣ�� SELECT�ϴ� sql�� �����ÿ�.
--��Ʈ
SELECT to_char(sysdate, 'DD')
      ,to_char(sysdate, 'MM')
      ,to_char(sysdate, 'DAY')
  FROM dual

SELECT '31' || '11' FROM dual

SELECT DECODE(to_char(sysdate,'DAY'),'������',to_char(sysdate, 'DD')||'01'
             ,'ȭ����', to_char(sysdate,'DD')||'11'
             ,'������', to_char(sysdate,'DD')||'21'
             ,'�����', to_char(sysdate,'DD')||'31'
             ,'�ݿ���', to_char(sysdate,'DD')||'41'
             ,'�����', to_char(sysdate,'DD')||'51'
             ,'�Ͽ���', to_char(sysdate,'DD')||'61')
 FROM dual

SELECT DECODE(to_char(sysdate,'DAY'),'������',to_char(sysdate,'DD')||'01'
                                    ,'ȭ����',to_char(sysdate,'DD')||'11'
                                    ,'������',to_char(sysdate,'DD')||'21'
                                    ,'�����',to_char(sysdate,'DD')||'31'
                                    ,'�ݿ���',to_char(sysdate,'DD')||'41'
                                    ,'�����',to_char(sysdate,'DD')||'51'
                                    ,'�Ͽ���',to_char(sysdate,'DD')||'61') ��ȣ 
 FROM dual
 
SELECT to_char(sysdate,'DD')||
DECODE(to_char(sysdate,'day'),'������','01'
                             ,'ȭ����','11'
                             ,'������','21'
                             ,'�����','31'
                             ,'�ݿ���','41'
                             ,'�����','51'
                             ,'�Ͽ���','61')
  FROM dual
  
��������
��� ���̺��� job �� 'CLERK'�� ����� �޿���, 'SALESMAN'�� ����� 
�޿��� ���� ���ϰ� ������ job�� ���ؼ��� ��Ÿ�� ������ ���Ͻÿ�.

SELECT * FROM emp

SELECT DECODE(job,'CLERK',sal,'SALESMAN',sal,sal)
  FROM emp

SELECT SUM(DECODE(job,'CLERK',sal,'SALESMAN',sal,sal))
  FROM emp

SELECT SUM(DECODE(job,'CLERK',sal)) clerk
      ,SUM(DECODE(job,'SALESMAN',sal)) salesman
      ,SUM(DECODE(job,'CLERK',null,'SALESMAN',null,sal)) ��Ÿ
  FROM emp


SELECT * FROM member

�α����� ����
�ƴ� 
ȸ�������� ���� �ΰ���?

ȸ�����Խ� ���̵� �ߺ��˻� �������� �ۼ��� ����.

SELECT mem_name
  FROM member
 WHERE mem_id =:x
   AND mem_pw =:y
   
SELECT COUNT(mem_id)
  FROM member
 WHERE mem_id =:x
 
SELECT 1 FROM member
WHERE mem_id='apple'

���������� where�� �Ʒ� select���� ���Ѵ�.

SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple')

SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple5')

SELECT NVL(hobby,'����') FROM temp

SELECT NVL((
            SELECT 1
              FROM dual
             WHERE EXISTS (SELECT mem_name
                             FROM member
                            WHERE mem_id='apple6')
            ),0)
  FROM dual


�ζ��κ�� from�� �Ʒ� select���� ����.



