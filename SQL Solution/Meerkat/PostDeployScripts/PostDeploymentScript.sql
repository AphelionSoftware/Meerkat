
/*Status Type*/

INSERT INTO [Core].StatusType
(ID, Code, Name, Value)
SELECT 0, '+', 'On Target', 1
WHERE NOT EXISTS (SELECT 1 FROM Core.StatusType WHERE Code = '+')
UNION ALL
SELECT 1, '=', 'Acceptable', 0
WHERE NOT EXISTS (SELECT 1 FROM Core.StatusType WHERE Code = '=')
UNION ALL
SELECT 2, '-', 'Sub par', -1
WHERE NOT EXISTS (SELECT 1 FROM Core.StatusType WHERE Code = '-')



/*Activity Type */

INSERT [Core].[ActiveType] 
([ID]   
, [Code]
, [Name]) 

select -1, N'Deleted', N'Deleted'
where not exists
(Select 1 from Core.ActiveType where ID =-1)
GO

INSERT [Core].[ActiveType] 
([ID]
, [Code]
, [Name]) 

select 0, N'InActive', N'Deleted'
where not exists
(Select 1 from Core.ActiveType where ID =0)
GO
INSERT [Core].[ActiveType] 
([ID]
, [Code]
, [Name]) 

select 1, N'Active', N'Deleted'
where not exists
(Select 1 from Core.ActiveType where ID =1)
GO

/* Data Versions */
SET IDENTITY_INSERT Core.DataVersion ON 
INSERT INTO Core.DataVersion (Active, Code, DataVersion_ID, Name, [Order], [Description]) 
SELECT 1, '0', 0, 'External', 10, ''
WHERE NOT EXISTS (SELECT 1 FROM Core.DataVersion WHERE DataVersion_ID = 0)

INSERT INTO Core.DataVersion (Active, Code, DataVersion_ID, Name, [Order], [Description]) 
SELECT 1, '1', 1, 'Publish', 20, ''
WHERE NOT EXISTS (SELECT 1 FROM Core.DataVersion WHERE DataVersion_ID = 1)

INSERT INTO Core.DataVersion (Active, Code, DataVersion_ID, Name, [Order], [Description]) 
SELECT 1, '2', 3, 'Final Draft', 30, ''
WHERE NOT EXISTS (SELECT 1 FROM Core.DataVersion WHERE DataVersion_ID = 3)

INSERT INTO Core.DataVersion (Active, Code, DataVersion_ID, Name, [Order], [Description]) 
SELECT 1, '3', 4, 'First Draft', 40, ''
WHERE NOT EXISTS (SELECT 1 FROM Core.DataVersion WHERE DataVersion_ID = 4)


SET IDENTITY_INSERT  Core.DataVersion OFF


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
insert into Core.ReportingPeriod ( [ReportingPeriod]
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




GO

/*Outcomes Meerkat*/

SET IDENTITY_INSERT [app].[Outcome] ON 


INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])


 SELECT 1, N'Outcome 1', N'Eradicate Extreme Poverty and Hunger', N'Outcome 1', N'Eradicate Extreme Poverty and Hunger', N'The Ministry of Agriculture formulated the Strategy for Revitalizing Agriculture (2004-2014) and developed a Strategic Plan (2008-2012) both of which put forward fairly elaborate interventions that could contribute very substantially to improved agricultural productivity at the household level thereby touching positively the food security of the poor.', N'Outcome1', 0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 1) 
 
 INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])

 SELECT 2, N'Outcome 2', N'Achieve Universal Primary Education', N'Outcome 2', N'Achieve Universal Primary Education', N'Enrolment in both public and private schools increased by 2.3% from 8.6 million in 2008 to 8.8 million in 2009. The gross enrolment rate (GER) rose from 109.8% in 2008 to 110% in the year 2009. The net enrolment rate (NER) rose slightly from 92.5% in 2008 to 92.9% in 2009. There has been a consistent improvement of NER from 2005 to 2009. This is attributed to the introduction of the Free Primary Education which enabled children to begin schooling at the right school going age.', N'Outcome2',0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 2) 

  INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])

 SELECT 3, N'Outcome 3', N'Gender Equality and Women Empowerment', N'Outcome 3', N'Gender Equality and Women Empowerment', N'The governments commitment to invest in social services to improve the welfare of the population has been consistent in the past 8 years. The total social sector expenditure increased by 19.8 per cent from KES 197,537.4 million in the 2008/09 to KES 236,578.7 million in the 2009/10 Financial Year. The ministry of Gender, Children and Social Services recorded the highest increase in expenditure of 82.3 per cent. The central government expenditure on social services in regard to Gender increased from KES 1,421.42 in 2008/09 to 3,049.36 million in the 2009/10 FY. The new constitution inaugurated in 2010 provides for 30% representation of women in all elected and public offices.', N'Outcome3',0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 3) 


  INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])

 SELECT 4, N'Outcome 4', N'Reduce child mortality', N'Outcome 4', N'Reduce child mortality', N'Government launched a Child Survival and development Strategy that is budgeted in 2009 as an effort to accelerate child survival and provide a framework to improve indicators for children. The strategy is guided by the National Health Sector Strategic Plan II (NHSSP II) and the Vision 2030 Medium Term Plan that aim to reduce inequalities in the health care services and improve on the child health indicators.', N'Outcome4',0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 4) 


  INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])

 SELECT 5, N'Outcome 5', N'Improve maternal health', N'Outcome 5', N'Improve maternal health', N'Maternal mortality in Kenya has remained unacceptably high at 488 maternal deaths per 100,000 live births (with some regions reporting MMRs of 1,000/100,000 live births) in 2008/9, an increase from 414/100,000 in 2003, 590/100,000 in 1998. Most maternal deaths are due to causes directly related to pregnancy and childbirth unsafe abortion and obstetric complications such as severe bleeding, infection, hypertensive disorders, and obstructed labor. Others are due to causes such as malaria, diabetes, hepatitis, and anaemia, which are aggravated by pregnancy.', N'Outcome5',0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 5) 


  INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])

 SELECT 6, N'Outcome 6', N'Combat HIV/AIDS, malaria and other diseases', N'Outcome 6', N'Combat HIV/AIDS, malaria and other diseases', N'Recent studies indicate that whereas Kenya has made significant progress in the fight against HIV/AIDS, the national prevalence rates still raise concern.. The KDHS 2008/09 states that "in Kenya, HIV prevalence has not changed significantly in the past five years. The HIV prevalence is 6.3% for women and men aged 15-49, compared with 6.7% in the 2003 KDHS and 7.4% in the 2007 Kenya AIDS Indicator Survey".', N'Outcome6',0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 6) 

  INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])

 SELECT 7, N'Outcome 7', N'Ensure environmental sustainability', N'Outcome 7', N'Ensure environmental sustainability', N'The Environmental Management and Coordination Act (EMCA) of 1999 provides a comprehensive legislative framework for the management of the environment in the country. The legislation provided for the creation of the National Environment Management Authority (NEMA), a competent authority mandated to safeguard and enhance environmental quality through coordination, research, facilitation and enforcement. The organization has an important responsibility coordinating the preparation of Environmental Action Plans (EAPs) at district, provincial and national levels. The country has also ratified and domesticated various multilateral environmental agreements.', N'Outcome7',0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 7) 


  INSERT [app].[Outcome] 
