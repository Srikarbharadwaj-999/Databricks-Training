**Schema (MySQL v9)**

    CREATE TABLE employee_salary (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    base_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    tax_percent DECIMAL(5,2),
    experience_years INT
    );
    INSERT INTO employee_salary VALUES
    (1, 'Karthik', 75000.75, 5000.50, 10.00, 6),
    (2, 'Veena', 65000.40, 4000.25, 8.50, 4),
    (3, 'Ravi', 85000.90, 6000.75, 12.00, 8),
    (4, 'Anil', 70000.10, NULL, 9.00, 5),
    (5, 'Suresh', 60000.55, 3000.30, 7.50, 3);

---

**Query #1**

    DROP TABLE IF EXISTS employees;

There are no results to be displayed.

---
**Query #2**

    CREATE TABLE employees (
        emp_id INT PRIMARY KEY,
        full_name VARCHAR(100),
        email VARCHAR(100),
        department VARCHAR(50),
        city VARCHAR(50),
        remarks VARCHAR(100)
    );

There are no results to be displayed.

---
**Query #3**

    INSERT INTO employees VALUES
    (1, 'Karthik Anand', 'karthik@gmail.com', 'Analytics', 'New York', 'Good'),
    (2, 'Veena Sharma', 'veena@yahoo.com', 'HR', 'San Francisco', NULL),
    (3, 'Ravi Kumar', 'ravi@outlook.com', 'IT', 'Los Angeles', ' '),
    (4, 'Anil Verma', 'anil@gmail.com', 'Analytics', 'Chicago City', NULL),
    (5, 'Suresh Rao', 'suresh@protonmail.com', 'Finance', 'Boston City', 'Excellent');

There are no results to be displayed.

---
**Query #4**

    -- 1
    SELECT full_name, LENGTH(full_name) AS byte_length, CHAR_LENGTH(full_name) AS char_length
    FROM employees;

| full_name     | byte_length | char_length |
| ------------- | ----------- | ----------- |
| Karthik Anand | 13          | 13          |
| Veena Sharma  | 12          | 12          |
| Ravi Kumar    | 10          | 10          |
| Anil Verma    | 10          | 10          |
| Suresh Rao    | 10          | 10          |

---
**Query #5**

    -- 2
    SELECT 
        UPPER(full_name) AS upper_name,
        LOWER(full_name) AS lower_name
    FROM employees;

| upper_name    | lower_name    |
| ------------- | ------------- |
| KARTHIK ANAND | karthik anand |
| VEENA SHARMA  | veena sharma  |
| RAVI KUMAR    | ravi kumar    |
| ANIL VERMA    | anil verma    |
| SURESH RAO    | suresh rao    |

---
**Query #6**

    -- 3
    SELECT full_name,
           TRIM(full_name) AS trimmed,
           LTRIM(full_name) AS left_trim,
           RTRIM(full_name) AS right_trim
    FROM employees;

| full_name     | trimmed       | left_trim     | right_trim    |
| ------------- | ------------- | ------------- | ------------- |
| Karthik Anand | Karthik Anand | Karthik Anand | Karthik Anand |
| Veena Sharma  | Veena Sharma  | Veena Sharma  | Veena Sharma  |
| Ravi Kumar    | Ravi Kumar    | Ravi Kumar    | Ravi Kumar    |
| Anil Verma    | Anil Verma    | Anil Verma    | Anil Verma    |
| Suresh Rao    | Suresh Rao    | Suresh Rao    | Suresh Rao    |

---
**Query #7**

    -- 4
    SELECT 
        CONCAT(UPPER(LEFT(full_name,1)), LOWER(SUBSTRING(full_name,2))) AS formatted_name,
        CONCAT(full_name, '-', department) AS emp_details
    FROM employees;

| formatted_name | emp_details             |
| -------------- | ----------------------- |
| Karthik anand  | Karthik Anand-Analytics |
| Veena sharma   | Veena Sharma-HR         |
| Ravi kumar     | Ravi Kumar-IT           |
| Anil verma     | Anil Verma-Analytics    |
| Suresh rao     | Suresh Rao-Finance      |

---
**Query #8**

    -- 5
    SELECT CONCAT_WS('|', emp_id, full_name, city) AS emp_details_2
    FROM employees;

| emp_details_2                |
| ---------------------------- |
| 1|Karthik Anand|New York     |
| 2|Veena Sharma|San Francisco |
| 3|Ravi Kumar|Los Angeles     |
| 4|Anil Verma|Chicago City    |
| 5|Suresh Rao|Boston City     |

---
**Query #9**

    -- 6
    SELECT email,
           SUBSTRING_INDEX(email, '@', -1) AS email_domain,
           SUBSTRING_INDEX(email, '@', 1) AS username,
           SUBSTRING(full_name, 2, 1) AS second_char
    FROM employees;

