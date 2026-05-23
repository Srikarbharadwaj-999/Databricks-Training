**Schema (MySQL v9)**

    CREATE TABLE Customers (
      customer_id VARCHAR(10) PRIMARY KEY,
      customer_name VARCHAR(20),
      address VARCHAR(50),
      phone_no BIGINT,
      email_id VARCHAR(30)
    );
    
    CREATE TABLE Restaurants (
      restaurant_id VARCHAR(10) PRIMARY KEY,
      restaurant_name VARCHAR(30),
      location VARCHAR(50),
      phone_no BIGINT,
      email_id VARCHAR(30)
    );
    
    CREATE TABLE FoodItems (
      food_id VARCHAR(10) PRIMARY KEY,
      food_name VARCHAR(30),
      price DOUBLE(10,2),
      restaurant_id VARCHAR(10),
      FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
    );
    
    CREATE TABLE Orders (
      order_id VARCHAR(10) PRIMARY KEY,
      customer_id VARCHAR(10),
      food_id VARCHAR(10),
      order_date DATE,
      quantity INT,
      total_amount DOUBLE(10,2),
      FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
      FOREIGN KEY (food_id) REFERENCES FoodItems(food_id)
    );
    -- Customers
    INSERT INTO Customers VALUES ('CU1', 'Alice Brown', 'Chicago Ave', 9876543210, 'alice@cust.com');
    INSERT INTO Customers VALUES ('CU2', 'Bob Smith', 'Houston Road', 9876543211, 'bob@cust.com');
    INSERT INTO Customers VALUES ('CU3', 'Charlie Johnson', 'Miami Blvd', 9876543212, 'charlie@cust.com');
    
    -- Restaurants
    INSERT INTO Restaurants VALUES ('R1', 'Pizza Palace', 'New York', 9876543213, 'pizza@rest.com');
    INSERT INTO Restaurants VALUES ('R2', 'Burger Hub', 'Los Angeles', 9876543214, 'burger@rest.com');
    INSERT INTO Restaurants VALUES ('R3', 'Curry House', 'Chicago', 9876543215, 'curry@rest.com');
    
    -- Food Items
    INSERT INTO FoodItems VALUES ('F1', 'Margherita Pizza', 12.50, 'R1');
    INSERT INTO FoodItems VALUES ('F2', 'Pepperoni Pizza', 15.00, 'R1');
    INSERT INTO FoodItems VALUES ('F3', 'Cheeseburger', 10.00, 'R2');
    INSERT INTO FoodItems VALUES ('F4', 'Veggie Burger', 9.00, 'R2');
    INSERT INTO FoodItems VALUES ('F5', 'Chicken Curry', 13.00, 'R3');
    INSERT INTO FoodItems VALUES ('F6', 'Paneer Curry', 11.00, 'R3');
    INSERT INTO FoodItems VALUES ('F7', 'Naan Bread', 3.00, 'R3');
    
    -- Orders
    INSERT INTO Orders VALUES ('O1', 'CU1', 'F1', '2026-05-10', 2, 25.00);
    INSERT INTO Orders VALUES ('O2', 'CU2', 'F3', '2026-05-11', 1, 10.00);
    INSERT INTO Orders VALUES ('O3', 'CU1', 'F5', '2026-05-12', 3, 39.00);
    INSERT INTO Orders VALUES ('O4', 'CU3', 'F2', '2026-05-12', 1, 15.00);
    INSERT INTO Orders VALUES ('O5', 'CU2', 'F4', '2026-05-13', 2, 18.00);

---

**Query #1**

    SELECT 
        r.restaurant_name,
        f.food_name
    FROM Restaurants r
    LEFT JOIN FoodItems f 
        ON r.restaurant_id = f.restaurant_id;

| restaurant_name | food_name        |
| --------------- | ---------------- |
| Pizza Palace    | Pepperoni Pizza  |
| Pizza Palace    | Margherita Pizza |
| Burger Hub      | Veggie Burger    |
| Burger Hub      | Cheeseburger     |
| Curry House     | Naan Bread       |
| Curry House     | Paneer Curry     |
| Curry House     | Chicken Curry    |

---
**Query #2**

    SELECT 
        o.order_id,
        c.customer_id,
        f.food_name,
        o.quantity,
        o.total_amount
    FROM Orders o
    LEFT JOIN Customers c 
        ON o.customer_id = c.customer_id
    LEFT JOIN FoodItems f
        ON o.food_id = f.food_id;

| order_id | customer_id | food_name        | quantity | total_amount |
| -------- | ----------- | ---------------- | -------- | ------------ |
| O1       | CU1         | Margherita Pizza | 2        | 25           |
| O2       | CU2         | Cheeseburger     | 1        | 10           |
| O3       | CU1         | Chicken Curry    | 3        | 39           |
| O4       | CU3         | Pepperoni Pizza  | 1        | 15           |
| O5       | CU2         | Veggie Burger    | 2        | 18           |

---
**Query #3**

    SELECT 
        c.customer_name,
        SUM(o.total_amount) AS total_spent
    FROM Customers c
    LEFT JOIN Orders o 
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_name;

| customer_name   | total_spent |
| --------------- | ----------- |
| Alice Brown     | 64          |
| Bob Smith       | 28          |
| Charlie Johnson | 15          |

---
**Query #4**

    SELECT 
        r.restaurant_name,
        COUNT(f.food_id) AS fooditems
    FROM Restaurants r
    LEFT JOIN FoodItems f
        ON r.restaurant_id = f.restaurant_id
    GROUP BY r.restaurant_name
    HAVING COUNT(f.food_id) >= 3;

| restaurant_name | fooditems |
| --------------- | --------- |
| Curry House     | 3         |

---
**Query #5**

    SELECT 
        r.restaurant_name,
        AVG(f.price) AS avg_price
    FROM Restaurants r
    LEFT JOIN FoodItems f
        ON r.restaurant_id = f.restaurant_id
    GROUP BY r.restaurant_name;

| restaurant_name | avg_price |
| --------------- | --------- |
| Pizza Palace    | 13.75     |
| Burger Hub      | 9.5       |
| Curry House     | 9         |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
