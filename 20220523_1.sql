SELECT 1+5, 6-2, 2*3, 10/2 FROM dual

����

SELECT count(empno) FROM emp

SELECT count(empno) 
  FROM (SELECT empno FROM emp WHERE sal >= 2000) -�ζ��κ� - ���� -������
  
  
SELECT empno FROM emp WHERE sal >= 2000

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual
UNION ALL
SELECT 3 FROM dual


SELECT deptno FROM emp
MINUS
SELECT deptno FROM dept


SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp


SELECT deptno FROM dept
INTERSECT
SELECT deptno FROM emp


DELETE FROM dept