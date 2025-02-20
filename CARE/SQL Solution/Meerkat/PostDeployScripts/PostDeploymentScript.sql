﻿/*
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
/*Activity Type */

INSERT [Core].[ActiveType] 
([ID]
, [Code]
, [Name]) 

select -1, N'Deleted', N'Deleted'
where not exists
(Select 1 from core.ActiveType where ID =-1)
GO

INSERT [Core].[ActiveType] 
([ID]
, [Code]
, [Name]) 

select 0, N'Inactive', N'Deleted'
where not exists
(Select 1 from core.ActiveType where ID =0)
GO
INSERT [Core].[ActiveType] 
([ID]
, [Code]
, [Name]) 

select 1, N'Active', N'Deleted'
where not exists
(Select 1 from core.ActiveType where ID =1)
GO


/*Dim Date */
SET NOCOUNT ON;
IF (SELECT COUNT(1) FROM Core.DimDate) = 0
BEGIN
--Alter start

DECLARE
@StartDate DATETIME
,@EndDate DATETIME
,@Date DATETIME;

SET @StartDate = '1990/01/01';
SET @EndDate = '2025/12/31';
SET @Date = @StartDate;

WHILE @Date <= @EndDate
BEGIN

DECLARE @IsLeapYear BIT
IF ((Year(@Date) % 4 = 0) AND (Year(@Date) % 100 != 0 OR Year(@Date) % 400 = 0))
BEGIN

SELECT @IsLeapYear = 1;

END
ELSE
BEGIN

SELECT @IsLeapYear = 0;

END

DECLARE @IsWeekend BIT
IF (DATEPART(dw, @Date) = 1 OR DATEPART(dw, @Date) = 7)
BEGIN

SELECT @IsWeekend = 1;

END
ELSE
BEGIN

SELECT @IsWeekend = 0;

END

INSERT INTO Core.DimDate 
(DateID,Date,Day,DaySuffix,USDayOfWeek,DayOfWeek,DOWInMonth,DayOfYear,WeekOfYear,WeekOfMonth,MonthNumber,MonthName,Quarter,QuarterName,YearName,YearNumber,StandardDate,IsPublicHoliday,HolidayText)

VALUES
(
REPLACE(CONVERT(NVARCHAR(50),CONVERT(DATE,@Date)),'-','')
,@Date
,DATEPART(DAY,@Date)
,SUBSTRING(CONVERT(CHAR(3),DATENAME(DW, @Date)),1,3)
,DATEPART(WEEKDAY,@Date)
,CASE WHEN DATEPART(WEEKDAY,@Date)-1 = 0 THEN 1  
         WHEN DATEPART(WEEKDAY,@Date)-1 = 6 THEN 7  
         ELSE DATEPART(WEEKDAY,@Date)-1 
 END
,DATEPART(DAY,(DATEADD(S,-1,DATEADD(MM, DATEDIFF(M,0,@Date)+1,0))))
,DATEPART(DAYOFYEAR,@Date)
,DATEPART(WEEK,@Date)
,(DATEPART(DAY,@Date) / 7) + 1
,DATEPART(MONTH,@Date)
,DATENAME(MONTH,@Date)
,DATEPART(QUARTER,@Date)
,'Quarter ' + CONVERT(NVARCHAR(255),DATEPART(QUARTER,@Date))
,CONVERT(CHAR(4),DATEPART(YEAR,@Date))
,DATEPART(YEAR,@Date)
,NULL
,NULL
,NULL 
);

SET @Date += 1;

END

PRINT 'Updated Table [Shared.DimDate]';

END
GO
/*Reporting Period*/
insert into core.ReportingPeriod ( [ReportingPeriod]
      ,[StartDateID]
      ,[EndDateID]
      ,[FirstCycleDate]
      ,[LastCycleDate]
      ,[YearName]
      ,[YearNumber])
