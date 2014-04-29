﻿/*
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
SET IDENTITY_INSERT [app].[MilestoneType] ON 

GO
INSERT  [app].[MilestoneType]
        ( [app].[MilestoneType].[MilestoneTypeID] ,
          [app].[MilestoneType].[Code] ,
          [app].[MilestoneType].[Name] ,
          [app].[MilestoneType].[Active]
        )
        SELECT  4 ,
                N'Project' ,
                N'Project' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.MilestoneType
                             WHERE  [app].[MilestoneType].[MilestoneTypeID] = 4 )
GO
INSERT  [app].[MilestoneType]
        ( [app].[MilestoneType].[MilestoneTypeID] ,
          [app].[MilestoneType].[Code] ,
          [app].[MilestoneType].[Name] ,
          [app].[MilestoneType].[Active]
        )
        SELECT  5 ,
                N'Activity' ,
                N'Activity' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.MilestoneType
                             WHERE  [app].[MilestoneType].[MilestoneTypeID] = 5 )
GO
SET IDENTITY_INSERT [app].[MilestoneType] OFF
GO