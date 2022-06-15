SELECT * FROM member

프로시저 - 전체 목록 조회

CREATE OR REPLACE PROCEDURE proc_dept_list(p_dept OUT SYS_REFCURSOR)
IS
BEGIN
    --실행문
    OPEN p_dept
     FOR SELECT deptno, dname, loc FROM dept;
END;


CREATE OR REPLACE PROCEDURE proc_sal(v_ename IN varchar2, v_sal OUT number)
IS
BEGIN
  SELECT sal into v_sal
    FROM emp
   WHERE ename = v_ename;
END;