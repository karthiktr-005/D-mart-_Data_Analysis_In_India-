create schema d_mart_analysis;

use d_mart_analysis;

CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    PhoneNumber VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50)
);

INSERT INTO Customers (Customer_id, FirstName, LastName, Gender, Age, PhoneNumber, City, State) VALUES
    (1, 'Lakshmi', 'Ravi', 'Female', 22, '9876543210', 'Chennai', 'Tamil Nadu'),
    (2, 'Vivek', 'Sharma', 'Male', 24, '9876543211', 'Bengaluru', 'Karnataka'),
    (3, 'Sita', 'Mehta', 'Female', 23, '9876543213', 'Kolkata', 'West Bengal'),
    (4, 'Neha', 'Gupta', 'Female', 20, '9876543215', 'Pune', 'Maharashtra'),
    (5, 'Raj', 'Kapoor', 'Male', 25, '9876543220', 'Delhi', 'Delhi'),
    (6, 'Rajesh', 'Kumar', 'Male', 35, '9876543212', 'Mumbai', 'Maharashtra'),
    (7, 'Arun', 'Patel', 'Male', 42, '9876543214', 'Hyderabad', 'Telangana'),
    (8, 'Manoj', 'Iyer', 'Male', 33, '9876543216', 'Coimbatore', 'Tamil Nadu'),
    (9, 'Anjali', 'Deshmukh', 'Female', 29, '9876543217', 'Ahmedabad', 'Gujarat'),
    (10, 'Ravi', 'Varma', 'Male', 39, '9876543218', 'Lucknow', 'Uttar Pradesh'),
    (11, 'Neeraj', 'Singh', 'Male', 30, '9876543221', 'Indore', 'Madhya Pradesh'),
    (12, 'Pooja', 'Sharma', 'Female', 27, '9876543222', 'Jaipur', 'Rajasthan'),
    (13, 'Suresh', 'Reddy', 'Male', 28, '9876543223', 'Visakhapatnam', 'Andhra Pradesh'),
    (14, 'Kiran', 'Nair', 'Female', 31, '9876543224', 'Thiruvananthapuram', 'Kerala'),
    (15, 'Vinay', 'Rao', 'Male', 29, '9876543225', 'Mysuru', 'Karnataka');
    
    
    CREATE TABLE Products (
    Product_id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    ExpiryDate DATE
);

INSERT INTO Products (Product_id, ProductName, Category, Brand, Price, StockQuantity, ExpiryDate) VALUES
    (1, 'Basmati Rice', 'Groceries', 'India Gate', 1500, 500, '2025-12-31'),
    (2, 'Cotton Shirt', 'Clothing', 'Raymond', 1200, 250, '2025-06-30'),
    (3, 'Organic Apples', 'Fruits', 'Nature Fresh', 200, 400, '2024-12-15'),
    (4, 'Whole Wheat Flour', 'Groceries', 'Aashirvaad', 600, 1000, '2025-11-20'),
    (5, 'Casual Shoes', 'Footwear', 'Bata', 3000, 300, '2025-10-25'),
    (6, 'Packaged Juice', 'Beverages', 'Real', 120, 600, '2025-02-05'),
    (7, 'Formal Pants', 'Clothing', 'Arrow', 1800, 200, '2025-06-15'),
    (8, 'Organic Spinach', 'Vegetables', 'Fresh Farms', 60, 800, '2024-10-01'),
    (9, 'Milk', 'Dairy', 'Amul', 70, 1000, '2024-09-28'),
    (10, 'Luxury Sofa', 'Furniture', 'Godrej', 45000, 50, NULL),
    (11, 'Packaged Almonds', 'Dry Fruits', 'Nutty', 1200, 400, '2025-12-10'),
    (12, 'Cotton Bedsheet', 'Home Decor', 'Bombay Dyeing', 1500, 600, '2025-04-25'),
    (13, 'Green Tea', 'Beverages', 'Tata Tea', 500, 700, '2025-12-31'),
    (14, 'Leather Jacket', 'Clothing', 'Woodland', 7000, 150, '2025-06-20'),
    (15, 'Instant Coffee', 'Beverages', 'Nescafe', 450, 800, '2025-03-12');
    
    CREATE TABLE Stores (
		Store_id INT PRIMARY KEY AUTO_INCREMENT,
		StoreName VARCHAR(100),
		City VARCHAR(50),
		State VARCHAR(50)
	);

