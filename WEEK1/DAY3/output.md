**Schema (MySQL v5.7)**

    -- SQL Joins Assignment Starter File
    -- Compatible with PostgreSQL
    
    DROP TABLE IF EXISTS enrollments;
    DROP TABLE IF EXISTS courses;
    DROP TABLE IF EXISTS students;
    DROP TABLE IF EXISTS instructors;
    
    CREATE TABLE instructors (
        instructor_id INT PRIMARY KEY,
        instructor_name VARCHAR(100),
        department VARCHAR(100)
    );
    
    CREATE TABLE students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(100),
        email VARCHAR(100)
    );
    
    CREATE TABLE courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(100),
        instructor_id INT NULL,
        FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
    );
    
    CREATE TABLE enrollments (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT,
        enrollment_date DATE,
        FOREIGN KEY (student_id) REFERENCES students(student_id),
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
    );
    
    -- Insert instructors
    INSERT INTO instructors VALUES
    (1, 'Sarah Connor', 'Databases'),
    (2, 'Michael Scott', 'Programming'),
    (3, 'Tony Stark', 'Cloud Computing'),
    (4, 'Bruce Wayne', 'Cyber Security');
    
    -- Insert students
    INSERT INTO students VALUES
    (1, 'Alice Johnson', 'alice@email.com'),
    (2, 'Bob Smith', 'bob@email.com'),
    (3, 'Charlie Brown', 'charlie@email.com'),
    (4, 'Diana Prince', 'diana@email.com'),
    (5, 'Ethan Hunt', 'ethan@email.com'),
    (6, 'Fiona Green', 'fiona@email.com');
    
    -- Insert courses
    INSERT INTO courses VALUES
    (101, 'SQL Basics', 1),
    (102, 'Python Fundamentals', 2),
    (103, 'Data Analytics', NULL),
    (104, 'Cloud Computing', 3),
    (105, 'Machine Learning', NULL),
    (106, 'Cyber Security', 4);
    
    -- Insert enrollments
    INSERT INTO enrollments VALUES
    (1, 1, 101, '2024-01-10'),
    (2, 1, 102, '2024-01-12'),
    (3, 2, 101, '2024-01-15'),
    (4, 3, 104, '2024-01-20'),
    (5, 4, 106, '2024-01-25');
    
    -- Notes:
    -- Student 5 and 6 are not enrolled in any course.
    -- Courses 103 and 105 have no instructor assigned.
    -- Courses 103 and 105 also have no enrollments.
    -- Instructor 4 teaches one course.

---

**Query #1**

    SELECT s.student_name, c.course_name
    FROM students s
    LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    LEFT JOIN courses c
    ON e.course_id = c.course_id;

| student_name  | course_name         |
| ------------- | ------------------- |
| Alice Johnson | SQL Basics          |
| Alice Johnson | Python Fundamentals |
| Bob Smith     | SQL Basics          |
| Charlie Brown | Cloud Computing     |
| Diana Prince  | Cyber Security      |
| Ethan Hunt    |                     |
| Fiona Green   |                     |

---
**Query #2**

    SELECT c.course_name
    FROM courses c
    LEFT JOIN enrollments e
    ON c.course_id = e.course_id
    WHERE e.course_id IS NULL;

| course_name      |
| ---------------- |
| Data Analytics   |
| Machine Learning |

---
**Query #3**

    SELECT i.instructor_name, c.course_name
    FROM instructors i
    LEFT JOIN courses c
    ON i.instructor_id = c.instructor_id;

| instructor_name | course_name         |
| --------------- | ------------------- |
| Sarah Connor    | SQL Basics          |
| Michael Scott   | Python Fundamentals |
| Tony Stark      | Cloud Computing     |
| Bruce Wayne     | Cyber Security      |

---
**Query #4**

    SELECT course_name
    FROM courses
    WHERE instructor_id IS NULL;

| course_name      |
| ---------------- |
| Data Analytics   |
| Machine Learning |

---
**Query #5**

    SELECT s.student_name, e.enrollment_id, e.course_id
    FROM students s
    RIGHT JOIN enrollments e
    ON s.student_id = e.student_id;

| student_name  | enrollment_id | course_id |
| ------------- | ------------- | --------- |
| Alice Johnson | 1             | 101       |
| Alice Johnson | 2             | 102       |
| Bob Smith     | 3             | 101       |
| Charlie Brown | 4             | 104       |
| Diana Prince  | 5             | 106       |

