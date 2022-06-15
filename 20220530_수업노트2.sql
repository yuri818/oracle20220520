--pk�� �ε����� �����ϱ� ���ĵǾ��ִ°�
SELECT empno FROM emp

SELECT empno FROM emp
 WHERE empno = 7566
 
�Լ��� ����ϴ��� �ε��� ����ؼ� �� �˷���
 
SELECT empno FROM emp
 WHERE NVL(empno,0) = 7566


--pk�� �ƴϹǷ� ���ĵǾ����� �ʴ�.
SELECT ename FROM emp
ORDER BY ename desc

SELECT /*+index_desc(emp PK_EMP) */ empno
  FROM emp

/* */�̰Ŵ� �ּ��� �ƴ϶� ��Ʈ���̶� ��Ƽ���������� �˷��ִ°�.
�ε����� ������ ���ĵǾ� 2������(order by)�� �ʿ����.

create index i_ename
on emp(ename)

������� �Ϲ� (PK�� �ƴ� �ε���) �ε����� ������ ���Ǵ°� �ƴ϶�
��û�� �����̶� �־�� �ε����� ���ȴ�.

�÷��� �����ϸ� NVL�Լ�(null ���� ����Ȯ��)�� ����ϸ� �ε��� ����� �� ����.

--�ε����� �ִ� �÷��̶� �����ϸ� �ε����� ����� �� ����.

SELECT ename FROM emp

SELECT ename FROM emp
 WHERE ename = 'XXX'
 
SELECT ename FROM emp
 WHERE NVL(ename,'0') = 'XXX'

SELECT empno FROM emp

SELECT ename, deptno
  FROM emp

group by ���� ����� �÷��� ��밡���ϴ�.

SELECT ename, deptno
  FROM emp
GROUP BY deptno

--������ Ʋ�����ʾ����� ���� ���ϴ°� �ƴ�
SELECT ename, deptno
  FROM emp
GROUP BY deptno,ename

SELECT count(ename), deptno
  FROM emp
GROUP BY deptno

SELECT * FROM dept

--56�� - �Ͼ �� �ִ� ��� ����� ���̴�. - īŸ�þ��� ��

SELECT
       emp.ename, dept.deptno
  FROM emp, dept
  
National JOIN = equal join
���ʿ� �ִ°͸� ���´�.

SELECT
       emp.ename, dept.deptno
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
 
SELECT
       emp.ename, dept.deptno
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno
  
SELECT
       COUNT(emp.ename), dept.deptno
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno
GROUP BY dept.deptno

��������, �ζ��κ信 ���� ���� ����� ��.

����(emp[10,20,30], dept[10,20,30,40]) ���̺� �ִ� ���� �ƴ�
���� ���̺�(dept)���� �ְ� �ٸ� ����(emp)���� ���� ��(40)�� ����� ��
��(emp)�� null�� �ϴ��� ��(dept)�� ������ �����ٷ�

--����  
SELECT
       COUNT(emp.ename), dept.deptno, dept.dname
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno
GROUP BY dept.deptno, dept.dname

--����
SELECT
       COUNT(emp.ename), dept.deptno, dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno(+)
GROUP BY dept.deptno, dept.dname

���� �𸥴� �ݾ�.
�𸣴°� �� ���� �ֳ�?

ename�� not null
pk not null unique unique index

SELECT COUNT(ename), COUNT(comm), COUNT(*)
  FROM emp

�� comm�� null�� �ִ� �ɱ�? - ���谡 �߸���

SELECT COUNT(ename), COUNT(NVL(comm,0)), COUNT(*)
  FROM emp

���ΰ� ���� ���� �ʴ´�.
���� ���� ���� ������� �ʴ´�.

SELECT sum(comm) FROM emp


SELECT distinct(deptno) FROM emp

--�̰� �ߺ��� ����Ѱ�.
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept

--�̰� �ߺ��� ������ ��.
SELECT deptno FROM emp
UNION
SELECT deptno FROM dept
