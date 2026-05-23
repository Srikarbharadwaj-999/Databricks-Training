**Schema (MySQL v9)**

    -- SCHEMA 31
    CREATE TABLE employee_login (
        emp_id INT,
        emp_name VARCHAR(50),
        login_time DATETIME,
        logout_time DATETIME
    );
    
    INSERT INTO employee_login VALUES
    (1,'Karthik','2025-01-01 09:00:00','2025-01-01 18:00:00'),
    (2,'Veena','2025-01-01 10:30:00','2025-01-01 17:00:00'),
    (3,'Ravi','2025-01-01 08:45:00','2025-01-01 20:00:00');
    
    -- SCHEMA 32
    CREATE TABLE attendance_log (
        emp_id INT,
        emp_name VARCHAR(50),
        check_in DATETIME,
        check_out DATETIME
    );
    
    INSERT INTO attendance_log VALUES
    (1,'Ravi','2025-01-02 09:15:00','2025-01-02 18:00:00'),
    (2,'Anil','2025-01-02 11:00:00','2025-01-02 16:00:00'),
    (3,'Veena','2025-01-02 08:45:00','2025-01-02 19:30:00');
    
    -- SCHEMA 33
    CREATE TABLE weekend_monitor (
        emp_id INT,
        emp_name VARCHAR(50),
        login_time DATETIME,
        activity_score INT
    );
    
    INSERT INTO weekend_monitor VALUES
    (1,'Karthik','2025-01-04 09:00:00',95),
    (2,'Veena','2025-01-05 11:00:00',45),
    (3,'Ravi','2025-01-06 08:00:00',88);
    
    -- SCHEMA 34
    CREATE TABLE login_discipline (
        emp_id INT,
        emp_name VARCHAR(50),
        login_time DATETIME
    );
    
    INSERT INTO login_discipline VALUES
    (1,'Ravi','2025-01-01 08:45:00'),
    (2,'Anil','2025-01-01 10:15:00'),
    (3,'Veena','2025-01-01 09:05:00');
    
    -- SCHEMA 35
    CREATE TABLE performance_tracker (
        emp_id INT,
        emp_name VARCHAR(50),
        performance_score DECIMAL(5,2),
        review_date DATE
    );
    
    INSERT INTO performance_tracker VALUES
    (1,'Karthik',95.50,'2025-01-01'),
    (2,'Veena',72.40,'2025-01-02'),
    (3,'Ravi',88.90,'2025-01-03');

---

**Query #1**

    -- QUERY31
    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    DAYNAME(LOGIN_TIME) AS WEEK_DAY,
    TIMESTAMPDIFF(HOUR , LOGIN_TIME , LOGOUT_TIME) AS WORKING_TIME,
    TIMESTAMPDIFF(MINUTE ,LOGIN_TIME , LOGOUT_TIME) AS TOTAL_MINUTES,
    CASE 
    WHEN TIMESTAMPDIFF(HOUR , LOGIN_TIME , LOGOUT_TIME) > 9 THEN 'OVERTIME'
    WHEN TIMESTAMPDIFF(HOUR , LOGIN_TIME , LOGOUT_TIME) BETWEEN 7 AND 9 THEN 'REGULAR'
    ELSE 'SHORT SHIFT'
    END AS WORK_STATUS
    FROM employee_login;

| EMP_NAME | WEEK_DAY  | WORKING_TIME | TOTAL_MINUTES | WORK_STATUS |
| -------- | --------- | ------------ | ------------- | ----------- |
| KARTHIK  | Wednesday | 9            | 540           | REGULAR     |
| VEENA    | Wednesday | 6            | 390           | SHORT SHIFT |
| RAVI     | Wednesday | 11           | 675           | OVERTIME    |

---
**Query #2**

    -- QUERY32
    SELECT 
    CONCAT(
      UPPER(LEFT(EMP_NAME,1)),
      LOWER(SUBSTRING(EMP_NAME ,2 ))
    ) AS EMPLOYEE_NAME,
    DAYNAME(CHECK_IN) AS CHECK_IN_WEEKDAY,
    TIMESTAMPDIFF(HOUR , CHECK_IN , CHECK_OUT) AS WORKING_HOURS,
    ROUND(TIMESTAMPDIFF(HOUR , CHECK_IN , CHECK_OUT) / 60 , 2) AS ROUNDED_WORK_HOURS,
    CASE
    WHEN HOUR(check_in) > 10 THEN 'Late Entry'
    WHEN TIMESTAMPDIFF(HOUR , check_in , check_out) >= 8 THEN 'Full Shift'
    ELSE 'Half Shift'
    END AS attendance_status
    FROM attendance_log;

