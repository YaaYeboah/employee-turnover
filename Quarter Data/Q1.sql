-- separations in q1=76
SELECT 
    COUNT(de.emp_no) AS separated
FROM
    dept_emp1 de
WHERE
    de.to_date <= '1986-03-31'
        AND YEAR(de.to_date) = 1986;
-- number of employees beginning of q1 ='35140'

SELECT 
    COUNT(emp_no)
FROM
    employees
WHERE
    hire_date BETWEEN '1986-01-02' AND '1986-03-31';

/* number of people who left since jan 1 until march 30th =76 */
SELECT 
    COUNT(emp_no)
FROM
    dept_emp1
WHERE
    to_date BETWEEN '1986-01-02' AND '1986-03-31';

-- number of employees at the end q1 =35140+8999-76=44063

drop table if exists Q1;
CREATE TABLE Q1 (
    total_separated INT,
    q1_beginning INT,
    q1_end INT
);
insert into Q1
select total_separations.separated,35140,35140 + hires.a-separations.b as q1_end from
(
(select  count(de.emp_no) as separated from dept_emp1 de
where de.to_date <='1986-03-31' and year(de.to_date)=1986) as total_separations,
(select count(emp_no) as a from employees where hire_date between '1986-01-02' and  '1986-03-31')as hires,
(select count(emp_no) as b from dept_emp1 where to_date between '1986-01-02' and  '1986-03-31')as separations
);