INSERT INTO Stores (Store_id, StoreName, City, State)
VALUES
(1, 'SuperMart', 'Mumbai', 'Maharashtra'),
(2, 'MegaStore', 'Bengaluru', 'Karnataka'),
(3, 'Grocery Hub', 'Delhi', 'Delhi'),
(4, 'Fashion Point', 'Chennai', 'Tamil Nadu'),
(5, 'Electro World', 'Hyderabad', 'Telangana'),
(6, 'Home Essentials', 'Pune', 'Maharashtra'),
(7, 'Book Nook', 'Ahmedabad', 'Gujarat'),
(8, 'Sporting Goods', 'Jaipur', 'Rajasthan'),
(9, 'Pet Paradise', 'Kolkata', 'West Bengal'),
(10, 'Kids World', 'Lucknow', 'Uttar Pradesh'),
(11, 'Fruits & Veggies', 'Coimbatore', 'Tamil Nadu'),
(12, 'Beverage Barn', 'Visakhapatnam', 'Andhra Pradesh'),
(13, 'Beauty Shoppe', 'Surat', 'Gujarat'),
(14, 'Hardware Hub', 'Nagpur', 'Maharashtra'),
(15, 'Kitchen King', 'Indore', 'Madhya Pradesh');


CREATE TABLE Sales (
		Sale_id INT PRIMARY KEY AUTO_INCREMENT,
		SaleDate DATE,
		Customer_id INT,
		Store_id INT,
		TotalAmount DECIMAL(10, 2),
		Tax DECIMAL(10, 2),
		CONSTRAINT fk_Customer FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
		CONSTRAINT fk_Store FOREIGN KEY (Store_id) REFERENCES Stores(Store_id),
		INDEX idx_customer (Customer_id),
		INDEX idx_store (Store_id)
);

INSERT INTO Sales (Sale_id, SaleDate, Customer_id, Store_id, TotalAmount) VALUES  
    (1, '2024-09-20', 1, 1, 1500.00),     
    (2, '2024-09-21', 2, 2, 1200.00),     
    (3, '2024-09-22', 3, 3, 600.00),      
    (4, '2024-09-23', 4, 4, 3000.00),     
    (5, '2024-09-24', 5, 5, 3000.00),     
    (6, '2024-09-25', 6, 6, 480.00),     
    (7, '2024-09-26', 7, 7, 3600.00),     
    (8, '2024-09-27', 8, 8, 600.00),      
    (9, '2024-09-28', 9, 9, 70.00),       
    (10, '2024-09-29', 10, 10, 45000.00),  
    (11, '2024-09-30', 11, 11, 3600.00),  
    (12, '2024-10-01', 12, 12, 3000.00),  
    (13, '2024-10-02', 13, 13, 2500.00),  
    (14, '2024-10-03', 14, 14, 7000.00),  
    (15, '2024-10-04', 15, 15, 1800.00);



CREATE TABLE SalesDetails (
    SaleDetail_id INT PRIMARY KEY AUTO_INCREMENT,
    Sale_id INT,
    Product_id INT,
    Quantity INT,
    TaxPercentage DECIMAL(10, 2),
    TaxAmount DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (Sale_id) REFERENCES Sales(Sale_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id),
    INDEX idx_sale (Sale_id),
    INDEX idx_product (Product_id)
);

