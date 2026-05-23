CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

INSERT INTO employees VALUES
(1, 'Amit', 'Chennai', 2000, '2023-01-01'),
(2, 'Ravi', 'Hyderabad', 1500, '2023-01-02'),
(3, 'Sneha', 'Chennai', 3000, '2023-01-03'),
(4, 'Kiran', 'Bangalore', 2500, '2023-01-04'),
(5, 'Priya', 'Chennai', 2000, '2023-01-05'),
(6, 'Arjun', 'Hyderabad', 1800, '2023-01-06'),
(7, 'Neha', 'Bangalore', 2200, '2023-01-07'),
(8, 'Vikas', 'Chennai', 3000, '2023-01-08'),
(9, 'Anjali', 'Hyderabad', 1700, '2023-01-09'),
(10, 'Rahul', 'Bangalore', 2600, '2023-01-10'),
(11, 'Suresh', 'Chennai', 2800, '2023-01-11'),
(12, 'Pooja', 'Hyderabad', 1600, '2023-01-12'),
(13, 'Manoj', 'Bangalore', 2400, '2023-01-13'),
(14, 'Divya', 'Chennai', 2100, '2023-01-14'),
(15, 'Karthik', 'Hyderabad', 1900, '2023-01-15'),
(16, 'Meena', 'Bangalore', 2300, '2023-01-16'),
(17, 'Raj', 'Chennai', 2700, '2023-01-17'),
(18, 'Simran', 'Hyderabad', 2000, '2023-01-18'),
(19, 'Deepak', 'Bangalore', 2500, '2023-01-19'),
(20, 'Nisha', 'Chennai', 2600, '2023-01-20');
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    amount INT,
    order_date DATE
);

INSERT INTO orders (order_id, name, city, amount, order_date) VALUES
(101, 'Rahul', 'Hyderabad', 2500, '2026-05-10'),
(102, 'Ayesha', 'Mumbai', 1800, '2026-05-11'),
(103, 'Kiran', 'Bangalore', 3200, '2026-05-12'),
(104, 'Sneha', 'Chennai', 1500, '2026-05-13'),
(105, 'Arjun', 'Delhi', 2750, '2026-05-14'),
(106, 'Vikram', 'Hyderabad', 2100, '2026-05-15'),
(107, 'Meera', 'Chennai', 1900, '2026-05-16'),
(108, 'Rohit', 'Mumbai', 3000, '2026-05-17'),
(109, 'Priya', 'Bangalore', 2800, '2026-05-18'),
(110, 'Sanjay', 'Delhi', 3500, '2026-05-19');
