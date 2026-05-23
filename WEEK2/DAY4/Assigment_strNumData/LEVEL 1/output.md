**Schema (MySQL v9)**

    -- SCHEMA 11
    CREATE TABLE salary_audit (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        tax_percent DECIMAL(5,2),
        last_revision DATE
    );
    
    INSERT INTO salary_audit VALUES
    (1,'karthik',75000.75,10.5,'2022-01-15'),
    (2,'veena',65000.40,18.0,'2023-06-01'),
    (3,'ravi',85000.90,25.0,'2020-11-20');
    
    -- SCHEMA 12
    CREATE TABLE bonus_monitor (
        emp_code INT,
        emp_name VARCHAR(50),
        base_salary DECIMAL(10,2),
        bonus DECIMAL(10,2),
        bonus_date DATE
    );
    
    INSERT INTO bonus_monitor VALUES
    (101,'Anil',70000.10,30000.00,'2025-01-10'),
    (102,'Suresh',60000.55,3000.30,'2024-03-15'),
    (103,'Ravi',85000.90,15000.75,'2023-12-01');
    
    -- SCHEMA 13
    CREATE TABLE employee_experience (
        emp_id INT,
        emp_name VARCHAR(50),
        joining_date DATE,
        declared_experience INT,
        salary DECIMAL(10,2)
    );
    
    INSERT INTO employee_experience VALUES
    (1,'Veena','2018-07-01',4,65000.40),
    (2,'Ravi','2014-01-10',12,85000.90),
    (3,'Anil','2020-09-01',3,70000.10);
    
    -- SCHEMA 14
    CREATE TABLE salary_digits (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        credit_date DATE
    );
    
    INSERT INTO salary_digits VALUES
    (1,'Karthik',75000.75,'2025-01-01'),
    (2,'Veena',65000.40,'2025-01-02'),
    (3,'Suresh',60000.55,'2025-01-03');
    
    -- SCHEMA 15
    CREATE TABLE payroll_control (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        payment_date DATE
    );
    
    INSERT INTO payroll_control VALUES
    (1,'Ravi',85000.90,'2025-01-15'),
    (2,'Anil',70000.10,'2025-01-16'),
    (3,'Veena',65000.40,'2025-01-17');
    
    -- SCHEMA 16
    CREATE TABLE inflation_watch (
        product_id INT,
        product_name VARCHAR(50),
        old_price DECIMAL(10,2),
        new_price DECIMAL(10,2),
        update_date DATE
    );
    
    INSERT INTO inflation_watch VALUES
    (1,'Rice',1200.50,1450.75,'2025-01-10'),
    (2,'Oil',950.40,960.25,'2025-01-12'),
    (3,'Sugar',800.90,1100.60,'2025-01-15');
    
    -- SCHEMA 17
    CREATE TABLE salary_integrity (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        bonus DECIMAL(10,2),
        salary_date DATE
    );
    
    INSERT INTO salary_integrity VALUES
    (1,'Ravi',85000.90,5000.25,'2025-01-01'),
    (2,'Anil',70000.10,NULL,'2025-01-02'),
    (3,'Veena',65000.40,4000.50,'2025-01-03');
    
    -- SCHEMA 18
    CREATE TABLE name_salary (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        joining_date DATE
    );
    
    INSERT INTO name_salary VALUES
    (1,'Karthik',75000.75,'2020-01-01'),
    (2,'Ravi',85000.90,'2019-05-15'),
    (3,'Veena',65000.40,'2021-08-10');
    
    -- SCHEMA 19
    CREATE TABLE salary_monthly (
        emp_id INT,
        emp_name VARCHAR(50),
        annual_salary DECIMAL(12,2),
        payment_month DATE
    );
    
    INSERT INTO salary_monthly VALUES
    (1,'Ravi',1200000.00,'2025-01-01'),
    (2,'Anil',840000.00,'2025-02-01'),
    (3,'Veena',600000.00,'2025-03-01');
    
    -- SCHEMA 20
    CREATE TABLE digit_audit (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        audit_date DATE
    );
    
    INSERT INTO digit_audit VALUES
    (1,'Karthik',75000.75,'2025-01-01'),
    (2,'Veena',65007.40,'2025-01-02'),
    (3,'Ravi',85009.90,'2025-01-03');
    -- SCHEMA 21
    CREATE TABLE salary_credit_audit (
        emp_id INT,
        emp_name VARCHAR(50),
        expected_credit DATE,
        actual_credit DATE,
        salary DECIMAL(10,2)
    );
    
    INSERT INTO salary_credit_audit VALUES
    (1,'Ravi','2025-01-01','2025-01-03',85000.90),
    (2,'Veena','2025-01-01','2025-01-01',65000.40),
    (3,'Anil','2025-01-01','2025-01-08',70000.10);
    
    -- SCHEMA 22
    CREATE TABLE salary_time_drift (
        emp_id INT,
        emp_name VARCHAR(50),
        joining_date DATE,
        salary DECIMAL(10,2),
        current_date_check DATE
    );
    
    INSERT INTO salary_time_drift VALUES
    (1,'Karthik','2018-01-01',75000.75,'2025-01-01'),
    (2,'Veena','2021-06-15',65000.40,'2025-01-01'),
    (3,'Ravi','2014-03-20',85000.90,'2025-01-01');
    
    -- SCHEMA 23
    CREATE TABLE salary_precision (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,4),
        revision_date DATE
    );
    
    INSERT INTO salary_precision VALUES
    (1,'Ravi',85000.9876,'2025-01-01'),
    (2,'Veena',65000.1234,'2025-01-02'),
    (3,'Anil',70000.9999,'2025-01-03');
    
    -- SCHEMA 24
    CREATE TABLE salary_growth (
        emp_id INT,
        emp_name VARCHAR(50),
        current_salary DECIMAL(10,2),
        growth_rate DECIMAL(5,2),
        years_projected INT
    );
    
    INSERT INTO salary_growth VALUES
    (1,'Karthik',75000.75,10.5,3),
    (2,'Veena',65000.40,8.0,5),
    (3,'Ravi',85000.90,12.0,2);
    
    -- SCHEMA 25
    CREATE TABLE salary_symmetry (
        emp_id INT,
        emp_name VARCHAR(50),
        salary INT,
        check_date DATE
    );
    
    INSERT INTO salary_symmetry VALUES
    (1,'Ravi',7557,'2025-01-01'),
    (2,'Veena',6506,'2025-01-02'),
    (3,'Anil',7123,'2025-01-03');
    
    -- SCHEMA 26
    CREATE TABLE leap_salary (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        payment_date DATE
    );
    
    INSERT INTO leap_salary VALUES
    (1,'Ravi',85000.90,'2024-02-29'),
    (2,'Veena',65000.40,'2025-02-28'),
    (3,'Anil',70000.10,'2020-02-29');
    
    -- SCHEMA 27
    CREATE TABLE fiscal_salary (
        emp_id INT,
        emp_name VARCHAR(50),
        annual_salary DECIMAL(12,2),
        fiscal_year INT
    );
    
    INSERT INTO fiscal_salary VALUES
    (1,'Karthik',1200000.00,2025),
    (2,'Veena',720000.00,2025),
    (3,'Ravi',300000.00,2025);
    
    -- SCHEMA 28
    CREATE TABLE salary_sampling (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        audit_date DATE
    );
    
    INSERT INTO salary_sampling VALUES
    (1,'Ravi',85000.90,'2025-01-01'),
    (2,'Veena',65000.40,'2025-01-02'),
    (3,'Anil',70000.10,'2025-01-03');
    
    -- SCHEMA 29
    CREATE TABLE salary_ascii (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        joining_date DATE
    );
    
    INSERT INTO salary_ascii VALUES
    (1,'Karthik',75000.75,'2020-01-01'),
    (2,'Veena',65000.40,'2021-06-15'),
    (3,'Ravi',85000.90,'2019-03-20');
    
    -- SCHEMA 30
    CREATE TABLE salary_calendar (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        payment_date DATE
    );
    
    INSERT INTO salary_calendar VALUES
    (1,'Ravi',85000.90,'2025-01-31'),
    (2,'Veena',65000.40,'2025-02-28'),
    (3,'Anil',70000.10,'2025-03-15');

