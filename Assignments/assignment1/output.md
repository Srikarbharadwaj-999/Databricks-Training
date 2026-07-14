**Schema (MySQL v9)**

    CREATE TABLE Students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(50),
        department VARCHAR(20),
        city VARCHAR(30),
        marks DECIMAL(5,2),
        attendance INT
    );
    INSERT INTO Students
    (student_id, student_name, department, city, marks, attendance)
    VALUES
    (101,'Rahul','CS','Hyderabad',178,95),
    (102,'Anjali','IT','Bangalore',165,88),
    (103,'Kiran','CS','Chennai',150,91),
    (104,'Sneha','ECE','Hyderabad',140,82),
    (105,'Arjun','MECH','Pune',120,78),
    (106,'Priya','IT','Hyderabad',190,97),
    (107,'Vikram','CS','Bangalore',NULL,84),
    (108,'Neha','ECE','Chennai',155,89),
    (109,'Rohit','MECH','Hyderabad',98,65),
    (110,'Pooja','IT','Pune',175,92),
    (111,'Suresh','CS','Chennai',162,87),
    (112,'Deepa','ECE','Bangalore',145,90),
    (113,'Ajay','MECH','Hyderabad',130,73),
    (114,'Kavya','CS','Pune',185,96),
    (115,'Manoj','IT','Chennai',170,94),
    (116,'Divya','ECE','Hyderabad',NULL,80),
    (117,'Nikhil','MECH','Bangalore',158,86),
    (118,'Swathi','CS','Hyderabad',148,88),
    (119,'Harsha','IT','Pune',110,72),
    (120,'Keerthi','ECE','Chennai',182,99);

---

**Query #1**

    SELECT * FROM Students ORDER BY student_id LIMIT 5;

| student_id | student_name | department | city      | marks | attendance |
| ---------- | ------------ | ---------- | --------- | ----- | ---------- |
| 101        | Rahul        | CS         | Hyderabad | 178.0 | 95         |
| 102        | Anjali       | IT         | Bangalore | 165.0 | 88         |
| 103        | Kiran        | CS         | Chennai   | 150.0 | 91         |
| 104        | Sneha        | ECE        | Hyderabad | 140.0 | 82         |
| 105        | Arjun        | MECH       | Pune      | 120.0 | 78         |

---
**Query #2**

    SELECT
    (SELECT COUNT(*) FROM Students) AS total_rows,
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='Students') AS total_columns;

| total_rows | total_columns |
| ---------- | ------------- |
| 20         | 6             |

---
**Query #3**

    SELECT
    SUM(CASE WHEN student_id IS NULL THEN 1 ELSE 0 END) AS student_id_missing,
    SUM(CASE WHEN student_name IS NULL THEN 1 ELSE 0 END) AS student_name_missing,
    SUM(CASE WHEN department IS NULL THEN 1 ELSE 0 END) AS department_missing,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS city_missing,
    SUM(CASE WHEN marks IS NULL THEN 1 ELSE 0 END) AS marks_missing,
    SUM(CASE WHEN attendance IS NULL THEN 1 ELSE 0 END) AS attendance_missing
    FROM Students;

| student_id_missing | student_name_missing | department_missing | city_missing | marks_missing | attendance_missing |
| ------------------ | -------------------- | ------------------ | ------------ | ------------- | ------------------ |
| 0                  | 0                    | 0                  | 0            | 2             | 0                  |

---
**Query #4**

    UPDATE Students
    SET marks=(SELECT average_marks FROM(SELECT AVG(marks) AS average_marks FROM Students) AS x)
    WHERE marks IS NULL;

There are no results to be displayed.

---
**Query #5**

    SELECT student_name,marks FROM Students;

