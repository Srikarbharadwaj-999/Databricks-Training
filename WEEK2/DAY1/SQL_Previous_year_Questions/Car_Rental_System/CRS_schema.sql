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
