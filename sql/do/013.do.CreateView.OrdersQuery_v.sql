CREATE VIEW dbo.OrdersQuery_v AS
SELECT 
  O.OrderID, 
  O.CustomerID, 
  O.EmployeeID, 
  O.OrderDate, 
  O.RequiredDate, 
	O.ShippedDate, 
  O.ShipVia, 
  O.Freight, 
  O.ShipName, 
  O.ShipAddress, 
  O.ShipCity, 
	O.ShipRegion, 
  O.ShipPostalCode, 
  O.ShipCountry, 
	C.CompanyName, 
  C.Address, 
  C.City, 
  C.Region, 
  C.PostalCode, 
  C.Country
FROM dbo.Customers AS C
INNER JOIN dbo.Orders AS O
  ON C.CustomerID = O.CustomerID
GO