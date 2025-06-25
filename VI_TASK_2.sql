-- 1. Create Customers table
CREATE TABLE Customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT,
  city TEXT
);

-- 2. Create Orders table
CREATE TABLE Orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  product_name TEXT,
  quantity INTEGER,
  order_date TEXT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 3. Insert Customers (with NULLs)
INSERT INTO Customers (customer_id, name, email, city)
VALUES (1, 'Ravi Kumar', 'ravi@example.com', 'Delhi');

INSERT INTO Customers (customer_id, name, email, city)
VALUES (2, 'Sneha Shah', NULL, 'Mumbai'); -- Email is NULL

INSERT INTO Customers (customer_id, name, email, city)
VALUES (3, 'Amit Patil', 'amit@example.com', NULL); -- City is NULL

INSERT INTO Customers (customer_id, name, email, city)
VALUES (4, 'Neha Singh', NULL, NULL); -- Both email and city are NULL

INSERT INTO Customers (customer_id, name, email, city)
VALUES (5, 'Vikas Mehta', 'vikas@example.com', 'Chennai');

-- 4. Insert Orders (with NULL date)
INSERT INTO Orders (order_id, customer_id, product_name, quantity, order_date)
VALUES (101, 1, 'Mobile Phone', 1, '2025-06-01');

INSERT INTO Orders (order_id, customer_id, product_name, quantity, order_date)
VALUES (102, 2, 'Laptop', 1, NULL); -- Date is NULL

INSERT INTO Orders (order_id, customer_id, product_name, quantity, order_date)
VALUES (103, 1, 'Headphones', 2, '2025-06-02');

INSERT INTO Orders (order_id, customer_id, product_name, quantity, order_date)
VALUES (104, 5, 'Smartwatch', 1, NULL); -- Date is NULL

-- 5. Update NULL email in Customers
UPDATE Customers
SET email = 'noemail@example.com'
WHERE email IS NULL;

-- 6. Update city for customer where city is NULL
UPDATE Customers
SET city = 'Unknown City'
WHERE city IS NULL;

-- 7. Update Orders with NULL date to a default date
UPDATE Orders
SET order_date = '2025-06-15'
WHERE order_date IS NULL;

DELETE FROM Orders
WHERE customer_id IN (
    SELECT customer_id FROM Customers WHERE city = 'Chennai'
);

-- Now delete customers from Chennai
DELETE FROM Customers
WHERE city = 'Chennai';

-- 10. Show final data
SELECT * FROM Customers;
SELECT * FROM Orders;



