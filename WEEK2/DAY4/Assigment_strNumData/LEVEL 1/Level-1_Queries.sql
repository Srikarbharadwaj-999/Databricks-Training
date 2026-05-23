
-- QUERY 11
SELECT 
    LOWER(emp_name) AS emp_name,
    ROUND(salary,2) AS rounded_salary,
    TRUNCATE(salary,2) AS truncated_salary,
    ABS(ROUND(salary,2) - TRUNCATE(salary,2)) AS precision_difference,
    MONTHNAME(revision_date) AS revision_month,
    CASE 
        WHEN ABS(ROUND(salary,2) - TRUNCATE(salary,2)) > 0
        THEN 'PRECISION LOSS'
        ELSE 'STABLE'
    END AS precision_check
FROM salary_precision;


-- QUERY 12
SELECT 
    UPPER(emp_name) AS emp_name,
    POWER((1 + growth_rate/100), years_projected) * current_salary AS future_salary,
    
    ROUND(
        POWER((1 + growth_rate/100), years_projected) * current_salary,
        2
    ) AS rounded_projection,
    
    growth_rate AS growth_percentage,
    
    CASE 
        WHEN ((POWER((1 + growth_rate/100), years_projected) - 1) * 100) > 50 
            THEN 'RAPID GROWTH'
            
        WHEN ((POWER((1 + growth_rate/100), years_projected) - 1) * 100) 
             BETWEEN 20 AND 50 
            THEN 'MODERATE'
            
        ELSE 'STABLE'
    END AS growth_status

FROM salary_growth;


-- QUERY 13
SELECT 
    LOWER(emp_name) AS emp_name,
    salary AS original_salary,
    
    REVERSE(CAST(salary AS CHAR)) AS reverse_salary,
    
    DAYNAME(check_date) AS check_day,
    
    CASE 
        WHEN CAST(salary AS CHAR) = REVERSE(CAST(salary AS CHAR))
            THEN 'Symmetric'
        ELSE 'Non-Symmetric'
    END AS symmetry_status

FROM salary_symmetry;


-- QUERY 14
SELECT 
    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS employee_name,

    ROUND(salary) AS rounded_salary,

    DAYNAME(payment_date) AS day_name,

    YEAR(payment_date) AS payment_year,

    CASE 
        WHEN YEAR(payment_date)%4 = 0 
             AND YEAR(payment_date)%100 != 0
            THEN 'Leap Year Payment'
        ELSE 'Normal Payment'
    END AS leap_status

FROM leap_salary;


-- QUERY 15
SELECT 
    UPPER(emp_name) AS emp_name,

    DATEDIFF(actual_credit, expected_credit) AS delay_days,

    ROUND(salary) AS rounded_salary,

    DAYNAME(actual_credit) AS credit_day,

    CASE 
        WHEN DATEDIFF(actual_credit, expected_credit) > 5 
            THEN 'SEVERE DELAY'

        WHEN DATEDIFF(actual_credit, expected_credit) BETWEEN 1 AND 5 
            THEN 'MINOR DELAY'

        ELSE 'ON TIME'
    END AS delay_status

FROM salary_credit_audit;


-- QUERY 16
SELECT 
    LOWER(emp_name) AS emp_name,

    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        current_date_check
    ) AS experience_years,

    ROUND(salary) AS rounded_salary,

    DATEDIFF(current_date_check, joining_date) AS total_days,

    CASE 
        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                current_date_check
             ) > 10
            THEN 'VETERAN'

        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                current_date_check
             ) BETWEEN 5 AND 10
            THEN 'EXPERIENCED'

        ELSE 'FRESHER'
    END AS experience_status

FROM salary_time_drift;


-- QUERY 17
SELECT 
    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS emp_name,

    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        CURDATE()
    ) AS actual_experience,

    ABS(
        declared_experience -
        TIMESTAMPDIFF(
            YEAR,
            joining_date,
            CURDATE()
        )
    ) AS experience_diff,

    FLOOR(salary) AS floor_salary,

    CASE 
        WHEN declared_experience >
             TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
            THEN 'OVERSTATED'

        WHEN declared_experience <
             TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
            THEN 'UNDERSTATED'

        ELSE 'MATCHED'
    END AS experience_status

FROM employee_experience;


-- QUERY 18
SELECT 
    UPPER(emp_name) AS emp_name,

    salary + IFNULL(bonus,0) AS total_compensation,

    IFNULL(bonus,0) AS bonus_amount,

    MONTHNAME(salary_date) AS salary_month,

    CASE 
        WHEN bonus IS NULL 
            THEN 'MISSING BONUS'

        WHEN (salary + IFNULL(bonus,0)) > 90000 
            THEN 'HIGH COMPENSATION'

        ELSE 'STANDARD'
    END AS compensation_status

FROM salary_integrity;


-- QUERY 19
SELECT 
    LEFT(emp_name,3) AS first_three,

    YEAR(joining_date) AS join_year,

    ROUND(salary) AS salary_rounded,

    MOD(ROUND(salary),10) AS last_digit,

    CASE 
        WHEN MOD(ROUND(salary),10) =
             MOD(YEAR(joining_date),10)

            THEN 'ENCODE MATCH'

        ELSE 'MISMATCH'
    END AS encoding_status

