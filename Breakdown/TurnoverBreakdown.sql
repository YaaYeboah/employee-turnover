SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
 USE employees;
 


/* Create our dept_emp table with no emp_no duplicates*/
DROP TABLE IF EXISTS dept_emp1;
CREATE TABLE dept_emp1 (
    emp_no INT,
    dept_no VARCHAR(255),
    from_date DATE,
    to_date DATE
);
INSERT INTO dept_emp1
SELECT emp_no,dept_no,max(from_date),max(to_date) FROM dept_emp
GROUP BY emp_no;

/* Create our titles table with no emp_no duplicates*/
DROP TABLE IF EXISTS titles1;
CREATE TABLE titles1 (
    emp_no INT,
    title VARCHAR(255),
    from_date DATE,
    to_date DATE
);
INSERT INTO titles1
SELECT emp_no,title,max(from_date),max(to_date) FROM titles
GROUP BY emp_no;

/* Turnover Breakdown Results Table */

/* separations table */
DROP TABLE IF EXISTS separations;
CREATE TABLE separations (
    Separations INT,
    Department VARCHAR(255),
    Title VARCHAR(255),
    Gender ENUM('F', 'M')
);
INSERT INTO separations
    SELECT 
        COUNT(de.emp_no) AS separations,
            d.dept_name,
            t.title,
            e.gender
    FROM
        employees e
    JOIN dept_emp1 de ON de.emp_no = e.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    JOIN titles1 t ON t.emp_no = e.emp_no
    WHERE
        de.to_date BETWEEN '1986-01-01' AND '1986-12-31'
    GROUP BY d.dept_name , t.title , e.gender;
    
    /*Hires table */
    DROP TABLE IF EXISTS hires;
CREATE TABLE hires (
    Hires INT,
    Department VARCHAR(255),
    Title VARCHAR(255),
    Gender ENUM('F', 'M')
);
INSERT INTO hires
   SELECT 
        COUNT(e.emp_no) AS hires, d.dept_name, t.title, e.gender
    FROM
        employees e
    JOIN dept_emp1 de ON de.emp_no = e.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    JOIN titles1 t ON t.emp_no = e.emp_no
    WHERE
        e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
    GROUP BY d.dept_name , t.title , e.gender;
        
        
        

/* Separations in the previous year */
SELECT 
    COUNT(emp_no)
FROM
    dept_emp
WHERE
    to_date BETWEEN '1985-01-01' AND '1985-12-31';
    
    /* Hires in the previous year */
SELECT 
    COUNT(emp_no)
FROM
    employees
WHERE
    hire_date BETWEEN '1985-01-01' AND '1985-12-31';
    
   
    
