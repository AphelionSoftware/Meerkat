USE [MeerKat]
GO
/****** Object:  View [app].[fvAttribute]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[app].[fvAttribute]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [app].[fvAttribute]
AS
SELECT ID AS AttrID, ParentID, AttributeTypeID, AttributeName, CASE WHEN AttributeTypeID = 1 THEN CONVERT(Nvarchar(255), [AttributeStrVal]) 
                  WHEN AttributeTypeID = 2 THEN CONVERT(Nvarchar(255), [AttributenumericalVal]) WHEN AttributeTypeID = 3 THEN CONVERT(Nvarchar(255), 
                  [AttributeDateTimeVal]) END AS AttributeValue, sys_created, sys_modified, sys_createdBy, sys_ModifiedBy
FROM     app.Attributes AS a

' 
GO
