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
INSERT INTO [app].[Output]
           ([Code]
           ,[LongName]
           ,[BusinessKey]
           ,[Outcome_ID]
           ,[ShortName]
           ,[TextDescription]
           )
     SELECT
           'OTP2.1'
           ,'Ensure that, by 2015, children everywhere, boys and girls alike, will be able to complete a full course of primary schooling'
           ,'OTP2.1'
           ,(SELECT Outcome_ID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Full Primary Schooling'
           ,'Ensure that, by 2015, children everywhere, boys and girls alike, will be able to complete a full course of primary schooling'
    WHERE NOT EXISTS (SELECT 1 FROM app.Output where code = 'OTP2.1')
    UNION 
    
     SELECT
           'OTP2.2'
           ,'Incentivise good schooling practises in schools'
           ,'OTP2.2'
           ,(SELECT Outcome_ID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Good schooling practices'
           ,'Incentivise good schooling practises in schools'
    WHERE NOT EXISTS (SELECT 1 FROM app.Output where code = 'OTP2.2')
    UNION 
     SELECT
           'OTP2.3'
           ,'Ensure the schools are well managed'
           ,'OTP2.3'
           ,(SELECT Outcome_ID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Well managed schools'
           ,'Ensure the schools are well managed'
    WHERE NOT EXISTS (SELECT 1 FROM app.Output where code = 'OTP2.3' )

GO