([OutcomeID]
, [Code]
, [LongName]
, [BusinessKey]
, [ShortName]
, [TextDescription]
, [OutcomeSitename]
,[DataVersion])

 SELECT 8, N'Outcome 8', N'Develop a global partnership for development', N'Outcome 8', N'Develop a global artnership for development', N'The MDG goal 8 on developing a global partnership for development gives international trade indicators that are intended to improve market access of developing countries and least developed countries exports to the developed economy markets. Trade has increasingly become the cornerstone of the Kenyas economic development in the 21st century. Kenyas trade share of GDP in 2007 stood at about 55.4%. In 2007, merchandize trade contributed about 60.6% of total exports while services constituted about 38.8%. Trade in services also continues to be critical in Kenyas quest for sustainable economic growth and development. In 2007, services accounted for about 60% of Kenyas GDP with leading contributors being Transport and communication, postal and telecommunications, and wholesale and retail trade.', N'Outcome8',0
 WHERE NOT EXISTS
 (SELECT 1 FROM [app].[Outcome] WHERE OutcomeID = 8) 

 set identity_insert [app].[Outcome]  OFF



/*MilestoneType*/


SET IDENTITY_INSERT [app].[MilestoneType] ON 

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
Select 3, N'SubOutput', N'SubOutput', 1
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
           ,[SubOutput_ID]
           ,[ShortName]
		   ,UnitOfMeasure
           )
     
SELECT OM.ShortName + ' Status',                                  /* Long Name */
	OM.ShortName + ' Status',                                     /* Text Description */
	0,                                                            /* Baseline */
	0,                                                            /* Baseline String */
	'2012/01/01' As BaselineDate,                                 /* Baseline Date */
	0,                                                            /* Target */
	0,                                                            /* Target String */
	'2012/01/01' As TargetDate,                                   /* Target Date */
	'2012/01/01' As ReleaseDate,                                  /* Release Date */
	NULL AS OutputID,                                             /* Output ID */
	OM.OutcomeID as OutcomeID,                                    /* OutcomeID */
	OM.ShortName + ' Status' as BusinessKey,                      /* Business Key */
	'' AS NOTES,                                                  /* Notes */
	CAST(OM.OutcomeID as varchar(10)) + ' Status' As Code,        /* Code */
	 6 as IndicatorType_ID,                                       /* Indicator Type ID */
	 NULL AS SubOutput_ID,                                        /* Sub output ID */
	 LEFT('Status of ' + OM.ShortName,50)                        /* Short Name */
	 ,'Percentage'
FROM [app].[Outcome] OM

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
	 NULL AS SubOutput_ID,
	 LEFT('Status of ' + OP.ShortName,50)
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

	 SO.SubOutput_ID AS SubSubOutput_ID,
	 LEFT('Status of ' + SO.ShortName,50)
	 ,'Percentage'
FROM [app].[SubOutput] SO

GO