| email                 | email_domain   | username | second_char |
| --------------------- | -------------- | -------- | ----------- |
| karthik@gmail.com     | gmail.com      | karthik  | a           |
| veena@yahoo.com       | yahoo.com      | veena    | e           |
| ravi@outlook.com      | outlook.com    | ravi     | a           |
| anil@gmail.com        | gmail.com      | anil     | n           |
| suresh@protonmail.com | protonmail.com | suresh   | u           |

---
**Query #10**

    -- 7
    SELECT full_name,
           LEFT(full_name, 1) AS first_char,
           RIGHT(full_name, 8) AS last_chars
    FROM employees;

| full_name     | first_char | last_chars |
| ------------- | ---------- | ---------- |
| Karthik Anand | K          | ik Anand   |
| Veena Sharma  | V          | a Sharma   |
| Ravi Kumar    | R          | vi Kumar   |
| Anil Verma    | A          | il Verma   |
| Suresh Rao    | S          | resh Rao   |

---
**Query #11**

    -- 8
    SELECT email, INSTR(email, '@') AS at_position
    FROM employees;

| email                 | at_position |
| --------------------- | ----------- |
| karthik@gmail.com     | 8           |
| veena@yahoo.com       | 6           |
| ravi@outlook.com      | 5           |
| anil@gmail.com        | 5           |
| suresh@protonmail.com | 7           |

---
**Query #12**

    -- 9
    SELECT email, LOCATE('.', email) AS dot_position
    FROM employees;

| email                 | dot_position |
| --------------------- | ------------ |
| karthik@gmail.com     | 14           |
| veena@yahoo.com       | 12           |
| ravi@outlook.com      | 13           |
| anil@gmail.com        | 11           |
| suresh@protonmail.com | 18           |

---
**Query #13**

    -- 10
    SELECT full_name,
           REPLACE(full_name, 'a', '*') AS replaced_name
    FROM employees;

| full_name     | replaced_name |
| ------------- | ------------- |
| Karthik Anand | K*rthik An*nd |
| Veena Sharma  | Veen* Sh*rm*  |
| Ravi Kumar    | R*vi Kum*r    |
| Anil Verma    | Anil Verm*    |
| Suresh Rao    | Suresh R*o    |

---
**Query #14**

    -- 11
    SELECT full_name,
           REVERSE(full_name) AS reversed_name
    FROM employees;

| full_name     | reversed_name |
| ------------- | ------------- |
| Karthik Anand | dnanA kihtraK |
| Veena Sharma  | amrahS aneeV  |
| Ravi Kumar    | ramuK ivaR    |
| Anil Verma    | amreV linA    |
| Suresh Rao    | oaR hseruS    |

---
**Query #15**

    -- 12
    SELECT full_name,
           LPAD(full_name, 15, '*') AS left_padded,
           RPAD(full_name, 15, '*') AS right_padded
    FROM employees;

| full_name     | left_padded     | right_padded    |
| ------------- | --------------- | --------------- |
| Karthik Anand | **Karthik Anand | Karthik Anand** |
| Veena Sharma  | ***Veena Sharma | Veena Sharma*** |
| Ravi Kumar    | *****Ravi Kumar | Ravi Kumar***** |
| Anil Verma    | *****Anil Verma | Anil Verma***** |
| Suresh Rao    | *****Suresh Rao | Suresh Rao***** |

---
**Query #16**

    -- 13
    SELECT city,
           REPLACE(city, ' ', '*') AS cleaned_city
    FROM employees;

| city          | cleaned_city  |
| ------------- | ------------- |
| New York      | New*York      |
| San Francisco | San*Francisco |
| Los Angeles   | Los*Angeles   |
| Chicago City  | Chicago*City  |
| Boston City   | Boston*City   |

---
**Query #17**

    -- 14
    SELECT full_name,
           COALESCE(NULLIF(remarks, ' '), 'NO REMARKS') AS remarks_cleaned
    FROM employees;

| full_name     | remarks_cleaned |
| ------------- | --------------- |
| Karthik Anand | Good            |
| Veena Sharma  | NO REMARKS      |
| Ravi Kumar    | NO REMARKS      |
| Anil Verma    | NO REMARKS      |
| Suresh Rao    | Excellent       |

---
**Query #18**

    -- 15
    SELECT full_name,
           COALESCE(remarks, 'N/A') AS remarks_filled
    FROM employees;

| full_name     | remarks_filled |
| ------------- | -------------- |
| Karthik Anand | Good           |
| Veena Sharma  | N/A            |
| Ravi Kumar    |                |
| Anil Verma    | N/A            |
| Suresh Rao    | Excellent      |

---
**Query #19**

    -- 16
    SELECT FIND_IN_SET('Analytics', 'Data,Analytics,AI') AS search_result;

| search_result |
| ------------- |
| 2             |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
