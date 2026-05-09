-- Question 1
SELECT department,
       COUNT(*) AS employee_count
FROM Employees
GROUP BY department
HAVING COUNT(*) > 3;


-- Question 2
SELECT department,
       AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;


-- Question 3
SELECT city,
       COUNT(*) AS employee_count
FROM Employees
GROUP BY city
HAVING COUNT(*) > 2;


-- Question 4
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;


-- Question 5
SELECT department,
       MAX(salary) AS max_salary
FROM Employees
GROUP BY department
HAVING MAX(salary) > 90000;


-- Question 6
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;


-- Question 7
SELECT *
FROM Employees
ORDER BY experience DESC
LIMIT 3;


-- Question 8
SELECT *
FROM Employees
WHERE department = 'Finance'
ORDER BY salary DESC
LIMIT 2;


-- Question 9
SELECT *
FROM Employees
WHERE city = 'Hyderabad'
LIMIT 4;


-- Question 10
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 1;


-- Question 11
SELECT DISTINCT department
FROM Employees;


-- Question 12
SELECT DISTINCT city
FROM Employees;


-- Question 13
SELECT DISTINCT salary
FROM Employees;


-- Question 14
SELECT DISTINCT department,
                city
FROM Employees;


-- Question 15
SELECT DISTINCT experience
FROM Employees;


-- Question 16
SELECT *
FROM Employees
WHERE salary >= 80000;


-- Question 17
SELECT *
FROM Employees
WHERE experience <= 3;


-- Question 18
SELECT *
FROM Employees
WHERE salary <> 45000;


-- Question 19
SELECT *
FROM Employees
WHERE salary < 50000;


-- Question 20
SELECT *
FROM Employees
WHERE experience > 5;


-- Question 21
SELECT *
FROM Employees
WHERE department = 'IT'
AND salary > 70000;


-- Question 22
SELECT *
FROM Employees
WHERE city = 'Hyderabad'
OR city = 'Bangalore';


-- Question 23
SELECT *
FROM Employees
WHERE department = 'HR'
AND experience < 3;


-- Question 24
SELECT *
FROM Employees
WHERE salary > 60000
OR experience > 6;


-- Question 25
SELECT *
FROM Employees
WHERE department != 'Sales';


-- Question 26
SELECT *
FROM Employees
WHERE city IN ('Hyderabad', 'Mumbai');


-- Question 27
SELECT *
FROM Employees
WHERE department IN ('IT', 'Finance');


-- Question 28
SELECT *
FROM Employees
WHERE city NOT IN ('Chennai', 'Pune');


-- Question 29
SELECT *
FROM Employees
WHERE salary IN (45000, 75000, 91000);


-- Question 30
SELECT *
FROM Employees
WHERE department NOT IN ('HR', 'Sales');


-- Question 31
SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;


-- Question 32
SELECT *
FROM Employees
WHERE experience BETWEEN 3 AND 6;


-- Question 33
SELECT *
FROM Employees
WHERE emp_id BETWEEN 105 AND 112;


-- Question 34
SELECT *
FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000;


-- Question 35
SELECT *
FROM Employees
WHERE experience BETWEEN 2 AND 4;


-- Question 36
SELECT *
FROM Employees
WHERE emp_name LIKE 'R%';


-- Question 37
SELECT *
FROM Employees
WHERE emp_name LIKE '%a';


-- Question 38
SELECT *
FROM Employees
WHERE emp_name LIKE '%v%';


-- Question 39
SELECT *
FROM Employees
WHERE city LIKE 'B%';


-- Question 40
SELECT *
FROM Employees
WHERE department LIKE '%s';
