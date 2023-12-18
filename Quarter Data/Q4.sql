-- separations in q4=127
select  count(de.emp_no) as separated from dept_emp1 de
where de.to_date between '1986-10-01' and '1986-12-31';

-- Employees at the beginning of the quarter
 -- employees at the end of q3
 -- hires on october 1 =91
 select count(emp_no) from employees where hire_date ='1986-10-01';
 -- separations on october 1=2
 select count(emp_no) from dept_emp1 where to_date ='1986-10-01';
 
 -- Employees at the end of the quarter
 -- employees at the beginning of the quarter
 -- hires from october 2nd til december 31=8852
select count(emp_no) from employees where hire_date between '1986-10-02' and  '1986-12-31';
-- separations from october 2nd til december 31=125
select count(emp_no) from dept_emp1 where to_date between '1986-10-02' and  '1986-12-31';
 
 
 drop table if exists Q4;
create table Q4 (total_separated int,q4_beginning int,q4_end int);
insert into Q4
select total_separations.separated,62020+ beghires.a-begseparations.b as q4_beginning,62020 + beghires.a-begseparations.b + hiresbet.c-sepbetween.d as q4_end from
(
(select  count(de.emp_no) as separated from dept_emp1 de
where de.to_date between '1986-10-01' and '1986-12-31') as total_separations,
( select count(emp_no) as a from employees where hire_date ='1986-10-01')as beghires,
( select count(emp_no) as b from dept_emp1 where to_date ='1986-10-01')as begseparations,
(select count(emp_no) as c from employees where hire_date between '1986-10-02' and  '1986-12-31') as hiresbet,
(select count(emp_no) as d from dept_emp1 where to_date between '1986-10-02' and  '1986-12-31')as sepbetween
);

drop table if exists quarters;
create table quarters (qid int auto_increment primary key,separated int,employee_count_start int,employee_count_end int);
insert into quarters(separated,employee_count_start,employee_count_end)
select * from Q1 union select * from Q2 union select * from Q3 union select * from Q4;

