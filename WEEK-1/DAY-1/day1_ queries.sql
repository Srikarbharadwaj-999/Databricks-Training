-- Question 1
SELECT *
FROM Employee;


-- Question 2
SELECT name, salary
FROM Employee;


-- Question 3
SELECT *
FROM Employee
WHERE age > 30;


-- Question 4
SELECT name
FROM Department;


-- Question 5
SELECT e.*
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'IT';


-- Question 6
SELECT *
FROM Employee
WHERE name LIKE 'J%';


-- Question 7
SELECT *
FROM Employee
WHERE name LIKE '%e';


-- Question 8
SELECT *
FROM Employee
WHERE name LIKE '%a%';


-- Question 9
SELECT *
FROM Employee
WHERE LENGTH(name) = 9;


-- Question 10
SELECT *
FROM Employee
WHERE name LIKE '_o%';


-- Question 11
SELECT *
FROM Employee
WHERE hire_date > '2020-01-01';


-- Question 12
SELECT *
FROM Employee
WHERE hire_date < '2020-01-01';


-- Question 13
SELECT *
FROM Employee
WHERE YEAR(hire_date) = 2021;


-- Question 14
SELECT *
FROM Employee
WHERE MONTH(hire_date) = 7;


-- Question 15
SELECT name,
       YEAR(hire_date) AS hire_year
FROM Employee;


-- Question 16
SELECT AVG(salary) AS average_salary
FROM Employee;


-- Question 17
SELECT MAX(salary) AS maximum_salary
FROM Employee;


-- Question 18
SELECT MIN(salary) AS minimum_salary
FROM Employee;


-- Question 19
SELECT COUNT(*) AS total_employees
FROM Employee;


-- Question 20
SELECT SUM(salary) AS total_salary
FROM Employee;


-- Question 21
SELECT department_id,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;


-- Question 22
SELECT department_id,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;


-- Question 23
SELECT department_id,
       MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id;


-- Question 24
SELECT department_id,
       MIN(salary) AS min_salary
FROM Employee
GROUP BY department_id;


-- Question 25
SELECT department_id,
       SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;


-- Question 26
SELECT department_id,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;


-- Question 27
SELECT department_id,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;


-- Question 28
SELECT department_id,
       SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) > 100000;


-- Question 29
SELECT department_id,
       MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 70000;


-- Question 30
SELECT department_id,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) < 3;


-- Question 31
SELECT *
FROM Employee
ORDER BY salary ASC;


-- Question 32
SELECT *
FROM Employee
ORDER BY salary DESC;


-- Question 33
SELECT *
FROM Employee
ORDER BY age;


-- Question 34
SELECT *
FROM Employee
ORDER BY hire_date DESC;


-- Question 35
SELECT *
FROM Employee
ORDER BY department_id,
         salary DESC;


-- Question 36
SELECT e.name AS employee_name,
       d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;


-- Question 37
SELECT e.name AS employee_name,
       p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;


-- Question 38
SELECT d.name AS department_name,
       e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;


-- Question 39
SELECT d.name AS department_name,
       p.name AS project_name
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id;


-- Question 40
SELECT *
FROM Employee
WHERE department_id IS NULL;


-- Question 41
SELECT *
FROM Project
WHERE department_id IS NULL;


-- Question 42
SELECT e.name,
       d.name
FROM Employee e
INNER JOIN Department d
ON e.department_id = d.department_id;


-- Question 43
SELECT e.name,
       d.name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;


-- Question 44
SELECT d.name,
       e.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;


-- Question 45
SELECT e.name AS employee_name,
       p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;


-- Question 46
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);


-- Question 47
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);


-- Question 48
SELECT *
FROM Employee
WHERE salary = (
    SELECT MIN(salary)
    FROM Employee
);


-- Question 49
SELECT *
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Department
    WHERE name = 'IT'
);


-- Question 50
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
);


-- Question 51
SELECT *
FROM Department
WHERE department_id IN (
    SELECT department_id
    FROM Employee
    WHERE salary > 60000
);


-- Question 52
SELECT *
FROM Employee
WHERE hire_date < (
    SELECT AVG(hire_date)
    FROM Employee
);


-- Question 53
SELECT *
FROM Employee e1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);


-- Question 54
SELECT *
FROM Employee
WHERE age > (
    SELECT AVG(age)
    FROM Employee
);


-- Question 55
SELECT *
FROM Employee
WHERE department_id IS NULL;


-- Question 56
SELECT department_id,
       AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;


-- Question 57
SELECT *
FROM Employee
ORDER BY age ASC
LIMIT 1;


-- Question 58
SELECT *
FROM Employee
ORDER BY age DESC
LIMIT 1;


-- Question 59
SELECT d.name,
       COUNT(p.project_id) AS project_count
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.name;


-- Question 60
SELECT *
FROM Department
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM Employee
    WHERE department_id IS NOT NULL
);


-- Question 61
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);


-- Question 62
SELECT *
FROM Employee
WHERE name LIKE '%e%';


-- Question 63
SELECT COUNT(*) AS total_employees
FROM Employee
WHERE YEAR(hire_date) > 2020;


-- Question 64
SELECT d.name,
       COUNT(e.emp_id) AS employee_count
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name;


-- Question 65
SELECT e.name AS employee_name,
       d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;
