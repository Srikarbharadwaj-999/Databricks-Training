SELECT ABS(-100);

SELECT emp_name, ROUND(base_salary, 0) AS rounded_salary
FROM employee_salary;

SELECT ROUND(base_salary, 2)
FROM employee_salary;

SELECT CEIL(base_salary)
FROM employee_salary;

SELECT FLOOR(base_salary)
FROM employee_salary;

SELECT TRUNCATE(base_salary, 0)
FROM employee_salary;

SELECT MOD(experience_years, 2)
FROM employee_salary;

SELECT POWER(2, 3);

SELECT POW(3, 2);

SELECT SQRT(64);

SELECT SIGN(base_salary)
FROM employee_salary;

SELECT RAND();

SELECT FORMAT(base_salary, 2)
FROM employee_salary;

SELECT emp_name,
       GREATEST(base_salary, IFNULL(bonus, 0))
FROM employee_salary;

SELECT emp_name,
       LEAST(base_salary, IFNULL(bonus, 0))
FROM employee_salary;
