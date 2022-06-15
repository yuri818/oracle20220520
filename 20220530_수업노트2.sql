--pk라서 인덱스가 있으니까 정렬되어있는것
SELECT empno FROM emp

SELECT empno FROM emp
 WHERE empno = 7566
 
함수를 사용하더라도 인덱스 사용해서 값 알려줌
 
SELECT empno FROM emp
 WHERE NVL(empno,0) = 7566


--pk가 아니므로 정렬되어있지 않다.
SELECT ename FROM emp
ORDER BY ename desc

SELECT /*+index_desc(emp PK_EMP) */ empno
  FROM emp

/* */이거는 주석이 아니라 힌트문이라서 옵티마이저에게 알려주는것.
인덱스를 가지면 정렬되어 2차가공(order by)이 필요없다.

create index i_ename
on emp(ename)

만들어진 일반 (PK가 아닌 인덱스) 인덱스는 무조건 사용되는게 아니라
멍청한 조건이라도 있어야 인덱스가 사용된다.

컬럼을 가공하면 NVL함수(null 값의 유무확인)를 사용하면 인덱스 사용할 수 없다.

--인덱스가 있는 컬럼이라도 가공하면 인덱스를 사용할 수 없다.

SELECT ename FROM emp

SELECT ename FROM emp
 WHERE ename = 'XXX'
 
SELECT ename FROM emp
 WHERE NVL(ename,'0') = 'XXX'

SELECT empno FROM emp

SELECT ename, deptno
  FROM emp

group by 절에 사용한 컬럼만 사용가능하다.

SELECT ename, deptno
  FROM emp
GROUP BY deptno

--문법은 틀리지않았지만 내가 원하는게 아님
SELECT ename, deptno
  FROM emp
GROUP BY deptno,ename

SELECT count(ename), deptno
  FROM emp
GROUP BY deptno

SELECT * FROM dept

--56건 - 일어날 수 있는 모든 경우의 수이다. - 카타시안의 곱

SELECT
       emp.ename, dept.deptno
  FROM emp, dept
  
National JOIN = equal join
양쪽에 있는것만 나온다.

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

서브쿼리, 인라인뷰에 대해 내일 얘기할 것.

양쪽(emp[10,20,30], dept[10,20,30,40]) 테이블에 있는 것이 아닌
한쪽 테이블(dept)에만 있고 다른 한쪽(emp)에는 없는 것(40)을 출력할 때
나(emp)는 null로 하더라도 너(dept)는 있으면 보여줄래

--정답  
SELECT
       COUNT(emp.ename), dept.deptno, dept.dname
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno
GROUP BY dept.deptno, dept.dname

--오답
SELECT
       COUNT(emp.ename), dept.deptno, dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno(+)
GROUP BY dept.deptno, dept.dname

널은 모른다 잖아.
모르는걸 셀 수가 있나?

ename은 not null
pk not null unique unique index

SELECT COUNT(ename), COUNT(comm), COUNT(*)
  FROM emp

왜 comm에 null이 있는 걸까? - 설계가 잘못됨

SELECT COUNT(ename), COUNT(NVL(comm,0)), COUNT(*)
  FROM emp

널인건 굳이 세지 않는다.
널인 경으 굳이 계산하지 않는다.

SELECT sum(comm) FROM emp


SELECT distinct(deptno) FROM emp

--이건 중복을 허용한것.
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept

--이건 중복을 제거한 것.
SELECT deptno FROM emp
UNION
SELECT deptno FROM dept
