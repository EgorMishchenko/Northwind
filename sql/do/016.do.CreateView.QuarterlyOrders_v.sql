CREATE VIEW dbo.QuarterlyOrders_v AS
SELECT DISTINCT 
  C.CustomerID, 
  C.CompanyName, 
  C.City,
  C.Country
FROM dbo.Customers AS C
RIGHT JOIN dbo.Orders AS O
  ON C.CustomerID = O.CustomerID
WHERE O.OrderDate BETWEEN '19970101' And '19971231'
GO