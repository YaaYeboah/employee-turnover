/* Number of separations*/
SELECT sum(Separations) as Number_of_separations from separations;

/*Previous year information*/
SELECT c.hires-d.separations as total_employees_previous_year from(
-- hires in 1985
(SELECT count(emp_no)as hires FROM employees where year(hire_date)=1985)c,

-- separations in 1985
(SELECT count(emp_no) as separations FROM dept_emp WHERE year(to_date)=1985)d
);

-- Employees at the beginning of current year
-- hires on Jan 1 1986
SELECT count(emp_no)as hires_jan1 FROM employees where hire_date='1986-01-01';
-- separations on Jan 1 1986
SELECT count(emp_no)as separation_jan1 FROM dept_emp where to_date='1986-01-01';

SELECT 35140+80-1 as employee_beg;


-- Employees at the end of the current year
-- hires between jan2 and dec 31
SELECT count(emp_no)as hires_between FROM employees where hire_date BETWEEN '1986-01-02' AND '1986-12-31';
-- separations between jan2 and dec 31
SELECT count(emp_no)as separations_between FROM dept_emp where to_date BETWEEN '1986-01-02' AND '1986-12-31';

SELECT 35149+36070-649 as employee_end;


Select 374 as separations,35219 as employees_beginning,70570 as employees_end;




/* Previous Year Turnover*/


SELECT count(emp_no)as hires_jan1 FROM employees where hire_date='1985-01-01';

SELECT count(emp_no)as separation_jan1 FROM dept_emp where to_date='1985-01-01';

-- 176 separations
-- 9 hires jan 1
-- o separations jan 1
-- 35316-9 hires between
-- 176 separations between

SELECT 176 as separations,9 as beginning, 35140 as end

