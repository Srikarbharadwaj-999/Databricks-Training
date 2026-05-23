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
