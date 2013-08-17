CREATE VIEW 
 [app].[DimOutput]
as
/****** Script for SelectTopNRows command from SSMS  ******/
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [Output_ID]
            ,ShortName + ' : ' + left(LongName,80) as ShortName
      ,Left(LongName, 255) as LongName
      ,left(ShortName + ' : ' + left(LongName,80),255) as FullName
      ,Left(TextDescription,255) as TextDescription
      ,[BusinessKey]
      ,[OutcomeID]
     -- ,[Target]
      ,[Code]

  FROM [app].[Output]
		