SELECT emp.ename, emp.deptno
  FROM dept, emp
 WHERE dept.deptno = emp.deptno(+)
 
SELECT ename, emp.deptno
  FROM dept LEFT OUTER JOIN emp
    ON dept.deptno = emp.deptno