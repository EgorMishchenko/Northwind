SET NOCOUNT ON
GO

USE master
GO

-- get master db filepath
DECLARE @device_directory NVARCHAR(520) 
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

/* ON PRIMARY */
EXECUTE (N'CREATE DATABASE Northwind
  ON PRIMARY (NAME = N''Northwind'', FILENAME = N''' + @device_directory + N'northwnd.mdf'')  
  LOG ON (NAME = N''Northwind_log'',  FILENAME = N''' + @device_directory + N'northwnd.ldf'')')
GO
SET QUOTED_IDENTIFIER ON 
-- если ON, то двойные кавычки рассматриваются как [...], т.е можно определять имена таблиц, колонок и тд, 
-- если OFF, то рассматриваются как '...' и используются как определитель текста 
GO

/* Set DATEFORMAT so that the date strings are interpreted correctly regardless of
   the default DATEFORMAT on the server.
*/
SET DATEFORMAT mdy -- month/day/year
GO