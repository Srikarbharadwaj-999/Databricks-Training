--1
SELECT s.student_name , d.department_name 
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id ;

--2
SELECT s.subject_id , s.subject_name , AVG(m.value) AS avg_marks 
FROM Subject s 
LEFT JOIN Mark m 
ON s.subject_id = m.subject_id
GROUP BY s.subject_id , s.subject_name;

--3
SELECT st.staff_name , s.subject_name 
FROM Staff st 
LEFT JOIN Subject s 
ON st.staff_id = s.staff_id;

--4
SELECT s.student_id , s.student_name , sub.subject_name , m.value 
FROM Mark m
LEFT JOIN Student s
ON m.student_id = s.student_id 
LEFT JOIN Subject sub 
ON m.subject_id = sub.subject_id;

--5
SELECT d.department_name , COUNT(s.student_id) AS NO_OF_STUDENTS
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id 
GROUP BY d.department_id;