SELECT  [ReportingPeriod]
      ,[StartDateID]
      ,[EndDateID]
      ,[FirstCycleDate]
      ,[LastCycleDate]
      ,[YearName]
      ,[YearNumber]
  FROM [Core].[ReportCycle]


  /*DataVersion Level*/
  

SET IDENTITY_INSERT [Core].[DataVersionLevel] ON 

GO
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 1, N'0', 10, N'Working Group', N'Output to Working Group', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 1)


GO
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 2, N'1', 20, N'Public Release', N'Final Release to public - not used where public information is not allowed', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 2)
GO
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 3, N'2', 30, N'Final Release', N'Final numbers internally', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 3)
GO
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 4, N'3', 40, N'Pre release', N'Numbers for discussion within outcome at national level', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 4)
GO
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 5, N'4', 50, N'Pre release - 2', N'2 versions prior to release', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 5)
GO
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 6, N'5', 60, N'Pre release - 3', N'3 versions prior to release', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 6)
GO
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 7, N'6', 70, N'Pre release - 4', N'4 versions prior to release', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 7)
Go
INSERT [Core].[DataVersionLevel] 
([DataVersionLevel_ID]
, [VersionLevelCode]
, [VersionOrder]
, [Name]
, [Description]
, [Active]) 
Select 8, N'7', 80, N'Pre release - 5', N'5 versions prior to release', 1
where not exists(select 1 from core.DataVersion where DataVersion_ID = 8)
GO
SET IDENTITY_INSERT [Core].[DataVersionLevel] OFF
GO

/*Outcomes CARE*/

SET IDENTITY_INSERT [app].[Outcome] ON 


INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSiteName])


 SELECT 1, N'Outcome 1', N'Women in Conflict management', N'Outcome 1', N'Conflict management', N'Women in Conflict management', N'Outcome1'
 WHERE NOT EXISTS
 (SELECT 1 FROM app.Outcome WHERE OutcomeID = 1) 
 
 INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSiteName])

 SELECT 2, N'Outcome 2', N'Natural Resources Governance', N'Natural Resources Governance', N'Resource Governance', N'Natural Resources Governance', N'Outcome2'
 WHERE NOT EXISTS
 (SELECT 1 FROM app.Outcome WHERE OutcomeID = 2) 


 set identity_insert [app].[Outcome]  OFF



/*MilestoneType*/


SET IDENTITY_INSERT [app].[MilestoneType] ON 

GO
INSERT [app].[MilestoneType] 
([MilestoneTypeID]
, [Code]
, [Name]
, [Active]) 
Select 1, N'Outcome', N'Outcome', 1
where not exists(select 1 from  app.MilestoneType where MilestoneTypeID = 1)
GO
INSERT [app].[MilestoneType] 
([MilestoneTypeID]
, [Code]
, [Name]
, [Active]) 
Select 4, N'Project', N'Project', 1
where not exists(select 1 from  app.MilestoneType where MilestoneTypeID = 4)
GO
INSERT [app].[MilestoneType] 
([MilestoneTypeID]
, [Code]
, [Name]
, [Active]) 
Select 5, N'Activity', N'Activity', 1
where not exists(select 1 from app.MilestoneType where MilestoneTypeID= 5)
GO
SET IDENTITY_INSERT [app].[MilestoneType] OFF
GO


/*IndicatorType*/


SET IDENTITY_INSERT [app].[IndicatorType] ON 

