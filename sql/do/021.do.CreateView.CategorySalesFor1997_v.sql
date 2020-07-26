CREATE VIEW dbo.CategorySalesFor1997_v AS
SELECT 
  PS97.CategoryName, 
  Sum(PS97.ProductSales) AS CategorySales
FROM dbo.ProductSalesFor1997_v AS PS97
GROUP BY PS97.CategoryName
GO