
CREATE VIEW [app].[DimOutcome]
as
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [OutcomeID] as [Outcome_ID]
      ,[Code]
            ,ShortName + ' : ' + left(LongName,80) as ShortName
      ,Left(LongName, 255) as LongName
      ,left(ShortName + ' : ' + LongName,255) as FullName
      ,Left(TextDescription,255) as TextDescription
      ,[BusinessKey]
      --,[Target]
     -- ,[Sharepoint_ID]


  FROM app.[Outcome]


