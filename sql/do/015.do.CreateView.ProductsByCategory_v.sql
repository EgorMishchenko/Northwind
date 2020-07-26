CREATE VIEW dbo.ProductsByCategory_v AS
SELECT 
  C.CategoryName, 
  P.ProductName, 
  P.QuantityPerUnit, 
  P.UnitsInStock, 
  P.Discontinued
FROM dbo.Categories AS C
INNER JOIN dbo.Products AS P
  ON C.CategoryID = P.CategoryID
WHERE P.Discontinued <> 1
--ORDER BY C.CategoryName, P.ProductName
GO