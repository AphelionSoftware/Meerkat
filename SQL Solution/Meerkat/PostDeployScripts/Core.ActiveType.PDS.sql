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
INSERT  [Core].[ActiveType]
        ( [Core].[ActiveType].[ID] ,
          [Core].[ActiveType].[Code] ,
          [Core].[ActiveType].[Name]
        )
        SELECT  -1 ,
                N'Deleted' ,
                N'Deleted'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ActiveType
                             WHERE  [Core].[ActiveType].[ID] = -1 )
GO

INSERT  [Core].[ActiveType]
        ( [Core].[ActiveType].[ID] ,
          [Core].[ActiveType].[Code] ,
          [Core].[ActiveType].[Name]
        )
        SELECT  0 ,
                N'InActive' ,
                N'Deleted'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ActiveType
                             WHERE  [Core].[ActiveType].[ID] = 0 )
GO
INSERT  [Core].[ActiveType]
        ( [Core].[ActiveType].[ID] ,
          [Core].[ActiveType].[Code] ,
          [Core].[ActiveType].[Name]
        )
        SELECT  1 ,
                N'Active' ,
                N'Deleted'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ActiveType
                             WHERE  [Core].[ActiveType].[ID] = 1 )
GO
