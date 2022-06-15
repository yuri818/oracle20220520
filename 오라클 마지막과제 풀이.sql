SELECT * FROM t_orderbasket

더미테이블 활용

SELECT rownum rno FROM dept
 WHERE rownum < 3
 
카타시안곱

SELECT rownum rno FROM dept
 WHERE rownum < 4

SELECT
       *
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc) as "물품구분"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')
        ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc)

---------------------------------------------------------    
SELECT deptno, count(empno)
  FROM emp
GROUP BY deptno

SELECT deptno, empno
  FROM emp
GROUP BY deptno

SELECT deptno, max(empno)
  FROM emp
GROUP BY deptno

SELECT deptno, empno
  FROM emp
GROUP BY deptno, empno
--------------------------------------

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc) as "물품구분"
      ,SUM(a.qty_nu)||'개' as "판매개수"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')
        ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc)

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc) as "물품구분"
      ,SUM(a.qty_nu)||'개' as "판매개수"
      ,SUM(a.qty_nu*a.price_nu)||'원' as "판매가격"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')
        ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc)
        
SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc) as "물품구분"
      ,SUM(a.qty_nu)||'개' as "판매개수"
      ,SUM(a.qty_nu*a.price_nu)||'원' as "판매가격"
  FROM t_orderbasket a,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 4
       )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')
        ,DECODE(b.rno,3,a.gubun_vc||'계',1,a.gubun_vc)
ORDER BY "판매날짜"        

--------------------------------------------------------------

SELECT
       a.emp_id as "사번", a.emp_name as "성명"
      ,b.dept_code, B.DEPT_NAME
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code

SELECT
       a.emp_id as "사번", a.emp_name as "성명"
      ,b.dept_code, B.DEPT_NAME
      ,c.dept_code as "상위부서코드"
      ,c.dept_name as "상위부서명"
  FROM temp a, tdept b , tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c.dept_code

SELECT
       a.emp_id as "사번", a.emp_name as "성명"
      ,b.dept_code, B.DEPT_NAME
      ,c.dept_code as "상위부서코드"
      ,c.dept_name as "상위부서명"
  FROM temp a, tdept b , tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c.dept_code
   AND c.dept_code = 'CA0001'

SELECT
       a.emp_id as "사번", a.emp_name as "성명"
      ,b.dept_code, B.DEPT_NAME
      ,c.dept_code as "상위부서코드"
      ,c.dept_name as "상위부서명"
      ,c.boss_id as "부서장아이디"
      ,d.emp_name as"부서장성명"
  FROM temp a, tdept b , tdept c, temp d
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c.dept_code
   AND c.dept_code = 'CA0001'
   AND c.boss_id = d.emp_id

