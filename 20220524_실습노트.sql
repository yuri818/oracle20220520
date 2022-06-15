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
 
비교를 크거나 같은걸로 했으니까 기준은 a이다. 그래서 a를 세야해 b를 세야해?
->b를 세야한다.

사원집합에서 deptno는 fk이고 사원집합에서 pk는 사원번호가 맞아요
부서집합에서 deptno는 pk이다.
부서집합에 deptno를 받아서 태어난 자손이 사원집합이고
따라서 부모의 deptno가 자손으로 가서 외래키가 되었다.

SELECT deptno FROM emp, dept

--emp 집합에서는 deptno가 fk이다.
--a.deptno는 테이블에 접근하고 b는 아니라서 a의 속도가 더 느리다.

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


group by절

우리 회사에 근무하는 사원들에 대해서 부서별 사원수를 출력하고 싶다. 
어떡하지?

사원집합 - FK - deptno

FK는 중복이 허락된다.
인덱스를 제공하지 않는다.
FK는 릴레이션이다. (1:n 관계형태)

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
GROUP BY empno --중복이 안되므로 GROUP BY가 의미없다.

SELECT COUNT(empno)
  FROM emp
GROUP BY deptno

SELECT deptno, COUNT(empno)
  FROM emp
GROUP BY deptno

그룹함수 - avg, count, max, min, sum

테이블 전체 데이터에서 통계적인 결과를 얻기 위해서 행 집합에
적용하여 하나의 결과를 생산함.

일반 컬럼과 그룹함수가 같이 올 수 있나?
없다.
    
SELECT sum(sal) FROM emp

SELECT sum(sal), ename FROM emp

문법적인 문제는 해결했지만 의미가 없다. (의존관계가 없음)

SELECT sum(sal), max(ename) FROM emp

SELECT sum(sal) FROM emp
GROUP BY deptno

SELECT sum(sal) FROM emp

group by에 사용한 컬럼명은 select다음에
사용했을 떄 의미가 있다. 의존관계 있다.

SELECT sum(sal), deptno FROM emp
GROUP BY deptno

SELECT max(sal), avg(sal), deptno FROM emp
GROUP BY deptno



그렇다면 해결 방법은 있나요?    
하나. 일반 컬럼도 그룹함수를 씌운다.
둘. group by절을 추가해서 일반 컬럼명을 적는다.


