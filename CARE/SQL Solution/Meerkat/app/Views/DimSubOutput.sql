
CREATE VIEW 
 [app].[DimSubOutput]
as
/****** Script for SelectTopNRows command from SSMS  ******/
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [SubOutput_ID]
            ,ShortName + ' : ' + left(LongName,80) as ShortName
      ,Left(LongName, 255) as LongName
      ,left(ShortName + ' : ' + left(LongName,80),255) as FullName
      ,Left(TextDescription,255) as TextDescription
      ,[BusinessKey]
      ,[Output_ID]
      --,[Target]
      ,[Code]
  --    ,[Sharepoint_ID]

  FROM [App].[SubOutput]


