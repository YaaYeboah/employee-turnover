SELECT 
    DATE_FORMAT(from_date, '%Y%m') AS from_date,
    DATE_FORMAT(to_date, '%Y%m') AS to_date,
    PERIOD_DIFF((DATE_FORMAT(to_date, '%Y%m')),
            (DATE_FORMAT(from_date, '%Y%m'))) AS duration,
    CASE
        WHEN
            PERIOD_DIFF((DATE_FORMAT(to_date, '%Y%m')),
                    (DATE_FORMAT(from_date, '%Y%m'))) BETWEEN 0 AND 4
        THEN
            '4 months or less'
        WHEN
            PERIOD_DIFF((DATE_FORMAT(to_date, '%Y%m')),
                    (DATE_FORMAT(from_date, '%Y%m'))) BETWEEN 5 AND 9
        THEN
            '5-9  months '
        WHEN
            PERIOD_DIFF((DATE_FORMAT(to_date, '%Y%m')),
                    (DATE_FORMAT(from_date, '%Y%m'))) BETWEEN 10 AND 14
        THEN
            '10-14  months '
        WHEN
            PERIOD_DIFF((DATE_FORMAT(to_date, '%Y%m')),
                    (DATE_FORMAT(from_date, '%Y%m'))) BETWEEN 15 AND 19
        THEN
            '15-19  months '
        WHEN
            PERIOD_DIFF((DATE_FORMAT(to_date, '%Y%m')),
                    (DATE_FORMAT(from_date, '%Y%m'))) BETWEEN 20 AND 24
        THEN
            '20-24  months '
    END AS bucket
FROM
    dept_emp1
WHERE
    YEAR(to_date) = 1986;
 
 