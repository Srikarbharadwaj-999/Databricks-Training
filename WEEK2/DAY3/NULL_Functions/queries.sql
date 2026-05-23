SELECT * FROM Employees
WHERE salary IS NULL;

SELECT * FROM Employees 
WHERE bonus IS NOT NULL;

SELECT COUNT(*) AS no_manager 
FROM Employees 
WHERE manager_id IS NULL;

SELECT * FROM Employees
WHERE salary IS NULL AND bonus IS NULL;

SELECT * FROM Employees
WHERE salary IS NULL AND manager_id IS NOT NULL;

SELECT emp_id, name, IFNULL(salary, 0) AS salary 
FROM Employees;

SELECT emp_id, name, IFNULL(bonus, 1000) AS bonus
FROM Employees;

SELECT order_id, customer_name, IFNULL(amount, 500) AS amount
FROM Orders;

SELECT product_id, product_name, IFNULL(stock, 0) AS stock
FROM Products;

SELECT emp_id, name, COALESCE(salary, bonus) AS earnings
FROM Employees;

SELECT emp_id, name, COALESCE(salary, bonus, 0) AS income
FROM Employees;

SELECT product_id, product_name, COALESCE(price, 1000) AS price 
FROM Products;

SELECT order_id, customer_name, COALESCE(amount, discount, 0) AS payment
FROM Orders;

SELECT emp_id, name, NULLIF(salary, 0) AS salary 
FROM Employees;

SELECT order_id, customer_name, NULLIF(discount, 0) AS discount 
FROM Orders;

SELECT amount / NULLIF(discount, 0) AS ratio
FROM Orders;

SELECT order_id, customer_name, NULLIF(coupon_code, 'DISC10') AS coupon_code
FROM Orders;

SELECT emp_id, name, COALESCE(salary,0) + COALESCE(bonus, 0) AS earnings
FROM Employees;

SELECT * FROM Employees 
WHERE salary IS NULL AND bonus IS NULL;

SELECT * FROM Products
WHERE price IS NULL AND category IS NOT NULL;

SELECT * FROM Orders
WHERE amount IS NULL AND discount IS NULL;

SELECT emp_id, name, COALESCE(salary, bonus, 1000) AS income 
FROM Employees;

SELECT order_id, customer_name, NULLIF(amount, 0) AS amount 
FROM Orders;

SELECT order_id,
       ABS(COALESCE(amount, 0) - COALESCE(discount, 0)) AS payable
FROM Orders;

SELECT * FROM Employees
WHERE salary IS NULL AND manager_id IS NOT NULL;
