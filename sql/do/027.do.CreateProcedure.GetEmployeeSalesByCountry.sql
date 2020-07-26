CREATE PROCEDURE dbo.GetEmployeeSalesByCountry 
(
	@Beginning_Date DATETIME, 
	@Ending_Date DATETIME
)
AS
SET NOCOUNT ON; 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT 
	E.Country, 
	E.LastName, 
	E.FirstName, 
	O.ShippedDate, 
	O.OrderID, 
	OS_v.Subtotal AS SaleAmount
FROM dbo.Orders AS O
INNER JOIN dbo.Employees AS E 
	ON E.EmployeeID = O.EmployeeID
INNER JOIN dbo.OrderSubtotals AS OS_v
	ON OS_v.OrderID = O.OrderID
WHERE O.ShippedDate 
	BETWEEN @Beginning_Date AND @Ending_Date;

RETURN; 
GO