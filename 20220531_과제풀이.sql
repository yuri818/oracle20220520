SELECT * FROM sam_tab02

SELECT ROWNUM no, gubun FROM sam_tab02;                
                
SELECT ceil(no/4) rno,no,gubun                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       );    

SELECT ceil(no/4) rno                
          ,mod(no,4) cno                
          ,no,gubun                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       );                
            

SELECT ceil(no/4) rno                
          ,mod(no,4) cno                
          ,decode(mod(no,4),1,gubun) c1                
          ,decode(mod(no,4),2,gubun) c2                
          ,decode(mod(no,4),3,gubun) c3                
          ,decode(mod(no,4),0,gubun) c4                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )     
           
SELECT ceil(no/4) rno                
      ,mod(no,4) cno                               
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       );                
GROUP BY rno

SELECT ceil(no/4) rno                                              
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )
GROUP BY ceil(no/4)

SELECT ceil(no/4) rno                                              
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )
GROUP BY ceil(no/4)
ORDER BY ceil(no/4)
------------------------------------------------

인라인뷰를 이용하면 테이블에 포함된 컬럼이 아니더라도 접근이 가능하다.

SELECT ceil(no/4) rno                                              
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )

SELECT
       rno
  FROM (
       SELECT ceil(no/4) rno                                              
         FROM (                
               SELECT rownum no,gubun FROM sam_tab02                
              )
       )
GROUP BY rno
  


SELECT     ceil(no/4) rno                              
          ,MAX(decode(mod(no,4),1,gubun)) c1                
          ,MAX(decode(mod(no,4),2,gubun)) c2                
          ,MAX(decode(mod(no,4),3,gubun)) c3                
          ,MAX(decode(mod(no,4),0,gubun)) c4                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       ) 
GROUP BY ceil(no/4)
ORDER BY ceil(no/4)

SELECT     ceil(no/5) rno                              
          ,MAX(decode(mod(no,5),1,emp_id)) c1                
          ,MAX(decode(mod(no,5),2,emp_id)) c2                
          ,MAX(decode(mod(no,5),3,emp_id)) c3                
          ,MAX(decode(mod(no,5),4,emp_id)) c4
          ,MAX(decode(mod(no,5),0,emp_id)) c5                
  FROM (                
        SELECT rownum no,emp_id FROM temp                
       ) 
GROUP BY ceil(no/5)
ORDER BY ceil(no/5)

SELECT     ceil(no/5) rno                              
          ,MIN(decode(mod(no,5),1,emp_id)) c1                
          ,MIN(decode(mod(no,5),2,emp_id)) c2                
          ,MIN(decode(mod(no,5),3,emp_id)) c3                
          ,MIN(decode(mod(no,5),4,emp_id)) c4
          ,MIN(decode(mod(no,5),0,emp_id)) c5                
  FROM (                
        SELECT rownum no,emp_id FROM temp                
       ) 
GROUP BY ceil(no/5)
ORDER BY ceil(no/5)

SELECT     ceil(no/5) rno                              
          ,MIN(decode(mod(no,5),1,emp_id)) c1  
          ,MIN(decode(mod(no,5),1,emp_name)) name1              
          ,MIN(decode(mod(no,5),2,emp_id)) c2
          ,MIN(decode(mod(no,5),2,emp_name)) name2                  
          ,MIN(decode(mod(no,5),3,emp_id)) c3
          ,MIN(decode(mod(no,5),3,emp_name)) name3                
          ,MIN(decode(mod(no,5),4,emp_id)) c4
          ,MIN(decode(mod(no,5),4,emp_name)) name4
          ,MIN(decode(mod(no,5),0,emp_id)) c5
          ,MIN(decode(mod(no,5),0,emp_name)) name5                
  FROM (                
        SELECT rownum no,emp_id, emp_name FROM temp                
       ) 
GROUP BY ceil(no/5)
ORDER BY ceil(no/5)