| student_name | marks  |
| ------------ | ------ |
| Rahul        | 178.0  |
| Anjali       | 165.0  |
| Kiran        | 150.0  |
| Sneha        | 140.0  |
| Arjun        | 120.0  |
| Priya        | 190.0  |
| Vikram       | 153.39 |
| Neha         | 155.0  |
| Rohit        | 98.0   |
| Pooja        | 175.0  |
| Suresh       | 162.0  |
| Deepa        | 145.0  |
| Ajay         | 130.0  |
| Kavya        | 185.0  |
| Manoj        | 170.0  |
| Divya        | 153.39 |
| Nikhil       | 158.0  |
| Swathi       | 148.0  |
| Harsha       | 110.0  |
| Keerthi      | 182.0  |

---
**Query #6**

    SELECT * FROM Students WHERE marks>160;

| student_id | student_name | department | city      | marks | attendance |
| ---------- | ------------ | ---------- | --------- | ----- | ---------- |
| 101        | Rahul        | CS         | Hyderabad | 178.0 | 95         |
| 102        | Anjali       | IT         | Bangalore | 165.0 | 88         |
| 106        | Priya        | IT         | Hyderabad | 190.0 | 97         |
| 110        | Pooja        | IT         | Pune      | 175.0 | 92         |
| 111        | Suresh       | CS         | Chennai   | 162.0 | 87         |
| 114        | Kavya        | CS         | Pune      | 185.0 | 96         |
| 115        | Manoj        | IT         | Chennai   | 170.0 | 94         |
| 120        | Keerthi      | ECE        | Chennai   | 182.0 | 99         |

---
**Query #7**

    SELECT * FROM Students WHERE department='CS';

| student_id | student_name | department | city      | marks  | attendance |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         |
| 103        | Kiran        | CS         | Chennai   | 150.0  | 91         |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         |
| 118        | Swathi       | CS         | Hyderabad | 148.0  | 88         |

---
**Query #8**

    SELECT * FROM Students WHERE attendance>85 AND marks>150;

| student_id | student_name | department | city      | marks | attendance |
| ---------- | ------------ | ---------- | --------- | ----- | ---------- |
| 101        | Rahul        | CS         | Hyderabad | 178.0 | 95         |
| 102        | Anjali       | IT         | Bangalore | 165.0 | 88         |
| 106        | Priya        | IT         | Hyderabad | 190.0 | 97         |
| 108        | Neha         | ECE        | Chennai   | 155.0 | 89         |
| 110        | Pooja        | IT         | Pune      | 175.0 | 92         |
| 111        | Suresh       | CS         | Chennai   | 162.0 | 87         |
| 114        | Kavya        | CS         | Pune      | 185.0 | 96         |
| 115        | Manoj        | IT         | Chennai   | 170.0 | 94         |
| 117        | Nikhil       | MECH       | Bangalore | 158.0 | 86         |
| 120        | Keerthi      | ECE        | Chennai   | 182.0 | 99         |

---
**Query #9**

    SELECT * FROM Students ORDER BY marks DESC;

| student_id | student_name | department | city      | marks  | attendance |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- |
| 106        | Priya        | IT         | Hyderabad | 190.0  | 97         |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         |
| 120        | Keerthi      | ECE        | Chennai   | 182.0  | 99         |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         |
| 110        | Pooja        | IT         | Pune      | 175.0  | 92         |
| 115        | Manoj        | IT         | Chennai   | 170.0  | 94         |
| 102        | Anjali       | IT         | Bangalore | 165.0  | 88         |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         |
| 117        | Nikhil       | MECH       | Bangalore | 158.0  | 86         |
| 108        | Neha         | ECE        | Chennai   | 155.0  | 89         |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         |
| 116        | Divya        | ECE        | Hyderabad | 153.39 | 80         |
| 103        | Kiran        | CS         | Chennai   | 150.0  | 91         |
| 118        | Swathi       | CS         | Hyderabad | 148.0  | 88         |
| 112        | Deepa        | ECE        | Bangalore | 145.0  | 90         |
| 104        | Sneha        | ECE        | Hyderabad | 140.0  | 82         |
| 113        | Ajay         | MECH       | Hyderabad | 130.0  | 73         |
| 105        | Arjun        | MECH       | Pune      | 120.0  | 78         |
| 119        | Harsha       | IT         | Pune      | 110.0  | 72         |
| 109        | Rohit        | MECH       | Hyderabad | 98.0   | 65         |

