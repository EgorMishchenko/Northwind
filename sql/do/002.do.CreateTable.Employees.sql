CREATE TABLE dbo.Employees (
	EmployeeID INT IDENTITY (1, 1) NOT NULL,
	LastName NVARCHAR (20) NOT NULL,
	FirstName NVARCHAR (10) NOT NULL,
	Title NVARCHAR (30) NULL,
	TitleOfCourtesy NVARCHAR (25) NULL,
	BirthDate DATETIME NULL,
	HireDate DATETIME NULL,
	[Address] NVARCHAR (60) NULL,
	City NVARCHAR (15) NULL,
	Region NVARCHAR (15) NULL,
	PostalCode NVARCHAR (10) NULL,
	Country NVARCHAR (15) NULL,
	HomePhone NVARCHAR (24) NULL,
	Extension NVARCHAR (4) NULL,
	Photo VARBINARY(MAX) NULL,
	Notes NVARCHAR(MAX) NULL,
	ReportsTo INT NULL,
	PhotoPath NVARCHAR (255) NULL,
	CONSTRAINT PK_Employees PRIMARY KEY CLUSTERED 
	(
		EmployeeID
	),
	CONSTRAINT FK_Employees_Employees FOREIGN KEY 
	(
		ReportsTo
	) 
	REFERENCES dbo.Employees (
		EmployeeID
	),
	CONSTRAINT CK_Birthdate CHECK (BirthDate < getdate())
);
GO

 CREATE NONCLUSTERED INDEX IX_LastName 
 ON dbo.Employees
 (
	 LastName
 ); 
GO

 CREATE NONCLUSTERED INDEX PostalCode 
 ON dbo.Employees
 (
	 PostalCode
 );
GO