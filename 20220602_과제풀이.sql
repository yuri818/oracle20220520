SELECT * FROM t_orderbasket

�������̺��� �̿��Ͽ� �ΰ��� ���� ���̴�.
-����� ���� ����

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual

�����͸� 2����� �����ϱ� - īŸ�þ��� �� �̿�

SELECT * 
  FROM t_orderbasket,
       (SELECT 1 FROM dual
        UNION ALL
        SELECT 2 FROM dual
       )

SELECT * 
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       )

SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc

SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc
UNION ALL
SELECT '�Ѱ�' FROM dual

�����׽�Ʈ

DECODE(rownum, 1, indate_vc, 2, '�Ѱ�')

SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�') 
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b

--group by�� order by, �÷� � decode����

SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�') 
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')


SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�') �Ǹų�¥
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
ORDER BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')


SUM(qty_nu*price_nu) as "��ǰ�� �����"


SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�') �Ǹų�¥
      ,SUM(qty_nu)||' ��' as "�ǸŰ���"
      ,SUM(qty_nu*price_nu)||' ��' as "��ǰ�� �����"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
ORDER BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')


SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�') �Ǹų�¥
      ,SUM(qty_nu)||' ��' as "�ǸŰ���"
      ,SUM(qty_nu*price_nu)||' ��' as "��ǰ�� �����"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
ORDER BY "�Ǹų�¥"


--�� dept��? emp�� ����� ������ �ο찡 4���� �Ϸ��� �پ���.

SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�') �Ǹų�¥
      ,SUM(qty_nu)||' ��' as "�ǸŰ���"
      ,SUM(qty_nu*price_nu)||' ��' as "��ǰ�� �����"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM emp
         WHERE rownum < 3 
       ) b
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
ORDER BY "�Ǹų�¥"