�������� ��������

1.temp���� ������ ���� ���� ������ row�� ã�Ƽ� �� �ݾװ� ������ �ݾ���
�޴� ������ ����� ������ ����Ͻÿ�.

SELECT * FROM temp

SELECT max(salary) FROM temp 


SELECT emp_id ���, emp_name �̸� FROM temp

SELECT emp_id ���, emp_name �̸� FROM temp
 WHERE salary = (SELECT max(salary) FROM temp)


2.temp�� �ڷḦ �̿��Ͽ� salary�� ����� ���ϰ� �̺��� ū �ݾ��� salary��
�޴� ������ ����� ����, ������ �����ֽÿ�.

SELECT * FROM temp

SELECT AVG(salary) FROM temp

SELECT emp_id ���, emp_name ����, salary ����
  FROM temp
 WHERE salary > (SELECT AVG(salary) FROM temp)


3.temp�� ���� �� ��õ�� �ٹ��ϴ� ������ ����� ������ �о���� SQL�� ����
������ �̿��� �����ÿ�.

SELECT * FROM temp

SELECT * FROM tdept

SELECT * FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code

SELECT dept_name FROM tdept
 WHERE area = '��õ' 
 
SELECT a.emp_id, a.emp_name FORM temp a, tdept b
INNER JOIN tdept b 
ON a.dept_code = b.dept_code
WHERE b.area = '��õ'

SELECT emp_id ���, emp_name ���� FROM temp
 WHERE dept_code = 
 (SELECT dept_code FROM tdept WHERE area = '��õ')


SELECT emp_id ���, emp_name ���� FROM temp
 WHERE dept_code IN 
 (SELECT dept_code FROM tdept WHERE area = '��õ')

4.tcom�� ���� �ܿ� Ŀ�̼��� �޴� ������ ����� �����Ǿ� �ִ�.
�� ������ ���������� select�Ͽ� �μ� ��Ī���� Ŀ�̼��� �޴�
�ο����� ���� ������ ����� ���ÿ�.

SELECT * FROM temp

SELECT * FROM tcom

SELECT * FROM tdept

SELECT count(emp_id) FROM tcom

SELECT emp_id
  FROM temp
 WHERE emp_id IN(SELECT emp_id FROM tcom)

SELECT count(emp_id), dept_code
  FROM temp
 WHERE emp_id IN(SELECT emp_id FROM tcom)
GROUP BY dept_code

SELECT count(emp_id), dept_name
  FROM temp
 WHERE emp_id IN(SELECT emp_id FROM tcom)
GROUP BY dept_name


SELECT count(emp_id), dept_name
  FROM temp, tdept
 WHERE emp_id IN(SELECT emp_id FROM tcom)
   AND temp.dept_code = tdept.dept_code
GROUP BY dept_name
