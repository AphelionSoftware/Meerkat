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
SET IDENTITY_INSERT [app].[IndicatorType] ON 

GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  1 ,
                N'Outcome' ,
                N'Outcome' ,
                1,
				N'Outcome'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 1 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  2 ,
                N'Output' ,
                N'Output' ,
                1,
				N'Output'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 2 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  3 ,
                N'SubOutput' ,
                N'SubOutput' ,
                1,
				N'SubOutput'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 3 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  4 ,
                N'Activity' ,
                N'Activity' ,
                1,
				N'Activity'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 4 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  5 ,
                N'Milestone' ,
                N'Milestone' ,
                1,
				N'Milestone'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 5 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  6 ,
                N'OS' ,
                N'Overall Status' ,
                1,
				N'OS'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 6 )
GO



INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  7 ,
                N'PROG' ,
                N'Programme' ,
                1,
				N'PROG'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 7 )
GO

INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  8 ,
                N'SEC' ,
                N'Sector' ,
                1,
				N'SEC'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 8 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  9 ,
                N'SS' ,
                N'SubSector' ,
                1,
				N'SS'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 9 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active],
		  [app].[IndicatorType].[BusinessKey]
        )
        SELECT  10,
                N'PRJ' ,
                N'Project' ,
                1,
				N'PRJ'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 9 )
GO
SET IDENTITY_INSERT [app].[IndicatorType] OFF
GO