---
**Query #6**

    SELECT s.student_name
    FROM students s
    LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    WHERE e.student_id IS NULL;

| student_name |
| ------------ |
| Ethan Hunt   |
| Fiona Green  |

---
**Query #7**

    SELECT s.student_name, e.enrollment_id, e.course_id
    FROM students s
    LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    
    UNION
    
    SELECT s.student_name, e.enrollment_id, e.course_id
    FROM students s
    RIGHT JOIN enrollments e
    ON s.student_id = e.student_id;

| student_name  | enrollment_id | course_id |
| ------------- | ------------- | --------- |
| Alice Johnson | 1             | 101       |
| Alice Johnson | 2             | 102       |
| Bob Smith     | 3             | 101       |
| Charlie Brown | 4             | 104       |
| Diana Prince  | 5             | 106       |
| Ethan Hunt    |               |           |
| Fiona Green   |               |           |

---
**Query #8**

    SELECT c.course_name
    FROM courses c
    LEFT JOIN enrollments e
    ON c.course_id = e.course_id
    WHERE e.course_id IS NULL;

| course_name      |
| ---------------- |
| Data Analytics   |
| Machine Learning |

---
**Query #9**

    SELECT i.instructor_name, c.course_name
    FROM instructors i
    LEFT JOIN courses c
    ON i.instructor_id = c.instructor_id
    
    UNION
    
    SELECT i.instructor_name, c.course_name
    FROM instructors i
    RIGHT JOIN courses c
    ON i.instructor_id = c.instructor_id;

| instructor_name | course_name         |
| --------------- | ------------------- |
| Sarah Connor    | SQL Basics          |
| Michael Scott   | Python Fundamentals |
| Tony Stark      | Cloud Computing     |
| Bruce Wayne     | Cyber Security      |
|                 | Data Analytics      |
|                 | Machine Learning    |

---
**Query #10**

    SELECT 
        s.student_name,
        c.course_name,
        i.instructor_name
    FROM students s
    LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    LEFT JOIN courses c
    ON e.course_id = c.course_id
    LEFT JOIN instructors i
    ON c.instructor_id = i.instructor_id;

| student_name  | course_name         | instructor_name |
| ------------- | ------------------- | --------------- |
| Alice Johnson | SQL Basics          | Sarah Connor    |
| Alice Johnson | Python Fundamentals | Michael Scott   |
| Bob Smith     | SQL Basics          | Sarah Connor    |
| Charlie Brown | Cloud Computing     | Tony Stark      |
| Diana Prince  | Cyber Security      | Bruce Wayne     |
| Ethan Hunt    |                     |                 |
| Fiona Green   |                     |                 |

---
**Query #11**

    SELECT s.student_name, c.course_name
    FROM students s
    CROSS JOIN courses c;

| student_name  | course_name         |
| ------------- | ------------------- |
| Alice Johnson | SQL Basics          |
| Bob Smith     | SQL Basics          |
| Charlie Brown | SQL Basics          |
| Diana Prince  | SQL Basics          |
| Ethan Hunt    | SQL Basics          |
| Fiona Green   | SQL Basics          |
| Alice Johnson | Python Fundamentals |
| Bob Smith     | Python Fundamentals |
| Charlie Brown | Python Fundamentals |
| Diana Prince  | Python Fundamentals |
| Ethan Hunt    | Python Fundamentals |
| Fiona Green   | Python Fundamentals |
| Alice Johnson | Data Analytics      |
| Bob Smith     | Data Analytics      |
| Charlie Brown | Data Analytics      |
| Diana Prince  | Data Analytics      |
| Ethan Hunt    | Data Analytics      |
| Fiona Green   | Data Analytics      |
| Alice Johnson | Cloud Computing     |
| Bob Smith     | Cloud Computing     |
| Charlie Brown | Cloud Computing     |
| Diana Prince  | Cloud Computing     |
| Ethan Hunt    | Cloud Computing     |
| Fiona Green   | Cloud Computing     |
| Alice Johnson | Machine Learning    |
| Bob Smith     | Machine Learning    |
| Charlie Brown | Machine Learning    |
| Diana Prince  | Machine Learning    |
| Ethan Hunt    | Machine Learning    |
| Fiona Green   | Machine Learning    |
| Alice Johnson | Cyber Security      |
| Bob Smith     | Cyber Security      |
| Charlie Brown | Cyber Security      |
| Diana Prince  | Cyber Security      |
| Ethan Hunt    | Cyber Security      |
| Fiona Green   | Cyber Security      |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
