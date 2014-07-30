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

INSERT INTO [forms].[Response]
           ([FormResponse_ID]
		   ,[FormResponse_FNVID]
		   ,[Question_ID]
		   ,[IntegerResponse]
		   
		    )
      SELECT 
		[FormResponse_ID]
		   ,[FormResponse_FNVID]
		   ,[Question_ID]
		   ,[IntegerResponse]
		   
		FROM 				 
		(SELECT 
			FR.FormResponse_ID
			,fr.FormResponse_FNVID
                ,(SELECT Question_ID from forms.Question Q where Q.code = '#TXT') as Question_ID
				
				,55 as[IntegerResponse]
				
			FROM forms.FormResponse FR
			WHERE FR.FormResponse_FNVID = -1
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   forms.Response R
                             WHERE  R.FormResponse_ID = src.FormResponse_ID
							 and R.Question_ID = src.Question_ID) 

GO



INSERT INTO [forms].[Response]
           ([FormResponse_ID]
		   ,[FormResponse_FNVID]
		   ,[Question_ID]
		   ,[Response]
		   
		    )
      SELECT 
		[FormResponse_ID]
		   ,[FormResponse_FNVID]
		   ,[Question_ID]
		   ,[Response]
		   
		FROM 				 
		(SELECT 
			FR.FormResponse_ID
			,fr.FormResponse_FNVID
                ,(SELECT Question_ID from forms.Question Q where Q.code = 'TXTType') as Question_ID
				
				,'Geography' as Response
				
			FROM forms.FormResponse FR
			WHERE FR.FormResponse_FNVID = -1
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   forms.Response R
                             WHERE  R.FormResponse_ID = src.FormResponse_ID
							 and R.Question_ID = src.Question_ID) 

GO
