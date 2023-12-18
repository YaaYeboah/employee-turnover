SELECT 
    *
FROM
    employees.titles1;
SELECT 
    *
FROM
    titles
WHERE
    to_date = '1986-01-01';

-- t1.previous_data+t2.hired-t3.separated as employees_beginning,
-- t1.previous_data+t2.hired-t3.separated+t4.hires_between-t5.separations_between as employees_end



SELECT 
    t1.title,
    t1.total_separations,
    t2.previous_data + t3.hiredjan1 AS beginning,
    t2.previous_data + t3.hiredjan1 + t5.hiredbetween - t6.sepbetween AS end_employees
FROM
    ((SELECT 
        t.title, COUNT(t.emp_no) AS total_separations
    FROM
        titles1 t
    WHERE
        t.to_date BETWEEN '1986-01-01' AND '1986-12-31'
    GROUP BY t.title) AS t1, (SELECT 
        title, SUM(remainder) AS previous_data
    FROM
        separations_and_hires
    WHERE
        Year = 1985
    GROUP BY title) AS t2, (SELECT 
        t.title, COUNT(e.emp_no) AS hiredjan1
    FROM
        titles1 t
    JOIN employees e ON e.emp_no = t.emp_no
    WHERE
        e.hire_date = '1986-01-01'
    GROUP BY t.title) AS t3, (SELECT 
        t.title, COUNT(e.emp_no) AS hiredbetween
    FROM
        titles1 t
    JOIN employees e ON e.emp_no = t.emp_no
    WHERE
        e.hire_date BETWEEN '1986-01-02' AND '1986-12-31'
    GROUP BY t.title) AS t5, (SELECT 
        title, COUNT(emp_no) AS sepbetween
    FROM
        titles1
    WHERE
        to_date BETWEEN '1986-01-02' AND '1986-12-31'
    GROUP BY title) AS t6)
WHERE
    t1.title = t2.title
        AND t1.title = t3.title
        AND t1.title = t5.title
        AND t1.title = t6.title;



