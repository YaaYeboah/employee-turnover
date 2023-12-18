/* q3 - July 1st - september 30th*/
-- separations in q3 =100
select  count(de.emp_no) as separated from dept_emp1 de
where de.to_date between '1986-07-01' and '1986-09-30';

-- Employees beginning of q3
   -- employees end of q2
   -- hires on july 1 =97
select count(emp_no) from employees where hire_date ='1986-07-01';
-- separations on july 1=1
select count(emp_no) from dept_emp1 where to_date ='1986-07-01';


-- Employees end of q3
  -- employees beg of q3
  -- hires from july 2nd until september 30=9000
  select count(emp_no) from employees where hire_date between '1986-07-02' and  '1986-09-30';
  -- separations from july 2nd yo september 30=99
select count(emp_no) from dept_emp1 where to_date between '1986-07-02' and  '1986-09-30';


drop table if exists Q3;
create table Q3 (total_separated int,q3_beginning int,q3_end int);
insert into Q3
select total_separations.separated,53023+ beghires.a-begseparations.b as q3_beginning,53023 + beghires.a-begseparations.b+hiresbet.c-sepbetween.d as q3_end from
(
(select  count(de.emp_no) as separated from dept_emp1 de
where de.to_date between '1986-07-01' and '1986-09-30') as total_separations,
(select count(emp_no) as a from employees where hire_date ='1986-07-01')as beghires,
(select count(emp_no) as b from dept_emp1 where to_date ='1986-07-01')as begseparations,
(select count(emp_no) as c from employees where hire_date between '1986-07-02' and  '1986-09-30') as hiresbet,
(select count(emp_no) as d from dept_emp1 where to_date between '1986-07-02' and  '1986-09-30')as sepbetween
);