---

**Query #1**

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

| emp_name | rounded_salary | truncated_salary | precision_difference | revision_month | precision_check |
| -------- | -------------- | ---------------- | -------------------- | -------------- | --------------- |
| ravi     | 85000.99       | 85000.98         | 0.01                 | January        | PRECISION LOSS  |
| veena    | 65000.12       | 65000.12         | 0.0                  | January        | STABLE          |
| anil     | 70001.0        | 70000.99         | 0.01                 | January        | PRECISION LOSS  |

---
**Query #2**

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

| emp_name | future_salary      | rounded_projection | growth_percentage | growth_status |
| -------- | ------------------ | ------------------ | ----------------- | ------------- |
| KARTHIK  | 101193.45879946875 | 101193.46          | 10.5              | MODERATE      |
| VEENA    | 95506.91272323075  | 95506.91           | 8.0               | MODERATE      |
| RAVI     | 106625.12896       | 106625.13          | 12.0              | MODERATE      |

---
**Query #3**

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

| emp_name | original_salary | reverse_salary | check_day | symmetry_status |
| -------- | --------------- | -------------- | --------- | --------------- |
| ravi     | 7557            | 7557           | Wednesday | Symmetric       |
| veena    | 6506            | 6056           | Thursday  | Non-Symmetric   |
| anil     | 7123            | 3217           | Friday    | Non-Symmetric   |

