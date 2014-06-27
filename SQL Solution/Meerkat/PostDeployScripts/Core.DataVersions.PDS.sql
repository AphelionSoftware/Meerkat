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
SET IDENTITY_INSERT Core.DataVersion ON 
INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description],
		  [Core].[DataVersion].[BusinessKey]
        )
        SELECT  1 ,
                '0' ,
                0 ,
                'External' ,
                0 ,
                '',
				'0'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 0 )

INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description],
		  [Core].[DataVersion].[BusinessKey]
        )
        SELECT  1 ,
                '1' ,
                1 ,
                'Publish' ,
                1 ,
                '',
				'1'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 1 )

INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description],
		  [Core].[DataVersion].[BusinessKey]
        )
        SELECT  1 ,
                '2' ,
                2 ,
                'Final Draft' ,
                2 ,
                '',
				'2'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 3 )

INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description],
		  [Core].[DataVersion].[BusinessKey]
        )
        SELECT  1 ,
                '3' ,
                3 ,
                'First Draft' ,
                3 ,
                '',
				'3'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 4 )


SET IDENTITY_INSERT  Core.DataVersion OFF