---
**Query #10**

    SELECT * FROM Students WHERE marks IS NOT NULL ORDER BY marks DESC LIMIT 3;

| student_id | student_name | department | city      | marks | attendance |
| ---------- | ------------ | ---------- | --------- | ----- | ---------- |
| 106        | Priya        | IT         | Hyderabad | 190.0 | 97         |
| 114        | Kavya        | CS         | Pune      | 185.0 | 96         |
| 120        | Keerthi      | ECE        | Chennai   | 182.0 | 99         |

---
**Query #11**

    SELECT *,ROUND((marks*100.0)/200,2) AS percentage FROM Students;

| student_id | student_name | department | city      | marks  | attendance | percentage |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- | ---------- |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         | 89.0       |
| 102        | Anjali       | IT         | Bangalore | 165.0  | 88         | 82.5       |
| 103        | Kiran        | CS         | Chennai   | 150.0  | 91         | 75.0       |
| 104        | Sneha        | ECE        | Hyderabad | 140.0  | 82         | 70.0       |
| 105        | Arjun        | MECH       | Pune      | 120.0  | 78         | 60.0       |
| 106        | Priya        | IT         | Hyderabad | 190.0  | 97         | 95.0       |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         | 76.7       |
| 108        | Neha         | ECE        | Chennai   | 155.0  | 89         | 77.5       |
| 109        | Rohit        | MECH       | Hyderabad | 98.0   | 65         | 49.0       |
| 110        | Pooja        | IT         | Pune      | 175.0  | 92         | 87.5       |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         | 81.0       |
| 112        | Deepa        | ECE        | Bangalore | 145.0  | 90         | 72.5       |
| 113        | Ajay         | MECH       | Hyderabad | 130.0  | 73         | 65.0       |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         | 92.5       |
| 115        | Manoj        | IT         | Chennai   | 170.0  | 94         | 85.0       |
| 116        | Divya        | ECE        | Hyderabad | 153.39 | 80         | 76.7       |
| 117        | Nikhil       | MECH       | Bangalore | 158.0  | 86         | 79.0       |
| 118        | Swathi       | CS         | Hyderabad | 148.0  | 88         | 74.0       |
| 119        | Harsha       | IT         | Pune      | 110.0  | 72         | 55.0       |
| 120        | Keerthi      | ECE        | Chennai   | 182.0  | 99         | 91.0       |

---
**Query #12**

    SELECT *,ROUND((marks*100.0)/200,2) AS percentage,
    CASE
    WHEN (marks*100.0)/200>=85 THEN 'A'
    WHEN (marks*100.0)/200>=70 THEN 'B'
    WHEN (marks*100.0)/200>=50 THEN 'C'
    ELSE 'Fail'
    END AS grade
    FROM Students;

