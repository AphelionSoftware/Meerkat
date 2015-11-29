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

INSERT INTO [forms].[Form]
           ([Name]
           ,[Code]
           ,[TextDescription]
           
           ,[ProjectID]
         )
      SELECT 
		[Name]
		,[Code]
		,[TextDescription]
		,[ProjectID]
		FROM 				 
		(SELECT 
		'Textbooks' AS Name
                ,'TXT' As Code
                ,'Textbooks ' As TextDescription
				,ProjectID
			FROM app.Project Proj
			WHERE Proj.BusinessKey ='PRJ2.1'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   forms.Form
                             WHERE  forms.Form.Code = src.Code) 

GO