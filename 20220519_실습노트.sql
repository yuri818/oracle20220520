DDL(��ü ����) - DBA

DCL(����) - DB���� ���

DML(SELECT, INSERT, DELETE, UPDATE): ������ ���۾�

��ȸ(�����ȸ, �ֹ���ȸ ��� ...)

�Է�, ����, ����(�Ƿ����� ���� ����)

SELECT �÷���1, �÷���2, ....
    FROM �����̸�(SELECT�� - �ζ��κ�)
    
SELECT ename, job
    FROM emp
    
SELECT ename, job, hiredate
    FROM emp
 
SELECT ename as "�̸�", job, hiredate
    FROM emp
           
50����
��Ƽ������ - �ϲ� - ����Ŭ���� JVM����

�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� ALLEN����� �޿��� ���ΰ���?

SELECT sal as "�޿�"
 FROM emp 
 WHERE ename = 'ALLEN'
    
�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �޿��� 1000�޷� �̻��� ����� �̸�, �޿���
����ϴ� select���� �ۼ��Ͻÿ�.    

SELECT ename as "�̸�" , sal as "�޿�"
  FROM emp
   WHERE sal >= 1000
         
���� �˻��� where�� ����ϸ� �ȴ�.
   
SELECT ename as "�̸�" , sal as "�޿�"
  FROM emp
   WHERE sal >= 2000

where..and ������ : ��ȸ����� �پ���.

SELECT ename as "�̸�" , sal as "�޿�"
  FROM emp
   WHERE sal >= 2000
     AND deptno = 20

or�� �������̴�. ���߿� �ϳ��� �����ϸ� �ȴ�.
     
SELECT ename as "�̸�" , sal as "�޿�"
  FROM emp
   WHERE sal >= 2000
     OR deptno = 20     


SELECT sal 
  FROM emp
 WHERE ename = 'ALLEN'
 
SELECT sal 
  FROM emp
 WHERE ename = 'allen'
--���̺� �ִ� ���� �빮�ڿ� �ҹ��ڷ� �Ǿ������� ������ �־�� �Ѵ�. 

 