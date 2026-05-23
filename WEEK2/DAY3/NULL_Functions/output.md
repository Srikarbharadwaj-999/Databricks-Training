
**Schema (MySQL v9)**

    CREATE TABLE Employees (
        emp_id INT,
        name VARCHAR(50),
        salary INT,
        bonus INT,
        manager_id INT
    );
    
    CREATE TABLE Orders (
        order_id INT,
        customer_name VARCHAR(50),
        amount INT,
        discount INT,
        coupon_code VARCHAR(20)
    );
    
    CREATE TABLE Products (
        product_id INT,
        product_name VARCHAR(50),
        price INT,
        category VARCHAR(50),
        stock INT
    );
    INSERT INTO Employees VALUES
    (1, 'Amit', 50000, NULL, 101),
    (2, 'John', NULL, 5000, 102),
    (3, 'Sara', 60000, NULL, NULL),
    (4, 'David', NULL, NULL, 103),
    (5, 'Priya', 45000, 3000, 101),
    (6, 'Kiran', NULL, NULL, NULL),
    (7, 'Ravi', 70000, 7000, 102),
    (8, 'Neha', NULL, 2000, NULL);
    
    INSERT INTO Orders VALUES
    (101, 'Amit', 1000, NULL, 'DISC10'),
    (102, 'John', NULL, 50, NULL),
    (103, 'Sara', 2000, NULL, 'DISC20'),
    (104, 'David', NULL, NULL, NULL),
    (105, 'Priya', 1500, 100, NULL),
    (106, 'Kiran', NULL, NULL, 'DISC5'),
    (107, 'Ravi', 3000, NULL, NULL),
    (108, 'Neha', NULL, 200, 'DISC15');
    
    INSERT INTO Products VALUES
    (1, 'Laptop', 50000, 'Electronics', 10),
    (2, 'Phone', NULL, 'Electronics', NULL),
    (3, 'Tablet', 30000, NULL, 5),
    (4, 'Headphones', NULL, NULL, NULL),
    (5, 'Monitor', 20000, 'Electronics', 0),
    (6, 'Keyboard', NULL, 'Accessories', 15),
    (7, 'Mouse', 500, NULL, NULL),
    (8, 'Printer', NULL, 'Electronics', 3);

---

**Query #1**

    SELECT * FROM Employees
    WHERE salary IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |
| 8      | Neha  |        | 2000  |            |

---
**Query #2**

    SELECT * FROM Employees 
    WHERE bonus IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 5      | Priya | 45000  | 3000  | 101        |
| 7      | Ravi  | 70000  | 7000  | 102        |
| 8      | Neha  |        | 2000  |            |

---
**Query #3**

    SELECT COUNT(*) AS no_manager 
    FROM Employees 
    WHERE manager_id IS NULL;

| no_manager |
| ---------- |
| 3          |

---
**Query #4**

    SELECT * FROM Employees
    WHERE salary IS NULL AND bonus IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |

---
**Query #5**

    SELECT * FROM Employees
    WHERE salary IS NULL AND manager_id IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |

---
**Query #6**

    SELECT emp_id, name, IFNULL(salary, 0) AS salary 
    FROM Employees;

| emp_id | name  | salary |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 0      |
| 3      | Sara  | 60000  |
| 4      | David | 0      |
| 5      | Priya | 45000  |
| 6      | Kiran | 0      |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 0      |

---
**Query #7**

    SELECT emp_id, name, IFNULL(bonus, 1000) AS bonus
    FROM Employees;

| emp_id | name  | bonus |
| ------ | ----- | ----- |
| 1      | Amit  | 1000  |
| 2      | John  | 5000  |
| 3      | Sara  | 1000  |
| 4      | David | 1000  |
| 5      | Priya | 3000  |
| 6      | Kiran | 1000  |
| 7      | Ravi  | 7000  |
| 8      | Neha  | 2000  |

---
**Query #8**

    SELECT order_id, customer_name, IFNULL(amount, 500) AS amount
    FROM Orders;

| order_id | customer_name | amount |
| -------- | ------------- | ------ |
| 101      | Amit          | 1000   |
| 102      | John          | 500    |
| 103      | Sara          | 2000   |
| 104      | David         | 500    |
| 105      | Priya         | 1500   |
| 106      | Kiran         | 500    |
| 107      | Ravi          | 3000   |
| 108      | Neha          | 500    |

---
**Query #9**

    SELECT product_id, product_name, IFNULL(stock, 0) AS stock
    FROM Products;

| product_id | product_name | stock |
| ---------- | ------------ | ----- |
| 1          | Laptop       | 10    |
| 2          | Phone        | 0     |
| 3          | Tablet       | 5     |
| 4          | Headphones   | 0     |
| 5          | Monitor      | 0     |
| 6          | Keyboard     | 15    |
| 7          | Mouse        | 0     |
| 8          | Printer      | 3     |

---
**Query #10**

    SELECT emp_id, name, COALESCE(salary, bonus) AS earnings
    FROM Employees;

| emp_id | name  | earnings |
| ------ | ----- | -------- |
| 1      | Amit  | 50000    |
| 2      | John  | 5000     |
| 3      | Sara  | 60000    |
| 4      | David |          |
| 5      | Priya | 45000    |
| 6      | Kiran |          |
| 7      | Ravi  | 70000    |
| 8      | Neha  | 2000     |

---
**Query #11**

    SELECT emp_id, name, COALESCE(salary, bonus, 0) AS income
    FROM Employees;

