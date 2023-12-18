--  at end of q1
-- separations in q2 =71
select  count(de.emp_no) as separated from dept_emp1 de
where de.to_date between '1986-04-01' and '1986-06-30';

/* number of employees @ the beginning of q2*/
-- 44063 employees at the end of q1
-- hires on 1986-04-01 =90
select count(emp_no) from employees where hire_date ='1986-04-01';
-- separations on 1986-04-01 =0
select count(emp_no) from dept_emp1 where to_date ='1986-04-01';

/*number of employees @ the end of q2*/
-- employees on april 1st=
-- hires from april 2 til june 30 =8941
select count(emp_no) from employees where hire_date between '1986-04-02' and  '1986-06-30';
-- separations from april 2 until june 30 =71
select count(emp_no) from dept_emp1 where to_date between '1986-04-02' and  '1986-06-30';

drop table if exists Q2;
create table Q2 (total_separated int,q2_beginning int,q2_end int);
insert into Q2
select total_separations.separated,44063 + beghires.a-begseparations.b as q2_beginning,44063 + beghires.a-begseparations.b + hiresbet.c-sepbetween.d as q2_end from
(
(select  count(de.emp_no) as separated from dept_emp1 de
where de.to_date between '1986-04-01' and '1986-06-30') as total_separations,
(select count(emp_no) as a from employees where hire_date ='1986-04-01')as beghires,
(select count(emp_no) as b from dept_emp1 where to_date ='1986-04-01')as begseparations,
(select count(emp_no) as c from employees where hire_date between '1986-04-02' and  '1986-06-30') as hiresbet,
(select count(emp_no) as d from dept_emp1 where to_date between '1986-04-02' and  '1986-06-30')as sepbetween
);