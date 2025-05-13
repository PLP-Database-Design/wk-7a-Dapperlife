Q1

-- Step 1: Create the normalized tables
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderProducts (
    OrderProductID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 2: Insert the normalized data (assuming original data is in a temp table)
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName FROM ProductDetail;

-- Step 3: Insert the split products (this would require application logic or multiple statements)
-- For example, for order 101:
INSERT INTO OrderProducts (OrderID, Product) VALUES (101, 'Laptop');
INSERT INTO OrderProducts (OrderID, Product) VALUES (101, 'Mouse');

-- For order 102:
INSERT INTO OrderProducts (OrderID, Product) VALUES (102, 'Tablet');
INSERT INTO OrderProducts (OrderID, Product) VALUES (102, 'Keyboard');
INSERT INTO OrderProducts (OrderID, Product) VALUES (102, 'Mouse');

-- For order 103:
INSERT INTO OrderProducts (OrderID, Product) VALUES (103, 'Phone');


Q2
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Order_Items (
    OrderID INT NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
