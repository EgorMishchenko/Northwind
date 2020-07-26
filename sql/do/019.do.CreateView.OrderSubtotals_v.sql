CREATE VIEW dbo.OrderSubtotals_v AS
SELECT 
  OD.OrderID, 
  Sum(CONVERT(DECIMAL(19,4), (OD.UnitPrice * Quantity * (1 - Discount) / 100 )) * 100) AS Subtotal
FROM dbo.OrderDetails AS OD
GROUP BY OD.OrderID
GO