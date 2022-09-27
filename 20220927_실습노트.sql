SELECT COUNT(*)
  FROM memo
 WHERE read_yn = 'N'
   AND to_id = 'apple'
   
edit member

edit memo

SELECT seq_memo_no.nextval from dual

SELECT COUNT(*), count(comm) FROM emp

-- 이기능은 로그인 처리와 의존관계에 있다
-- 따라서 MemoController와 MemoLogic을 경유할 필요가 없다.
-- to_id는 어디서 어떻게 가져오지?
-- MemberController에서 넘어와야함 - 호출되는 시점이 MemberLogic임
-- 컨트롤 계층에 듣는다 -> @RequestParam Map지원이 어디서 되니?
-- Model model   com.springframework..ui.XXXX
-- login(id,pw) -> MemberVO -> mVO.getMem_id(); 가 apple이라면
-- to_id의 변수자리에 apple이 들어가면 된다
-- pMap.put("to_id", mVO.getMember_id());
SELECT COUNT(*)
  FROM memo
 WHERE read_yn = 'N'
   AND to_id =: to_id


SELECT no, from_id, to_id, memo_content
      ,create_date, read_yn
  FROM memo
 WHERE no =: no
 
 
UPDATE memo
   SET read_yn = 'Y'
 WHERE no =: no