| student_id | student_name | department | city      | marks  | attendance | percentage | grade |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- | ---------- | ----- |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         | 89.0       | A     |
| 102        | Anjali       | IT         | Bangalore | 165.0  | 88         | 82.5       | B     |
| 103        | Kiran        | CS         | Chennai   | 150.0  | 91         | 75.0       | B     |
| 104        | Sneha        | ECE        | Hyderabad | 140.0  | 82         | 70.0       | B     |
| 105        | Arjun        | MECH       | Pune      | 120.0  | 78         | 60.0       | C     |
| 106        | Priya        | IT         | Hyderabad | 190.0  | 97         | 95.0       | A     |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         | 76.7       | B     |
| 108        | Neha         | ECE        | Chennai   | 155.0  | 89         | 77.5       | B     |
| 109        | Rohit        | MECH       | Hyderabad | 98.0   | 65         | 49.0       | Fail  |
| 110        | Pooja        | IT         | Pune      | 175.0  | 92         | 87.5       | A     |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         | 81.0       | B     |
| 112        | Deepa        | ECE        | Bangalore | 145.0  | 90         | 72.5       | B     |
| 113        | Ajay         | MECH       | Hyderabad | 130.0  | 73         | 65.0       | C     |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         | 92.5       | A     |
| 115        | Manoj        | IT         | Chennai   | 170.0  | 94         | 85.0       | A     |
| 116        | Divya        | ECE        | Hyderabad | 153.39 | 80         | 76.7       | B     |
| 117        | Nikhil       | MECH       | Bangalore | 158.0  | 86         | 79.0       | B     |
| 118        | Swathi       | CS         | Hyderabad | 148.0  | 88         | 74.0       | B     |
| 119        | Harsha       | IT         | Pune      | 110.0  | 72         | 55.0       | C     |
| 120        | Keerthi      | ECE        | Chennai   | 182.0  | 99         | 91.0       | A     |

---
**Query #13**

    SELECT *,marks+5 AS marks_with_bonus FROM Students;

| student_id | student_name | department | city      | marks  | attendance | marks_with_bonus |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- | ---------------- |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         | 183.0            |
| 102        | Anjali       | IT         | Bangalore | 165.0  | 88         | 170.0            |
| 103        | Kiran        | CS         | Chennai   | 150.0  | 91         | 155.0            |
| 104        | Sneha        | ECE        | Hyderabad | 140.0  | 82         | 145.0            |
| 105        | Arjun        | MECH       | Pune      | 120.0  | 78         | 125.0            |
| 106        | Priya        | IT         | Hyderabad | 190.0  | 97         | 195.0            |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         | 158.39           |
| 108        | Neha         | ECE        | Chennai   | 155.0  | 89         | 160.0            |
| 109        | Rohit        | MECH       | Hyderabad | 98.0   | 65         | 103.0            |
| 110        | Pooja        | IT         | Pune      | 175.0  | 92         | 180.0            |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         | 167.0            |
| 112        | Deepa        | ECE        | Bangalore | 145.0  | 90         | 150.0            |
| 113        | Ajay         | MECH       | Hyderabad | 130.0  | 73         | 135.0            |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         | 190.0            |
| 115        | Manoj        | IT         | Chennai   | 170.0  | 94         | 175.0            |
| 116        | Divya        | ECE        | Hyderabad | 153.39 | 80         | 158.39           |
| 117        | Nikhil       | MECH       | Bangalore | 158.0  | 86         | 163.0            |
| 118        | Swathi       | CS         | Hyderabad | 148.0  | 88         | 153.0            |
| 119        | Harsha       | IT         | Pune      | 110.0  | 72         | 115.0            |
| 120        | Keerthi      | ECE        | Chennai   | 182.0  | 99         | 187.0            |

---
**Query #14**

    SELECT *,ROUND((marks*100.0)/200,2) AS percentage,
    CASE
    WHEN (marks*100.0)/200>=40 THEN 'Pass'
    ELSE 'Fail'
    END AS result
    FROM Students;

