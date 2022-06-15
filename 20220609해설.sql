문제1.부서 별 평균 월급이 2,800,000을 초과하는 부서를 조회한 것이다.

SELECT DEPT, SUM(SALARY) 합계, FLOOR(AVG(SALARY)) 평균, COUNT(*) 인원수

FROM EMP

WHERE SALARY > 2800000

GROUP BY DEPT

ORDER BY DEPT ASC;


문제2. ROWNUM을 이용해서 월급이 가장 높은 3명을 뽑을려고 하였으나,
     올바른 결과가 조회 되지 않았다.


SELECT ROWNUM, EMPNAME, SAL

FROM EMP

WHERE ROWNUM <= 3

ORDER BY SAL DESC;
------------------------------------------------------------

1. DBMS에서 사용하는 DDL 중 ALTER 문에 대해 서술하시오.

ALTER TABLE SCOTT.MEMBER
 ADD (mem_address VARCHAR2(100));

SELECT *
  FROM emp
 WHERE empno = '7499'

SELECT *
  FROM emp
 WHERE empno = TO_NUMBER('7499')

ClassCastException

4.문자열 데이터 '20/10/13' 를 '2020-10-13' 로 표현될 수 있도록
  형변환 함수들을 사용하여 SELECT 구문을 작성하시오.

SELECT to_char('20/10/13')
      ,to_date('20/10/13')+1
      ,to_char(to_date('20/10/13'), 'YYYY-MM-DD')
  FROM dual

5.문자열 데이터 '190505' 를 '2019년 5월 5일' 로 표현될 수 있도록
  형변환 함수들을 사용하여 SELECT 구문을 작성하시오. 

SELECT to_char(to_date('20/10/13'), 'YYYY년MM월DD일')
  FROM dual

SELECT to_char(to_date('190505'),'YYYY')||'년'
     ||to_char(to_date('190505'),'MM')||'월'
     ||to_char(to_date('190505'),'DD')||'일'
  FROM dual

SELECT to_char(to_date('190505'), 'YYYY"년"MM"월"DD"일"')
  FROM dual

6.

SELECT trim(' ABC D   ')
      ,trim(' ABC D   ')||'AAA'
  FROM dual

7.

SELECT concat(concat(concat(empno,','),concat(ename,',')),deptno)
  FROM emp

