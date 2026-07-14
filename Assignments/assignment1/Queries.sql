SELECT * FROM Students ORDER BY student_id LIMIT 5;

SELECT
(SELECT COUNT(*) FROM Students) AS total_rows,
(SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='Students') AS total_columns;

SELECT
SUM(CASE WHEN student_id IS NULL THEN 1 ELSE 0 END) AS student_id_missing,
SUM(CASE WHEN student_name IS NULL THEN 1 ELSE 0 END) AS student_name_missing,
SUM(CASE WHEN department IS NULL THEN 1 ELSE 0 END) AS department_missing,
SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS city_missing,
SUM(CASE WHEN marks IS NULL THEN 1 ELSE 0 END) AS marks_missing,
SUM(CASE WHEN attendance IS NULL THEN 1 ELSE 0 END) AS attendance_missing
FROM Students;

UPDATE Students
SET marks=(SELECT average_marks FROM(SELECT AVG(marks) AS average_marks FROM Students) AS x)
WHERE marks IS NULL;

SELECT student_name,marks FROM Students;

SELECT * FROM Students WHERE marks>160;

SELECT * FROM Students WHERE department='CS';

SELECT * FROM Students WHERE attendance>85 AND marks>150;

SELECT * FROM Students ORDER BY marks DESC;

SELECT * FROM Students WHERE marks IS NOT NULL ORDER BY marks DESC LIMIT 3;

SELECT *,ROUND((marks*100.0)/200,2) AS percentage FROM Students;

SELECT *,ROUND((marks*100.0)/200,2) AS percentage,
CASE
WHEN (marks*100.0)/200>=85 THEN 'A'
WHEN (marks*100.0)/200>=70 THEN 'B'
WHEN (marks*100.0)/200>=50 THEN 'C'
ELSE 'Fail'
END AS grade
FROM Students;

SELECT *,marks+5 AS marks_with_bonus FROM Students;

SELECT *,ROUND((marks*100.0)/200,2) AS percentage,
CASE
WHEN (marks*100.0)/200>=40 THEN 'Pass'
ELSE 'Fail'
END AS result
FROM Students;

SELECT student_id,UPPER(student_name) AS student_name,department,city,marks,attendance FROM Students;

SELECT department,ROUND(AVG(marks),2) AS average_marks FROM Students GROUP BY department;

SELECT city,MAX(marks) AS maximum_marks FROM Students GROUP BY city;

SELECT department,COUNT(*) AS total_students FROM Students GROUP BY department;

SELECT department,ROUND(AVG(marks),2) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 1;

SELECT department,
ROUND(AVG(CASE WHEN city='Hyderabad' THEN marks END),2) AS Hyderabad,
ROUND(AVG(CASE WHEN city='Bangalore' THEN marks END),2) AS Bangalore,
ROUND(AVG(CASE WHEN city='Chennai' THEN marks END),2) AS Chennai,
ROUND(AVG(CASE WHEN city='Pune' THEN marks END),2) AS Pune
FROM Students
GROUP BY department;

SELECT student_id,student_name,marks,
RANK() OVER(ORDER BY marks DESC) AS marks_rank
FROM Students
ORDER BY marks_rank;

SELECT * FROM Students
WHERE marks>(SELECT AVG(marks) FROM Students)
ORDER BY marks DESC;

SELECT student_id,student_name,marks,
ROUND((marks-MIN(marks) OVER())/NULLIF(MAX(marks) OVER()-MIN(marks) OVER(),0),4) AS normalized_marks
FROM Students;

SELECT *,
CASE
WHEN attendance>=90 THEN 'Excellent'
WHEN attendance>=75 THEN 'Good'
WHEN attendance>=60 THEN 'Average'
ELSE 'Poor'
END AS attendance_category
FROM Students;
