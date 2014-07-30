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
INSERT INTO [forms].[Question]
           ([Name]
		 ,[Code]
		 ,[TextDescription]
		 ,[QuestionType_ID]
		 ,[Category_ID]
		 ,[QuestionOrder]
		    )
      SELECT 
		[Name]
		 ,[Code]
		 ,[TextDescription]
		 ,[QuestionType_ID]
		 ,[Category_ID]
		 ,[QuestionOrder]
		FROM 				 
		(SELECT 
		'# Textbooks' AS Name
                ,'#TXT' As Code
                ,'Number of Textbooks ' As TextDescription
				,(SELECT QuestionType_ID from forms.QuestionType QT where QT.code = 'INT') as QuestionType_ID
				, Category_ID
				,100 as QuestionOrder
				
			FROM forms.Category cat
			WHERE Cat.Code ='TXT.CAT'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   forms.Question cat
                             WHERE  cat.Code = src.Code
							 and cat.QuestionOrder = src.QuestionOrder) 

GO


INSERT INTO [forms].[Question]
           ([Name]
		 ,[Code]
		 ,[TextDescription]
		 ,[QuestionType_ID]
		 ,[Category_ID]
		 ,[QuestionOrder]
		    )
      SELECT 
		[Name]
		 ,[Code]
		 ,[TextDescription]
		 ,[QuestionType_ID]
		 ,[Category_ID]
		 ,[QuestionOrder]
		FROM 				 
		(SELECT 
		'Textbook Type' AS Name
                ,'TXTType' As Code
                ,'Type of of Textbooks ' As TextDescription
				,(SELECT QuestionType_ID from forms.QuestionType QT where QT.code = 'TR') as QuestionType_ID
				, Category_ID
				,200 as QuestionOrder
				
			FROM forms.Category cat
			WHERE Cat.Code ='TXT.CAT'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   forms.Question cat
                             WHERE  cat.Code = src.Code
							 and cat.QuestionOrder = src.QuestionOrder) 

GO