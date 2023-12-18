use employees;
drop table if exists dept_emp_dup;
create table dept_emp_dup (emp_no int, dept_no varchar(255), from_date date, to_date date);
insert into dept_emp_dup
select * from dept_emp1;