| EMPLOYEE_NAME | CHECK_IN_WEEKDAY | WORKING_HOURS | ROUNDED_WORK_HOURS | attendance_status |
| ------------- | ---------------- | ------------- | ------------------ | ----------------- |
| Ravi          | Thursday         | 8             | 0.13               | Full Shift        |
| Anil          | Thursday         | 5             | 0.08               | Late Entry        |
| Veena         | Thursday         | 10            | 0.17               | Full Shift        |

---
**Query #3**

    -- QUERY33
    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    DAYNAME(LOGIN_TIME) AS LOGIN_DAY,
    ROUND(ACTIVITY_SCORE) AS ROUNDED_ACTIVITY,
    CASE 
    WHEN DAYNAME(LOGIN_TIME) IN ('Saturday','Sunday') AND ACTIVITY_SCORE > 80 
    THEN 'Suspicious Weekend Activity'
    WHEN DAYNAME(LOGIN_TIME) IN ('Saturday','Sunday') 
    THEN 'Normal Weekend'
    ELSE 'Weekday Activity'
    END AS activity_status
    FROM weekend_monitor;

| EMP_NAME | LOGIN_DAY | ROUNDED_ACTIVITY | activity_status             |
| -------- | --------- | ---------------- | --------------------------- |
| karthik  | Saturday  | 95               | Suspicious Weekend Activity |
| veena    | Sunday    | 45               | Normal Weekend              |
| ravi     | Monday    | 88               | Weekday Activity            |

---
**Query #4**

    -- QUERY34
    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    DAYNAME(LOGIN_TIME) AS LOGIN_DAY,
    HOUR(LOGIN_TIME) AS LOGIN_HOUR,
    MOD(HOUR(LOGIN_TIME),2) AS LOGIN_MOD,
    CASE 
    WHEN HOUR(LOGIN_TIME) < 9 THEN 'EARLY LOGIN'
    WHEN HOUR(LOGIN_TIME) = 9 THEN 'ON TIME'
    ELSE 'LATE LOGIN'
    END AS LOGIN_STATUS
    FROM login_discipline;

| EMP_NAME | LOGIN_DAY | LOGIN_HOUR | LOGIN_MOD | LOGIN_STATUS |
| -------- | --------- | ---------- | --------- | ------------ |
| RAVI     | Wednesday | 8          | 0         | EARLY LOGIN  |
| ANIL     | Wednesday | 10         | 0         | LATE LOGIN   |
| VEENA    | Wednesday | 9          | 1         | ON TIME      |

---
**Query #5**

    -- QUERY35
    SELECT 
    CONCAT(
      UPPER(LEFT(EMP_NAME,1)),
      LOWER(SUBSTRING(EMP_NAME,2))
    ) AS EMP_NAME,
    ROUND(PERFORMANCE_SCORE) AS ROUNDED_SCORE,
    ABS(PERFORMANCE_SCORE) AS ABSOLUTE_SCORE,
    DAYNAME(REVIEW_DATE) AS REVIEW_DAY,
    CASE 
    WHEN PERFORMANCE_SCORE >= 90 THEN 'EXCELLENT'
    WHEN PERFORMANCE_SCORE BETWEEN 75 AND 89 THEN 'GOOD'
    ELSE 'AVERAGE'
    END AS PERFORMANCE_STATUS
    FROM performance_tracker;

| EMP_NAME | ROUNDED_SCORE | ABSOLUTE_SCORE | REVIEW_DAY | PERFORMANCE_STATUS |
| -------- | ------------- | -------------- | ---------- | ------------------ |
| Karthik  | 96            | 95.5           | Wednesday  | EXCELLENT          |
| Veena    | 72            | 72.4           | Thursday   | AVERAGE            |
| Ravi     | 89            | 88.9           | Friday     | GOOD               |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
