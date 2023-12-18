use employees;
drop table if exists separations_and_hires;
CREATE TABLE separations_and_hires (
    Year INT,
    dept_name VARCHAR(255),
    Gender ENUM('M', 'F'),
    title VARCHAR(255),
    Hires INT,
    Separations INT,
    remainder INT
);
insert into separations_and_hires
select p1.year,p1.dept_name,p1.gender,p1.title,p2.new_hires,p1.employees,p2.new_hires-p1.employees from
(
-- separations
(select year(de.to_date)as year ,d.dept_name,e.gender,t.title,count(de.emp_no)as employees
from dept_emp1 de 
left join departments d on de.dept_no=d.dept_no
left join employees e on e.emp_no=de.emp_no and year(e.hire_date)= year(de.from_date) 
left join titles1 t on t.emp_no=de.emp_no and year(t.from_date) =year(e.hire_date)
-- where  year(e.hire_date)= year(de.from_date) and year(t.from_date) =year(e.hire_date)
group by year(de.to_date),d.dept_name,e.gender,t.title
order by year(de.to_date)) as p1,


-- hires 

(select year(e.hire_date) as year,d.dept_name,e.gender,t.title,count(e.emp_no)as new_hires
from employees e 
join dept_emp1 de on de.emp_no=e.emp_no 
join departments d on d.dept_no=de.dept_no
join titles1 t on t.emp_no=e.emp_no 
where  year(e.hire_date)= year(de.from_date) and year(t.from_date) =year(e.hire_date)
group by year(e.hire_date),d.dept_name,e.gender,t.title
) as p2
)
where p1.year=p2.year and  p1.gender=p2.gender and p1.dept_name=p2.dept_name and p1.title=p2.title
-- group by p1.year,p2.year,p1.gender,p2.gender,p1.dept_name,p2.dept_name,p1.title,p2.title;