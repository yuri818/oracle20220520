INSERT INTO test1(t_id, t_pw, t_email, t_jumin)
            VALUES('tomato', '123','nice_test@hot.com','900712-1234567');
            
INSERT INTO test1(t_id, t_pw, t_email, t_jumin)
VALUES('banana', '123','ban_test@hot.com','900712-12376842');
            
INSERT INTO test1(t_id, t_pw, t_email, t_jumin)
VALUES('apple', '123','app_test@hot.com','900712-4937284');
            
commit
            
SELECT * FROM test1
 WHERE t_email LIKE '___\_%' ESCAPE '\'
 
SELECT * FROM test1
 WHERE t_email LIKE '___$_%' ESCAPE '$'
 
SELECT * FROM test1
 WHERE t_email LIKE '___!_%' ESCAPE '!'

SELECT * FROM test1
 WHERE SUBSTR(EMP_NO,8,1) = 1;

SELECT * FROM test1
 WHERE T_JUMIN LIKE '_______1%'

SELECT SUBSTR('Hello Java', 8,1)
      ,SUBSTR('Hello Java', 8,2)
      ,SUBSTR('Çï·Î ÀÚ¹Ù', 8,1)
  FROM dual

