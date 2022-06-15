도전문제) 월요일엔 해당일자에 01을 붙여서 4자리 암호를 만들고, 화요일엔 11, 수요일엔 21,
목요일엔 31, 금요일엔 41, 토요일엔 51, 일요일엔 61을 붙여서 4자리 암호를 만든다고 할 때,
암호를 SELECT하는 sql을 만들어보시오.
--힌트
SELECT to_char(sysdate, 'DD')
      ,to_char(sysdate, 'MM')
      ,to_char(sysdate, 'DAY')
  FROM dual

SELECT '31' || '11' FROM dual

SELECT DECODE(to_char(sysdate,'DAY'),'월요일',to_char(sysdate, 'DD')||'01'
             ,'화요일', to_char(sysdate,'DD')||'11'
             ,'수요일', to_char(sysdate,'DD')||'21'
             ,'목요일', to_char(sysdate,'DD')||'31'
             ,'금요일', to_char(sysdate,'DD')||'41'
             ,'토요일', to_char(sysdate,'DD')||'51'
             ,'일요일', to_char(sysdate,'DD')||'61')
 FROM dual

SELECT DECODE(to_char(sysdate,'DAY'),'월요일',to_char(sysdate,'DD')||'01'
                                    ,'화요일',to_char(sysdate,'DD')||'11'
                                    ,'수요일',to_char(sysdate,'DD')||'21'
                                    ,'목요일',to_char(sysdate,'DD')||'31'
                                    ,'금요일',to_char(sysdate,'DD')||'41'
                                    ,'토요일',to_char(sysdate,'DD')||'51'
                                    ,'일요일',to_char(sysdate,'DD')||'61') 암호 
 FROM dual
 
SELECT to_char(sysdate,'DD')||
DECODE(to_char(sysdate,'day'),'월요일','01'
                             ,'화요일','11'
                             ,'수요일','21'
                             ,'목요일','31'
                             ,'금요일','41'
                             ,'토요일','51'
                             ,'일요일','61')
  FROM dual
  
실전문제
사원 테이블에서 job 이 'CLERK'인 사원의 급여합, 'SALESMAN'인 사람의 
급여의 합을 구하고 나머지 job에 대해서는 기타의 합으로 구하시오.

SELECT * FROM emp

SELECT DECODE(job,'CLERK',sal,'SALESMAN',sal,sal)
  FROM emp

SELECT SUM(DECODE(job,'CLERK',sal,'SALESMAN',sal,sal))
  FROM emp

SELECT SUM(DECODE(job,'CLERK',sal)) clerk
      ,SUM(DECODE(job,'SALESMAN',sal)) salesman
      ,SUM(DECODE(job,'CLERK',null,'SALESMAN',null,sal)) 기타
  FROM emp


SELECT * FROM member

로그인이 먼저
아님 
회원가입이 먼저 인가요?

회원가입시 아이디 중복검사 쿼리문을 작성해 본다.

SELECT mem_name
  FROM member
 WHERE mem_id =:x
   AND mem_pw =:y
   
SELECT COUNT(mem_id)
  FROM member
 WHERE mem_id =:x
 
SELECT 1 FROM member
WHERE mem_id='apple'

서브쿼리는 where절 아래 select문을 말한다.

SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple')

SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple5')

SELECT NVL(hobby,'없음') FROM temp

SELECT NVL((
            SELECT 1
              FROM dual
             WHERE EXISTS (SELECT mem_name
                             FROM member
                            WHERE mem_id='apple6')
            ),0)
  FROM dual


인라인뷰는 from절 아래 select문을 말함.



