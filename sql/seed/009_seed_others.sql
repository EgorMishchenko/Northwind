SET NOCOUNT ON
GO

/* The following adds stored procedures */

if exists (select * from sysobjects where id = object_id('dbo.CustOrdersDetail'))
    drop procedure dbo.CustOrdersDetail
GO

CREATE PROCEDURE CustOrdersDetail @OrderID int
AS
SELECT ProductName,
    UnitPrice=ROUND(Od.UnitPrice, 2),
    Quantity,
    Discount=CONVERT(int, Discount * 100), 
    ExtendedPrice=ROUND(CONVERT(money, Quantity * (1 - Discount) * Od.UnitPrice), 2)
FROM Products P, [OrderDetails] Od
WHERE Od.ProductID = P.ProductID and Od.OrderID = @OrderID
go


if exists (select * from sysobjects where id = object_id('dbo.CustOrdersOrders'))
	drop procedure dbo.CustOrdersOrders
GO

CREATE PROCEDURE CustOrdersOrders @CustomerID nchar(5)
AS
SELECT OrderID, 
	OrderDate,
	RequiredDate,
	ShippedDate
FROM Orders
WHERE CustomerID = @CustomerID
ORDER BY OrderID
GO


if exists (select * from sysobjects where id = object_id('dbo.CustOrderHist') and sysstat & 0xf = 4)
	drop procedure dbo.CustOrderHist
GO
CREATE PROCEDURE CustOrderHist @CustomerID nchar(5)
AS
SELECT ProductName, Total=SUM(Quantity)
FROM Products P, [OrderDetails] OD, Orders O, Customers C
WHERE C.CustomerID = @CustomerID
AND C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
GROUP BY ProductName
GO

if exists (select * from sysobjects where id = object_id('dbo.SalesByCategory') and sysstat & 0xf = 4)
	drop procedure dbo.SalesByCategory
GO
CREATE PROCEDURE SalesByCategory
    @CategoryName nvarchar(15), @OrdYear nvarchar(4) = '1998'
AS
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998' 
BEGIN
	SELECT @OrdYear = '1998'
END

SELECT ProductName,
	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
FROM [OrderDetails] OD, Orders O, Products P, Categories C
WHERE OD.OrderID = O.OrderID 
	AND OD.ProductID = P.ProductID 
	AND P.CategoryID = C.CategoryID
	AND C.CategoryName = @CategoryName
	AND SUBSTRING(CONVERT(nvarchar(22), O.OrderDate, 111), 1, 4) = @OrdYear
GROUP BY ProductName
ORDER BY ProductName
GO


/* The follwing adds tables to the Northwind database */


CREATE TABLE [dbo].[CustomerCustomerDemo] 
	([CustomerID] nchar (5) NOT NULL,
	[CustomerTypeID] [nchar] (10) NOT NULL
) ON [PRIMARY] 
GO

CREATE TABLE [dbo].[CustomerDemographics] 
	([CustomerTypeID] [nchar] (10) NOT NULL ,
	[CustomerDesc] [ntext] NULL 
)  ON [PRIMARY] 
GO		
	
