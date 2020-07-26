CREATE PROCEDURE dbo.GetSalesByYear 
(
	@Beginning_Date DATETIME, 
	@Ending_Date DATETIME
)	 
AS
SET NOCOUNT ON; 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT
	O.ShippedDate, 
	O.OrderID, 
	OS_v.Subtotal, 
	DATENAME(yy, O.ShippedDate) AS [Year]
FROM dbo.Orders AS O
INNER JOIN dbo.OrderSubtotals AS OS_v
	ON OS_v.OrderID = O.OrderID
WHERE O.ShippedDate 
	BETWEEN @Beginning_Date AND @Ending_Date;
RETURN; 

GO