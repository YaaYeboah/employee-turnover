SELECT 
    t1.dept_name,
    t6.separated,
    t1.previous_data + t2.hired - t3.separated AS employees_beginning,
    t1.previous_data + t2.hired - t3.separated + t4.hires_between - t5.separations_between AS employees_end
FROM
    ((SELECT 
        d.dept_name, COUNT(e.emp_no) AS separated
    FROM
        departments d
    JOIN dept_emp1 de ON de.dept_no = d.dept_no
    JOIN employees e ON e.emp_no = de.emp_no
    WHERE
        to_date >= '1986-01-01'
            AND YEAR(de.to_date) = 1986
    GROUP BY d.dept_name) AS t6, (SELECT 
        sh1.dept_name, SUM(sh1.remainder) AS previous_data
    FROM
        separations_and_hires sh1
    WHERE
        sh1.year = '1985'
    GROUP BY sh1.dept_name) AS t1, (SELECT 
        d.dept_name, COUNT(e.emp_no) AS hired
    FROM
        departments d
    JOIN dept_emp1 de ON de.dept_no = d.dept_no
    JOIN employees e ON e.emp_no = de.emp_no
    WHERE
        e.hire_date = '1986-01-01'
    GROUP BY d.dept_name) AS t2, (SELECT 
        d.dept_name, COUNT(de.emp_no) AS separated
    FROM
        departments d
    LEFT JOIN dept_emp1 de ON de.dept_no = d.dept_no
        AND de.to_date = '1986-01-01'
    GROUP BY d.dept_name) AS t3, (SELECT 
        d.dept_name, COUNT(e.emp_no) AS hires_between
    FROM
        departments d
    JOIN dept_emp1 de ON de.dept_no = d.dept_no
    JOIN employees e ON e.emp_no = de.emp_no
    WHERE
        e.hire_date BETWEEN '1986-01-02' AND '1986-12-31'
    GROUP BY d.dept_name) AS t4, (SELECT 
        d.dept_name, COUNT(de.emp_no) AS separations_between
    FROM
        departments d
    JOIN dept_emp de ON de.dept_no = d.dept_no
    WHERE
        de.to_date BETWEEN '1986-01-02' AND '1986-12-31'
    GROUP BY d.dept_name) AS t5)
WHERE
    t1.dept_name = t2.dept_name
        AND t1.dept_name = t3.dept_name
        AND t1.dept_name = t4.dept_name
        AND t1.dept_name = t5.dept_name
        AND t1.dept_name = t6.dept_name;






