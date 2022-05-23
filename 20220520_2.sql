SELECT * FROM member

INSERT INTO member(mem_no, mem_id, mem_pw, mem_name)
VALUES(9,'nice','123','이성욱')

commit;

SELECT 
       mem_name
  FROM
 WHERE 아이디 = 값
   AND  비번 = 값
   
--아이디와 비번이 일치하는 경우에만 출력 결과를 볼 수 있다.
--데이터를 추가한 뒤 commit을 하지 않으면 실제 DB table에 반영되지 않음
--자신 서버를 바라볼 때는 결과가 있는 것 처럼 보여지지만 외부에서 접근하면 볼 수 있다.

   
SELECT 
       mem_name
  FROM member
 WHERE mem_id =: mid
   AND mem_pw =: mpw
   
