CREATE DATABASE SuperStore;
USE SuperStore;
CREATE TABLE sales(
    RowID          INT,
    OrderID        VARCHAR(50),
    OrderDate      VARCHAR(20),      
    ShipDate       VARCHAR(20),      
    ShipMode       VARCHAR(50),
    CustomerID     VARCHAR(50),
    CustomerName   VARCHAR(100),
    State          VARCHAR(100),
    Country        VARCHAR(100),
    ProductID      VARCHAR(50),
    Category       VARCHAR(50),
    ProductName    TEXT,
    Sales          DECIMAL(10,3),    
    Quantity       INT,              
    Discount       DECIMAL(4,2),     
    Profit         DECIMAL(12,4),    
    Month          INT,             
    Year           INT,              
    ProfitMargin   VARCHAR(10)       
);


SET GLOBAL LOCAL_INFILE=ON;
SHOW VARIABLES LIKE 'LOCAL_INFILE';
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 9.5/Uploads/CSV_Superstore_Cleaned.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM sales LIMIT 10;
SELECT COUNT(*) FROM SALES;

SET SQL_SAFE_UPDATES=0;

SELECT OrderDate, STR_TO_DATE(OrderDate, '%d-%m-%Y') as FixedDate FROM sales LIMIT 5;
SELECT ShipDate, STR_TO_DATE(ShipDate, '%d-%m-%Y') as FixedShipDate FROM sales LIMIT 5;
UPDATE sales SET OrderDate = STR_TO_DATE(OrderDate, '%d-%m-%Y');
UPDATE sales SET ShipDate = STR_TO_DATE(ShipDate, '%d-%m-%Y');

SELECT 
  COUNT(*)               AS Total_Rows,
  MIN(OrderDate)         AS First_Order,
  MAX(OrderDate)         AS Last_Order,
  SUM(Sales)             AS Total_Sales,
  SUM(Profit)            AS Total_Profit
FROM sales;

-- YEARLY SALES & PROFIT
SELECT 
  Year,
  SUM(Sales)  AS Year_Sales,
  SUM(Profit) AS Year_Profit
FROM sales
GROUP BY Year
ORDER BY Year;

-- COUNTRYWISE SALES
SELECT 
  Country,
  SUM(Sales)  AS Country_Sales,
  SUM(Profit) AS Country_Profit
FROM sales
GROUP BY Country
ORDER BY Country_Profit DESC;
-- TOP PROFITABLE PRODUCTS
SELECT 
  ProductName,
  SUM(Sales)  AS Product_Sales,
  SUM(Profit) AS Product_Profit
FROM sales
GROUP BY ProductName
ORDER BY Product_Sales DESC
LIMIT 10;

-- LOSS MAKING PRODUCTS
SELECT 
  ProductName,
  SUM(Sales)  AS Product_Sales,
  SUM(Profit) AS Product_Profit
FROM sales
GROUP BY ProductName
HAVING Product_Profit < 0
ORDER BY Product_Profit ASC
LIMIT 10;


-- MONTH WISE TREND

SELECT 
  Year,
  Month,
  SUM(Sales)  AS Month_Sales,
  SUM(Profit) AS Month_Profit
FROM sales
GROUP BY Year, Month
ORDER BY Year, Month;


SELECT COUNTRY, SUM(SALES) AS COUNTRY_SALES
FROM SALES GROUP BY COUNTRY
ORDER BY COUNTRY_SALES DESC
LIMIT 5;

SELECT PRODUCTNAME, SUM(Sales) AS Top_Products
From sales GROUP BY ProductName
ORDER BY Top_Products Desc
LIMIT 5;
