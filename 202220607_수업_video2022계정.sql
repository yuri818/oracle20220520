select * from hd_video_member_t

���� ���� � ������ �뿩 �ߴ��� �˰� �ʹ�.
���� �̹ݳ� �����̸� ��ȭ�� �ɾ� �ݳ� ��û�� �ؾ� �Ѵٰ� �Ѵ�.
� ���յ��� �ʿ����� �������.

SELECT * FROM hd_video_t

SELECT * FROM hd_video_loan_detail_t

SELECT * FROM hd_video_loan_mast_t

SELECT * FROM hd_video_t

īŸ�þ��� ��, CROSS JOIN�� ���
�Ͼ �� �ִ� ��� ����� ���� ���´� - 108��
108�� �ȿ���  ���� �Ͼ �뿩�Ǹ� ����ִ°� �ƴѵ�.......
�׷��� ��� �ؾ� ���� �Ͼ �뿩 �Ǹ� �� �� ������?

SELECT *
  FROM hd_video_loan_mast_t, hd_video_loan_detail_t

SELECT vm.loan_no as "�뿩��ȣ"
      ,1 as "�뿩����"
      ,'test' as "ȸ���ڵ�"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd

SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.loan_date as "�뿩����"
      ,vm.mem_cd as "ȸ���ڵ�"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd
 WHERE vm.loan_no = vd.loan_no
--���⼭�� ȸ���� �̸��� �𸥴�.+��ȭ��ȣ��

SELECT *
  FROM hd_video_loan_mast_t
     , hd_video_loan_detail_t
     , hd_video_member_t
--9*12*5 = 540 --�ǹ� ���� ���� ���ֱ� ���ؼ� JOIN�� ����.

SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.loan_date as "�뿩����"
      ,vm.mem_cd as "ȸ���ڵ�"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd
     , hd_video_member_t mem
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd

SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.loan_date as "�뿩����"
      ,mem.mem_name as "ȸ����"
      ,mem.mem_tel as "��ȭ��ȣ"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd
     , hd_video_member_t mem
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd

SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.loan_date as "�뿩����"
      ,mem.mem_name as "ȸ����"
      ,mem.mem_tel as "��ȭ��ȣ"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd
     , hd_video_member_t mem
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd

SELECT m.movie_name as "��ȭ����"
  FROM hd_video_t v
      ,hd_movie_t m
 WHERE v.movie_cd = m.movie_cd

--���� Ǭ ���� = ����� Ǯ��
SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.loan_date as "�뿩����"
      ,mem.mem_name as "ȸ����"
      ,mem.mem_tel as "��ȭ��ȣ"
      ,m.movie_name as "��ȭ����"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd
     , hd_video_member_t mem
     , hd_video_t v
     , hd_movie_t m
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd
   AND vd.video_cd = v.video_cd
   AND v.movie_cd = m.movie_cd

SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.loan_date as "�뿩����"
      ,mem.mem_name as "ȸ����"
      ,mem.mem_tel as "��ȭ��ȣ"
      ,m.movie_name as "��ȭ����"
      ,m.manager as "��ȭ����"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd
     , hd_video_member_t mem
     , hd_video_t v
     , hd_movie_t m
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd
   AND vd.video_cd = v.video_cd
   AND v.movie_cd = m.movie_cd

