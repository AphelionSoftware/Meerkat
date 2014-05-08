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
SET IDENTITY_INSERT [app].[IndicatorType] OFF
GO