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

INSERT INTO [forms].[FormResponse]
           ( [Form_ID]
			  ,[Location_ID]
			  ,FormResponse_FNVID
          )

		 SELECT [Form_ID]
			  ,[Location_ID]
			  ,FormResponse_FNVID
		   FROM 
		   (
		    SELECT [Form_ID]
           ,1 As Location_ID
		   ,-1 as FormResponse_FNVID
		   FROM forms.Form 
		   WHERE  Form.Code = 'TXT'

		   ) src
      WHERE   NOT EXISTS ( SELECT 1
                             FROM   [forms].[FormResponse]
                             WHERE  [forms].[FormResponse].Form_ID = src.Form_ID
							 AND [forms].[FormResponse].Location_ID = src.Location_ID
							 AND forms.FormResponse.FormResponse_FNVID = src.FormResponse_FNVID) 
GO