INSERT INTO SalesDetails (Sale_id, Product_id, Quantity, TaxPercentage, TaxAmount, TotalPrice) VALUES
(1, 1, 1, 5, 75, 1500.00),        -- Sale 1, Product 1
(2, 2, 1, 12, 144, 1200.00),      -- Sale 2, Product 2
(3, 3, 3, 5, 10, 600.00),          -- Sale 3, Product 3
(4, 4, 5, 5, 30, 3000.00),         -- Sale 4, Product 4
(5, 5, 1, 18, 540, 3000.00),      -- Sale 5, Product 5
(6, 6, 4, 18, 22, 480.00),         -- Sale 6, Product 6
(7, 7, 2, 12, 216, 3600.00),      -- Sale 7, Product 7
(8, 8, 10, 5, 3, 600.00),           -- Sale 8, Product 8
(9, 9, 1, 5, 4, 70.00),             -- Sale 9, Product 9
(10, 10, 1, 12, 5400, 45000.00), -- Sale 10, Product 10
(11, 11, 3, 5, 60, 3600.00),      -- Sale 11, Product 11
(12, 12, 2, 12, 180, 3000.00),    -- Sale 12, Product 12
(13, 13, 5, 18, 90, 2500.00),      -- Sale 13, Product 13
(14, 14, 1, 12, 840, 7000.00),    -- Sale 14, Product 14
(15, 15, 4, 18, 81, 1800.00);      -- Sale 15, Product 15




CREATE TABLE Inventory (
    Inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    Product_id INT,
    Store_id INT,
    StockQuantity INT,
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id),
    FOREIGN KEY (Store_id) REFERENCES Stores(Store_id),
    INDEX idx_product_inventory (Product_id),
    INDEX idx_store_inventory (Store_id)
);

INSERT INTO Inventory (Inventory_id, Product_id, Store_id, StockQuantity) VALUES
(1, 1, 1, 100),  -- ProductID 1 in StoreID 1
(2, 2, 2, 150),  -- ProductID 2 in StoreID 2
(3, 3, 3, 200),  -- ProductID 3 in StoreID 3
(4, 4, 4, 250),  -- ProductID 4 in StoreID 4
(5, 5, 5, 300),  -- ProductID 5 in StoreID 5
(6, 6, 6, 350),  -- ProductID 6 in StoreID 6
(7, 7, 7, 400),  -- ProductID 7 in StoreID 7
(8, 8, 8, 450),  -- ProductID 8 in StoreID 8
(9, 9, 9, 500),  -- ProductID 9 in StoreID 9
(10, 10, 10, 550), -- ProductID 10 in StoreID 10
(11, 11, 11, 600), -- ProductID 11 in StoreID 11
(12, 12, 12, 650), -- ProductID 12 in StoreID 12
(13, 13, 13, 700), -- ProductID 13 in StoreID 13
(14, 14, 14, 750), -- ProductID 14 in StoreID 14
(15, 15, 15, 800); -- ProductID 15 in StoreID 15



CREATE TABLE Revenue (
    Revenue_id INT PRIMARY KEY AUTO_INCREMENT,
    Sale_id INT,
    Store_id INT,
    TaxPercentage DECIMAL(10, 2),
    TaxAmount DECIMAL(10,2),
    TotalRevenue DECIMAL(10, 2),
    RevenueDate DATE,
    FOREIGN KEY (Sale_id) REFERENCES Sales(Sale_id),
    FOREIGN KEY (Store_id) REFERENCES Stores(Store_id),
    INDEX idx_revenue_sale (Sale_id),
    INDEX idx_revenue_store (Store_id)
);

