CREATE VIEW dbo.ProductsAboveAveragePrice_v AS
SELECT 
  P.ProductName, 
  P.UnitPrice
FROM dbo.Products AS P
WHERE P.UnitPrice > (SELECT AVG(UnitPrice) FROM dbo.Products)
--ORDER BY P.UnitPrice DESC
GO