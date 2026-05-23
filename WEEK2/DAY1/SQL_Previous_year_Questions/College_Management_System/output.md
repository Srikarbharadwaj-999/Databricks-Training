**Schema (MySQL v9)**

    CREATE TABLE Department (
      department_id INT PRIMARY KEY,
      department_name VARCHAR(30),
      department_block_number INT
    );
    
    CREATE TABLE Student (
      student_id INT PRIMARY KEY,
      student_name VARCHAR(30),
      address VARCHAR(40),
      city VARCHAR(30),
      department_id INT,
      FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    CREATE TABLE Staff (
      staff_id INT PRIMARY KEY,
      staff_name VARCHAR(30),
      department_id INT,
      FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    CREATE TABLE Subject (
      subject_id INT PRIMARY KEY,
      subject_name VARCHAR(30),
      subject_code VARCHAR(10),
      staff_id INT,
      FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
    );
    
    CREATE TABLE Mark (
      value INT,
      subject_id INT,
      student_id INT,
      PRIMARY KEY (subject_id, student_id),
      FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
      FOREIGN KEY (student_id) REFERENCES Student(student_id)
    );
    -- Departments
    INSERT INTO Department VALUES (1, 'Computer Science', 101);
    INSERT INTO Department VALUES (2, 'Mechanical', 102);
    
    -- Students
    INSERT INTO Student VALUES (1, 'Alice', 'Street 1', 'CityA', 1);
    INSERT INTO Student VALUES (2, 'Bob', 'Street 2', 'CityB', 2);
    INSERT INTO Student VALUES (3, 'Charlie', 'Street 3', 'CityA', 1);
    
    -- Staff
    INSERT INTO Staff VALUES (1, 'Dr. Smith', 1);
    INSERT INTO Staff VALUES (2, 'Dr. John', 2);
    
    -- Subjects
    INSERT INTO Subject VALUES (1, 'DBMS', 'CS101', 1);
    INSERT INTO Subject VALUES (2, 'Thermodynamics', 'ME102', 2);
    
    -- Marks
    INSERT INTO Mark VALUES (85, 1, 1);  -- Alice in DBMS
    INSERT INTO Mark VALUES (90, 2, 2);  -- Bob in Thermodynamics
    INSERT INTO Mark VALUES (78, 1, 3);  -- Charlie in DBMS

---

**Query #1**

    SELECT 
        s.student_name,
        d.department_name
    FROM Student s
    LEFT JOIN Department d
        ON s.department_id = d.department_id;

| student_name | department_name  |
| ------------ | ---------------- |
| Alice        | Computer Science |
| Bob          | Mechanical       |
| Charlie      | Computer Science |

---
**Query #2**

    SELECT 
        s.subject_id,
        s.subject_name,
        AVG(m.value) AS avg_marks
    FROM Subject s
    LEFT JOIN Mark m 
        ON s.subject_id = m.subject_id
    GROUP BY s.subject_id, s.subject_name;

| subject_id | subject_name   | avg_marks |
| ---------- | -------------- | --------- |
| 1          | DBMS           | 81.5      |
| 2          | Thermodynamics | 90.0      |

---
**Query #3**

    SELECT 
        st.staff_name,
        s.subject_name
    FROM Staff st
    LEFT JOIN Subject s 
        ON st.staff_id = s.staff_id;

| staff_name | subject_name   |
| ---------- | -------------- |
| Dr. Smith  | DBMS           |
| Dr. John   | Thermodynamics |

---
**Query #4**

    SELECT 
        s.student_id,
        s.student_name,
        sub.subject_name,
        m.value
    FROM Mark m
    LEFT JOIN Student s
        ON m.student_id = s.student_id
    LEFT JOIN Subject sub 
        ON m.subject_id = sub.subject_id;

| student_id | student_name | subject_name   | value |
| ---------- | ------------ | -------------- | ----- |
| 1          | Alice        | DBMS           | 85    |
| 3          | Charlie      | DBMS           | 78    |
| 2          | Bob          | Thermodynamics | 90    |

---
**Query #5**

    SELECT 
        d.department_name,
        COUNT(s.student_id) AS no_of_students
    FROM Department d
    LEFT JOIN Student s
        ON d.department_id = s.department_id
    GROUP BY d.department_name;

| department_name  | no_of_students |
| ---------------- | -------------- |
| Computer Science | 2              |
| Mechanical       | 1              |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
