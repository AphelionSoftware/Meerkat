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

INSERT  INTO [App].ProjectType
        ( 
          [App].[ProjectType].[Code] ,
          [App].[ProjectType].[Name] ,
          [App].[ProjectType].[Active],
		  [App].[ProjectType].[BusinessKey]
        )
        SELECT  
                'PRG' ,
                'Programme' ,
                1,
				'PRG'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   App.ProjectType
                             WHERE  [App].[ProjectType].[Code] = 'P' )

INSERT  INTO [App].ProjectType
        ( 
          [App].[ProjectType].[Code] ,
          [App].[ProjectType].[Name] ,
          [App].[ProjectType].[Active],
		  [App].[ProjectType].[BusinessKey]
        )

        SELECT  
                'S' ,
                'Sector' ,
                1,
				'S'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   App.ProjectType
                             WHERE  [App].[ProjectType].[Code] = 'S' )
        
INSERT  INTO [App].ProjectType
        ( 
          [App].[ProjectType].[Code] ,
          [App].[ProjectType].[Name] ,
          [App].[ProjectType].[Active],
		  [App].[ProjectType].[BusinessKey]
        )

        SELECT  
                'SS' ,
                'Subsector' ,
                1,
				'SS'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   App.ProjectType
                             WHERE  [App].[ProjectType].[Code] = 'SS' )
        


GO