INSERT INTO Revenue (Revenue_id, Sale_id, Store_id, TaxPercentage, TaxAmount, TotalRevenue, RevenueDate) VALUES
(1, 1, 1, 5, 75.00, 1500.00, '2024-09-20'),   
(2, 2, 2, 12, 144.00, 1200.00, '2024-09-21'),   
(3, 3, 3, 5, 10.00, 600.00, '2024-09-22'),   
(4, 4, 4, 5, 30.00, 3000.00, '2024-09-23'),   
(5, 5, 5, 18, 540.00, 3000.00, '2024-09-24'),   
(6, 6, 6, 18, 22.00, 480.00, '2024-09-25'),   
(7, 7, 7, 12, 216.00, 3600.00, '2024-09-26'),    
(8, 8, 8, 5, 3.00, 600.00, '2024-09-27'),     
(9, 9, 9, 5, 4.00, 70.00, '2024-09-28'),      
(10, 10, 10, 12, 5400.00, 45000.00, '2024-09-29'), 
(11, 11, 11, 5, 60.00, 3600.00, '2024-09-30'),   
(12, 12, 12, 12, 180.00, 3000.00, '2024-10-01'),  
(13, 13, 13, 18, 90.00, 2500.00, '2024-10-02'),  
(14, 14, 14, 12, 840.00, 7000.00, '2024-10-03'),  
(15, 15, 15, 18, 81.00, 1800.00, '2024-10-04');




CREATE TABLE EmployeeSalary (
    Employee_id INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    Designation VARCHAR(50),
    Department VARCHAR(50),
    BasicSalary DECIMAL(10, 2),
    SalaryMonth VARCHAR(20)
);

INSERT INTO EmployeeSalary (Employee_id, EmployeeName, Designation, Department, BasicSalary, SalaryMonth)
VALUES
(1,'Lakshmi Iyer', 'Store Manager', 'Management', 70000.00, 'September 2024'),
(2, 'Vivek Kumar', 'Cashier', 'Sales', 25000.00, 'September 2024'),
(3, 'Priya Rao', 'Sales Associate', 'Sales', 20000.00, 'September 2024'),
(4, 'Arjun Desai', 'Inventory Supervisor', 'Inventory', 40000.00, 'September 2024'),
(5, 'Neha Sharma', 'Customer Service Executive', 'Support', 22000.00, 'September 2024'),
(6, 'Rahul Mehta', 'Accountant', 'Finance', 35000.00, 'September 2024'),
(7, 'Aditi Joshi', 'Marketing Executive', 'Marketing', 30000.00, 'September 2024'),
(8, 'Siddharth Verma', 'IT Support', 'IT', 28000.00, 'September 2024'),
(9, 'Komal Singh', 'HR Executive', 'Human Resources', 32000.00, 'September 2024'),
(10,'Karan Gupta', 'Sales Manager', 'Sales', 70000.00, 'September 2024');

select * from customers;
select * from inventory;
select * from employeesalary;
select * from products;
select * from salesdetails;
select * from sales;
select * from revenue;
select * from stores;

------------------ Data Analysis Question ------------------
                                         
                                               ------ Customer Analysis ------

-- 1.Customer Information Retrieval:
-- Could you write a query to retrieve the first names, last names, and cities of all customers?

DELIMITER $$
CREATE PROCEDURE GetCustomerInformation()
BEGIN
    SELECT FirstName, LastName, City
    FROM Customers;
END $$
DELIMITER ;

call  GetCustomerInformation;


-- 2.Product Price Inquiry:
-- How would you formulate a query to identify all products priced above 500?

DELIMITER $$
CREATE PROCEDURE GetProductsAbovePrice()
BEGIN
    SELECT *
    FROM Products
    WHERE price > 500;
END $$
DELIMITER ;

CALL GetProductsAbovePrice();


-- 3.Store Count Assessment:
-- Can you provide a query to count the total number of stores listed in the Stores table?

DELIMITER $$
CREATE PROCEDURE GetTotalStores()
BEGIN
    SELECT COUNT(*) AS TotalStores
    FROM Stores;
END $$
DELIMITER ;

CALL GetTotalStores();


-- 4.Unique Customer Cities:
-- Please write a query to list the distinct cities where customers reside.

