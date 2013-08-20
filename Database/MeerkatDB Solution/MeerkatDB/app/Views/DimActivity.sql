CREATE view [app].[DimActivity] as
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ActivityID] as Activity_ID
            ,ShortName + ' : ' + left(LongName,80) as ShortName
      ,Left(LongName, 255) as LongName
      ,left(Code + ' : ' + LongName,255) as FullName
      ,Left(TextDescription,255) as TextDescription
      --,[SubOutput_ID]
      --,[BusinessKey]
      --,[Target]
      ,[Code]
      --,[ActivityType_ID]

  FROM [app].[Activity]