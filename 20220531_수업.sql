SELECT 
       deptno
  FROM emp
GROUP BY deptno

SELECT 
       deptno, SUM(sal)
  FROM emp
GROUP BY deptno

�׷��Լ��� GROUP BY�� �Բ� ��� ������
�׷��Լ��� ��ü���� ó���̴�.

SELECT 
       deptno, SUM(sal), AVG(sal)
  FROM emp
GROUP BY deptno

SELECT 
       deptno, SUM(sal), AVG(sal)
  FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000

SELECT DECODE(1,2,'��','����')
  FROM dual
  
SELECT DECODE(1,1,'��','����')
  FROM dual


SELECT DECODE(2,5,'A',2,'B',3,'C','D')
  FROM dual

IF 2 = 5 THEN 
    return 'A';
ELSIF 2 = 2 THEN
    return 'B';
ELSIF 2 = 3 THEN
    return 'C';
ELSE 
    return 'D';
END IF;