DELIMITER $$
CREATE PROCEDURE GetUniqueCustomerCities()
BEGIN
    SELECT DISTINCT City
    FROM Customers;
END $$
DELIMITER ;

CALL GetUniqueCustomerCities();


-- 5.Customer Sales Totals: 
-- How would you construct a query to retrieve the total number of sales made by each customer?

DELIMITER $$
CREATE PROCEDURE GetCustomerSalesTotals()
BEGIN
    SELECT Customer_id, COUNT(*) AS TotalSales
    FROM Sales
    GROUP BY Customer_id;
END $$
DELIMITER ;

CALL GetCustomerSalesTotals;


                                                 ---- Product Analysis ------


-- 1. Retrieve All Product Details:
-- How can you retrieve all the products from the Products table using a stored procedure?

DELIMITER $$
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END $$
DELIMITER ;

CALL GetAllProducts();


-- 2.Count of Products in Each Category:
-- How can you find the count of products grouped by category using a stored procedure?

DELIMITER $$
CREATE PROCEDURE CountProductsInEachCategory()
BEGIN
    SELECT Category, COUNT(*) AS product_count 
    FROM Products 
    GROUP BY Category;
END $$
DELIMITER ;

CALL CountProductsInEachCategory();


3. Top-N Expensive Products:
How can you retrieve the top N most expensive products using a stored procedure?

DELIMITER $$
CREATE PROCEDURE GetTopExpensiveProducts(IN limit_count INT)
BEGIN
    SELECT * 
    FROM Products 
    ORDER BY price DESC 
    LIMIT limit_count;
END $$
DELIMITER ;

CALL GetTopExpensiveProducts(5);


-- 4. List out  Products Under a Specific Price
-- How can you list all products that are priced under a specific amount using a stored procedure?

DELIMITER $$
CREATE PROCEDURE GetProductsUnderPrice(IN maxPrice DECIMAL(10, 2))
BEGIN
    SELECT *
    FROM Products
    WHERE Price < maxPrice;
END $$
DELIMITER ;

CALL GetProductsUnderPrice(300);


-- 5. List out  Average Price of Products
-- How can you find the average price of products?

DELIMITER $$

CREATE PROCEDURE GetAveragePrice()
BEGIN
    SELECT AVG(Price) AS AveragePrice
    FROM Products;
END $$

DELIMITER ;

Call GetAveragePrice()



                                                   ------ Store Analysis ------


-- 1. What is the total number of stores located in each state?

DELIMITER $$

CREATE PROCEDURE GetTotalStoresByState()
BEGIN
    SELECT State, COUNT(*) AS TotalStores
    FROM Stores
    GROUP BY State;
END $$

DELIMITER ;

Call GetTotalStoresByState()


-- 2. Which cities have the highest concentration of stores?

DELIMITER $$
CREATE PROCEDURE GetTopCitiesByStoreCount(IN topN INT)
BEGIN
    SELECT City, COUNT(*) AS TotalStores
    FROM Stores
    GROUP BY City
    ORDER BY TotalStores DESC
    LIMIT topN;
END $$
DELIMITER ;

Call GetTopCitiesByStoreCount(3);

-- 3. What are the top three stores based on name length or alphabetically?

DELIMITER $$
CREATE PROCEDURE GetTopStoresByNameLength(IN topN INT)
BEGIN
    SELECT StoreName
    FROM Stores
    ORDER BY LENGTH(StoreName) DESC
    LIMIT topN;
END $$
DELIMITER ;

call GetTopStoresByNameLength(3);

-- 4. How many stores are there in each city?

DELIMITER $$
CREATE PROCEDURE GetStoresByCity()
BEGIN
    SELECT City, COUNT(*) AS TotalStores
    FROM Stores
    GROUP BY City;
END $$
DELIMITER ;

Call GetStoresByCity();


                                                  ------- Sales Analysis -------


-- 1. List out Total Sales Amount for Each Store ?