CREATE TABLE [dbo].[Region] 
	( [RegionID] [int] NOT NULL ,
	[RegionDescription] [nchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Territories] 
	([TerritoryID] [nvarchar] (20) NOT NULL ,
	[TerritoryDescription] [nchar] (50) NOT NULL ,
        [RegionID] [int] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EmployeeTerritories] 
	([EmployeeID] [int] NOT NULL,
	[TerritoryID] [nvarchar] (20) NOT NULL 
) ON [PRIMARY]

-- The following adds data to the tables just created.

Insert Into Region Values (1,'Eastern')
Insert Into Region Values (2,'Western')
Insert Into Region Values (3,'Northern')
Insert Into Region Values (4,'Southern')
Go

Insert Into Territories Values ('01581','Westboro',1)
Insert Into Territories Values ('01730','Bedford',1)
Insert Into Territories Values ('01833','Georgetow',1)
Insert Into Territories Values ('02116','Boston',1)
Insert Into Territories Values ('02139','Cambridge',1)
Insert Into Territories Values ('02184','Braintree',1)
Insert Into Territories Values ('02903','Providence',1)
Insert Into Territories Values ('03049','Hollis',3)
Insert Into Territories Values ('03801','Portsmouth',3)
Insert Into Territories Values ('06897','Wilton',1)
Insert Into Territories Values ('07960','Morristown',1)
Insert Into Territories Values ('08837','Edison',1)
Insert Into Territories Values ('10019','New York',1)
Insert Into Territories Values ('10038','New York',1)
Insert Into Territories Values ('11747','Mellvile',1)
Insert Into Territories Values ('14450','Fairport',1)
Insert Into Territories Values ('19428','Philadelphia',3)
Insert Into Territories Values ('19713','Neward',1)
Insert Into Territories Values ('20852','Rockville',1)
Insert Into Territories Values ('27403','Greensboro',1)
Insert Into Territories Values ('27511','Cary',1)
Insert Into Territories Values ('29202','Columbia',4)
Insert Into Territories Values ('30346','Atlanta',4)
Insert Into Territories Values ('31406','Savannah',4)
Insert Into Territories Values ('32859','Orlando',4)
Insert Into Territories Values ('33607','Tampa',4)
Insert Into Territories Values ('40222','Louisville',1)
Insert Into Territories Values ('44122','Beachwood',3)
Insert Into Territories Values ('45839','Findlay',3)
Insert Into Territories Values ('48075','Southfield',3)
Insert Into Territories Values ('48084','Troy',3)
Insert Into Territories Values ('48304','Bloomfield Hills',3)
Insert Into Territories Values ('53404','Racine',3)
Insert Into Territories Values ('55113','Roseville',3)
Insert Into Territories Values ('55439','Minneapolis',3)
Insert Into Territories Values ('60179','Hoffman Estates',2)
Insert Into Territories Values ('60601','Chicago',2)
Insert Into Territories Values ('72716','Bentonville',4)
Insert Into Territories Values ('75234','Dallas',4)
Insert Into Territories Values ('78759','Austin',4)
Insert Into Territories Values ('80202','Denver',2)
Insert Into Territories Values ('80909','Colorado Springs',2)
Insert Into Territories Values ('85014','Phoenix',2)
Insert Into Territories Values ('85251','Scottsdale',2)
Insert Into Territories Values ('90405','Santa Monica',2)
Insert Into Territories Values ('94025','Menlo Park',2)
Insert Into Territories Values ('94105','San Francisco',2)
Insert Into Territories Values ('95008','Campbell',2)
Insert Into Territories Values ('95054','Santa Clara',2)
Insert Into Territories Values ('95060','Santa Cruz',2)
Insert Into Territories Values ('98004','Bellevue',2)
Insert Into Territories Values ('98052','Redmond',2)
Insert Into Territories Values ('98104','Seattle',2)
Go

Insert Into EmployeeTerritories Values (1,'06897')
Insert Into EmployeeTerritories Values (1,'19713')
Insert Into EmployeeTerritories Values (2,'01581')
Insert Into EmployeeTerritories Values (2,'01730')
Insert Into EmployeeTerritories Values (2,'01833')
Insert Into EmployeeTerritories Values (2,'02116')
Insert Into EmployeeTerritories Values (2,'02139')
Insert Into EmployeeTerritories Values (2,'02184')
Insert Into EmployeeTerritories Values (2,'40222')
Insert Into EmployeeTerritories Values (3,'30346')
Insert Into EmployeeTerritories Values (3,'31406')
Insert Into EmployeeTerritories Values (3,'32859')
Insert Into EmployeeTerritories Values (3,'33607')
Insert Into EmployeeTerritories Values (4,'20852')
Insert Into EmployeeTerritories Values (4,'27403')
Insert Into EmployeeTerritories Values (4,'27511')
Insert Into EmployeeTerritories Values (5,'02903')
Insert Into EmployeeTerritories Values (5,'07960')
Insert Into EmployeeTerritories Values (5,'08837')
Insert Into EmployeeTerritories Values (5,'10019')
Insert Into EmployeeTerritories Values (5,'10038')
Insert Into EmployeeTerritories Values (5,'11747')
Insert Into EmployeeTerritories Values (5,'14450')
Insert Into EmployeeTerritories Values (6,'85014')
Insert Into EmployeeTerritories Values (6,'85251')
Insert Into EmployeeTerritories Values (6,'98004')
Insert Into EmployeeTerritories Values (6,'98052')
Insert Into EmployeeTerritories Values (6,'98104')
Insert Into EmployeeTerritories Values (7,'60179')
Insert Into EmployeeTerritories Values (7,'60601')
Insert Into EmployeeTerritories Values (7,'80202')
Insert Into EmployeeTerritories Values (7,'80909')
Insert Into EmployeeTerritories Values (7,'90405')
Insert Into EmployeeTerritories Values (7,'94025')
Insert Into EmployeeTerritories Values (7,'94105')
Insert Into EmployeeTerritories Values (7,'95008')
Insert Into EmployeeTerritories Values (7,'95054')
Insert Into EmployeeTerritories Values (7,'95060')
Insert Into EmployeeTerritories Values (8,'19428')
Insert Into EmployeeTerritories Values (8,'44122')
Insert Into EmployeeTerritories Values (8,'45839')
Insert Into EmployeeTerritories Values (8,'53404')
Insert Into EmployeeTerritories Values (9,'03049')
Insert Into EmployeeTerritories Values (9,'03801')
Insert Into EmployeeTerritories Values (9,'48075')
Insert Into EmployeeTerritories Values (9,'48084')
Insert Into EmployeeTerritories Values (9,'48304')
Insert Into EmployeeTerritories Values (9,'55113')
Insert Into EmployeeTerritories Values (9,'55439')
GO



--  The following adds constraints to the Northwind database

ALTER TABLE CustomerCustomerDemo
	ADD CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY  NONCLUSTERED 
	(
		[CustomerID],
		[CustomerTypeID]
	) ON [PRIMARY]
GO

ALTER TABLE CustomerDemographics
	ADD CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY  NONCLUSTERED 
	(
		[CustomerTypeID]
	) ON [PRIMARY]
GO

ALTER TABLE CustomerCustomerDemo
	ADD CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY 
	(
		[CustomerTypeID]
	) REFERENCES [dbo].[CustomerDemographics] (
		[CustomerTypeID]
	)
GO

ALTER TABLE CustomerCustomerDemo
	ADD CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY
	(
		[CustomerID]
	) REFERENCES [dbo].[Customers] (
		[CustomerID]
	)
GO

ALTER TABLE Region
	ADD CONSTRAINT [PK_Region] PRIMARY KEY  NONCLUSTERED 
	(
		[RegionID]
	)  ON [PRIMARY] 
GO

ALTER TABLE Territories
	ADD CONSTRAINT [PK_Territories] PRIMARY KEY  NONCLUSTERED 
	(
		[TerritoryID]
	)  ON [PRIMARY] 
GO

ALTER TABLE Territories
	ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY 
	(
		[RegionID]
	) REFERENCES [dbo].[Region] (
		[RegionID]
	)
GO

ALTER TABLE EmployeeTerritories
	ADD CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY  NONCLUSTERED 
	(
		[EmployeeID],
		[TerritoryID]
	) ON [PRIMARY]
GO

ALTER TABLE EmployeeTerritories
	ADD CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY 
	(
		[EmployeeID]
	) REFERENCES [dbo].[Employees] (
		[EmployeeID]
	)
GO


ALTER TABLE EmployeeTerritories	
	ADD CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY 
	(
		[TerritoryID]
	) REFERENCES [dbo].[Territories] (
		[TerritoryID]
	)
GO
