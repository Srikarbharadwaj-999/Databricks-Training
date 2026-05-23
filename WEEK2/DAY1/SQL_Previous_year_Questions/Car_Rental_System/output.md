**Schema (MySQL v9)**

    CREATE TABLE Owners (
      owner_id VARCHAR(10) PRIMARY KEY,
      owner_name VARCHAR(20),
      address VARCHAR(20),
      phone_no BIGINT,
      email_id VARCHAR(20)
    );
    
    CREATE TABLE Cars (
      car_id VARCHAR(10) PRIMARY KEY,
      car_name VARCHAR(20),
      car_type VARCHAR(20),
      owner_id VARCHAR(10),
      FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
    );
    
    CREATE TABLE Customers (
      customer_id VARCHAR(10) PRIMARY KEY,
      customer_name VARCHAR(20),
      address VARCHAR(20),
      phone_no BIGINT,
      email_id VARCHAR(20)
    );
    
    CREATE TABLE Rentals (
      rental_id VARCHAR(10) PRIMARY KEY,
      customer_id VARCHAR(10),
      car_id VARCHAR(10),
      pickup_date DATE,
      return_date DATE,
      km_driven INT,
      fare_amount DOUBLE(10,2),
      FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
      FOREIGN KEY (car_id) REFERENCES Cars(car_id)
    );
    -- Owners
    INSERT INTO Owners VALUES ('O1', 'John Carter', 'NY Street 10', 9876543210, 'john@cars.com');
    INSERT INTO Owners VALUES ('O2', 'Emily Davis', 'LA Street 5', 9876543211, 'emily@cars.com');
    
    -- Cars
    INSERT INTO Cars VALUES ('C1', 'Toyota Corolla', 'Sedan', 'O1');
    INSERT INTO Cars VALUES ('C2', 'Honda Civic', 'Sedan', 'O1');
    INSERT INTO Cars VALUES ('C3', 'Ford Explorer', 'SUV', 'O2');
    
    -- Customers
    INSERT INTO Customers VALUES ('CU1', 'Alice Brown', 'Chicago Ave', 9876543212, 'alice@cust.com');
    INSERT INTO Customers VALUES ('CU2', 'Bob Smith', 'Houston Road', 9876543213, 'bob@cust.com');
    INSERT INTO Customers VALUES ('CU3', 'Charlie Johnson', 'Miami Blvd', 9876543214, 'charlie@cust.com');
    
    -- Rentals
    INSERT INTO Rentals VALUES ('R1', 'CU1', 'C1', '2026-05-01', '2026-05-05', 500, 250.00);
    INSERT INTO Rentals VALUES ('R2', 'CU2', 'C2', '2026-05-02', '2026-05-04', 300, 180.00);
    INSERT INTO Rentals VALUES ('R3', 'CU1', 'C3', '2026-05-06', '2026-05-08', 400, 300.00);
    INSERT INTO Rentals VALUES ('R4', 'CU3', 'C1', '2026-05-07', '2026-05-09', 350, 200.00);

---

**Query #1**

    -- 1. Owners and Cars (LEFT JOIN)
    SELECT 
        o.owner_id,
        o.owner_name,
        c.car_id,
        c.car_name
    FROM Owners o
    LEFT JOIN Cars c 
        ON o.owner_id = c.owner_id;

| owner_id | owner_name  | car_id | car_name       |
| -------- | ----------- | ------ | -------------- |
| O1       | John Carter | C2     | Honda Civic    |
| O1       | John Carter | C1     | Toyota Corolla |
| O2       | Emily Davis | C3     | Ford Explorer  |

---
**Query #2**

    -- 2. Rental Details with Customer, Car & Owner Info
    SELECT 
        r.rental_id,
        c.customer_name,
        cr.car_name,
        cr.car_type,
        o.owner_name
    FROM Rentals r
    LEFT JOIN Customers c
        ON r.customer_id = c.customer_id
    LEFT JOIN Cars cr 
        ON r.car_id = cr.car_id
    LEFT JOIN Owners o 
        ON cr.owner_id = o.owner_id;

| rental_id | customer_name   | car_name       | car_type | owner_name  |
| --------- | --------------- | -------------- | -------- | ----------- |
| R1        | Alice Brown     | Toyota Corolla | Sedan    | John Carter |
| R2        | Bob Smith       | Honda Civic    | Sedan    | John Carter |
| R3        | Alice Brown     | Ford Explorer  | SUV      | Emily Davis |
| R4        | Charlie Johnson | Toyota Corolla | Sedan    | John Carter |

---
**Query #3**

    -- 3. Car-wise Rental Analytics (Window Functions)
    SELECT 
        r.rental_id,
        r.car_id,
        c.car_name,
        c.car_type,
        SUM(r.fare_amount) OVER (PARTITION BY r.car_id) AS total_fare,
        COUNT(r.rental_id) OVER (PARTITION BY r.car_id) AS total_rentals,
        AVG(r.fare_amount) OVER (PARTITION BY r.car_id) AS avg_fare_per_rental
    FROM Rentals r
    LEFT JOIN Cars c
        ON r.car_id = c.car_id;

| rental_id | car_id | car_name       | car_type | total_fare | total_rentals | avg_fare_per_rental |
| --------- | ------ | -------------- | -------- | ---------- | ------------- | ------------------- |
| R1        | C1     | Toyota Corolla | Sedan    | 450        | 2             | 225                 |
| R4        | C1     | Toyota Corolla | Sedan    | 450        | 2             | 225                 |
| R2        | C2     | Honda Civic    | Sedan    | 180        | 1             | 180                 |
| R3        | C3     | Ford Explorer  | SUV      | 300        | 1             | 300                 |

---
**Query #4**

    -- 4. Customers who rented more than 1 car
    SELECT 
        c.customer_name,
        COUNT(DISTINCT r.car_id) AS cars_rented
    FROM Rentals r
    LEFT JOIN Customers c
        ON r.customer_id = c.customer_id
    GROUP BY c.customer_name
    HAVING COUNT(DISTINCT r.car_id) > 1;

| customer_name | cars_rented |
| ------------- | ----------- |
| Alice Brown   | 2           |

---
**Query #5**

    -- 5. Average KM driven per car
    SELECT 
        c.car_name,
        AVG(r.km_driven) AS avg_km
    FROM Rentals r
    LEFT JOIN Cars c 
        ON r.car_id = c.car_id
    GROUP BY c.car_name;

| car_name       | avg_km |
| -------------- | ------ |
| Toyota Corolla | 425.0  |
| Honda Civic    | 300.0  |
| Ford Explorer  | 400.0  |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
