/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET IDENTITY_INSERT [app].[IndicatorSimpleType] ON 

GO
INSERT  [app].[IndicatorSimpleType]
        ( [app].[IndicatorSimpleType].[IndicatorSimpleType_ID] ,
          [app].[IndicatorSimpleType].[Code] ,
          [app].[IndicatorSimpleType].[Name] ,
          [app].[IndicatorSimpleType].[Active],
		  [app].[IndicatorSimpleType].[BusinessKey]
        )
        SELECT  1 ,
                N'Impact' ,
                N'Impact' ,
                1,
				N'Impact'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorSimpleType
                             WHERE  [app].[IndicatorSimpleType].[IndicatorSimpleType_ID] = 1 )
GO
INSERT  [app].[IndicatorSimpleType]
        ( [app].[IndicatorSimpleType].[IndicatorSimpleType_ID] ,
          [app].[IndicatorSimpleType].[Code] ,
          [app].[IndicatorSimpleType].[Name] ,
          [app].[IndicatorSimpleType].[Active],
		  [app].[IndicatorSimpleType].[BusinessKey]
        )
        SELECT  2 ,
                N'Outcome' ,
                N'Outcome' ,
                1,
				N'Outcome'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorSimpleType
                             WHERE  [app].[IndicatorSimpleType].[IndicatorSimpleType_ID] = 2 )
GO
INSERT  [app].[IndicatorSimpleType]
        ( [app].[IndicatorSimpleType].[IndicatorSimpleType_ID] ,
          [app].[IndicatorSimpleType].[Code] ,
          [app].[IndicatorSimpleType].[Name] ,
          [app].[IndicatorSimpleType].[Active],
		  [app].[IndicatorSimpleType].[BusinessKey]
        )
        SELECT  3 ,
                N'Output' ,
                N'Output' ,
                1,
				N'Output'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorSimpleType
                             WHERE  [app].[IndicatorSimpleType].[IndicatorSimpleType_ID] = 3 )
GO
GO
SET IDENTITY_INSERT [app].[IndicatorSimpleType] OFF
GO
