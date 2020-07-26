CREATE VIEW dbo.Invoices_v AS
SELECT 
  O.ShipName, 
  O.ShipAddress, 
  O.ShipCity, 
  O.ShipRegion, 
  O.ShipPostalCode, 
  O.ShipCountry, 
  O.CustomerID, 
  C.CompanyName AS CustomerName, 
  C.Address, 
  C.City, 
  C.Region, 
  C.PostalCode, 
  C.Country, 
  (FirstName + ' ' + LastName) AS Salesperson, 
  O.OrderID, 
  O.OrderDate, 
  O.RequiredDate, 
  O.ShippedDate, 
  S.CompanyName AS ShipperName, 
  OD.ProductID, 
  P.ProductName, 
  OD.UnitPrice, 
  OD.Quantity, 
  OD.Discount, 
  (CONVERT(MONEY, (OD.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS ExtendedPrice, 
  O.Freight
FROM dbo.Employees AS E 
INNER JOIN dbo.Orders AS O 
	ON O.EmployeeID = E.EmployeeID
INNER JOIN dbo.OrderDetails AS OD
	ON OD.OrderID = O.OrderID
INNER JOIN dbo.Customers AS C
	ON C.CustomerID = O.CustomerID
INNER JOIN dbo.Products AS P
	ON P.ProductID = OD.ProductID 
INNER JOIN dbo.Shippers AS S
	ON S.ShipperID = O.ShipVia
GO