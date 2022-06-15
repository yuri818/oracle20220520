

SELECT p.name_vc as "상품" , p.point_nu as "포인트"
  FROM t_giftmem mem, t_giftpoint p
 WHERE (SELECT 
               p.name_vc, p.point_nu 
          FROM t_giftpoint, t_giftmem
         WHERE t_giftmem.name_vc = '김유신'
           AND t_giftmem.point_nu >= t_giftpoint.point_nu
       )
       
SELECT point_nu
  FROM t_giftmem
 WHERE name_vc = '김유신'
 
문제2 

SELECT 
      point_nu
  FROM t_giftmem
 WHERE name_vc = '김유신'
 
SELECT 
       point_nu
  FROM t_giftmem
 WHERE name_vc =: name
 
SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= 50012

----where절에 select문이 있으면 서브쿼리

SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= (SELECT 
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '김유신'
                    )
                    
SELECT max(point_nu) as "포인트"
  FROM t_giftpoint
 WHERE point_nu <= (SELECT 
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '김유신'
                    )
                    
그룹함수와 일반 컬럼은 같이 사용할 수 없다.
그렇지만 이것도 답이 아니다. 왜냐면 name_vc에 max씌워서 한과세트 나온건 우연.

SELECT max(point_nu), max(name_vc)
  FROM t_giftpoint
 WHERE point_nu <= (SELECT 
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '김유신'
                    )

SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = 50000

SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = (SELECT max(point_nu)
                    FROM t_giftpoint
                   WHERE point_nu <= (SELECT 
                                             point_nu
                                        FROM t_giftmem
                                       WHERE name_vc = '김유신'
                                     )
                   )

SELECT 
       ename
  FROM emp
  
SELECT 
       ename
  FROM emp
 WHERE ename LIKE 'S%'
 
SELECT 
       ename
  FROM emp
 WHERE ename LIKE '%S'

SELECT 
       ename
  FROM emp
 WHERE ename LIKE '%S%'

SELECT *
  FROM emp
 WHERE ename LIKE '____'

SELECT *
  FROM emp
 WHERE ename LIKE '____S'
 
선분조건
점조건

SELECT ename, sal
  FROM emp
 WHERE sal>1000
   AND sal<3000
   
SELECT ename, sal
  FROM emp
 WHERE sal BETWEEN 1000 AND 3000
 
SELECT ename, sal
  FROM emp
 WHERE sal >= 1000
   AND sal <= 3000
   
