SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint

SELECT *
  FROM t_giftmem, t_giftpoint

SELECT t_giftmem.point_nu as "��������Ʈ"
  FROM t_giftmem, t_giftpoint

SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
  FROM t_giftmem, t_giftpoint

SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
      ,t_giftmem.point_nu - t_giftpoint.point_nu
  FROM t_giftmem, t_giftpoint

�� ���� ���� ������ �ɱ��?
���� �����ϰ� �ִ� ����Ʈ�� ���� �� ���� ��ǰ�� �ִ�.

���� ������ ����Ʈ >= ��ǰ�� ����Ʈ

������ ���� ���� �� ���� ��ǰ�̴�. ���ܽ��Ѿ� �Ѵ�. ����� ������ 30���� 5*6
������ õõ�� �Ĳ��ϰ� �о �ִ����� ������ ����.

��ȭƼ���ΰ� �߿��� and 
6�� ��ǰ �߿��� �ϳ��� ������.
mem.point_nu >= point.point_nu

�̸� ��������Ʈ ��������Ʈ ��������Ʈ-��������Ʈ

6���߿��� �ϳ��� ���Ѵ�.

SELECT point_nu
  FROM t_giftpoint
 WHERE name_vc = '��ȭƼ��'


SELECT mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
      , (SELECT point_nu
           FROM t_giftpoint
          WHERE name_vc = '��ȭƼ��'
        )point

SELECT mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
      , (SELECT point_nu
           FROM t_giftpoint
          WHERE name_vc = '��ȭƼ��'
        )point
 WHERE mem.point_nu >= point.point_nu

------------����------------------------

SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
      , (SELECT point_nu
           FROM t_giftpoint
          WHERE name_vc = '��ȭƼ��'
        )point
 WHERE mem.point_nu >= point.point_nu

SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu
   AND point.name_vc = '��ȭƼ��'

SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu
   AND point.name_vc =:x
   
���� x�� UI���� �����´�.