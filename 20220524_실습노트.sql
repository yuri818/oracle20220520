SELECT * FROM t_worktime

SELECT pint_nu
      ,rank() over(order by point_nu)
 FROM t_worktime


SELECT workcd_vc, time_nu FROM t_worktime


SELECT workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc

SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc

SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime

SELECT rownum rnk, time_nu
  FROM (
        SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime
        ORDER BY time_nu asc
       )
       
       
SELECT ename, deptno
  FROM emp

SELECT dname FROM dept

SELECT a.time_nu, b.time_nu FROM t_worktime a, t_worktime b

SELECT rownum rno, ename FROM emp
WHERE rownum < 4

SELECT time_nu FROM t_worktime
WHERE rownum < 4

SELECT
       a.time_nu
  FROM(
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )a,
      (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )b


SELECT
       a.time_nu
  FROM(
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )a,
      (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )b
 WHERE a.time_nu < b.time_nu


SELECT
       a.time_nu
  FROM(
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )a,
      (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )b
 WHERE a.time_nu <= b.time_nu
 
 
SELECT
       a.time_nu, b.time_nu
  FROM(
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )a,
      (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )b
 WHERE a.time_nu <= b.time_nu
 
�񱳸� ũ�ų� �����ɷ� �����ϱ� ������ a�̴�. �׷��� a�� ������ b�� ������?
->b�� �����Ѵ�.

������տ��� deptno�� fk�̰� ������տ��� pk�� �����ȣ�� �¾ƿ�
�μ����տ��� deptno�� pk�̴�.
�μ����տ� deptno�� �޾Ƽ� �¾ �ڼ��� ��������̰�
���� �θ��� deptno�� �ڼ����� ���� �ܷ�Ű�� �Ǿ���.

SELECT deptno FROM emp, dept

--emp ���տ����� deptno�� fk�̴�.
--a.deptno�� ���̺� �����ϰ� b�� �ƴ϶� a�� �ӵ��� �� ������.

SELECT a.deptno FROM emp a, dept b

SELECT b.deptno FROM emp a, dept b

SELECT empno FROM emp

SELECT
       a.time_nu, count(b.time_nu)
  FROM(
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )a,
      (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
      )b
 WHERE a.time_nu <= b.time_nu
GROUP BY a.time_nu
ORDER BY count(b.time_nu) asc


group by��

�츮 ȸ�翡 �ٹ��ϴ� ����鿡 ���ؼ� �μ��� ������� ����ϰ� �ʹ�. 
�����?

������� - FK - deptno

FK�� �ߺ��� ����ȴ�.
�ε����� �������� �ʴ´�.
FK�� �����̼��̴�. (1:n ��������)

SELECT empno
  FROM emp
GROUP BY dname

SELECT empno
  FROM emp
GROUP BY deptno

SELECT deptno
  FROM emp
GROUP BY deptno

SELECT empno
  FROM emp
GROUP BY empno --�ߺ��� �ȵǹǷ� GROUP BY�� �ǹ̾���.

SELECT COUNT(empno)
  FROM emp
GROUP BY deptno

SELECT deptno, COUNT(empno)
  FROM emp
GROUP BY deptno

�׷��Լ� - avg, count, max, min, sum

���̺� ��ü �����Ϳ��� ������� ����� ��� ���ؼ� �� ���տ�
�����Ͽ� �ϳ��� ����� ������.

�Ϲ� �÷��� �׷��Լ��� ���� �� �� �ֳ�?
����.
    
SELECT sum(sal) FROM emp

SELECT sum(sal), ename FROM emp

�������� ������ �ذ������� �ǹ̰� ����. (�������谡 ����)

SELECT sum(sal), max(ename) FROM emp

SELECT sum(sal) FROM emp
GROUP BY deptno

SELECT sum(sal) FROM emp

group by�� ����� �÷����� select������
������� �� �ǹ̰� �ִ�. �������� �ִ�.

SELECT sum(sal), deptno FROM emp
GROUP BY deptno

SELECT max(sal), avg(sal), deptno FROM emp
GROUP BY deptno



�׷��ٸ� �ذ� ����� �ֳ���?    
�ϳ�. �Ϲ� �÷��� �׷��Լ��� �����.
��. group by���� �߰��ؼ� �Ϲ� �÷����� ���´�.


