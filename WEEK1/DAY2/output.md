**Schema (MySQL v5.7)**

    CREATE TABLE Employees (
        emp_id INT,
        emp_name VARCHAR(50),
        department VARCHAR(50),
        salary INT,
        city VARCHAR(50),
        experience INT
    );
    
    INSERT INTO Employees VALUES
    (101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
    (102, 'Anjali', 'HR', 45000, 'Chennai', 3),
    (103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
    (104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
    (105, 'Aman', 'HR', 39000, 'Pune', 2),
    (106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
    (107, 'Divya', 'IT', 55000, 'Chennai', 3),
    (108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
    (109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
    (110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
    (111, 'Vikas', 'HR', 52000, 'Pune', 3),
    (112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
    (113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
    (114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
    (115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);

---

**Query #1**

    -- Question 1
    SELECT department,
           COUNT(*) AS employee_count
    FROM Employees
    GROUP BY department
    HAVING COUNT(*) > 3;

| department | employee_count |
| ---------- | -------------- |
| Finance    | 4              |
| IT         | 5              |

---
**Query #2**

    -- Question 2
    SELECT department,
           AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department
    HAVING AVG(salary) > 60000;

| department | average_salary |
| ---------- | -------------- |
| Finance    | 76000.0        |
| IT         | 76400.0        |

---
**Query #3**

    -- Question 3
    SELECT city,
           COUNT(*) AS employee_count
    FROM Employees
    GROUP BY city
    HAVING COUNT(*) > 2;

| city      | employee_count |
| --------- | -------------- |
| Bangalore | 3              |
| Chennai   | 3              |
| Hyderabad | 4              |
| Mumbai    | 3              |

---
**Query #4**

    -- Question 4
    SELECT department,
           SUM(salary) AS total_salary
    FROM Employees
    GROUP BY department
    HAVING SUM(salary) > 200000;

| department | total_salary |
| ---------- | ------------ |
| Finance    | 304000       |
| IT         | 382000       |

---
**Query #5**

    -- Question 5
    SELECT department,
           MAX(salary) AS max_salary
    FROM Employees
    GROUP BY department
    HAVING MAX(salary) > 90000;

| department | max_salary |
| ---------- | ---------- |
| Finance    | 91000      |
| IT         | 97000      |

---
**Query #6**

    -- Question 6
    SELECT *
    FROM Employees
    ORDER BY salary DESC
    LIMIT 5;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |

---
**Query #7**

    -- Question 7
    SELECT *
    FROM Employees
    ORDER BY experience DESC
    LIMIT 3;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #8**

    -- Question 8
    SELECT *
    FROM Employees
    WHERE department = 'Finance'
    ORDER BY salary DESC
    LIMIT 2;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #9**

    -- Question 9
    SELECT *
    FROM Employees
    WHERE city = 'Hyderabad'
    LIMIT 4;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #10**

    -- Question 10
    SELECT *
    FROM Employees
    ORDER BY salary DESC
    LIMIT 1;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #11**

    -- Question 11
    SELECT DISTINCT department
    FROM Employees;

| department |
| ---------- |
| IT         |
| HR         |
| Finance    |
| Sales      |

---
**Query #12**

    -- Question 12
    SELECT DISTINCT city
    FROM Employees;

| city      |
| --------- |
| Hyderabad |
| Chennai   |
| Bangalore |
| Pune      |
| Mumbai    |

---
**Query #13**

    -- Question 13
    SELECT DISTINCT salary
    FROM Employees;

| salary |
| ------ |
| 75000  |
| 45000  |
| 82000  |
| 67000  |
| 39000  |
| 91000  |
| 55000  |
| 48000  |
| 61000  |
| 73000  |
| 52000  |
| 88000  |
| 46000  |
| 97000  |
| 58000  |

---
**Query #14**

    -- Question 14
    SELECT DISTINCT department,
                    city
    FROM Employees;

| department | city      |
| ---------- | --------- |
| IT         | Hyderabad |
| HR         | Chennai   |
| IT         | Bangalore |
| Finance    | Hyderabad |
| HR         | Pune      |
| Finance    | Mumbai    |
| IT         | Chennai   |
| Sales      | Bangalore |
| Sales      | Hyderabad |
| IT         | Mumbai    |
| Finance    | Bangalore |
| Sales      | Chennai   |

---
**Query #15**

    -- Question 15
    SELECT DISTINCT experience
    FROM Employees;

| experience |
| ---------- |
| 5          |
| 3          |
| 6          |
| 4          |
| 2          |
| 8          |
| 7          |
| 9          |

---
**Query #16**

    -- Question 16
    SELECT *
    FROM Employees
    WHERE salary >= 80000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #17**

    -- Question 17
    SELECT *
    FROM Employees
    WHERE experience <= 3;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---
**Query #18**

    -- Question 18
    SELECT *
    FROM Employees
    WHERE salary <> 45000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #19**

    -- Question 19
    SELECT *
    FROM Employees
    WHERE salary < 50000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---
**Query #20**

    -- Question 20
    SELECT *
    FROM Employees
    WHERE experience > 5;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #21**

    -- Question 21
    SELECT *
    FROM Employees
    WHERE department = 'IT'
    AND salary > 70000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #22**

    -- Question 22
    SELECT *
    FROM Employees
    WHERE city = 'Hyderabad'
    OR city = 'Bangalore';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #23**

    -- Question 23
    SELECT *
    FROM Employees
    WHERE department = 'HR'
    AND experience < 3;

| emp_id | emp_name | department | salary | city | experience |
| ------ | -------- | ---------- | ------ | ---- | ---------- |
| 105    | Aman     | HR         | 39000  | Pune | 2          |

---
**Query #24**

    -- Question 24
    SELECT *
    FROM Employees
    WHERE salary > 60000
    OR experience > 6;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #25**

    -- Question 25
    SELECT *
    FROM Employees
    WHERE department != 'Sales';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #26**

    -- Question 26
    SELECT *
    FROM Employees
    WHERE city IN ('Hyderabad', 'Mumbai');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #27**

    -- Question 27
    SELECT *
    FROM Employees
    WHERE department IN ('IT', 'Finance');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #28**

    -- Question 28
    SELECT *
    FROM Employees
    WHERE city NOT IN ('Chennai', 'Pune');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #29**

    -- Question 29
    SELECT *
    FROM Employees
    WHERE salary IN (45000, 75000, 91000);

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |

---
**Query #30**

    -- Question 30
    SELECT *
    FROM Employees
    WHERE department NOT IN ('HR', 'Sales');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #31**

    -- Question 31
    SELECT *
    FROM Employees
    WHERE salary BETWEEN 50000 AND 80000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #32**

    -- Question 32
    SELECT *
    FROM Employees
    WHERE experience BETWEEN 3 AND 6;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #33**

    -- Question 33
    SELECT *
    FROM Employees
    WHERE emp_id BETWEEN 105 AND 112;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #34**

    -- Question 34
    SELECT *
    FROM Employees
    WHERE salary NOT BETWEEN 40000 AND 60000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #35**

    -- Question 35
    SELECT *
    FROM Employees
    WHERE experience BETWEEN 2 AND 4;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #36**

    -- Question 36
    SELECT *
    FROM Employees
    WHERE emp_name LIKE 'R%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |

---
**Query #37**

    -- Question 37
    SELECT *
    FROM Employees
    WHERE emp_name LIKE '%a';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #38**

    -- Question 38
    SELECT *
    FROM Employees
    WHERE emp_name LIKE '%v%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #39**

    -- Question 39
    SELECT *
    FROM Employees
    WHERE city LIKE 'B%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #40**

    -- Question 40
    SELECT *
    FROM Employees
    WHERE department LIKE '%s';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
