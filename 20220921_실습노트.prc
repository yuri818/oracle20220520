variable rc_dept REFCURSOR;
exec proc_deptlist(20, :rc_dept);
print rc_dept;


variable rc_board REFCURSOR;
exec proc_boardlist(:rc_board);
print rc_board;