GO
INSERT [app].[IndicatorType] 
([IndicatorType_ID]
, [Code]
, [Name]
, [Active]) 
Select 1, N'Outcome', N'Outcome', 1
where not exists(select 1 from  app.IndicatorType where IndicatorType_ID = 1)
GO
INSERT [app].[IndicatorType] 
([IndicatorType_ID]
, [Code]
, [Name]
, [Active]) 
Select 2, N'Output', N'Output', 1
where not exists(select 1 from  app.IndicatorType where IndicatorType_ID = 2)
GO
INSERT [app].[IndicatorType] 
([IndicatorType_ID]
, [Code]
, [Name]
, [Active]) 
Select 3, N'SubOutput', N'Suboutput', 1
where not exists(select 1 from  app.IndicatorType where IndicatorType_ID = 3)
GO
INSERT [app].[IndicatorType] 
([IndicatorType_ID]
, [Code]
, [Name]
, [Active]) 
Select 4, N'Activity', N'Activity', 1
where not exists(select 1 from  app.IndicatorType where IndicatorType_ID = 4)
GO
INSERT [app].[IndicatorType] 
([IndicatorType_ID]
, [Code]
, [Name]
, [Active]) 
Select 5, N'Milestone', N'Milestone', 1
where not exists(select 1 from  app.IndicatorType where IndicatorType_ID = 5)
GO
INSERT [app].[IndicatorType] 
([IndicatorType_ID]
, [Code]
, [Name]
, [Active]) 
Select 6, N'OS', N'Overall Status', 1
where not exists(select 1 from  app.IndicatorType where IndicatorType_ID = 6)
GO
SET IDENTITY_INSERT [app].[IndicatorType] OFF
GO


/*Status Indicators*/

INSERT INTO [app].[Indicator]
           ([LongName]
           ,[TextDescription]
           ,[Baseline]
           ,[BaselineString]
           ,[BaselineDate]
           ,[Target]
           ,[TargetString]
           ,[TargetDate]
           ,[ReleaseDate]
           ,[Output_ID]
           ,[OutcomeID]
           ,[BusinessKey]
           ,[Notes]
           ,[Code]
           ,[IndicatorType_ID]
           ,[Activity_ID]
           ,[SubOutput_ID]
           ,[ShortName]
		   ,IsKeyIndicator
		   ,UnitOfMeasure
           )
     
SELECT OM.ShortName + ' Status', 
	OM.ShortName + ' Status', 
	0,
	0,
	'2012/01/01' As BaselineDate,
	0,
	0,
	'2012/01/01' As TargetDate,
	'2012/01/01' As ReleaseDate,
	NULL AS OutputID,
	OM.OutcomeID as OutcomeID,
	OM.ShortName + ' Status' as BusinessKey,
	'' AS NOTES,
	CAST(OM.OutcomeID as varchar(10)) + ' Status' As Code,
	 6 as IndicatorType_ID,
	 NULL AS Activity_ID,
	 NULL AS Suboutput_ID,
	 LEFT('Status of ' + OM.ShortName,50),
	 0
	 ,'Percentage'
FROM app.Outcome OM

UNION ALL 

SELECT OP.ShortName + ' Status', 
	OP.ShortName + ' Status', 
	0,
	0,
	'2012/01/01' As BaselineDate,
	0,
	0,
	'2012/01/01' As TargetDate,
	'2012/01/01' As ReleaseDate,
	OP.Output_ID AS Output_ID,
	NULL as OutcomeID,
	OP.ShortName + ' Status' as BusinessKey,
	'' AS NOTES,
	CAST(OP.Output_ID as varchar(10)) + ' Status' As Code,
	 6 as IndicatorType_ID,
	 NULL AS Activity_ID,
	 NULL AS Suboutput_ID,
	 LEFT('Status of ' + OP.ShortName,50),
	 0 
	 ,'Percentage'

FROM app.Output OP

UNION ALL 


SELECT SO.ShortName + ' Status', 
	SO.ShortName + ' Status', 
	0,
	0,
	'2012/01/01' As BaselineDate,
	0,
	0,
	'2012/01/01' As TargetDate,
	'2012/01/01' As ReleaseDate,
	NULL AS Output_ID,
	NULL as OutcomeID,
	SO.ShortName + ' Status' as BusinessKey,
	'' AS NOTES,
	CAST(SO.SubOutput_ID as varchar(10)) + ' Status' As Code,
	 6 as IndicatorType_ID,
	 NULL AS Activity_ID,
	 SO.SubOutput_ID AS SubSubOutput_ID,
	 LEFT('Status of ' + SO.ShortName,50),
	 0
	 ,'Percentage'
FROM app.SubOutput SO

