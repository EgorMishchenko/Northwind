CREATE TABLE dbo.Orders (
	OrderID INT IDENTITY (1, 1) NOT NULL,
	CustomerID NCHAR (5) NULL,
	EmployeeID INT NULL,
	OrderDate DATETIME NULL,
	RequiredDate DATETIME NULL,
	ShippedDate DATETIME NULL,
	ShipVia INT NULL,
	Freight DECIMAL(19,4) NULL CONSTRAINT DF_Orders_Freight DEFAULT (0),
	ShipName NVARCHAR (40) NULL,
	ShipAddress NVARCHAR (60) NULL,
	ShipCity NVARCHAR (15) NULL,
	ShipRegion NVARCHAR (15) NULL,
	ShipPostalCode NVARCHAR (10) NULL,
	ShipCountry NVARCHAR (15) NULL,
	CONSTRAINT PK_Orders PRIMARY KEY  CLUSTERED 
	(
		OrderID
	),
	CONSTRAINT FK_Orders_Customers FOREIGN KEY 
	(
		CustomerID
	) REFERENCES dbo.Customers (
		CustomerID
	),
	CONSTRAINT FK_Orders_Employees FOREIGN KEY 
	(
		EmployeeID
	) REFERENCES dbo.Employees (
		EmployeeID
	),
	CONSTRAINT FK_Orders_Shippers FOREIGN KEY 
	(
		ShipVia
	) REFERENCES dbo.Shippers (
		ShipperID
	)
)
GO
 CREATE  INDEX CustomerID ON dbo.Orders(CustomerID)
GO
 CREATE  INDEX CustomersOrders ON dbo.Orders(CustomerID)
GO
 CREATE  INDEX EmployeeID ON dbo.Orders(EmployeeID)
GO
 CREATE  INDEX EmployeesOrders ON dbo.Orders(EmployeeID)
GO
 CREATE  INDEX OrderDate ON dbo.Orders(OrderDate)
GO
 CREATE  INDEX ShippedDate ON dbo.Orders(ShippedDate)
GO
 CREATE  INDEX ShippersOrders ON dbo.Orders(ShipVia)
GO
 CREATE  INDEX ShipPostalCode ON dbo.Orders(ShipPostalCode)
GO