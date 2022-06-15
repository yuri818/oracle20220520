문제
temp에서 사번, 성명, 부서코드를 읽어내는데 부서명칭을 함께 보고 싶은
경우에 어떡하지?

SELECT * FROM temp

SELECT * FROM tdept

SELECT  a.emp_id as "사번"
       ,a.emp_name as "성명"
       ,b.dept_code as "부서코드"
       ,b.dept_name as "부서명칭"
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code
 
--강사님 풀이--index읽는지확인용.

SELECT a.deptno
  FROM emp a, dept b
  
SELECT NVL(a.deptno,0)
  FROM emp a, dept b
  
SELECT a.deptno
  FROM emp a, dept b
 WHERE a.deptno = 10
 
SELECT a.deptno
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10

SELECT a.deptno, a.ename
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10

SELECT a.ename
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10

SELECT a.ename
  FROM emp a, dept b
 WHERE comm is not null


SELECT a.emp_id, a.emp_name
     , b.dept_code
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code
 
SELECT a.emp_id, a.emp_name
     , b.dept_code
  FROM temp a JOIN tdept b
    ON a.dept_code = b.dept_code

SELECT emp_id, emp_name
     , dept_code, dept_name
  FROM temp NATURAL JOIN tdept

Inner JOIN 은 JOIN조건을 만족하는 행만 질의의 결과로 가져옵니다.

SELECT a.emp_id, a.emp_name
     , b.dept_code , b.dept_name
  FROM temp a INNER JOIN tdept b
    ON a.dept_code = b.dept_code

연습문제
tcom의 work_year가 2001인 자료와 temp를 사번으로 연결해서 조인한 후
comm을 받는 직원의 성명, salary+comm을 조회하는 sql문을 작성하시오.

SELECT * FROM temp

SELECT 
       *
  FROM tcom a, temp b
 WHERE a.emp_id = b.emp_id
 
SELECT b.emp_id as "사번"
      ,b.emp_name as "성명"
      ,b.salary+a.comm
  FROM tcom a, temp b
 WHERE a.emp_id = b.emp_id
   AND a.work_year = '2001'
------------------------------------------
non_equal 조인
: 조인 조건이 =이 아닌 다른 연산기호로 주어지는 경우

temp와 emp_level을 이용해 emp_level의 과장 직급의
연봉 상한/하한 범위 내에 드는 직원의 사번과 성명, 직급, salary를
읽어오는 sql문을 작성하시오.

WHERE temp.salary BETWEEN from_sal AND to_sal
AND lev = '과장' 


SELECT * FROM temp

SELECT * FROM emp_level

SELECT a.emp_id as "사번"
      ,a.emp_name as "성명"
      ,a.lev as "직급"
      ,a.salary
  FROM temp a, emp_level b
 WHERE a.salary BETWEEN b.from_sal AND b.to_sal

--정답--
SELECT a.emp_id as "사번"
      ,a.emp_name as "성명"
      ,a.lev as "직급"
      ,a.salary
  FROM temp a, emp_level b
 WHERE b.lev = '과장'
   AND a.salary BETWEEN b.from_sal AND b.to_sal
------------------------------------------------------

outer join

각 사번의 성명, salary, 연봉하한금액, 연봉상한금액을 보고자 한다.
temp와 emp_level을 조인하여 결과를 보여주되
연봉의 상하한이 등록되어 있지 않은 수습사원은 성명, salary까지만
이라도 나올 수 있도록 쿼리문을 작성하시오.

힌트: select 컬럼1, 컬럼2,... from 테이블1, 테이블2
 where 테이블1.컬럼 = 테이블2.컬럼(+)

이경우 기준이 되는 테이블은 테이블 1이다.
결합된 컬럼값이 테이블2에 없더라도 테이블 1에 있으면
테이블2의 값들중 테이블 1과 일치되는 값이 없는 행은 모두 null로
리턴된다.

SELECT A.EMP_ID as "사번"
      ,a.emp_name as "성명"
      ,a.salary
      ,B.FROM_SAL as "연봉하한금액"
      ,b.to_sal as "연봉상한금액"
  FROM temp a, emp_level b
 WHERE a.lev = b.lev(+)
--이게 정답   
SELECT A.EMP_ID as "사번"
      ,a.emp_name as "성명"
      ,a.salary
      ,B.FROM_SAL as "연봉하한금액"
      ,b.to_sal as "연봉상한금액"
  FROM temp a LEFT OUTER JOIN emp_level b
    ON a.lev = b.lev
--이건 정답 아님
SELECT A.EMP_ID as "사번"
      ,a.emp_name as "성명"
      ,a.salary
      ,B.FROM_SAL as "연봉하한금액"
      ,b.to_sal as "연봉상한금액"
  FROM temp a RIGHT OUTER JOIN emp_level b
    ON a.lev = b.lev
 
tdept 테이블에 자신의 상위 부서정보를 관리하고 있다
이 테이블을 이용하여 부서코드, 부서명, 상위부서코드, 상위부서명을
읽어오는 쿼리를 작성하시오.

SELECT * FROM tdept

SELECT a.dept_code as "부서코드"
      ,a.dept_name as "부서명"
      ,a.parent_dept as "상위부서코드"
      ,b.dept_name as "상위부서명"
  FROM tdept a, tdept b
 WHERE a.parent_dept = b.dept_code


도전문제
temp와 tdept를 이용하여 다음 컬럼을 보여주는 SQL을 만들어 보자.
상위부서가 'CA0001'인 부서에 소속된 직원을 1.사번, 2.성명, 3.부서코드
4.부서명, 5.상위부서코드, 6.상위부서명, 7.상위부서장코드, 8.상위부서장성명
순서로 보여주면 된다.

SELECT * FROM temp

SELECT * FROM tdept

SELECT a.emp_id as "사번"
      ,a.emp_name as "성명"
      ,b.DEPT_CODE as "부서코드"
      ,b.dept_name as "부서명" 
      ,b.parent_dept as "상위부서코드"
      ,c.dept_name as "상위부서명"
      ,d.emp_id as "상위부서장코드"
      ,d.emp_name as "상위부서장성명"
  FROM temp a, tdept b, tdept c, temp d
 WHERE b.parent_dept = 'CA0001'
   AND b.parent_dept = c.dept_code
   AND a.dept_code = b.dept_code
   AND c.boss_id = d.emp_id

--이게 좀 더 나은 정답
SELECT a.emp_id as "사번"
      ,a.emp_name as "성명"
      ,b.DEPT_CODE as "부서코드"
      ,b.dept_name as "부서명" 
      ,c.dept_code as "상위부서코드"
      ,c.dept_name as "상위부서명"
      ,d.emp_id as "상위부서장코드"
      ,d.emp_name as "상위부서장성명"
  FROM temp a, tdept b, tdept c, temp d
 WHERE b.parent_dept = 'CA0001'
   AND b.parent_dept = c.dept_code
   AND a.dept_code = b.dept_code
   AND c.boss_id = d.emp_id