DELIMITER $$
CREATE PROCEDURE GetTotalSalesByStore()
BEGIN
    SELECT Store_id, SUM(TotalAmount) AS TotalSales
    FROM Sales
    GROUP BY Store_id;
END $$
DELIMITER ;

call GetTotalSalesByStore();

-- 2. List out Customer with the Highest Total Purchases ?

DELIMITER $$
CREATE PROCEDURE GetTopCustomer()
BEGIN
    SELECT Customer_id, SUM(TotalAmount) AS TotalPurchases
    FROM Sales
    GROUP BY Customer_id
    ORDER BY TotalPurchases DESC
    LIMIT 1;
END $$
DELIMITER ;
 call GetTopCustomer();
 
-- 3. List Out Average Sale Amount Across All Transactions ?

DELIMITER $$
CREATE PROCEDURE GetAverageSaleAmount()
BEGIN
    SELECT AVG(TotalAmount) AS AverageSale
    FROM Sales;
END $$
DELIMITER ;
call GetAverageSaleAmount();



                                        ------ Sales Detail Anslysis ------

 -- 1. Total Quantity Sold for Each Product

DELIMITER $$
CREATE PROCEDURE GetTotalQuantitySoldByProduct()
BEGIN
    SELECT sd.Product_id, SUM(sd.Quantity) AS TotalQuantity
    FROM SalesDetails sd
    GROUP BY sd.Product_id;
END $$
DELIMITER ;

CAll GetTotalQuantitySoldByProduct();


-- 2. Total Sales Amount by Product

DELIMITER $$
CREATE PROCEDURE GetTotalSalesAmountByProduct()
BEGIN
    SELECT sd.Product_id, SUM(sd.TotalPrice) AS TotalSales
    FROM SalesDetails sd
    GROUP BY sd.Product_id;
END $$
DELIMITER ;

Call  GetTotalSalesAmountByProduct();

--  3. Average Tax Amount Per Sale
 
DELIMITER $$
CREATE PROCEDURE GetAverageTaxAmount()
BEGIN
    SELECT AVG(sd.TaxAmount) AS AverageTax
    FROM SalesDetails sd;
END $$
DELIMITER ;

call  GetAverageTaxAmount();


-- 4. Total Tax Collected by Store

DELIMITER $$
CREATE PROCEDURE GetTotalTaxCollectedByStore()
BEGIN
    SELECT s.Store_id, st.StoreName, SUM(sd.TaxAmount) AS TotalTaxCollected
    FROM SalesDetails sd
    JOIN Sales s ON sd.Sale_id = s.Sale_id
    JOIN Stores st ON s.Store_id = st.Store_id
    GROUP BY s.Store_id, st.StoreName;
END $$

DELIMITER ;

call  GetTotalTaxCollectedByStore();


                                    ---------- Inventory Analysis -------------


-- 1. What is the total stock quantity of all products in the inventory?

DELIMITER $$
CREATE PROCEDURE GetTotalStockQuantity()
BEGIN
    SELECT SUM(StockQuantity) AS TotalStock
    FROM Inventory;
END $$
DELIMITER ;

CALL GetTotalStockQuantity();


-- 2. How many products are available in each store?

DELIMITER $$
CREATE PROCEDURE GetProductCountPerStore()
BEGIN
    SELECT Store_id, COUNT(*) AS ProductCount
    FROM Inventory
    GROUP BY Store_id;
END $$
DELIMITER ;

CALL GetProductCountPerStore();


-- 3. Which product has the highest stock quantity?

DELIMITER $$
CREATE PROCEDURE GetHighestStockProduct()
BEGIN
    SELECT Product_id, StockQuantity
    FROM Inventory
    ORDER BY StockQuantity DESC
    LIMIT 1;
END $$
DELIMITER ;
CALL GetHighestStockProduct();

