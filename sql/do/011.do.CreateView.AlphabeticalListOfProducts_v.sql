CREATE VIEW dbo.AlphabeticalListOfProducts_v AS
SELECT 
  P.ProductID, 
  P.ProductName, 
  P.SupplierID, 
  P.CategoryID, 
  P.QuantityPerUnit, 
  P.UnitPrice, 
  P.UnitsInStock, 
  P.UnitsOnOrder, 
  P.ReorderLevel, 
  P.Discontinued, 
  C.CategoryName
FROM dbo.Categories AS C
INNER JOIN dbo.Products AS P
  ON C.CategoryID = P.CategoryID
WHERE P.Discontinued = 0
GO