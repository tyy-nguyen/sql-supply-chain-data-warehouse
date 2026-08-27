/*
-------------------------------------------------------------------
This DDL Script creates Bronze tables in the Medallion Architecture
-------------------------------------------------------------------
Script Purpose:
This script creates tables in the 'bronze' schema, and will get rid of
existing tables.
-------------------------------------------------------------------
*/

-- If the table already exists it'll delete it and make a new one.
IF OBJECT_ID ('bronze.customer_master' , 'U') IS NOT NULL
  DROP TABLE bronze.customer_master;
GO
-- Creates Bronze Customer Table (sell-side)
CREATE TABLE bronze.customer_master (
  Customer_ID NVARCHAR (100),
  Customer_Name NVARCHAR(100),
  Industry NVARCHAR (100),
  Market_Segment NVARCHAR(100),
  Country NVARCHAR(100),
  City NVARCHAR(100),
  Latitude FLOAT,
  Longitude FLOAT
);
GO

IF OBJECT_ID ('bronze.product_master' , 'U') IS NOT NULL
  DROP TABLE bronze.product_master;
GO
-- Creates Bronze Product Table 
CREATE TABLE bronze.product_master (
  Product_ID NVARCHAR(100),
  SKU NVARCHAR(100),
  Product_Name NVARCHAR(100),
  Category NVARCHAR(100),
  Subcategory NVARCHAR(100),
  Unit NVARCHAR(100),
  Unit_Cost FLOAT,
  Standard_Price FLOAT,
  Launch_Date DATE,
  Discontinuation_Date DATE
);
GO

IF OBJECT_ID ('bronze.supplier_master' , 'U') IS NOT NULL
  DROP TABLE bronze.supplier_master;
GO
-- Creates Bronze Supplier Table
CREATE TABLE bronze.supplier_master (
  Supplier_ID NVARCHAR(100),
  Supplier_Name NVARCHAR(100),
  Country NVARCHAR(100),
  Region NVARCHAR(100),
  On_Time_Delivery_Rate FLOAT,
  Certification_Level NVARCHAR(100),
  Preferred_Supplier_Flag INT
);
GO
  
IF OBJECT_ID ('bronze.sales_orders' , 'U') IS NOT NULL
  DROP TABLE bronze.sales_orders;
GO
-- Creates Bronze Sales Table 
CREATE TABLE bronze.sales_orders (
Order_ID NVARCHAR(100),
Customer_ID NVARCHAR(100),
Product_ID NVARCHAR(100),
Order_Date DATE,
Order_Status NVARCHAR(100),
Order_Quantity INT,
Unit_Price FLOAT,
Discount FLOAT,
Shipping_Mode NVARCHAR(100),
Shipping_Carrier NVARCHAR(100),
Shipping_Date_Scheduled DATE,
Shipping_Date_Actual DATE,
Delivery_Status NVARCHAR(100),
Late_Delivery_Risk_Flag INT,
VAT_Rate FLOAT,
COGS INT,
Unit_Price_Effective FLOAT,
Order_Total FLOAT,
VAT_Amount FLOAT,
Profit_Per_Order FLOAT
);
GO
  
IF OBJECT_ID ('bronze.procurement_orders' , 'U') IS NOT NULL
  DROP TABLE bronze.procurement_orders;
GO
-- Creates Bronze Procurement Table
CREATE TABLE bronze.procurement_orders (
PO_ID NVARCHAR(100),
Supplier_ID NVARCHAR(100),
Raw_Material_ID NVARCHAR(100),
Order_Date DATE,
Order_Quantity INT,
Unit_Cost FLOAT,
Delivery_Date_Planned DATE,
Delivery_Date_Actual DATE,
Total_Cost FLOAT
);
GO
