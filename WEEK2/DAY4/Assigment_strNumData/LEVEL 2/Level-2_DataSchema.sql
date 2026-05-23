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
