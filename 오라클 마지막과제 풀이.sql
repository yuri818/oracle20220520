SELECT * FROM t_orderbasket

�������̺� Ȱ��

SELECT rownum rno FROM dept
 WHERE rownum < 3
 
īŸ�þȰ�

SELECT rownum rno FROM dept
 WHERE rownum < 4

SELECT
       *
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc) as "��ǰ����"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')
        ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc)

---------------------------------------------------------    
SELECT deptno, count(empno)
  FROM emp
GROUP BY deptno

SELECT deptno, empno
  FROM emp
GROUP BY deptno

SELECT deptno, max(empno)
  FROM emp
GROUP BY deptno

SELECT deptno, empno
  FROM emp
GROUP BY deptno, empno
--------------------------------------

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc) as "��ǰ����"
      ,SUM(a.qty_nu)||'��' as "�ǸŰ���"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')
        ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc)

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc) as "��ǰ����"
      ,SUM(a.qty_nu)||'��' as "�ǸŰ���"
      ,SUM(a.qty_nu*a.price_nu)||'��' as "�ǸŰ���"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')
        ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc)
        
SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc) as "��ǰ����"
      ,SUM(a.qty_nu)||'��' as "�ǸŰ���"
      ,SUM(a.qty_nu*a.price_nu)||'��' as "�ǸŰ���"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')
        ,DECODE(b.rno,3,a.gubun_vc||'��',1,a.gubun_vc)
ORDER BY "�Ǹų�¥"        

--------------------------------------------------------------

SELECT
       a.emp_id as "���", a.emp_name as "����"
      ,b.dept_code, B.DEPT_NAME
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code

SELECT
       a.emp_id as "���", a.emp_name as "����"
      ,b.dept_code, B.DEPT_NAME
      ,c.dept_code as "�����μ��ڵ�"
      ,c.dept_name as "�����μ���"
  FROM temp a, tdept b , tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c.dept_code

SELECT
       a.emp_id as "���", a.emp_name as "����"
      ,b.dept_code, B.DEPT_NAME
      ,c.dept_code as "�����μ��ڵ�"
      ,c.dept_name as "�����μ���"
  FROM temp a, tdept b , tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c.dept_code
   AND c.dept_code = 'CA0001'

SELECT
       a.emp_id as "���", a.emp_name as "����"
      ,b.dept_code, B.DEPT_NAME
      ,c.dept_code as "�����μ��ڵ�"
      ,c.dept_name as "�����μ���"
      ,c.boss_id as "�μ�����̵�"
      ,d.emp_name as"�μ��强��"
  FROM temp a, tdept b , tdept c, temp d
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c.dept_code
   AND c.dept_code = 'CA0001'
   AND c.boss_id = d.emp_id