| emp_id | name  | income |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 5000   |
| 3      | Sara  | 60000  |
| 4      | David | 0      |
| 5      | Priya | 45000  |
| 6      | Kiran | 0      |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 2000   |

---
**Query #12**

    SELECT product_id, product_name, COALESCE(price, 1000) AS price 
    FROM Products;

| product_id | product_name | price |
| ---------- | ------------ | ----- |
| 1          | Laptop       | 50000 |
| 2          | Phone        | 1000  |
| 3          | Tablet       | 30000 |
| 4          | Headphones   | 1000  |
| 5          | Monitor      | 20000 |
| 6          | Keyboard     | 1000  |
| 7          | Mouse        | 500   |
| 8          | Printer      | 1000  |

---
**Query #13**

    SELECT order_id, customer_name, COALESCE(amount, discount, 0) AS payment
    FROM Orders;

| order_id | customer_name | payment |
| -------- | ------------- | ------- |
| 101      | Amit          | 1000    |
| 102      | John          | 50      |
| 103      | Sara          | 2000    |
| 104      | David         | 0       |
| 105      | Priya         | 1500    |
| 106      | Kiran         | 0       |
| 107      | Ravi          | 3000    |
| 108      | Neha          | 200     |

---
**Query #14**

    SELECT emp_id, name, NULLIF(salary, 0) AS salary 
    FROM Employees;

| emp_id | name  | salary |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  |        |
| 3      | Sara  | 60000  |
| 4      | David |        |
| 5      | Priya | 45000  |
| 6      | Kiran |        |
| 7      | Ravi  | 70000  |
| 8      | Neha  |        |

---
**Query #15**

    SELECT order_id, customer_name, NULLIF(discount, 0) AS discount 
    FROM Orders;

| order_id | customer_name | discount |
| -------- | ------------- | -------- |
| 101      | Amit          |          |
| 102      | John          | 50       |
| 103      | Sara          |          |
| 104      | David         |          |
| 105      | Priya         | 100      |
| 106      | Kiran         |          |
| 107      | Ravi          |          |
| 108      | Neha          | 200      |

---
**Query #16**

    SELECT amount / NULLIF(discount, 0) AS ratio
    FROM Orders;

| ratio |
| ----- |
|       |
|       |
|       |
|       |
| 15.0  |
|       |
|       |
|       |

---
**Query #17**

    SELECT order_id, customer_name, NULLIF(coupon_code, 'DISC10') AS coupon_code
    FROM Orders;

| order_id | customer_name | coupon_code |
| -------- | ------------- | ----------- |
| 101      | Amit          |             |
| 102      | John          |             |
| 103      | Sara          | DISC20      |
| 104      | David         |             |
| 105      | Priya         |             |
| 106      | Kiran         | DISC5       |
| 107      | Ravi          |             |
| 108      | Neha          | DISC15      |

---
**Query #18**

    SELECT emp_id, name, COALESCE(salary,0) + COALESCE(bonus, 0) AS earnings
    FROM Employees;

| emp_id | name  | earnings |
| ------ | ----- | -------- |
| 1      | Amit  | 50000    |
| 2      | John  | 5000     |
| 3      | Sara  | 60000    |
| 4      | David | 0        |
| 5      | Priya | 48000    |
| 6      | Kiran | 0        |
| 7      | Ravi  | 77000    |
| 8      | Neha  | 2000     |

---
**Query #19**

    SELECT * FROM Employees 
    WHERE salary IS NULL AND bonus IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |

---
**Query #20**

    SELECT * FROM Products
    WHERE price IS NULL AND category IS NOT NULL;

| product_id | product_name | price | category    | stock |
| ---------- | ------------ | ----- | ----------- | ----- |
| 2          | Phone        |       | Electronics |       |
| 6          | Keyboard     |       | Accessories | 15    |
| 8          | Printer      |       | Electronics | 3     |

---
**Query #21**

    SELECT * FROM Orders
    WHERE amount IS NULL AND discount IS NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 104      | David         |        |          |             |
| 106      | Kiran         |        |          | DISC5       |

---
**Query #22**

    SELECT emp_id, name, COALESCE(salary, bonus, 1000) AS income 
    FROM Employees;

| emp_id | name  | income |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 5000   |
| 3      | Sara  | 60000  |
| 4      | David | 1000   |
| 5      | Priya | 45000  |
| 6      | Kiran | 1000   |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 2000   |

---
**Query #23**

    SELECT order_id, customer_name, NULLIF(amount, 0) AS amount 
    FROM Orders;

| order_id | customer_name | amount |
| -------- | ------------- | ------ |
| 101      | Amit          | 1000   |
| 102      | John          |        |
| 103      | Sara          | 2000   |
| 104      | David         |        |
| 105      | Priya         | 1500   |
| 106      | Kiran         |        |
| 107      | Ravi          | 3000   |
| 108      | Neha          |        |

---
**Query #24**

    SELECT order_id,
           ABS(COALESCE(amount, 0) - COALESCE(discount, 0)) AS payable
    FROM Orders;

| order_id | payable |
| -------- | ------- |
| 101      | 1000    |
| 102      | 50      |
| 103      | 2000    |
| 104      | 0       |
| 105      | 1400    |
| 106      | 0       |
| 107      | 3000    |
| 108      | 200     |

---
**Query #25**

    SELECT * FROM Employees
    WHERE salary IS NULL AND manager_id IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
