SELECT s.student_id, s.student_name, d.department_name
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id
GROUP BY s.student_id, s.student_name, d.department_name;

SELECT s.staff_id, s.staff_name, d.department_name
FROM Staff s
LEFT JOIN Department d
ON s.department_id = d.department_id
GROUP BY s.staff_id, s.staff_name, d.department_name;

SELECT d.department_id, d.department_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;

SELECT s.student_id, s.student_name, m.marks
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id
WHERE m.marks IS NULL;

SELECT subject_id, subject_name
FROM Subject
WHERE staff_id IS NULL;

SELECT d.department_name, AVG(s.cgpa) AS avg_cgpa
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name;

SELECT d.department_name, AVG(s.cgpa) AS avg_cgpa
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING AVG(s.cgpa) > 8.0;

SELECT d.department_name, COUNT(s.student_id) AS no_of_students
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name;

SELECT s.subject_name, MAX(m.marks) AS highest_marks, MIN(m.marks) AS lowest_marks
FROM Subject s
LEFT JOIN Mark m
ON s.subject_id = m.subject_id
GROUP BY s.subject_name;

SELECT s.student_name, m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks > 90;

SELECT s.student_name, d.department_name
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

SELECT s.staff_name, COUNT(sub.subject_id) AS subjects_handled
FROM Staff s
LEFT JOIN Subject sub 
ON s.staff_id = sub.staff_id
GROUP BY s.staff_name;

SELECT s.student_name, SUM(m.marks) AS total_marks
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id
GROUP BY s.student_name;

SELECT d.department_name, COUNT(s.staff_id) AS staff_count
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING COUNT(s.staff_id) > 2;

SELECT student_name, cgpa
FROM Student
WHERE cgpa > (SELECT AVG(cgpa) FROM Student);

SELECT st.staff_name, st.salary
FROM Staff st
WHERE st.salary > (
    SELECT AVG(salary)
    FROM Staff
    WHERE department_id = st.department_id
);

SELECT MAX(salary) AS second_highest_salary
FROM Staff
WHERE salary < (
    SELECT MAX(salary)
    FROM Staff
);

SELECT *
FROM (
    SELECT s.student_name, sub.subject_name, m.marks,
           RANK() OVER (PARTITION BY sub.subject_id ORDER BY m.marks DESC) AS student_rank
    FROM Mark m
    LEFT JOIN Student s ON m.student_id = s.student_id
    LEFT JOIN Subject sub ON m.subject_id = sub.subject_id
) t
WHERE student_rank = 1;

SELECT s.student_id, s.student_name, m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id;

SELECT s.subject_name, AVG(m.marks) AS avg_marks
FROM Subject s
LEFT JOIN Mark m
ON s.subject_id = m.subject_id
GROUP BY s.subject_name
HAVING AVG(m.marks) < 70;

SELECT student_name, cgpa
FROM Student
ORDER BY cgpa DESC;

SELECT d.department_name, SUM(s.salary) AS total_expenditure
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name;

SELECT d.department_name, SUM(s.salary) AS total_expenditure
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING SUM(s.salary) > 200000;

SELECT student_name, admission_year, cgpa
FROM Student
WHERE admission_year > 2021 AND cgpa > 7.5;

SELECT admission_year, COUNT(*) AS student_admitted
FROM Student
GROUP BY admission_year;

SELECT city, COUNT(*) AS total_students
FROM Student
GROUP BY city
ORDER BY total_students DESC
LIMIT 1;

SELECT d.department_name, COUNT(s.staff_id) AS total_staff
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name;

SELECT s.student_name, m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks < 50;

SELECT staff_name, hire_date
FROM Staff
WHERE hire_date < '2018-01-01';

SELECT d.department_name
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING COUNT(CASE WHEN s.salary IS NULL THEN 1 END) = 0;

SELECT student_id, student_name, cgpa,
ROW_NUMBER() OVER (ORDER BY cgpa DESC) AS row_num
FROM Student;

SELECT student_name, cgpa,
RANK() OVER (ORDER BY cgpa DESC) AS student_rank
FROM Student;

