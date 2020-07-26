CREATE TABLE dbo.Categories (
	CategoryID INT IDENTITY (1, 1) NOT NULL,
	CategoryName NVARCHAR (15) NOT NULL,
	[Description] NVARCHAR(MAX) NULL,
	Picture VARBINARY(MAX) NULL,
	CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED 
	(
		CategoryID
	)
);
GO

CREATE NONCLUSTERED INDEX IX_CategoryName 
ON dbo.Categories
(
	CategoryName
);
GO