CREATE VIEW dbo.SalesByCategory_v AS
SELECT 
	C.CategoryID,
	C.CategoryName, 
	P.ProductName, 
	SUM(ODE_v.ExtendedPrice) AS ProductSales
FROM dbo.Orders AS O
INNER JOIN dbo.OrderDetailsExtended_v AS ODE_v
	ON ODE_v.OrderID = O.OrderID
INNER JOIN dbo.Products AS P
	ON P.ProductID = ODE_v.ProductID
INNER JOIN dbo.Categories AS C
	ON C.CategoryID = P.CategoryID
WHERE O.OrderDate BETWEEN '19970101' AND '19971231'
GROUP BY C.CategoryID, C.CategoryName, P.ProductName
--ORDER BY P.ProductName
GO
