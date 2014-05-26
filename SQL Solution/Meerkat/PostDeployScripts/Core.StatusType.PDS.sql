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
SET IDENTITY_INSERT Core.StatusType ON 

INSERT  INTO [Core].StatusType
        ( [Core].[StatusType].[ID] ,
          [Core].[StatusType].[Code] ,
          [Core].[StatusType].[Name] ,
          [Core].[StatusType].[Value],
          [Core].[StatusType].[Active],
		  [Core].[StatusType].[BusinessKey]
        )
        SELECT  0 ,
                '+' ,
                'On Target' ,
                1,
                1,
				'+'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.StatusType
                             WHERE  [Core].[StatusType].[Code] = '+' )
        UNION ALL
        SELECT  1 ,
                '=' ,
                'Acceptable' ,
                0,
                1,
				'='
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.StatusType
                             WHERE  [Core].[StatusType].[Code] = '=' )
        UNION ALL
        SELECT  2 ,
                '-' ,
                'Sub par' ,
                -1,
                1,
				'-'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.StatusType
                             WHERE  [Core].[StatusType].[Code] = '-' )

GO


SET IDENTITY_INSERT Core.StatusType OFF