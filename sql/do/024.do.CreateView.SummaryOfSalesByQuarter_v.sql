CREATE VIEW dbo.SummaryOfSalesByQuarter_v AS
SELECT 
  O.ShippedDate, 
  O.OrderID, 
  OS_v.Subtotal
FROM dbo.Orders AS O
INNER JOIN dbo.OrderSubtotals_v AS OS_v
  ON O.OrderID = OS_v.OrderID
WHERE O.ShippedDate IS NOT NULL
--ORDER BY O.ShippedDate
GO