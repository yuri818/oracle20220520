서브쿼리 연습문제

1.temp에서 연봉이 가장 많은 직원의 row를 찾아서 이 금액과 동일한 금액을
받는 직원의 사번과 성명을 출력하시오.

SELECT * FROM temp

SELECT max(salary) FROM temp 


SELECT emp_id 사번, emp_name 이름 FROM temp

SELECT emp_id 사번, emp_name 이름 FROM temp
 WHERE salary = (SELECT max(salary) FROM temp)


2.temp의 자료를 이용하여 salary의 평균을 구하고 이보다 큰 금액을 salary로
받는 직원의 사번과 성명, 연봉을 보여주시오.

SELECT * FROM temp

SELECT AVG(salary) FROM temp

SELECT emp_id 사번, emp_name 성명, salary 연봉
  FROM temp
 WHERE salary > (SELECT AVG(salary) FROM temp)


3.temp의 직원 중 인천에 근무하는 직원의 사번과 성명을 읽어오는 SQL을 서브
쿼리를 이용해 만들어보시오.

SELECT * FROM temp

SELECT * FROM tdept

SELECT * FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code

SELECT dept_name FROM tdept
 WHERE area = '인천' 
 
SELECT a.emp_id, a.emp_name FORM temp a, tdept b
INNER JOIN tdept b 
ON a.dept_code = b.dept_code
WHERE b.area = '인천'

SELECT emp_id 사번, emp_name 성명 FROM temp
 WHERE dept_code = 
 (SELECT dept_code FROM tdept WHERE area = '인천')


SELECT emp_id 사번, emp_name 성명 FROM temp
 WHERE dept_code IN 
 (SELECT dept_code FROM tdept WHERE area = '인천')

4.tcom에 연봉 외에 커미션을 받는 직원의 사번이 보관되어 있다.
이 정보를 서브쿼리로 select하여 부서 명칭별로 커미션을 받는
인원수를 세는 문장을 만들어 보시오.

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
