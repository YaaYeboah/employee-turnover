use employees;
drop table if exists dept_emp_dup1;
CREATE TABLE dept_emp_dup1 (
    emp_no INT,
    dept_no VARCHAR(255),
    from_date DATE,
    to_date DATE
);
insert into dept_emp_dup1
select * from dept_emp1;

SET SQL_SAFE_UPDATES = 0;
UPDATE dept_emp_dup1 
SET 
    emp_no = FLOOR(1 + RAND() * 10);
SET SQL_SAFE_UPDATES = 1;