| student_id | student_name | department | city      | marks  | attendance | percentage | result |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- | ---------- | ------ |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         | 89.0       | Pass   |
| 102        | Anjali       | IT         | Bangalore | 165.0  | 88         | 82.5       | Pass   |
| 103        | Kiran        | CS         | Chennai   | 150.0  | 91         | 75.0       | Pass   |
| 104        | Sneha        | ECE        | Hyderabad | 140.0  | 82         | 70.0       | Pass   |
| 105        | Arjun        | MECH       | Pune      | 120.0  | 78         | 60.0       | Pass   |
| 106        | Priya        | IT         | Hyderabad | 190.0  | 97         | 95.0       | Pass   |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         | 76.7       | Pass   |
| 108        | Neha         | ECE        | Chennai   | 155.0  | 89         | 77.5       | Pass   |
| 109        | Rohit        | MECH       | Hyderabad | 98.0   | 65         | 49.0       | Pass   |
| 110        | Pooja        | IT         | Pune      | 175.0  | 92         | 87.5       | Pass   |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         | 81.0       | Pass   |
| 112        | Deepa        | ECE        | Bangalore | 145.0  | 90         | 72.5       | Pass   |
| 113        | Ajay         | MECH       | Hyderabad | 130.0  | 73         | 65.0       | Pass   |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         | 92.5       | Pass   |
| 115        | Manoj        | IT         | Chennai   | 170.0  | 94         | 85.0       | Pass   |
| 116        | Divya        | ECE        | Hyderabad | 153.39 | 80         | 76.7       | Pass   |
| 117        | Nikhil       | MECH       | Bangalore | 158.0  | 86         | 79.0       | Pass   |
| 118        | Swathi       | CS         | Hyderabad | 148.0  | 88         | 74.0       | Pass   |
| 119        | Harsha       | IT         | Pune      | 110.0  | 72         | 55.0       | Pass   |
| 120        | Keerthi      | ECE        | Chennai   | 182.0  | 99         | 91.0       | Pass   |

---
**Query #15**

    SELECT student_id,UPPER(student_name) AS student_name,department,city,marks,attendance FROM Students;

| student_id | student_name | department | city      | marks  | attendance |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- |
| 101        | RAHUL        | CS         | Hyderabad | 178.0  | 95         |
| 102        | ANJALI       | IT         | Bangalore | 165.0  | 88         |
| 103        | KIRAN        | CS         | Chennai   | 150.0  | 91         |
| 104        | SNEHA        | ECE        | Hyderabad | 140.0  | 82         |
| 105        | ARJUN        | MECH       | Pune      | 120.0  | 78         |
| 106        | PRIYA        | IT         | Hyderabad | 190.0  | 97         |
| 107        | VIKRAM       | CS         | Bangalore | 153.39 | 84         |
| 108        | NEHA         | ECE        | Chennai   | 155.0  | 89         |
| 109        | ROHIT        | MECH       | Hyderabad | 98.0   | 65         |
| 110        | POOJA        | IT         | Pune      | 175.0  | 92         |
| 111        | SURESH       | CS         | Chennai   | 162.0  | 87         |
| 112        | DEEPA        | ECE        | Bangalore | 145.0  | 90         |
| 113        | AJAY         | MECH       | Hyderabad | 130.0  | 73         |
| 114        | KAVYA        | CS         | Pune      | 185.0  | 96         |
| 115        | MANOJ        | IT         | Chennai   | 170.0  | 94         |
| 116        | DIVYA        | ECE        | Hyderabad | 153.39 | 80         |
| 117        | NIKHIL       | MECH       | Bangalore | 158.0  | 86         |
| 118        | SWATHI       | CS         | Hyderabad | 148.0  | 88         |
| 119        | HARSHA       | IT         | Pune      | 110.0  | 72         |
| 120        | KEERTHI      | ECE        | Chennai   | 182.0  | 99         |

---
**Query #16**

    SELECT department,ROUND(AVG(marks),2) AS average_marks FROM Students GROUP BY department;

| department | average_marks |
| ---------- | ------------- |
| CS         | 162.73        |
| IT         | 162.0         |
| ECE        | 155.08        |
| MECH       | 126.5         |

---
**Query #17**

    SELECT city,MAX(marks) AS maximum_marks FROM Students GROUP BY city;

| city      | maximum_marks |
| --------- | ------------- |
| Hyderabad | 190.0         |
| Bangalore | 165.0         |
| Chennai   | 182.0         |
| Pune      | 185.0         |

