DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    remarks VARCHAR(100)
);

INSERT INTO employees VALUES
(1, 'Karthik Anand', 'karthik@gmail.com', 'Analytics', 'New York', 'Good'),
(2, 'Veena Sharma', 'veena@yahoo.com', 'HR', 'San Francisco', NULL),
(3, 'Ravi Kumar', 'ravi@outlook.com', 'IT', 'Los Angeles', ' '),
(4, 'Anil Verma', 'anil@gmail.com', 'Analytics', 'Chicago City', NULL),
(5, 'Suresh Rao', 'suresh@protonmail.com', 'Finance', 'Boston City', 'Excellent');

-- 1
SELECT full_name, LENGTH(full_name) AS byte_length, CHAR_LENGTH(full_name) AS char_length
FROM employees;

-- 2
SELECT 
    UPPER(full_name) AS upper_name,
    LOWER(full_name) AS lower_name
FROM employees;

-- 3
SELECT full_name,
       TRIM(full_name) AS trimmed,
       LTRIM(full_name) AS left_trim,
       RTRIM(full_name) AS right_trim
FROM employees;

-- 4
SELECT 
    CONCAT(UPPER(LEFT(full_name,1)), LOWER(SUBSTRING(full_name,2))) AS formatted_name,
    CONCAT(full_name, '-', department) AS emp_details
FROM employees;

-- 5
SELECT CONCAT_WS('|', emp_id, full_name, city) AS emp_details_2
FROM employees;

-- 6
SELECT email,
       SUBSTRING_INDEX(email, '@', -1) AS email_domain,
       SUBSTRING_INDEX(email, '@', 1) AS username,
       SUBSTRING(full_name, 2, 1) AS second_char
FROM employees;

-- 7
SELECT full_name,
       LEFT(full_name, 1) AS first_char,
       RIGHT(full_name, 8) AS last_chars
FROM employees;

-- 8
SELECT email, INSTR(email, '@') AS at_position
FROM employees;

-- 9
SELECT email, LOCATE('.', email) AS dot_position
FROM employees;

-- 10
SELECT full_name,
       REPLACE(full_name, 'a', '*') AS replaced_name
FROM employees;

-- 11
SELECT full_name,
       REVERSE(full_name) AS reversed_name
FROM employees;

-- 12
SELECT full_name,
       LPAD(full_name, 15, '*') AS left_padded,
       RPAD(full_name, 15, '*') AS right_padded
FROM employees;

-- 13
SELECT city,
       REPLACE(city, ' ', '*') AS cleaned_city
FROM employees;

-- 14
SELECT full_name,
       COALESCE(NULLIF(remarks, ' '), 'NO REMARKS') AS remarks_cleaned
FROM employees;

-- 15
SELECT full_name,
       COALESCE(remarks, 'N/A') AS remarks_filled
FROM employees;

-- 16
SELECT FIND_IN_SET('Analytics', 'Data,Analytics,AI') AS search_result;
