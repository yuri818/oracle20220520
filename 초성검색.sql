--�ʼ��˻��� �� ����ϴ� function�����

CREATE OR REPLACE function SCOTT.fn_choseong(str in varchar2)
return varchar2
IS
    returnStr varchar2(100);--ó���� �ʼ����� ���
    cnt number:=0;--�߶� ���ڿ� ���Ҷ� ����� ��ġ����
    tmpStr varchar2(20);--���ھ� �߶󳻱�
BEGIN
    if str is null then
        return '';
    end if;
    cnt := length(str);--���ڿ��� ���� ���
    for i in 1 ..cnt loop
        tmpStr := substr(str,i,1);
        returnStr := returnStr ||
        case when tmpStr < '��' then substr(tmpStr,1,1)
        when ascii('��') <= ascii(tmpStr)
             and ascii(tmpStr) <= ascii('��') then chr(ascii(tmpStr))
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < 'ī' then '��'
        when tmpStr < 'Ÿ' then '��'
        when tmpStr < '��' then '��'
        when tmpStr < '��' then '��'
        else '��'
        end;
    end loop;
    return returnStr;
END;
/


--�׽�Ʈ�غ� ������

SELECT fn_choseong('��')  --��
      ,fn_choseong('����') -- ����
      ,fn_choseong('�ڼ��̺�') --��������
  FROM dual
  
---
SELECT �Լ���(��) FROM dual

�Լ��� �÷����� ���� �ڸ��� �� �� �ִ�.

SELECT 
       *
  FROM book
 WHERE bk_title LIKE 'ȥ'||'%' 
 

SELECT 
       *
  FROM book
 WHERE fn_choseong(bk_title) LIKE '��'||'%'
 
 
�ʼ����� üũ - ���? �׸��� ���? �׸��� ����?


�Է¹��� �������� ��ȿ�� �˻絵 �ڹٽ�ũ��Ʈ�� �ؾ� �Ѵ�.
����Ʈ����, how? �ʼ������� ����ϴ� ������ ������ ��, �ڹٽ�ũ��Ʈ��