CREATE VIEW dbo.OrderDetailsExtended_v AS
SELECT 
  OD.OrderID, 
  OD.ProductID, 
  P.ProductName, 
  OD.UnitPrice, 
  OD.Quantity, 
  OD.Discount, 
  (CONVERT(DECIMAL(19,4),(OD.UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS ExtendedPrice
FROM dbo.Products AS P
INNER JOIN dbo.OrderDetails AS OD
  ON P.ProductID = OD.ProductID
--ORDER BY OD.OrderID
GO