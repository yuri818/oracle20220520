SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint

SELECT *
  FROM t_giftmem, t_giftpoint

SELECT t_giftmem.point_nu as "보유포인트"
  FROM t_giftmem, t_giftpoint

SELECT t_giftmem.point_nu as "보유포인트"
      ,t_giftpoint.point_nu as "적용포인트"
  FROM t_giftmem, t_giftpoint

SELECT t_giftmem.point_nu as "보유포인트"
      ,t_giftpoint.point_nu as "적용포인트"
      ,t_giftmem.point_nu - t_giftpoint.point_nu
  FROM t_giftmem, t_giftpoint

왜 음의 수가 나오는 걸까요?
내가 보유하고 있는 포인트로 가질 수 없는 상품이 있다.

내가 보유한 포인트 >= 상품의 포인트

음수는 내가 가질 수 없는 상품이다. 제외시켜야 한다. 경우의 수에서 30가지 5*6
문제를 천천히 꼼꼼하게 읽어서 최대한의 정보를 얻어내자.

영화티켓인것 중에서 and 
6개 상품 중에서 하나만 따진다.
mem.point_nu >= point.point_nu

이름 보유포인트 적용포인트 보유포인트-적용포인트

6개중에서 하나만 비교한다.

SELECT point_nu
  FROM t_giftpoint
 WHERE name_vc = '영화티켓'


SELECT mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem
      , (SELECT point_nu
           FROM t_giftpoint
          WHERE name_vc = '영화티켓'
        )point

SELECT mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem
      , (SELECT point_nu
           FROM t_giftpoint
          WHERE name_vc = '영화티켓'
        )point
 WHERE mem.point_nu >= point.point_nu

------------정답------------------------

SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem
      , (SELECT point_nu
           FROM t_giftpoint
          WHERE name_vc = '영화티켓'
        )point
 WHERE mem.point_nu >= point.point_nu

SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu
   AND point.name_vc = '영화티켓'

SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu
   AND point.name_vc =:x
   
변수 x는 UI에서 가져온다.