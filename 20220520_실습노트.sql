SELECT deptno, dname, loc FROM dept

SELECT empno, ename, job, mgr, hiredate, comm, sal, deptno FROM emp

--���̺� ����� ���� �����ϱ�
���Ἲ ��������(FK_DEPTNO) ������ ������ �Ұ��ϴ�.
������� ������ �Ұ��ϴ�. - �����͸� �����ϰ� ������ �� �ִ�.
�ε����� �����ȴ�.(����-�˻� �ӵ� �̳� ������.)
������ �ٴ��� �����ϱ� �Ҿ���� ���� ����.
�� ��Ʈ�� ���� �͵� ���� ����.

DELETE FROM dept

DELETE FROM emp

rollback

dept deptno pk�̰� - �⺻Ű
emp deptno fk�̴�. - �ܷ�Ű

SELECT �÷���1, �÷���2,.........
  FROM �����̸�
 WHERE �÷��� = ��
 
�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �̸���  SCOTT�̶�� ����� �ִ�?

SELECT empno
  FROM emp
 WHERE ename = 'SCOTT'
 
 SELECT 1 as "�����ϴ�(1: �ִ�, 0�̸� ����)"
  FROM emp
 WHERE ename = 'SCOTT'
 
 --count�� �޼ҵ�
 
 SELECT count(empno) 
  FROM emp
 WHERE ename = 'SCOTT'

 SELECT �Լ���(�÷���) 
  FROM emp
 WHERE ename = 'SCOTT'
 
 
�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �̸���  SCOTT�̶�� ����� �� ���̴�?

tomato���̵� �����ϴ�?

tomato���̵� �� �� �ִ�?
