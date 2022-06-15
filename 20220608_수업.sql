SELECT count(uid_no)
      ,count(*), count(ri)
  FROM zipcode_t

SELECT * FROM zipcode_t
WHERE address LIKE '%송파구 잠실3동%'

SELECT empno, ename FROM emp
 WHERE ename LIKE '%'||'S'||'%'
 
SELECT empno, ename FROM emp
 WHERE ename LIKE 'S'||'%'

SELECT empno, ename FROM emp
 WHERE ename LIKE '%'||'S'
 
SELECT address, zipcode
  FROM zipcode_t
 WHERE dong LIKE '%'||'당산'||'%'

대분류 - 시 도 정보만 조회하세요. 중복제거하세요

SELECT distinct zdo
  FROM zipcode_t
  
SELECT zdo
  FROM zipcode_t
GROUP BY zdo

SELECT DECODE(b.rno,1,'전체',2,distinct zdo)
  FROM zipcode_t,
      (
        SELECT rownum rno FROM test11
         WHERE rownum < 3
       )b

SELECT distinct zdo
  FROM zipcode_t
ORDER BY zdo 

SELECT '전체' zdo FROM dual
UNION ALL
SELECT '경기' FROM dual
UNION ALL
SELECT '서울' FROM dual

SELECT distinct(zdo) zdo
  FROM zipcode_t
ORDER BY zdo asc

SELECT '전체' zdo FROM dual
UNION ALL
SELECT distinct(zdo) zdo
  FROM zipcode_t
ORDER BY zdo asc

SELECT '전체' zdo FROM dual
UNION ALL
SELECT zdo
  FROM (
        SELECT distinct(zdo) zdo
          FROM zipcode_t
        ORDER BY zdo asc
       )

SELECT '전체' sigu FROM dual
UNION ALL
SELECT sigu
  FROM (
        SELECT distinct(sigu) sigu
          FROM zipcode_t
        ORDER BY sigu asc
       )

SELECT '전체' sigu FROM dual
UNION ALL
SELECT sigu
  FROM (
        SELECT distinct(sigu) sigu
          FROM zipcode_t
         WHERE zdo =: x
        ORDER BY sigu asc
       )

SELECT '전체' dong FROM dual
UNION ALL
SELECT dong
  FROM (
        SELECT distinct(dong) dong
          FROM zipcode_t
         WHERE zdo =: x AND sigu =:y
        ORDER BY dong asc
       )


SELECT *
          FROM zipcode_t
         WHERE zdo =: x AND sigu =:y
        ORDER BY dong asc

select * from zipcode_t

SELECT zipcode
  FROM (
        SELECT distinct(dong) dong
          FROM zipcode_t
         WHERE zdo =: x AND sigu =:y
        ORDER BY dong asc
       ) ,zipcode_t

SELECT zipcode
  FROM zipcode_t
 WHERE zdo =: x AND sigu =: y
GROUP BY zipcode
ORDER BY zipcode


SELECT * FROM test02