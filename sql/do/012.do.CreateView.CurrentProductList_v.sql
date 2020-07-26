CREATE VIEW dbo.CurrentProductList_v AS
SELECT 
  P.ProductID, 
  P.ProductName
FROM dbo.Products AS P
WHERE P.Discontinued = 0
--ORDER BY P.ProductName
GO