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
INSERT INTO [app].[Indicator]
           ([LongName]
           ,[TextDescription]
           ,[Baseline]
           ,[BaselineDate]
           ,[Target]
           ,[TargetDate]
           ,[BusinessKey]
           ,[Code]
           ,[IndicatorType_ID] /*3*/
           ,[SubOutput_ID]
           ,[ShortName]
           ,[UnitOfMeasure])

           SELECT 'Number of children per classroom'
           ,'Number of children per classroom'
           ,50 As Baseline
           ,'2012/01/01'
           ,20 As target
           ,'2015/01/01'
           ,'#'
           ,'IND2.1.1.1'
           ,3
           ,(Select Suboutput_ID from app.SubOutput SO where SO.code = 'SO2.1.1')
           ,'Children per classroom'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Indicator where code = 'IND2.1.1.1')

GO	

           
INSERT INTO [app].[Indicator]
           ([LongName]
           ,[TextDescription]
           ,[Baseline]
           ,[BaselineDate]
           ,[Target]
           ,[TargetDate]
           ,[BusinessKey]
           ,[Code]
           ,[IndicatorType_ID] /*3*/
           ,[SubOutput_ID]
           ,[ShortName]
           ,[UnitOfMeasure])

           SELECT 'Total number of schools'
           ,'Total number of schools'
           ,1188
           ,'2012/01/01'
           ,2000
           ,'2017/01/01'
           ,'#'
           ,'IND2.1.1.2'
           ,3
           ,(Select Suboutput_ID from app.SubOutput SO where SO.code = 'SO2.1.1')
           ,'# schools'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Indicator where code = 'IND2.1.1.2')
           
GO