---
**Query #4**

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

| employee_name | rounded_salary | day_name | payment_year | leap_status       |
| ------------- | -------------- | -------- | ------------ | ----------------- |
| Ravi          | 85001          | Thursday | 2024         | Leap Year Payment |
| Veena         | 65000          | Friday   | 2025         | Normal Payment    |
| Anil          | 70000          | Saturday | 2020         | Leap Year Payment |

---
**Query #5**

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

| emp_name | delay_days | rounded_salary | credit_day | delay_status |
| -------- | ---------- | -------------- | ---------- | ------------ |
| RAVI     | 2          | 85001          | Friday     | MINOR DELAY  |
| VEENA    | 0          | 65000          | Wednesday  | ON TIME      |
| ANIL     | 7          | 70000          | Wednesday  | SEVERE DELAY |

---
**Query #6**

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

| emp_name | experience_years | rounded_salary | total_days | experience_status |
| -------- | ---------------- | -------------- | ---------- | ----------------- |
| karthik  | 7                | 75001          | 2557       | EXPERIENCED       |
| veena    | 3                | 65000          | 1296       | FRESHER           |
| ravi     | 10               | 85001          | 3940       | EXPERIENCED       |

---
**Query #7**

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

| emp_name | actual_experience | experience_diff | floor_salary | experience_status |
| -------- | ----------------- | --------------- | ------------ | ----------------- |
| Veena    | 7                 | 3               | 65000        | UNDERSTATED       |
| Ravi     | 12                | 0               | 85000        | MATCHED           |
| Anil     | 5                 | 2               | 70000        | UNDERSTATED       |

---
**Query #8**

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

| emp_name | total_compensation | bonus_amount | salary_month | compensation_status |
| -------- | ------------------ | ------------ | ------------ | ------------------- |
| RAVI     | 90001.15           | 5000.25      | January      | HIGH COMPENSATION   |
| ANIL     | 70000.1            | 0.0          | January      | MISSING BONUS       |
| VEENA    | 69000.9            | 4000.5       | January      | STANDARD            |

