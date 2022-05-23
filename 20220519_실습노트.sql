DDL(객체 생성) - DBA

DCL(권한) - DB서버 운영자

DML(SELECT, INSERT, DELETE, UPDATE): 데이터 조작어

조회(배송조회, 주문조회 경우 ...)

입력, 수정, 삭제(실력차이 거의 없다)

SELECT 컬럼명1, 컬럼명2, ....
    FROM 집합이름(SELECT문 - 인라인뷰)
    
SELECT ename, job
    FROM emp
    
SELECT ename, job, hiredate
    FROM emp
 
SELECT ename as "이름", job, hiredate
    FROM emp
           
50만명
옵티마이저 - 일꾼 - 오라클에서 JVM역할

우리 회사에 근무하는 사원 중에서 ALLEN사원의 급여는 얼마인가요?

SELECT sal as "급여"
 FROM emp 
 WHERE ename = 'ALLEN'
    
우리 회사에 근무하는 사원 중에서 급여가 1000달러 이상인 사원의 이름, 급여를
출력하는 select문을 작성하시오.    

SELECT ename as "이름" , sal as "급여"
  FROM emp
   WHERE sal >= 1000
         
조건 검색시 where절 사용하면 된다.
   
SELECT ename as "이름" , sal as "급여"
  FROM emp
   WHERE sal >= 2000

where..and 교집합 : 조회결과가 줄어든다.

SELECT ename as "이름" , sal as "급여"
  FROM emp
   WHERE sal >= 2000
     AND deptno = 20

or는 합집합이다. 둘중에 하나만 만족하면 된다.
     
SELECT ename as "이름" , sal as "급여"
  FROM emp
   WHERE sal >= 2000
     OR deptno = 20     


SELECT sal 
  FROM emp
 WHERE ename = 'ALLEN'
 
SELECT sal 
  FROM emp
 WHERE ename = 'allen'
--테이블에 있는 값이 대문자와 소문자로 되어있으면 구분해 주어야 한다. 

 