CREATE VIEW dbo.CustomerAndSuppliersByCity_v AS
SELECT 
  City, 
  CompanyName, 
  ContactName, 
  'Customers' AS Relationship 
FROM dbo.Customers
UNION SELECT 
  City, 
  CompanyName,
  ContactName, 
  'Suppliers' AS Relationship 
FROM dbo.Suppliers
--ORDER BY City, CompanyName
GO