SELECT staff_name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM Staff;

SELECT s.student_id, s.student_name,
SUM(m.marks) AS total_marks,
RANK() OVER (ORDER BY SUM(m.marks) DESC) AS student_ranking
FROM Student s
LEFT JOIN Mark m ON s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
ORDER BY total_marks DESC
LIMIT 3;

SELECT s.student_name, sub.subject_name, m.exam_date, m.marks,
SUM(m.marks) OVER (PARTITION BY s.student_id ORDER BY m.exam_date) AS running_total
FROM Mark m
LEFT JOIN Student s ON m.student_id = s.student_id
LEFT JOIN Subject sub ON m.subject_id = sub.subject_id;

SELECT DISTINCT s.subject_name,
AVG(m.marks) OVER (PARTITION BY s.subject_id) AS avg_marks
FROM Mark m
LEFT JOIN Subject s ON m.subject_id = s.subject_id;

SELECT s.student_name, m.exam_date, m.marks,
LAG(m.marks) OVER (PARTITION BY s.student_id ORDER BY m.exam_date) AS previous_marks
FROM Mark m
LEFT JOIN Student s ON m.student_id = s.student_id;

SELECT s.student_name, m.exam_date, m.marks,
LEAD(m.marks) OVER (PARTITION BY s.student_id ORDER BY m.exam_date) AS next_marks
FROM Mark m
LEFT JOIN Student s ON m.student_id = s.student_id;

SELECT DISTINCT s.subject_name,
MAX(m.marks) OVER (PARTITION BY s.subject_id) AS highest_marks
FROM Mark m
LEFT JOIN Subject s ON m.subject_id = s.subject_id;

SELECT DISTINCT exam_date,
AVG(marks) OVER (ORDER BY exam_date) AS cumulative_average
FROM Mark;

SELECT *
FROM (
    SELECT d.department_name, s.student_name, s.admission_year,
           ROW_NUMBER() OVER (PARTITION BY d.department_id ORDER BY s.admission_year) AS admission_number
    FROM Department d
    LEFT JOIN Student s ON d.department_id = s.department_id
) t
WHERE admission_number = 1;

SELECT *
FROM (
    SELECT staff_name, department_id, hire_date,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date DESC) AS joining_number
    FROM Staff
) t
WHERE joining_number = 1;

SELECT student_name, cgpa,
NTILE(4) OVER (ORDER BY cgpa) AS quartile
FROM Student;

SELECT student_name, cgpa,
PERCENT_RANK() OVER (ORDER BY cgpa DESC) AS percentage_rank
FROM Student
WHERE cgpa IS NOT NULL;

SELECT staff_name, salary,
CUME_DIST() OVER (ORDER BY salary) AS cumulative_distribution
FROM Staff;

SELECT s.student_name, sub.subject_name, m.marks
FROM Mark m
JOIN Student s ON m.student_id = s.student_id
JOIN Subject sub ON m.subject_id = sub.subject_id
WHERE m.marks > (
    SELECT AVG(m2.marks)
    FROM Mark m2
    WHERE m2.subject_id = m.subject_id
);

SELECT d.department_name, AVG(st.salary) AS avg_salary
FROM Department d
JOIN Staff st ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING AVG(st.salary) > (
    SELECT AVG(salary) FROM Staff
);

SELECT s.student_name, m.marks
FROM Student s
JOIN Mark m ON s.student_id = m.student_id
WHERE m.marks > (
    SELECT AVG(m2.marks)
    FROM Mark m2
    JOIN Student s2 ON m2.student_id = s2.student_id
    WHERE s2.department_id = s.department_id
);

SELECT s.student_name, d.department_name, sub.subject_name,
m.exam_type, m.marks,
AVG(m.marks) OVER (PARTITION BY d.department_id) AS dept_avg,
RANK() OVER (ORDER BY m.marks DESC) AS overall_rank
FROM Mark m
JOIN Student s ON m.student_id = s.student_id
JOIN Department d ON s.department_id = d.department_id
JOIN Subject sub ON m.subject_id = sub.subject_id;