---
**Query #18**

    SELECT department,COUNT(*) AS total_students FROM Students GROUP BY department;

| department | total_students |
| ---------- | -------------- |
| CS         | 6              |
| IT         | 5              |
| ECE        | 5              |
| MECH       | 4              |

---
**Query #19**

    SELECT department,ROUND(AVG(marks),2) AS average_marks
    FROM Students
    GROUP BY department
    ORDER BY average_marks DESC
    LIMIT 1;

| department | average_marks |
| ---------- | ------------- |
| CS         | 162.73        |

---
**Query #20**

    SELECT department,
    ROUND(AVG(CASE WHEN city='Hyderabad' THEN marks END),2) AS Hyderabad,
    ROUND(AVG(CASE WHEN city='Bangalore' THEN marks END),2) AS Bangalore,
    ROUND(AVG(CASE WHEN city='Chennai' THEN marks END),2) AS Chennai,
    ROUND(AVG(CASE WHEN city='Pune' THEN marks END),2) AS Pune
    FROM Students
    GROUP BY department;

| department | Hyderabad | Bangalore | Chennai | Pune  |
| ---------- | --------- | --------- | ------- | ----- |
| CS         | 163.0     | 153.39    | 156.0   | 185.0 |
| IT         | 190.0     | 165.0     | 170.0   | 142.5 |
| ECE        | 146.7     | 145.0     | 168.5   |       |
| MECH       | 114.0     | 158.0     |         | 120.0 |

---
**Query #21**

    SELECT student_id,student_name,marks,
    RANK() OVER(ORDER BY marks DESC) AS marks_rank
    FROM Students
    ORDER BY marks_rank;

| student_id | student_name | marks  | marks_rank |
| ---------- | ------------ | ------ | ---------- |
| 106        | Priya        | 190.0  | 1          |
| 114        | Kavya        | 185.0  | 2          |
| 120        | Keerthi      | 182.0  | 3          |
| 101        | Rahul        | 178.0  | 4          |
| 110        | Pooja        | 175.0  | 5          |
| 115        | Manoj        | 170.0  | 6          |
| 102        | Anjali       | 165.0  | 7          |
| 111        | Suresh       | 162.0  | 8          |
| 117        | Nikhil       | 158.0  | 9          |
| 108        | Neha         | 155.0  | 10         |
| 107        | Vikram       | 153.39 | 11         |
| 116        | Divya        | 153.39 | 11         |
| 103        | Kiran        | 150.0  | 13         |
| 118        | Swathi       | 148.0  | 14         |
| 112        | Deepa        | 145.0  | 15         |
| 104        | Sneha        | 140.0  | 16         |
| 113        | Ajay         | 130.0  | 17         |
| 105        | Arjun        | 120.0  | 18         |
| 119        | Harsha       | 110.0  | 19         |
| 109        | Rohit        | 98.0   | 20         |

---
**Query #22**

    SELECT * FROM Students
    WHERE marks>(SELECT AVG(marks) FROM Students)
    ORDER BY marks DESC;

| student_id | student_name | department | city      | marks  | attendance |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- |
| 106        | Priya        | IT         | Hyderabad | 190.0  | 97         |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         |
| 120        | Keerthi      | ECE        | Chennai   | 182.0  | 99         |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         |
| 110        | Pooja        | IT         | Pune      | 175.0  | 92         |
| 115        | Manoj        | IT         | Chennai   | 170.0  | 94         |
| 102        | Anjali       | IT         | Bangalore | 165.0  | 88         |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         |
| 117        | Nikhil       | MECH       | Bangalore | 158.0  | 86         |
| 108        | Neha         | ECE        | Chennai   | 155.0  | 89         |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         |
| 116        | Divya        | ECE        | Hyderabad | 153.39 | 80         |