FROM name_salary;


-- QUERY 20
SELECT 
    LOWER(emp_name) AS emp_name,

    ROUND(annual_salary/12,2) AS monthly_salary,

    MONTHNAME(payment_month) AS month_name,

    CEIL(annual_salary/12) AS ceiling_salary,

    CASE 
        WHEN annual_salary/12 >= 100000
            THEN 'PREMIUM'

        WHEN annual_salary/12 BETWEEN 50000 AND 99999
            THEN 'MID RANGE'

        ELSE 'BASIC'
    END AS salary_status

FROM salary_monthly;


-- QUERY 21
SELECT 
    UPPER(emp_name) AS emp_name,

    TRUNCATE(salary,0) AS truncated_salary,

    MOD(TRUNCATE(salary,0),10) AS last_digit,

    DAY(audit_date) AS audit_day,

    CASE 
        WHEN MOD(TRUNCATE(salary,0),10) = DAY(audit_date)
            THEN 'DIGIT MATCH'

        ELSE 'DIGIT MISMATCH'
    END AS digit_status

FROM digit_audit;


-- QUERY 22
SELECT 
    UPPER(emp_name) AS emp_name,

    DATEDIFF(actual_credit, expected_credit) AS delay_days,

    ROUND(salary) AS salary,

    DAYNAME(actual_credit) AS credit_day,

    CASE 
        WHEN DATEDIFF(actual_credit, expected_credit) > 5
            THEN 'SEVERE DELAY'

        WHEN DATEDIFF(actual_credit, expected_credit) BETWEEN 1 AND 5
            THEN 'MINOR DELAY'

        ELSE 'ON TIME'
    END AS status

FROM salary_credit_audit;


-- QUERY 23
SELECT 
    LOWER(emp_name) AS emp_name,

    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        current_date_check
    ) AS experience,

    ROUND(salary) AS salary,

    DATEDIFF(current_date_check, joining_date) AS total_days,

    CASE 
        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                current_date_check
             ) > 10
            THEN 'VETERAN'

        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                current_date_check
             ) BETWEEN 5 AND 10
            THEN 'EXPERIENCED'

        ELSE 'FRESHER'
    END AS status

FROM salary_time_drift;


-- QUERY 24
SELECT 
    UPPER(emp_name) AS emp_name,

    ROUND(salary,2) AS salary,

    MONTHNAME(revision_date) AS revision_month,

    ABS(
        ROUND(salary,2) -
        TRUNCATE(salary,2)
    ) AS diff,

    CASE 
        WHEN ABS(
                ROUND(salary,2) -
                TRUNCATE(salary,2)
             ) > 0
            THEN 'LOSS'

        ELSE 'STABLE'
    END AS status

FROM salary_precision;


-- QUERY 25
SELECT 
    UPPER(emp_name) AS emp_name,

    POWER(
        (1 + growth_rate/100),
        years_projected
    ) * current_salary AS future_salary,

    ROUND(
        POWER(
            (1 + growth_rate/100),
            years_projected
        ) * current_salary,
        2
    ) AS rounded_projection,

    CASE 
        WHEN growth_rate > 10
            THEN 'HIGH'
        ELSE 'LOW'
    END AS status

FROM salary_growth;


-- QUERY 26
SELECT 
    LOWER(emp_name) AS emp_name,

    REVERSE(CAST(salary AS CHAR)) AS reversed_salary,

    CASE 
        WHEN CAST(salary AS CHAR) =
             REVERSE(CAST(salary AS CHAR))
            THEN 'YES'

        ELSE 'NO'
    END AS status

FROM salary_symmetry;


-- QUERY 27
SELECT 
    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS emp_name,

    CASE 
        WHEN YEAR(payment_date)%4 = 0
            THEN 'LEAP'

        ELSE 'NORMAL'
    END AS leap_status

FROM leap_salary;


-- QUERY 28
SELECT 
    UPPER(emp_name) AS emp_name,

    DATEDIFF(
        actual_credit,
        expected_credit
    ) AS delay_days,

    CASE 
        WHEN DATEDIFF(
                actual_credit,
                expected_credit
             ) > 5
            THEN 'SEVERE'

        ELSE 'OK'
    END AS status

FROM salary_credit_audit;


-- QUERY 29
SELECT 
    UPPER(emp_name) AS emp_name,

    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        current_date_check
    ) AS experience_years,

    CASE 
        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                current_date_check
             ) > 10
            THEN 'VETERAN'

        ELSE 'FRESHER'
    END AS status

FROM salary_time_drift;


-- QUERY 30
SELECT 
    LOWER(emp_name) AS emp_name,

    ROUND(salary) AS rounded_salary,

    CASE 
        WHEN MOD(ROUND(salary),10) = 0
            THEN 'MATCH'

        ELSE 'NO MATCH'
    END AS status

FROM digit_audit;
