����
temp���� ���, ����, �μ��ڵ带 �о�µ� �μ���Ī�� �Բ� ���� ����
��쿡 �����?

SELECT * FROM temp

SELECT * FROM tdept

SELECT  a.emp_id as "���"
       ,a.emp_name as "����"
       ,b.dept_code as "�μ��ڵ�"
       ,b.dept_name as "�μ���Ī"
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code
 
--����� Ǯ��--index�д���Ȯ�ο�.

SELECT a.deptno
  FROM emp a, dept b
  
SELECT NVL(a.deptno,0)
  FROM emp a, dept b
  
SELECT a.deptno
  FROM emp a, dept b
 WHERE a.deptno = 10
 
SELECT a.deptno
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10

SELECT a.deptno, a.ename
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10

SELECT a.ename
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10

SELECT a.ename
  FROM emp a, dept b
 WHERE comm is not null


SELECT a.emp_id, a.emp_name
     , b.dept_code
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code
 
SELECT a.emp_id, a.emp_name
     , b.dept_code
  FROM temp a JOIN tdept b
    ON a.dept_code = b.dept_code

SELECT emp_id, emp_name
     , dept_code, dept_name
  FROM temp NATURAL JOIN tdept

Inner JOIN �� JOIN������ �����ϴ� �ุ ������ ����� �����ɴϴ�.

SELECT a.emp_id, a.emp_name
     , b.dept_code , b.dept_name
  FROM temp a INNER JOIN tdept b
    ON a.dept_code = b.dept_code

��������
tcom�� work_year�� 2001�� �ڷ�� temp�� ������� �����ؼ� ������ ��
comm�� �޴� ������ ����, salary+comm�� ��ȸ�ϴ� sql���� �ۼ��Ͻÿ�.

SELECT * FROM temp

SELECT 
       *
  FROM tcom a, temp b
 WHERE a.emp_id = b.emp_id
 
SELECT b.emp_id as "���"
      ,b.emp_name as "����"
      ,b.salary+a.comm
  FROM tcom a, temp b
 WHERE a.emp_id = b.emp_id
   AND a.work_year = '2001'
------------------------------------------
non_equal ����
: ���� ������ =�� �ƴ� �ٸ� �����ȣ�� �־����� ���

temp�� emp_level�� �̿��� emp_level�� ���� ������
���� ����/���� ���� ���� ��� ������ ����� ����, ����, salary��
�о���� sql���� �ۼ��Ͻÿ�.

WHERE temp.salary BETWEEN from_sal AND to_sal
AND lev = '����' 


SELECT * FROM temp

SELECT * FROM emp_level

SELECT a.emp_id as "���"
      ,a.emp_name as "����"
      ,a.lev as "����"
      ,a.salary
  FROM temp a, emp_level b
 WHERE a.salary BETWEEN b.from_sal AND b.to_sal

--����--
SELECT a.emp_id as "���"
      ,a.emp_name as "����"
      ,a.lev as "����"
      ,a.salary
  FROM temp a, emp_level b
 WHERE b.lev = '����'
   AND a.salary BETWEEN b.from_sal AND b.to_sal
------------------------------------------------------

outer join

�� ����� ����, salary, �������ѱݾ�, �������ѱݾ��� ������ �Ѵ�.
temp�� emp_level�� �����Ͽ� ����� �����ֵ�
������ �������� ��ϵǾ� ���� ���� ��������� ����, salary������
�̶� ���� �� �ֵ��� �������� �ۼ��Ͻÿ�.

��Ʈ: select �÷�1, �÷�2,... from ���̺�1, ���̺�2
 where ���̺�1.�÷� = ���̺�2.�÷�(+)

�̰�� ������ �Ǵ� ���̺��� ���̺� 1�̴�.
���յ� �÷����� ���̺�2�� ������ ���̺� 1�� ������
���̺�2�� ������ ���̺� 1�� ��ġ�Ǵ� ���� ���� ���� ��� null��
���ϵȴ�.

SELECT A.EMP_ID as "���"
      ,a.emp_name as "����"
      ,a.salary
      ,B.FROM_SAL as "�������ѱݾ�"
      ,b.to_sal as "�������ѱݾ�"
  FROM temp a, emp_level b
 WHERE a.lev = b.lev(+)
--�̰� ����   
SELECT A.EMP_ID as "���"
      ,a.emp_name as "����"
      ,a.salary
      ,B.FROM_SAL as "�������ѱݾ�"
      ,b.to_sal as "�������ѱݾ�"
  FROM temp a LEFT OUTER JOIN emp_level b
    ON a.lev = b.lev
--�̰� ���� �ƴ�
SELECT A.EMP_ID as "���"
      ,a.emp_name as "����"
      ,a.salary
      ,B.FROM_SAL as "�������ѱݾ�"
      ,b.to_sal as "�������ѱݾ�"
  FROM temp a RIGHT OUTER JOIN emp_level b
    ON a.lev = b.lev
 
tdept ���̺� �ڽ��� ���� �μ������� �����ϰ� �ִ�
�� ���̺��� �̿��Ͽ� �μ��ڵ�, �μ���, �����μ��ڵ�, �����μ�����
�о���� ������ �ۼ��Ͻÿ�.

SELECT * FROM tdept

SELECT a.dept_code as "�μ��ڵ�"
      ,a.dept_name as "�μ���"
      ,a.parent_dept as "�����μ��ڵ�"
      ,b.dept_name as "�����μ���"
  FROM tdept a, tdept b
 WHERE a.parent_dept = b.dept_code


��������
temp�� tdept�� �̿��Ͽ� ���� �÷��� �����ִ� SQL�� ����� ����.
�����μ��� 'CA0001'�� �μ��� �Ҽӵ� ������ 1.���, 2.����, 3.�μ��ڵ�
4.�μ���, 5.�����μ��ڵ�, 6.�����μ���, 7.�����μ����ڵ�, 8.�����μ��强��
������ �����ָ� �ȴ�.

SELECT * FROM temp

SELECT * FROM tdept

SELECT a.emp_id as "���"
      ,a.emp_name as "����"
      ,b.DEPT_CODE as "�μ��ڵ�"
      ,b.dept_name as "�μ���" 
      ,b.parent_dept as "�����μ��ڵ�"
      ,c.dept_name as "�����μ���"
      ,d.emp_id as "�����μ����ڵ�"
      ,d.emp_name as "�����μ��强��"
  FROM temp a, tdept b, tdept c, temp d
 WHERE b.parent_dept = 'CA0001'
   AND b.parent_dept = c.dept_code
   AND a.dept_code = b.dept_code
   AND c.boss_id = d.emp_id

--�̰� �� �� ���� ����
SELECT a.emp_id as "���"
      ,a.emp_name as "����"
      ,b.DEPT_CODE as "�μ��ڵ�"
      ,b.dept_name as "�μ���" 
      ,c.dept_code as "�����μ��ڵ�"
      ,c.dept_name as "�����μ���"
      ,d.emp_id as "�����μ����ڵ�"
      ,d.emp_name as "�����μ��强��"
  FROM temp a, tdept b, tdept c, temp d
 WHERE b.parent_dept = 'CA0001'
   AND b.parent_dept = c.dept_code
   AND a.dept_code = b.dept_code
   AND c.boss_id = d.emp_id
