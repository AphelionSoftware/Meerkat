USE [MeerKat]
GO
/****** Object:  Schema [Core]    Script Date: 2013-03-06 08:42:07 AM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Core')
EXEC sys.sp_executesql N'CREATE SCHEMA [Core]'

GO
