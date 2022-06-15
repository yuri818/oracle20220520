--emp 와 dept 테이블 이용하기
--인라인뷰 사용하세요
--sum(decode.....패턴 사용하세요
--group by 사용하세요
--order by 사용하세요
--더미테이블 사용하세요

----------------낱말카드 제공-------------------------------
sum(decode(job,'SALESMAN',sal,null))

sum(decode(job,'CLERK',null,'SALESMAN',null,sal))

sum(sal)

SELECT rownum rno
  FROM dept
 WHERE rownum < 3

GROUP BY decode(b.no, 1, dname)

WHERE a.deptno = b.deptno
---------------------------------------------------------

SELECT * FROM emp

SELECT * FROM dept

SELECT deptno
  FROM emp
GROUP BY deptno

SELECT dept.deptno, dname FROM emp, dept

SELECT dept.deptno, dname FROM emp, dept
 WHERE dept.deptno = emp.deptno

--dname 출력하는 select문 
SELECT dept.deptno, dname FROM emp, dept
 WHERE dept.deptno = emp.deptno
GROUP BY dept.deptno , dname

SELECT dept.deptno, dname FROM emp, dept
 WHERE dept.deptno = emp.deptno
GROUP BY dept.deptno , dname


--clerk가 직업인 사람
SELECT SUM(DECODE(job,'CLERK',sal,null))
  FROM emp
  
SELECT SUM(DECODE(job,'CLERK',null,'MANAGER',sal))
  FROM emp


SELECT SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal))
  FROM emp

--직업별 급여 총합
SELECT SUM(DECODE(job,'CLERK',sal,null)) clerk
      ,SUM(DECODE(job,'CLERK',null,'MANAGER',sal)) manager
      ,SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal)) etc
  FROM emp
  
  
SELECT b.dname, a.clerk, a.manager, a.etc
  FROM (
        SELECT SUM(DECODE(job,'CLERK',sal,null)) clerk
              ,SUM(DECODE(job,'CLERK',null,'MANAGER',sal)) manager
              ,SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal)) etc
          FROM emp
       ) a, dept b

------------------------------------------------------------
---정답--

SELECT
       deptno
  FROM emp, dept

SELECT deptno FROM dept

SELECT deptno FROM emp

SELECT dept.deptno
  FROM emp, dept

SELECT dept.deptno, dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno

SELECT dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname

--이걸 쓰는것을 원하는게 아님
SELECT distinct(deptno) FROM emp

SELECT dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname
UNION ALL
SELECT '총계' FROM dual

SELECT dept.dname
      ,SUM(DECODE(job,'CLERK',sal)) clerk
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname

--이건 불친절 버전
SELECT deptno
      ,SUM(DECODE(job,'CLERK',sal)) clerk
      ,SUM(sal)
  FROM emp
GROUP BY deptno

SELECT deptno
      ,SUM(DECODE(job,'CLERK',sal)) clerk
      ,SUM(DECODE(job,'MANAGER',sal)) manager
      ,SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal)) etc
      ,SUM(sal)
  FROM emp
GROUP BY deptno


SELECT dept.dname
      ,SUM(DECODE(job,'CLERK',sal)) clerk
      ,SUM(DECODE(job,'MANAGER',sal)) manager
      ,SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal)) etc
      ,SUM(sal) dept_sal
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname

SELECT dept.dname
      ,SUM(DECODE(job,'CLERK',sal)) clerk
      ,SUM(DECODE(job,'MANAGER',sal)) manager
      ,SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal)) etc
      ,SUM(sal) dept_sal
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname

SELECT
       decode(b.rno,'1',a.dname, '총계') dname
  FROM (
        SELECT dept.dname
              ,SUM(DECODE(job,'CLERK',sal)) clerk
              ,SUM(DECODE(job,'MANAGER',sal)) manager
              ,SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal)) etc
              ,SUM(sal) dept_sal
          FROM emp, dept
         WHERE emp.deptno = dept.deptno
        GROUP BY dept.dname
       )a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       )b
GROUP BY decode(b.rno,'1',a.dname, '총계')
ORDER BY decode(b.rno,'1',a.dname, '총계')



SELECT
       decode(b.rno,'1',a.dname, '총계') dname
      ,SUM(a.clerk) clerk
      ,SUM(a.manager) manager
      ,SUM(a.etc) etc
      ,SUM(a.dept_sal) dept_sal
  FROM (
        SELECT dept.dname
              ,SUM(DECODE(job,'CLERK',sal)) clerk
              ,SUM(DECODE(job,'MANAGER',sal)) manager
              ,SUM(DECODE(job,'CLERK',null,'MANAGER',null,sal)) etc
              ,SUM(sal) dept_sal
          FROM emp, dept
         WHERE emp.deptno = dept.deptno
        GROUP BY dept.dname
       )a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       )b
GROUP BY decode(b.rno,'1',a.dname, '총계')
ORDER BY dname


