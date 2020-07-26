CREATE TABLE dbo.Customers (
	CustomerID NCHAR (5) NOT NULL,
	CompanyName NVARCHAR (40) NOT NULL,
	ContactName NVARCHAR (30) NULL,
	ContactTitle NVARCHAR (30) NULL,
	[Address] NVARCHAR (60) NULL,
	City NVARCHAR (15) NULL,
	Region NVARCHAR (15) NULL,
	PostalCode NVARCHAR (10) NULL,
	Country NVARCHAR (15) NULL,
	Phone NVARCHAR (24) NULL,
	Fax NVARCHAR (24) NULL,
	CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED 
	(
		CustomerID
	)
)
GO
	CREATE NONCLUSTERED INDEX IX_City 
	ON dbo.Customers
	(
		City
	)
GO
	CREATE NONCLUSTERED INDEX IX_CompanyName 
	ON dbo.Customers
	(
		CompanyName
	)
GO
	CREATE NONCLUSTERED INDEX IX_PostalCode 
	ON dbo.Customers
	(
		PostalCode
	)
GO
	CREATE NONCLUSTERED INDEX IX_Region 
	ON dbo.Customers
	(
		Region
	)
GO