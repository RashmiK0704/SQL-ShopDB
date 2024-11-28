CREATE DATABASE ShopDB;

USE ShopDB;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    Order_date DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(200),
    Price DECIMAL(10,2),
    Description TEXT,
    IsReturnable ENUM('Yes', 'No')
);

-- Insert Data into Customers Table
INSERT INTO Customers (CustomerID, Name, email, Address, City)
VALUES (101, 'Mickey','mickey@gmail.com','street 8 house no. 2', 'Delhi'),
	       (102, 'Jimi','gimi@gmail.com', 'Dockyard lane', 'Mumbai'),
               (103, 'Nitesh','nitesh@gmail.com', 'Musakhedi', 'Indore'),
               (104, 'Om','om@gmail.com', 'street5 ', 'Dewas'),
               (105, 'Asha','asha@gmail.com', 'Sudama nagar', 'Indore');

-- Insert Data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, TotalAmount, Status, Order_date)
VALUES (1, 101, 1250.00, 'Delivered', '2024-01-10'),
               (2, 101, 4000.00, 'Pending', '2024-01-15'),
               (3, 102, 1500.00, 'Delivered', '2024-08-12'),
               (4, 103, 250.00, 'Returned', '2024-04-13'),
               (5, 104, 350.00, 'Delivered', '2024-03-14'),
               (6, 105, 150.00, 'Returned', '2024-02-16');

-- Insert Data into Products Table
INSERT INTO Products (ProductID, ProductName,Price, Description, IsReturnable) 
VALUES('P001', 'Phone', 1250.00, 'A smartphone', 'Yes'),
              ('P002', 'Laptop', 4000.00, 'Gaming laptop', 'No'),
	      ('P003', 'Shoes', 300.00, 'Black color shoes', 'Yes'),
              ('P004', 'Shirt', 500.00, 'Cotton, Floral print shirt', 'Yes'),
              ('P005', 'Smart Watch', 2000.00, 'Black color', 'Yes');


-- Question 1: Check the status of your order
SELECT OrderID, Status
FROM Orders
WHERE OrderID = 1;

-- Question 2: Find the total amount of your orders
SELECT CustomerID, SUM(TotalAmount) AS TotalAmount
FROM Orders
WHERE CustomerID = 101
GROUP BY CustomerID;

-- Question 3: Update your city (corrected city column)
UPDATE Customers
SET City = 'Bhopal'
WHERE CustomerID = 101;

-- Question 4: Change Product Description
UPDATE Products
SET Description = 'A high-performance smartphone with fast processing and a crystal-clear display.'
WHERE ProductID = 'P001';

-- Question 5: Display returnable products
SELECT ProductID, ProductName, Description
FROM Products
WHERE IsReturnable = 'Yes';