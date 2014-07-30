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

/*Forms Meerkat*/
INSERT INTO [forms].[Category]
           ([Name]
           ,[Code]
           ,[TextDescription]
           ,CategoryOrder
           ,Form_ID
         )
      SELECT 
		[Name]
		,[Code]
		,[TextDescription]
		,CategoryOrder
		,[Form_ID]
		FROM 				 
		(SELECT 
		'Textbooks' AS Name
                ,'TXT.CAT' As Code
                ,'Textbooks ' As TextDescription
				,100 as CategoryOrder
				,Form_id 
			FROM forms.Form 
			WHERE Form.Code ='TXT'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   forms.Category cat
                             WHERE  cat.Code = src.Code
							 and cat.CategoryOrder = src.CategoryOrder) 

GO