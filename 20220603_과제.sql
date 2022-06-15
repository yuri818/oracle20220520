SELECT * FROM test11

SELECT *
  FROM test11
      ,(
        SELECT rownum rno FROM test11
         WHERE rownum < 5 
       )b 
ORDER BY dept


