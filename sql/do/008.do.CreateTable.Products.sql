CREATE TABLE dbo.Products (
	ProductID INT IDENTITY (1, 1) NOT NULL,
	ProductName NVARCHAR (40) NOT NULL,
	SupplierID INT NULL,
	CategoryID INT NULL,
	QuantityPerUnit NVARCHAR (20) NULL,
	UnitPrice DECIMAL(19,4) NULL CONSTRAINT DF_Products_UnitPrice DEFAULT (0),
	UnitsInStock SMALLINT NULL CONSTRAINT DF_Products_UnitsInStock DEFAULT (0),
	UnitsOnOrder SMALLINT NULL CONSTRAINT DF_Products_UnitsOnOrder DEFAULT (0),
	ReorderLevel SMALLINT NULL CONSTRAINT DF_Products_ReorderLevel DEFAULT (0),
	Discontinued BIT NOT NULL CONSTRAINT DF_Products_Discontinued DEFAULT (0),
	CONSTRAINT PK_Products PRIMARY KEY CLUSTERED 
	(
		ProductID
	),
	CONSTRAINT FK_Products_Categories FOREIGN KEY 
	(
		CategoryID
	) REFERENCES dbo.Categories (
		CategoryID
	),
	CONSTRAINT FK_Products_Suppliers FOREIGN KEY 
	(
		SupplierID
	) REFERENCES dbo.Suppliers (
		SupplierID
	),
	CONSTRAINT CK_Products_UnitPrice CHECK (UnitPrice >= 0),
	CONSTRAINT CK_ReorderLevel CHECK (ReorderLevel >= 0),
	CONSTRAINT CK_UnitsInStock CHECK (UnitsInStock >= 0),
	CONSTRAINT CK_UnitsOnOrder CHECK (UnitsOnOrder >= 0)
)
GO
 CREATE  INDEX CategoriesProducts ON dbo.Products(CategoryID)
GO
 CREATE  INDEX CategoryID ON dbo.Products(CategoryID)
GO
 CREATE  INDEX ProductName ON dbo.Products(ProductName)
GO
 CREATE  INDEX SupplierID ON dbo.Products(SupplierID)
GO
 CREATE  INDEX SuppliersProducts ON dbo.Products(SupplierID)
GO