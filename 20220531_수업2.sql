Decode�� �Ϲ����� ���α׷��� ����� IF���� SQL���� �Ǵ� PL/SQL
������ ����鿩 ����ϱ� ���Ͽ� ������� ����Ŭ �Լ��̴�.
���� �Ϲ����� ���α׷��� ����� IF���� ������ �� �ִ� �����
�����ϰ� �ִ�.
SELECT���� DECODE����� FROM ���� ����� ��𼭳� ����� �� �ִ�.
FROM���� ����� �� ���ٴ� ���� SELECT�� ���̺��� DECODE�� �̿��Ͽ�
�������� ������ �� ���ٴ� ���̱⵵ �ϴ�.
IF A = B THEN
    RETURN 'T';
END IF; 
 
A�÷��� B�÷��� ���ٸ� 'T'�� RETURN �ް� �ʹٴ� �����̴�.
DECODE�� �̿��ϸ� ������ ���� �ȴ�.
DECODE(A,B,'T')
SELECT������ �̿�ȴٸ� 
A�÷��� B�÷��� ���� Record�� 'T'���� �����޶�� �ǹ̰� �ȴ�.
SELECT DECODE(A,B,'T') AS col1
  FROM TABLE�̸�
 WHERE ...
 
�� ��� A�÷���  B�÷��� ���� �ٸ��ٸ� � ���� �����ڴ°�?
����� ��(NULL)�� ���´�.
�̿Ͱ��� �ܼ��񱳷� ���Ǵ� DECODE�� ���������� ELSE�� �����
������ ������ ELSE�� �ش�� ��� ��(NULL)�� �����Ѵ�.
�ٽ� ���ؼ� �� ������ ������ ���´� ������ ����.
SELECT DECODE(A,B,'T',NULL) AS col1
  FROM TABLE�̸�
 WHERE .... 
 
SELECT * FROM lecture
 
����:�ִ� ���� �ð��� ������ ������ '�Ϲ�'�� ���� ������ �Ѵ�
��� �ؾ� �ϴ°�?
  
���ǽð� - lec_time
���� - lec_point

--Ʋ������ �⺻���� null
SELECT lec_time, lec_point, DECODE(1,2,'�Ϲ�')
  FROM lecture

SELECT lec_time, lec_point, DECODE(lec_time,2,'�Ϲ�')
  FROM lecture

SELECT lec_time, lec_point, DECODE(lec_time,lec_point,'�Ϲݰ���','��Ÿ����') as "����Ӽ�"
  FROM lecture

����:�ִ簭�ǽð��� ������ ���� ������ ���ڸ� �˰� �ʹ�.
��� �ؾ� �ϴ°�?
  
SELECT lec_id, lec_time, lec_point
  FROM lecture
 WHERE lec_time = lec_point

SELECT 2 
  FROM lecture
 WHERE lec_time = lec_point
 
SELECT count(2)
  FROM lecture
 WHERE lec_time = lec_point

SELECT count('A')
  FROM lecture
 WHERE lec_time = lec_point
--�̰͵� ���������� decode�Ẹ��--
SELECT count(lec_id)
  FROM lecture
 WHERE lec_time = lec_point
 
SELECT DECODE(job,'CLERK',sal)
  FROM emp
 
SELECT SUM(DECODE(job,'CLERK',sal))
  FROM emp

SELECT DECODE(lec_time, lec_point, 'A'), DECODE(lec_time, lec_point, lec_id)
  FROM lecture

SELECT COUNT(DECODE(lec_time,lec_point,lec_point)) as "����"
  FROM lecture

SELECT COUNT(DECODE(lec_time,lec_point,'a'))
      ,COUNT(DECODE(lec_time, lec_point, lec_id))
      ,MAX(DECODE(lec_time, lec_point,lec_id))
  FROM lecture
 
����: ���� �ð��� ������ ������ '�Ϲ�'�� ���Ϲ��� �� ���ĵ�
�ϰ� ���� ��쿡�� ��� �ؾ� �ϴ°�?

SELECT 
       lec_id
  FROM lecture
  
SELECT 
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�',null)
  FROM lecture

SELECT 
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�',null)
  FROM lecture
ORDER BY DECODE(lec_time, lec_point, '�Ϲ�',null) asc

SELECT 
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�',null)
  FROM lecture
ORDER BY DECODE(lec_time, lec_point, '�Ϲ�',null) desc
 
�ִ� ���� �ð��� ������ ������ '�Ϲ�' �� '����'�� ���Ϲ��� �� 
���ĵ� �ϰ� ���� ��쿡�� ��� �ؾ��ϴ°�?

SELECT 
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�','����')
  FROM lecture
ORDER BY DECODE(lec_time, lec_point, '�Ϲ�','����') desc

����:���� �ð��� ������ �ٸ��� NULL�� ���ϵǴ� ��� 'Ư��'�̶��
���ϵǵ��� �Ϸ��� ��� �ؾ��ϴ°�?
  
SELECT 
       lec_id, DECODE(lec_time, lec_point, '�Ϲݰ���','Ư������')
  FROM lecture

�ϳ� �� Ǯ��

lec_time�� ũ�� �������, lec_point�� ũ�� ��Ÿ����, ���� ������ '�Ϲݰ���'���� ���� �ް����Ѵ�.
�����?

decode�� ũ�� �۴ٴ� ���� �� ����.
���� ���� �͸� ����

SELECT SIGN(5), SIGN(-600), SIGN(10-50), SIGN(10-10) FROM dual

�� ���� �� ���� ���� �����̸� �տ� ���ڰ� ũ��|�۴�

SELECT lec_id
      ,DECODE(SIGN(lec_time-lec_point),1,'�������',-1,'��Ÿ����',0,'�Ϲݰ���')
  FROM lecture






IF A = B THEN
    RETURN 'T';
ELSIF A = C THEN
    RETURN 'F';
ELSE
    RETURN 'X';
END IF;
DECODE(A, B, 'T', C, 'F', 'X')
A�� B�� ������ 'T'�� �����ް� C�� ������ 'F'�� �����ް�, �̵� 
���� �ƴϸ� 'X'�� ���� �ް��� �Ѵٴ� ���̴�.
�Ʒ��� ���� A=B ���� A=C����, A=D����, A=E ���� �ƴϸ� �� ����
��������� ���� ���� '1', '2', '3', '4', '5'�� RETURN �ϰ� �ϴ�
DECODE �����̴�.
DECODE(A, B, '1', C, '2', D, '3', E, '4', '5')
