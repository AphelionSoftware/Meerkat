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
INSERT INTO [app].[SubOutput]
           ([Code]
           ,[ShortName]
           ,[BusinessKey]
           ,[Output_ID]
           ,[LongName]
           ,[TextDescription]
)
SELECT
           'SO2.1.1'
           ,'Increase ratio of schools to number of children'
           ,'Sub Output 2.1.1'
           ,(SELECT Output_ID FROM app.Output WHERE Code = 'OTP2.1') 
           ,'Sub Output 2.1.1'
           ,'Increase the ratio of schools to the number of children '
    WHERE NOT EXISTS (SELECT 1 FROM app.SubOutput where code = 'SO2.1.1')
    UNION
SELECT
           'SO2.1.2'
           ,'Deliver adequate textbooks to children'
           ,'Sub Output 2.1.2'
           ,(SELECT Output_ID FROM app.Output WHERE Code = 'OTP2.1') 
           ,'Sub Output 2.1.2'
           ,'Deliver adequate textbooks to children'
    WHERE NOT EXISTS (SELECT 1 FROM app.SubOutput where code = 'SO2.1.2')

    UNION
SELECT
           'SO2.1.3'
           ,'Provide a lunch time meal to all schools'
           ,'Sub Output 2.1.3'
           ,(SELECT Output_ID FROM app.Output WHERE Code = 'OTP2.1') 
           ,'Sub Output 2.1.3'
           ,'Provide a lunch time meal to all schools'
    WHERE NOT EXISTS (SELECT 1 FROM app.SubOutput where code = 'SO2.1.3')

    
UNION SELECT
           'SO2.2.1'
           ,'Provide additional training for teachers'
           ,'Sub Output 2.2.1'
           ,(SELECT Output_ID FROM app.Output WHERE Code = 'OTP2.2') 
           ,'Sub Output 2.2.1'
           ,'Provide additional training for teachers  on literacy, math & science'
    WHERE NOT EXISTS (SELECT 1 FROM app.SubOutput where code = 'SO2.2.1')

GO