---
**Query #9**

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

| first_three | join_year | salary_rounded | last_digit | encoding_status |
| ----------- | --------- | -------------- | ---------- | --------------- |
| Kar         | 2020      | 75001          | 1          | MISMATCH        |
| Rav         | 2019      | 85001          | 1          | MISMATCH        |
| Vee         | 2021      | 65000          | 0          | MISMATCH        |

---
**Query #10**

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

| emp_name | monthly_salary | month_name | ceiling_salary | salary_status |
| -------- | -------------- | ---------- | -------------- | ------------- |
| ravi     | 100000.0       | January    | 100000         | PREMIUM       |
| anil     | 70000.0        | February   | 70000          | MID RANGE     |
| veena    | 50000.0        | March      | 50000          | MID RANGE     |

---
**Query #11**

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

| emp_name | truncated_salary | last_digit | audit_day | digit_status   |
| -------- | ---------------- | ---------- | --------- | -------------- |
| KARTHIK  | 75000            | 0          | 1         | DIGIT MISMATCH |
| VEENA    | 65007            | 7          | 2         | DIGIT MISMATCH |
| RAVI     | 85009            | 9          | 3         | DIGIT MISMATCH |

---
**Query #12**

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

| emp_name | delay_days | salary | credit_day | status       |
| -------- | ---------- | ------ | ---------- | ------------ |
| RAVI     | 2          | 85001  | Friday     | MINOR DELAY  |
| VEENA    | 0          | 65000  | Wednesday  | ON TIME      |
| ANIL     | 7          | 70000  | Wednesday  | SEVERE DELAY |

---
**Query #13**

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

| emp_name | experience | salary | total_days | status      |
| -------- | ---------- | ------ | ---------- | ----------- |
| karthik  | 7          | 75001  | 2557       | EXPERIENCED |
| veena    | 3          | 65000  | 1296       | FRESHER     |
| ravi     | 10         | 85001  | 3940       | EXPERIENCED |

---
**Query #14**

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

| emp_name | salary   | revision_month | diff | status |
| -------- | -------- | -------------- | ---- | ------ |
| RAVI     | 85000.99 | January        | 0.01 | LOSS   |
| VEENA    | 65000.12 | January        | 0.0  | STABLE |
| ANIL     | 70001.0  | January        | 0.01 | LOSS   |

---
**Query #15**

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

| emp_name | future_salary      | rounded_projection | status |
| -------- | ------------------ | ------------------ | ------ |
| KARTHIK  | 101193.45879946875 | 101193.46          | HIGH   |
| VEENA    | 95506.91272323075  | 95506.91           | LOW    |
| RAVI     | 106625.12896       | 106625.13          | HIGH   |

---
**Query #16**

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

| emp_name | reversed_salary | status |
| -------- | --------------- | ------ |
| ravi     | 7557            | YES    |
| veena    | 6056            | NO     |
| anil     | 3217            | NO     |

---
**Query #17**

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

| emp_name | leap_status |
| -------- | ----------- |
| Ravi     | LEAP        |
| Veena    | NORMAL      |
| Anil     | LEAP        |

---
**Query #18**

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

| emp_name | delay_days | status |
| -------- | ---------- | ------ |
| RAVI     | 2          | OK     |
| VEENA    | 0          | OK     |
| ANIL     | 7          | SEVERE |

---
**Query #19**

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

| emp_name | experience_years | status  |
| -------- | ---------------- | ------- |
| KARTHIK  | 7                | FRESHER |
| VEENA    | 3                | FRESHER |
| RAVI     | 10               | FRESHER |

---
**Query #20**

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

| emp_name | rounded_salary | status   |
| -------- | -------------- | -------- |
| karthik  | 75001          | NO MATCH |
| veena    | 65007          | NO MATCH |
| ravi     | 85010          | MATCH    |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
