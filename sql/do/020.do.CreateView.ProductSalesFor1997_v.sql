CREATE VIEW dbo.ProductSalesFor1997_v AS
SELECT 
	C.CategoryName, 
	P.ProductName, 
	SUM(CONVERT(DECIMAL(19,4), (OD.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS ProductSales
FROM dbo.Orders AS O
INNER JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
INNER JOIN dbo.Products AS P
	ON P.ProductID = OD.ProductID
INNER JOIN dbo.Categories AS C
	ON C.CategoryID = P.CategoryID
WHERE O.ShippedDate BETWEEN '19970101' AND '19971231'
GROUP BY C.CategoryName, P.ProductName
GO