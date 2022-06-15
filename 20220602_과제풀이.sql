SELECT * FROM t_orderbasket

더미테이블을 이용하여 두개로 나눌 것이다.
-단톡방 사진 보기

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual

데이터를 2배수로 복제하기 - 카타시안의 곱 이용

SELECT * 
  FROM t_orderbasket,
       (SELECT 1 FROM dual
        UNION ALL
        SELECT 2 FROM dual
       )

SELECT * 
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       )

SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc

SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc
UNION ALL
SELECT '총계' FROM dual

단위테스트

DECODE(rownum, 1, indate_vc, 2, '총계')

SELECT DECODE(b.rno, 1, indate_vc, 2, '총계') 
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b

--group by나 order by, 컬럼 등에 decode가능

SELECT DECODE(b.rno, 1, indate_vc, 2, '총계') 
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계')


SELECT DECODE(b.rno, 1, indate_vc, 2, '총계') 판매날짜
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계')
ORDER BY DECODE(b.rno, 1, indate_vc, 2, '총계')


SUM(qty_nu*price_nu) as "상품의 매출액"


SELECT DECODE(b.rno, 1, indate_vc, 2, '총계') 판매날짜
      ,SUM(qty_nu)||' 개' as "판매개수"
      ,SUM(qty_nu*price_nu)||' 원' as "상품의 매출액"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계')
ORDER BY DECODE(b.rno, 1, indate_vc, 2, '총계')


SELECT DECODE(b.rno, 1, indate_vc, 2, '총계') 판매날짜
      ,SUM(qty_nu)||' 개' as "판매개수"
      ,SUM(qty_nu*price_nu)||' 원' as "상품의 매출액"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계')
ORDER BY "판매날짜"


--왜 dept야? emp랑 결과는 같지만 로우가 4개라서 일량이 줄어든다.

SELECT DECODE(b.rno, 1, indate_vc, 2, '총계') 판매날짜
      ,SUM(qty_nu)||' 개' as "판매개수"
      ,SUM(qty_nu*price_nu)||' 원' as "상품의 매출액"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM emp
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계')
ORDER BY "판매날짜"