---
**Query #23**

    SELECT student_id,student_name,marks,
    ROUND((marks-MIN(marks) OVER())/NULLIF(MAX(marks) OVER()-MIN(marks) OVER(),0),4) AS normalized_marks
    FROM Students;

| student_id | student_name | marks  | normalized_marks |
| ---------- | ------------ | ------ | ---------------- |
| 101        | Rahul        | 178.0  | 0.8696           |
| 102        | Anjali       | 165.0  | 0.7283           |
| 103        | Kiran        | 150.0  | 0.5652           |
| 104        | Sneha        | 140.0  | 0.4565           |
| 105        | Arjun        | 120.0  | 0.2391           |
| 106        | Priya        | 190.0  | 1.0              |
| 107        | Vikram       | 153.39 | 0.6021           |
| 108        | Neha         | 155.0  | 0.6196           |
| 109        | Rohit        | 98.0   | 0.0              |
| 110        | Pooja        | 175.0  | 0.837            |
| 111        | Suresh       | 162.0  | 0.6957           |
| 112        | Deepa        | 145.0  | 0.5109           |
| 113        | Ajay         | 130.0  | 0.3478           |
| 114        | Kavya        | 185.0  | 0.9457           |
| 115        | Manoj        | 170.0  | 0.7826           |
| 116        | Divya        | 153.39 | 0.6021           |
| 117        | Nikhil       | 158.0  | 0.6522           |
| 118        | Swathi       | 148.0  | 0.5435           |
| 119        | Harsha       | 110.0  | 0.1304           |
| 120        | Keerthi      | 182.0  | 0.913            |

---
**Query #24**

    SELECT *,
    CASE
    WHEN attendance>=90 THEN 'Excellent'
    WHEN attendance>=75 THEN 'Good'
    WHEN attendance>=60 THEN 'Average'
    ELSE 'Poor'
    END AS attendance_category
    FROM Students;

| student_id | student_name | department | city      | marks  | attendance | attendance_category |
| ---------- | ------------ | ---------- | --------- | ------ | ---------- | ------------------- |
| 101        | Rahul        | CS         | Hyderabad | 178.0  | 95         | Excellent           |
| 102        | Anjali       | IT         | Bangalore | 165.0  | 88         | Good                |
| 103        | Kiran        | CS         | Chennai   | 150.0  | 91         | Excellent           |
| 104        | Sneha        | ECE        | Hyderabad | 140.0  | 82         | Good                |
| 105        | Arjun        | MECH       | Pune      | 120.0  | 78         | Good                |
| 106        | Priya        | IT         | Hyderabad | 190.0  | 97         | Excellent           |
| 107        | Vikram       | CS         | Bangalore | 153.39 | 84         | Good                |
| 108        | Neha         | ECE        | Chennai   | 155.0  | 89         | Good                |
| 109        | Rohit        | MECH       | Hyderabad | 98.0   | 65         | Average             |
| 110        | Pooja        | IT         | Pune      | 175.0  | 92         | Excellent           |
| 111        | Suresh       | CS         | Chennai   | 162.0  | 87         | Good                |
| 112        | Deepa        | ECE        | Bangalore | 145.0  | 90         | Excellent           |
| 113        | Ajay         | MECH       | Hyderabad | 130.0  | 73         | Average             |
| 114        | Kavya        | CS         | Pune      | 185.0  | 96         | Excellent           |
| 115        | Manoj        | IT         | Chennai   | 170.0  | 94         | Excellent           |
| 116        | Divya        | ECE        | Hyderabad | 153.39 | 80         | Good                |
| 117        | Nikhil       | MECH       | Bangalore | 158.0  | 86         | Good                |
| 118        | Swathi       | CS         | Hyderabad | 148.0  | 88         | Good                |
| 119        | Harsha       | IT         | Pune      | 110.0  | 72         | Average             |
| 120        | Keerthi      | ECE        | Chennai   | 182.0  | 99         | Excellent           |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
