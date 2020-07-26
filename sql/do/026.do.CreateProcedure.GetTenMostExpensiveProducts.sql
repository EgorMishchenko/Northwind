CREATE PROCEDURE dbo.GetTenMostExpensiveProducts 
AS
SET NOCOUNT ON; 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
--SET ROWCOUNT 10 - deprecate construction

SELECT TOP 10
  P.ProductName AS TenMostExpensiveProducts, 
  P.UnitPrice
FROM dbo.Products AS P
ORDER BY P.UnitPrice DESC;
RETURN; 

GO
