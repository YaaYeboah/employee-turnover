SELECT *, 
case 
when emp_no=1 then 'Poor compensation'
when emp_no=2 then 'Poor performance'
when emp_no=3 then 'Career change'
when emp_no=4 then 'Unhappy'
when emp_no=5 then 'Retiring'
when emp_no=6 then 'Attendance/Other misconduct'
when emp_no=7 then 'Maternity leave- Did not return'
when emp_no=8 then 'Relocation'
when emp_no=9 then 'Return to school'
when emp_no=10 then 'Layoffs'
end as reasons,
case
when emp_no=1 then 'Voluntary'
when emp_no=2 then 'Involuntary'
when emp_no=3 then 'Voluntary'
when emp_no=4 then 'Voluntary'
when emp_no=5 then 'Voluntary'
when emp_no=6 then 'Involuntary'
when emp_no=7 then 'Voluntary'
when emp_no=8 then 'Voluntary'
when emp_no=9 then 'Voluntary'
when emp_no=10 then 'Involuntary'
end as turnover_type
 FROM employees.dept_emp_dup1
 where year(to_date)=1986;