SELECT COUNT(*)
  FROM memo
 WHERE read_yn = 'N'
   AND to_id = 'apple'
   
edit member

edit memo

SELECT seq_memo_no.nextval from dual

SELECT COUNT(*), count(comm) FROM emp

-- �̱���� �α��� ó���� �������迡 �ִ�
-- ���� MemoController�� MemoLogic�� ������ �ʿ䰡 ����.
-- to_id�� ��� ��� ��������?
-- MemberController���� �Ѿ�;��� - ȣ��Ǵ� ������ MemberLogic��
-- ��Ʈ�� ������ ��´� -> @RequestParam Map������ ��� �Ǵ�?
-- Model model   com.springframework..ui.XXXX
-- login(id,pw) -> MemberVO -> mVO.getMem_id(); �� apple�̶��
-- to_id�� �����ڸ��� apple�� ���� �ȴ�
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