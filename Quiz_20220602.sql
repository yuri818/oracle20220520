temp�� �ڷḦ salary�� �з��Ͽ� 3õ���� ���ϴ� D
3õ���� �ʰ� 5õ���� ���ϴ� C, 5õ���� �ʰ� 7õ���� ���ϴ� B
7õ���� �ʰ��� A��� ����� �з��Ͽ� ��޺� �ο����� ����ϴ� sql���� �ۼ��Ͻÿ�.

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


SELECT COUNT(*) �ο�
      , CASE WHEN salary<=30000000 THEN 'D'
            WHEN 30000000<salary AND salary<=50000000 THEN 'C'
            WHEN 50000000<salary AND salary<=70000000 THEN 'B'
            WHEN 70000000<salary THEN 'A'
       END ���
  FROM temp
GROUP BY (CASE WHEN salary<=30000000 THEN 'D'
            WHEN 30000000<salary AND salary<=50000000 THEN 'C'
            WHEN 50000000<salary AND salary<=70000000 THEN 'B'
            WHEN 70000000<salary THEN 'A'
          END)



���̵�� ����� ��ġ�ϸ� 1�� ��ȯ�ϰ� ����� Ʋ���� 0�� ��ȯ�ϰ�
���̵� �������� ������ -1�� ��ȯ�ϴ� select���� �ۼ��Ͻÿ�
(case���� ����� ��)

SELECT * FROM member

SELECT mem_id
    , CASE WHEN mem_id =:x AND mem_pw =: y THEN '1'
           WHEN mem_id =:x AND mem_pw !=: y THEN '0'
           WHEN mem_id !=:x THEN '-1'
      END ���̵�Ȯ��
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
      END ���̵�Ȯ��
  FROM member


SELECT mem_id
 , CASE WHEN mem_id =:x AND mem_pw =: y THEN '1'
        WHEN mem_id =:x AND mem_pw !=: y THEN '0'
        WHEN mem_id !=:x THEN '-1'
        END ���̵�Ȯ��
  FROM member
ORDER BY ���̵�Ȯ�� desc

SELECT mem_id
  FROM (
          SELECT mem_id
         , CASE WHEN mem_id =:x AND mem_pw =: y THEN '1'
                WHEN mem_id =:x AND mem_pw !=: y THEN '0'
                WHEN mem_id !=:x THEN '-1'
                END ���̵�Ȯ��
          FROM member
        ORDER BY ���̵�Ȯ�� desc
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