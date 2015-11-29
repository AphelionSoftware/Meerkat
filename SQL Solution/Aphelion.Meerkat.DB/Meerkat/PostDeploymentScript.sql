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
/*Activity Type */
INSERT [Core].[ActiveType] ([ID], [Code], [Name], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (-1, N'Deleted', N'Deleted', N'dbo', CAST(0x0000A1CC00FA3229 AS DateTime), N'dbo', CAST(0x0000A1CC00FA3229 AS DateTime))
GO
INSERT [Core].[ActiveType] ([ID], [Code], [Name], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (0, N'Inactive', N'Inactive', N'dbo', CAST(0x0000A1CC00FA3229 AS DateTime), N'dbo', CAST(0x0000A1CC00FA3229 AS DateTime))
GO
INSERT [Core].[ActiveType] ([ID], [Code], [Name], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'Active', N'Active', N'dbo', CAST(0x0000A1CC00FA3229 AS DateTime), N'dbo', CAST(0x0000A1CC00FA3229 AS DateTime))
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
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'0', 10, N'Working Group', N'Output to Working Group', 1, N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime))
GO
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'1', 20, N'Public Release', N'Final Release to public - not used where public information is not allowed', 1, N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime))
GO
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'2', 30, N'Final Release', N'Final numbers internally', 1, N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime))
GO
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (5, N'3', 40, N'Pre release', N'Numbers for discussion within outcome at national level', 1, N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime))
GO
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (6, N'4', 50, N'Pre release - 2', N'2 versions prior to release', 1, N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime))
GO
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (7, N'5', 60, N'Pre release - 3', N'3 versions prior to release', 1, N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime))
GO
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (8, N'6', 70, N'Pre release - 4', N'4 versions prior to release', 1, N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1C AS DateTime))
GO
INSERT [Core].[DataVersionLevel] ([DataVersionLevel_ID], [VersionLevelCode], [VersionOrder], [Name], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (9, N'7', 80, N'Pre release - 5', N'5 versions prior to release', 1, N'dbo', CAST(0x0000A1EF0144CDDE AS DateTime), N'mneadmin', CAST(0x0000A1EF0144CDE7 AS DateTime))
GO
SET IDENTITY_INSERT [Core].[DataVersionLevel] OFF
GO

/*Outcomes Generic*/

SET IDENTITY_INSERT [app].[Outcome] ON 

GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (7, N'Outcome 1', N'Outcome 1 Long name', N'Outcome 1', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Test User', CAST(0x0000A1CC00FC9E10 AS DateTime), N'Outcome1')
GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (9, N'Outcome 2', N'Outcome 2 Long name', N'Outcome 2', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Outcome2')
GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (10, N'Outcome 3', N'Outcome 3 Long name', N'Outcome 3', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Outcome3')
GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (11, N'Outcome 4', N'Outcome 4 Long name', N'Outcome 4', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Outcome4')
GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (12, N'Outcome 5', N'Outcome 5 Long name', N'Outcome 5', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Outcome5')
GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (13, N'Outcome 6', N'Outcome 6 Long name', N'Outcome 6', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Outcome6')
GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (14, N'Outcome 7', N'Outcome 7 Long name', N'Outcome 7', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Outcome7')
GO
INSERT [app].[Outcome] ([OutcomeID], [Code], [LongName], [BusinessKey], [ShortName], [TextDescription], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn], [OutcomeSiteName]) VALUES (15, N'Outcome 8', N'Outcome 8 Long name', N'Outcome 7', N'Shortname', N'Text Description', 1, N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B1B AS DateTime), N'Outcome8')
GO
SET IDENTITY_INSERT [app].[Outcome] OFF
GO

/*MilestoneType*/


SET IDENTITY_INSERT [app].[MilestoneType] ON 

GO
INSERT [app].[MilestoneType] ([MilestoneTypeID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'Outcome', N'Outcome', 1, N'dbo', CAST(0x0000A1CC00FA5B0A AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B0A AS DateTime))
GO
INSERT [app].[MilestoneType] ([MilestoneTypeID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'Project', N'Project', 1, N'dbo', CAST(0x0000A1CC00FA5B0A AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B0A AS DateTime))
GO
INSERT [app].[MilestoneType] ([MilestoneTypeID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (5, N'Activity', N'Activity', 1, N'dbo', CAST(0x0000A1CC00FA5B0A AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B0A AS DateTime))
GO
SET IDENTITY_INSERT [app].[MilestoneType] OFF
GO


/*IndicatorType*/


SET IDENTITY_INSERT [app].[IndicatorType] ON 

GO
INSERT [app].[IndicatorType] ([IndicatorType_ID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'Outcome', N'Outcome', 1, N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime))
GO
INSERT [app].[IndicatorType] ([IndicatorType_ID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'Output', N'Output', 1, N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime))
GO
INSERT [app].[IndicatorType] ([IndicatorType_ID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'SubOutput', N'Suboutput', 1, N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime))
GO
INSERT [app].[IndicatorType] ([IndicatorType_ID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'Activity', N'Activity', 1, N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime))
GO
INSERT [app].[IndicatorType] ([IndicatorType_ID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (5, N'Milestone', N'Milestone', 1, N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime), N'dbo', CAST(0x0000A1CC00FA5B15 AS DateTime))
GO
INSERT [app].[IndicatorType] ([IndicatorType_ID], [Code], [Name], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (6, N'OS', N'Overall Status', 1, N'mneadmin', CAST(0x0000A1EF014B3065 AS DateTime), N'mneadmin', CAST(0x0000A1EF014B3073 AS DateTime))
GO
SET IDENTITY_INSERT [app].[IndicatorType] OFF
GO