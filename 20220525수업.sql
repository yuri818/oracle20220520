SELECT * FROM t_letitbe

SELECT seq_vc 
      ,TO_NUMBER(seq_vc)
  FROM t_letitbe

SELECT empno FROM emp

DECODE(MOD(2,2),1,'홀수')

SELECT DECODE(MOD(2,2),0,'홀수')
  FROM dual
  
SELECT
       MOD(seq_vc,2) n
  FROM t_letitbe
  
--별칭은 컬럼명이 아니다.  
SELECT
       MOD(seq_vc,2) n
  FROM t_letitbe
 WHERE n = 1

 
SELECT
       n
  FROM (
        SELECT
               MOD(seq_vc,2) n
          FROM t_letitbe
       )
 WHERE n=1
 
 
SELECT
       MOD(seq_vc,2) no
      ,DECODE(MOD(seq_vc,2),1,words_vc)
  FROM t_letitbe 
  
SELECT
       no, eng_words
  FROM (
        SELECT
              MOD(seq_vc,2) no
             ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe 
       )
 WHERE no=1

--20220524 과제-1번답
  
SELECT
       rownum rno, eng_words
  FROM (
        SELECT
              MOD(seq_vc,2) no
             ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe 
       )
 WHERE no=1
 
--20220524 과제-2번답

SELECT
       rownum rno, kor_words
  FROM (
        SELECT
              MOD(seq_vc,2) no
             ,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
          FROM t_letitbe 
       )
 WHERE no=0
 
--20220524 과제-3번답

        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe 
        UNION ALL
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
          FROM t_letitbe

SELECT
      seq_vc
  FROM (
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe 
        UNION ALL
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
          FROM t_letitbe        
       )
GROUP BY seq_vc


SELECT
       deptno, max(ename)
  FROM emp
GROUP BY deptno


SELECT
      seq_vc , min(eng_words)
  FROM (
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe 
        UNION ALL
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),0,words_vc) eng_words
          FROM t_letitbe        
       )
GROUP BY seq_vc

--20220525 3번 과제 답

SELECT
      seq_vc , max(eng_words)
  FROM (
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe 
        UNION ALL
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),0,words_vc) eng_words
          FROM t_letitbe        
       )
GROUP BY seq_vc
ORDER BY TO_NUMBER(seq_vc)

------------------------------------------------------------

IF 2%2=0 THEN
    return '짝수'
ELSIF 2&2=1 THEN
    return '홀수'
END;

----------------------------------------------
SELECT
      seq_vc , eng_words
  FROM (
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe 
        UNION ALL
        SELECT
              seq_vc
             ,DECODE(MOD(seq_vc,2),0,words_vc) eng_words
          FROM t_letitbe        
       )
ORDER BY TO_NUMBER(seq_vc)