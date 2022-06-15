temp의 자료를 salary로 분류하여 3천만원 이하는 D
3천만원 초과 5천만원 이하는 C, 5천만원 초과 7천만원 이하는 B
7천만원 초과는 A라고 등급을 분류하여 등급별 인원수를 출력하는 sql문을 작성하시오.

SELECT * FROM temp

SELECT count(emp_id) FROM temp

SELECT count(emp_id),
       CASE WHEN salary <= 30000000 THEN 'D'
            WHEN 30000000<salary AND salary<=50000000 THEN 'C'
            WHEN 50000000<salary AND salary<=70000000 THEN 'B'
            WHEN 70000000<salary 'A' end
  FROM temp

CASE WHEN salary BETWEEN 30000001 AND 50000000 THEN 'C'

SELECT 
       COUNT(CASE WHEN salary <= 30000000 THEN 'D' end) D
  FROM temp


SELECT 
       COUNT(CASE WHEN salary > 70000000 THEN 'A' end) A
      ,COUNT(CASE WHEN 50000000<salary AND salary<=70000000 THEN 'B' end) B
      ,COUNT(CASE WHEN 30000000<salary AND salary<=50000000 THEN 'C' end) C
      ,COUNT(CASE WHEN salary <= 30000000 THEN 'D' end) D
  FROM temp

SELECT 
       CASE WHEN salary<=30000000 THEN 'D'
            WHEN 30000000<salary AND salary<=50000000 THEN 'C'
            WHEN 50000000<salary AND salary<=70000000 THEN 'B'
            WHEN 70000000<salary THEN 'A'
       END count
  FROM temp


SELECT COUNT(*) 인원
      , CASE WHEN salary<=30000000 THEN 'D'
            WHEN 30000000<salary AND salary<=50000000 THEN 'C'
            WHEN 50000000<salary AND salary<=70000000 THEN 'B'
            WHEN 70000000<salary THEN 'A'
       END 등급
  FROM temp
GROUP BY (CASE WHEN salary<=30000000 THEN 'D'
            WHEN 30000000<salary AND salary<=50000000 THEN 'C'
            WHEN 50000000<salary AND salary<=70000000 THEN 'B'
            WHEN 70000000<salary THEN 'A'
          END)



아이디와 비번이 일치하면 1을 반환하고 비번이 틀리면 0을 반환하고
아이디가 존재하지 않으면 -1을 반환하는 select문을 작성하시오
(case문을 사용할 것)

SELECT * FROM member

SELECT mem_id
    , CASE WHEN mem_id =:x AND mem_pw =: y THEN '1'
           WHEN mem_id =:x AND mem_pw !=: y THEN '0'
           WHEN mem_id !=:x THEN '-1'
      END 아이디확인
  FROM member
  
1
0
-1

SELECT * FROM emp

SELECT max(empno)+1 FROM emp

SELECT
       empno
  FROM emp
ORDER BY empno desc

SELECT
       empno+1
  FROM (
        SELECT
               empno
          FROM emp
        ORDER BY empno desc
       )
 WHERE rownum = 1
 

SELECT mem_id
    , CASE WHEN mem_id =:x AND mem_pw =: y THEN '1'
           WHEN mem_id =:x AND mem_pw !=: y THEN '0'
           WHEN mem_id !=:x THEN '-1'
      END 아이디확인
  FROM member


SELECT mem_id
 , CASE WHEN mem_id =:x AND mem_pw =: y THEN '1'
        WHEN mem_id =:x AND mem_pw !=: y THEN '0'
        WHEN mem_id !=:x THEN '-1'
        END 아이디확인
  FROM member
ORDER BY 아이디확인 desc

SELECT mem_id
  FROM (
          SELECT mem_id
         , CASE WHEN mem_id =:x AND mem_pw =: y THEN '1'
                WHEN mem_id =:x AND mem_pw !=: y THEN '0'
                WHEN mem_id !=:x THEN '-1'
                END 아이디확인
          FROM member
        ORDER BY 아이디확인 desc
)
WHERE rownum =1
  
SELECT 
       CASE WHEN mem_id=:id THEN
        CASE WHEN mem_pw=:pw THEN 1
            ELSE 0
        END
       ELSE -1
       END as result
  FROM member
  
SELECT 
       CASE WHEN mem_id=:id THEN
        CASE WHEN mem_pw=:pw THEN 1
            ELSE 0
        END
       ELSE -1
       END as result
  FROM member
ORDER BY result desc
  
SELECT
        result
  FROM (
        SELECT 
               CASE WHEN mem_id=:id THEN
                CASE WHEN mem_pw=:pw THEN mem_name
                    ELSE '0'
                END
               ELSE '-1'
               END as result
          FROM member
        ORDER BY result desc
       )
WHERE rownum = 1