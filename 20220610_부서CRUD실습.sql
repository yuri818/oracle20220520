SELECT * FROM dept

INSERT INTO dept(deptno, dname,loc)
          VALUES(71,'����1��','������')
          
int result = pstmt.executeUpdate();

SELECT * FROM dept
 WHERE deptno=71

commit

UPDATE dept
   SET dname = '����2��'
      ,loc = '������'
 WHERE deptno = 71
 
 
DELETE FROM dept
 WHERE deptno = 71
  
DELETE FROM dept
 WHERE deptno IN(71,40)

rollback


