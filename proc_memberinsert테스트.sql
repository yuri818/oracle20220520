variable result number;
exec proc_memberinsert('nice','123','이순신','12342','주소임', :result);
print result;