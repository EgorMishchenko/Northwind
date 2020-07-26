CREATE VIEW dbo.SalesTotalsByAmount_v AS
SELECT 
	OS_v.Subtotal AS SaleAmount,
	O.OrderID, 
	C.CompanyName, 
	O.ShippedDate
FROM dbo.Orders AS O
INNER JOIN dbo.OrderSubtotals_v AS OS_v
	ON O.OrderID = OS_v.OrderID
INNER JOIN dbo.Customers AS C
	ON C.CustomerID = O.CustomerID
WHERE (OS_v.Subtotal >2500) AND (O.ShippedDate BETWEEN '19970101' AND '19971231')
GO

