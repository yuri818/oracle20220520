�̸� - t_giftmem
��������Ʈ - t_giftmem, point_nu(�÷���)
��ȭƼ�� - t_giftpoint, point_nu(�÷���)

--�Ʒ��� from�� �Ʒ� ������ �̰��� �ζ��� ���̴�.

CREATE VIEW v_emp1(e_no, e_name)
AS SELECT empno, ename
     FROM emp
    WHERE deptno = 10

SELECT e_no,e_name FROM v_emp1

SELECT point_nu FROM t_giftpoint
 WHERE name_vc = '��ȭƼ��'

SELECT 
       point_nu
  FROM (
        SELECT point_nu FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'
       )


SELECT
       mem.name_vc, mem.point_nu, point.point_nu 
  FROM t_giftmem mem,
       (
        SELECT point_nu FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'
       )point
 WHERE mem.point_nu >= point.point_nu       


�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �˷����� �޿��� �� ���� �޴� ����� �̸��� �޿���
����ϴ� sql���� �ۼ��Ͻÿ�.


SELECT * FROM emp

SELECT sal
  FROM emp
 WHERE ename = 'ALLEN'

SELECT ename �̸�, sal �޿� 
  FROM emp
 WHERE sal > (
              SELECT sal
                FROM emp
               WHERE ename ='ALLEN'
       )





SELECT * FROM temp

SELECT * FROM tdept

SELECT * FROM tcom
