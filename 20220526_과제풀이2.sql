

SELECT p.name_vc as "��ǰ" , p.point_nu as "����Ʈ"
  FROM t_giftmem mem, t_giftpoint p
 WHERE (SELECT 
               p.name_vc, p.point_nu 
          FROM t_giftpoint, t_giftmem
         WHERE t_giftmem.name_vc = '������'
           AND t_giftmem.point_nu >= t_giftpoint.point_nu
       )
       
SELECT point_nu
  FROM t_giftmem
 WHERE name_vc = '������'
 
����2 

SELECT 
      point_nu
  FROM t_giftmem
 WHERE name_vc = '������'
 
SELECT 
       point_nu
  FROM t_giftmem
 WHERE name_vc =: name
 
SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= 50012

----where���� select���� ������ ��������

SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= (SELECT 
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������'
                    )
                    
SELECT max(point_nu) as "����Ʈ"
  FROM t_giftpoint
 WHERE point_nu <= (SELECT 
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������'
                    )
                    
�׷��Լ��� �Ϲ� �÷��� ���� ����� �� ����.
�׷����� �̰͵� ���� �ƴϴ�. �ֳĸ� name_vc�� max������ �Ѱ���Ʈ ���°� �쿬.

SELECT max(point_nu), max(name_vc)
  FROM t_giftpoint
 WHERE point_nu <= (SELECT 
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������'
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
                                       WHERE name_vc = '������'
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
 
��������
������

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
   
