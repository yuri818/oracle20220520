����1.�μ� �� ��� ������ 2,800,000�� �ʰ��ϴ� �μ��� ��ȸ�� ���̴�.

SELECT DEPT, SUM(SALARY) �հ�, FLOOR(AVG(SALARY)) ���, COUNT(*) �ο���

FROM EMP

WHERE SALARY > 2800000

GROUP BY DEPT

ORDER BY DEPT ASC;


����2. ROWNUM�� �̿��ؼ� ������ ���� ���� 3���� �������� �Ͽ�����,
     �ùٸ� ����� ��ȸ ���� �ʾҴ�.


SELECT ROWNUM, EMPNAME, SAL

FROM EMP

WHERE ROWNUM <= 3

ORDER BY SAL DESC;
------------------------------------------------------------

1. DBMS���� ����ϴ� DDL �� ALTER ���� ���� �����Ͻÿ�.

ALTER TABLE SCOTT.MEMBER
 ADD (mem_address VARCHAR2(100));

SELECT *
  FROM emp
 WHERE empno = '7499'

SELECT *
  FROM emp
 WHERE empno = TO_NUMBER('7499')

ClassCastException

4.���ڿ� ������ '20/10/13' �� '2020-10-13' �� ǥ���� �� �ֵ���
  ����ȯ �Լ����� ����Ͽ� SELECT ������ �ۼ��Ͻÿ�.

SELECT to_char('20/10/13')
      ,to_date('20/10/13')+1
      ,to_char(to_date('20/10/13'), 'YYYY-MM-DD')
  FROM dual

5.���ڿ� ������ '190505' �� '2019�� 5�� 5��' �� ǥ���� �� �ֵ���
  ����ȯ �Լ����� ����Ͽ� SELECT ������ �ۼ��Ͻÿ�. 

SELECT to_char(to_date('20/10/13'), 'YYYY��MM��DD��')
  FROM dual

SELECT to_char(to_date('190505'),'YYYY')||'��'
     ||to_char(to_date('190505'),'MM')||'��'
     ||to_char(to_date('190505'),'DD')||'��'
  FROM dual

SELECT to_char(to_date('190505'), 'YYYY"��"MM"��"DD"��"')
  FROM dual

6.

SELECT trim(' ABC D   ')
      ,trim(' ABC D   ')||'AAA'
  FROM dual

7.

SELECT concat(concat(concat(empno,','),concat(ename,',')),deptno)
  FROM emp

