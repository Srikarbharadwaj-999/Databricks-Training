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
