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