DELIMITER $$
CREATE PROCEDURE GetHighestStockProductwitName()
BEGIN
    SELECT 
        inv.Product_id, 
        p.ProductName, 
        inv.StockQuantity
    FROM Inventory inv
    JOIN Products p ON inv.Product_id = p.Product_id
    ORDER BY inv.StockQuantity DESC
    LIMIT 1;
END $$
DELIMITER ;

CALL GetHighestStockProductwitName();

-- 4. List all products with stock quantity below a certain threshold (e.g., 300)?

DELIMITER $$
CREATE PROCEDURE GetLowStockProducts(IN threshold INT)
BEGIN
    SELECT 
        inv.Product_id, 
        p.ProductName, 
        inv.StockQuantity
    FROM Inventory inv
    JOIN Products p ON inv.Product_id = p.Product_id
    WHERE inv.StockQuantity < threshold;
END $$
DELIMITER ;

CALL GetLowStockProducts(300);


                                                ---- Revenue Analysis ------


-- 1. Total Revenue by Store
-- How can you retrieve the total revenue generated by each store?

DELIMITER $$
CREATE PROCEDURE GetTotalRevenueByStore()
BEGIN
    SELECT Store_id, SUM(TotalRevenue) AS TotalRevenue
    FROM Revenue
    GROUP BY Store_id;
END $$
DELIMITER ;

call GetTotalRevenueByStore();

-- 2. Average Revenue per Sale
-- What is the average revenue generated per sale?

DELIMITER $$
CREATE PROCEDURE GetAverageRevenuePerSale()
BEGIN
    SELECT AVG(TotalRevenue) AS AverageRevenue
    FROM Revenue;
END $$
DELIMITER ;

call GetAverageRevenuePerSale();

-- 3. Total Tax Amount Collected
-- How much total tax has been collected?

DELIMITER $$
CREATE PROCEDURE GetTotalTaxCollected()
BEGIN
    SELECT SUM(TaxAmount) AS TotalTaxCollected
    FROM Revenue;
END $$
DELIMITER ;

Call GetTotalTaxCollected();


                                            ------- Employee Salary ----------


-- 1. What is the total salary expense for the month of September 2024?

DELIMITER $$
CREATE PROCEDURE GetTotalSalaryExpense()
BEGIN
    SELECT SUM(BasicSalary) AS TotalSalaryExpense
    FROM EmployeeSalary
    WHERE SalaryMonth = 'September 2024';
END $$
DELIMITER ;

CALL GetTotalSalaryExpense();

-- 2. Who earns the highest salary in the Sales department?

DELIMITER $$
CREATE PROCEDURE GetHighestSalaryInSales()
BEGIN
    SELECT EmployeeName, BasicSalary
    FROM EmployeeSalary
    WHERE Department = 'Sales'
    ORDER BY BasicSalary DESC
    LIMIT 1;
END $$
DELIMITER ;

CALL GetHighestSalaryInSales();


 -- 3. Who is the highest earner in the entire department for September 2024?
 
DELIMITER $$
CREATE PROCEDURE GetHighestEarner()
BEGIN
    SELECT EmployeeName, Designation, Department, BasicSalary
    FROM EmployeeSalary
    WHERE SalaryMonth = 'September 2024'
    ORDER BY BasicSalary DESC
    LIMIT 1;
END $$
DELIMITER ;

CALL GetHighestEarner();

-- 4. What is the average salary of employees in the organization?

DELIMITER $$
CREATE PROCEDURE GetAverageSalary()
BEGIN
    SELECT AVG(BasicSalary) AS AverageSalary
    FROM EmployeeSalary;
END $$
DELIMITER ;

CALL GetAverageSalary();

-- 5. How many employees are there in each designation?

DELIMITER $$
CREATE PROCEDURE CountEmployeesByDesignation()
BEGIN
    SELECT Designation, COUNT(*) AS EmployeeCount
    FROM EmployeeSalary
    GROUP BY Designation;
END $$
DELIMITER ;

CALL CountEmployeesByDesignation();

