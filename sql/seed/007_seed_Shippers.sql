SET NOCOUNT ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT dbo.Shippers ON
GO

ALTER TABLE dbo.Shippers NOCHECK CONSTRAINT ALL
GO

INSERT dbo.Shippers
(
  ShipperID, 
  CompanyName,
  Phone
) 
VALUES
(1, 'Speedy Express', '(503) 555-9831'), 
(2, 'United Package', '(503) 555-3199'), 
(3, 'Federal Shipping', '(503) 555-9931')
GO

SET IDENTITY_INSERT dbo.Shippers OFF
GO

ALTER TABLE dbo.Shippers CHECK CONSTRAINT ALL