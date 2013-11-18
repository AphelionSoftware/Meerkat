/*Activity Type */

INSERT  [Core].[ActiveType]
        ( [Core].[ActiveType].[ID] ,
          [Core].[ActiveType].[Code] ,
          [Core].[ActiveType].[Name]
        )
        SELECT  -1 ,
                N'Deleted' ,
                N'Deleted'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ActiveType
                             WHERE  [Core].[ActiveType].[ID] = -1 )
GO

INSERT  [Core].[ActiveType]
        ( [Core].[ActiveType].[ID] ,
          [Core].[ActiveType].[Code] ,
          [Core].[ActiveType].[Name]
        )
        SELECT  0 ,
                N'InActive' ,
                N'Deleted'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ActiveType
                             WHERE  [Core].[ActiveType].[ID] = 0 )
GO
INSERT  [Core].[ActiveType]
        ( [Core].[ActiveType].[ID] ,
          [Core].[ActiveType].[Code] ,
          [Core].[ActiveType].[Name]
        )
        SELECT  1 ,
                N'Active' ,
                N'Deleted'
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ActiveType
                             WHERE  [Core].[ActiveType].[ID] = 1 )
GO

/*Status Type*/

INSERT  INTO [Core].StatusType
        ( [Core].[StatusType].[ID] ,
          [Core].[StatusType].[Code] ,
          [Core].[StatusType].[Name] ,
          [Core].[StatusType].[Value],
          [Core].[StatusType].[Active]
        )
        SELECT  0 ,
                '+' ,
                'On Target' ,
                1,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.StatusType
                             WHERE  [Core].[StatusType].[Code] = '+' )
        UNION ALL
        SELECT  1 ,
                '=' ,
                'Acceptable' ,
                0,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.StatusType
                             WHERE  [Core].[StatusType].[Code] = '=' )
        UNION ALL
        SELECT  2 ,
                '-' ,
                'Sub par' ,
                -1,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.StatusType
                             WHERE  [Core].[StatusType].[Code] = '-' )

GO

/* Data Versions */
SET IDENTITY_INSERT Core.DataVersion ON 
INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description]
        )
        SELECT  1 ,
                '0' ,
                0 ,
                'External' ,
                10 ,
                ''
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 0 )

INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description]
        )
        SELECT  1 ,
                '1' ,
                1 ,
                'Publish' ,
                20 ,
                ''
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 1 )

INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description]
        )
        SELECT  1 ,
                '2' ,
                3 ,
                'Final Draft' ,
                30 ,
                ''
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 3 )

INSERT  INTO Core.DataVersion
        ( [Core].[DataVersion].[Active] ,
          [Core].[DataVersion].[Code] ,
          [Core].[DataVersion].[DataVersion_ID] ,
          [Core].[DataVersion].[Name] ,
          [Core].[DataVersion].[Order] ,
          [Core].[DataVersion].[Description]
        )
        SELECT  1 ,
                '3' ,
                4 ,
                'First Draft' ,
                40 ,
                ''
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.DataVersion
                             WHERE  [Core].[DataVersion].[DataVersion_ID] = 4 )


SET IDENTITY_INSERT  Core.DataVersion OFF


/*Dim Date */
SET NOCOUNT ON;
IF ( SELECT COUNT(1)
     FROM   Core.DimDate
   ) = 0 
    BEGIN
--Alter start

        DECLARE @StartDate DATETIME ,
            @EndDate DATETIME ,
            @Date DATETIME;

        SET @StartDate = '1990/01/01';
        SET @EndDate = '2025/12/31';
        SET @Date = @StartDate;

        WHILE @Date <= @EndDate 
            BEGIN

                DECLARE @IsLeapYear BIT
                IF ( ( YEAR(@Date) % 4 = 0 )
                     AND ( YEAR(@Date) % 100 != 0
                           OR YEAR(@Date) % 400 = 0
                         )
                   ) 
                    BEGIN

                        SELECT  @IsLeapYear = 1;

                    END
                ELSE 
                    BEGIN

                        SELECT  @IsLeapYear = 0;

                    END

                DECLARE @IsWeekend BIT
                IF ( DATEPART(dw, @Date) = 1
                     OR DATEPART(dw, @Date) = 7
                   ) 
                    BEGIN

                        SELECT  @IsWeekend = 1;

                    END
                ELSE 
                    BEGIN

                        SELECT  @IsWeekend = 0;

                    END

                INSERT  INTO Core.DimDate
                        ( [Core].[DimDate].[DateID] ,
                          [Core].[DimDate].[Date] ,
                          [Core].[DimDate].[Day] ,
                          [Core].[DimDate].[DaySuffix] ,
                          [Core].[DimDate].[USDayOfWeek] ,
                          [Core].[DimDate].[DayOfWeek] ,
                          [Core].[DimDate].[DOWInMonth] ,
                          [Core].[DimDate].[DayOfYear] ,
                          [Core].[DimDate].[WeekOfYear] ,
                          [Core].[DimDate].[WeekOfMonth] ,
                          [Core].[DimDate].[MonthNumber] ,
                          [Core].[DimDate].[MonthName] ,
                          [Core].[DimDate].[Quarter] ,
                          [Core].[DimDate].[QuarterName] ,
                          [Core].[DimDate].[YearName] ,
                          [Core].[DimDate].[YearNumber] ,
                          [Core].[DimDate].[StandardDate] ,
                          [Core].[DimDate].[IsPublicHoliday] ,
                          [Core].[DimDate].[HolidayText]
                        )
                VALUES  ( REPLACE(CONVERT(NVARCHAR(50), CONVERT(DATE, @Date)),
                                  '-', '') ,
                          @Date ,
                          DATEPART(DAY, @Date) ,
                          SUBSTRING(CONVERT(CHAR(3), DATENAME(DW, @Date)), 1,
                                    3) ,
                          DATEPART(WEEKDAY, @Date) ,
                          CASE WHEN DATEPART(WEEKDAY, @Date) - 1 = 0 THEN 1
                               WHEN DATEPART(WEEKDAY, @Date) - 1 = 6 THEN 7
                               ELSE DATEPART(WEEKDAY, @Date) - 1
                          END ,
                          DATEPART(DAY,
                                   ( DATEADD(S, -1,
                                             DATEADD(MM,
                                                     DATEDIFF(M, 0, @Date) + 1,
                                                     0)) )) ,
                          DATEPART(DAYOFYEAR, @Date) ,
                          DATEPART(WEEK, @Date) ,
                          ( DATEPART(DAY, @Date) / 7 ) + 1 ,
                          DATEPART(MONTH, @Date) ,
                          DATENAME(MONTH, @Date) ,
                          DATEPART(QUARTER, @Date) ,
                          'Quarter ' + CONVERT(NVARCHAR(255), DATEPART(QUARTER,
                                                              @Date)) ,
                          CONVERT(CHAR(4), DATEPART(YEAR, @Date)) ,
                          DATEPART(YEAR, @Date) ,
                          NULL ,
                          NULL ,
                          NULL 
                        );

                SET @Date += 1;

            END

        PRINT 'Updated Table [Shared.DimDate]';

    END
GO
/*Reporting Period*/
INSERT  INTO Core.ReportingPeriod
        ( [Core].[ReportingPeriod].[ReportingPeriod] ,
          [Core].[ReportingPeriod].[StartDateID] ,
          [Core].[ReportingPeriod].[EndDateID] ,
          [Core].[ReportingPeriod].[FirstCycleDate] ,
          [Core].[ReportingPeriod].[LastCycleDate] ,
          [Core].[ReportingPeriod].[YearName] ,
          [Core].[ReportingPeriod].[YearNumber],
          [Core].[ReportingPeriod].[Summary]
        )
        SELECT  rc.[ReportingPeriod] ,
                rc.[StartDateID] ,
                rc.[EndDateID] ,
                rc.[FirstCycleDate] ,
                rc.[LastCycleDate] ,
                rc.[YearName] ,
                rc.[YearNumber],
                CONCAT(rc.[YearNumber],' - ',rc.[ReportingPeriod])
        FROM    [Core].[ReportCycle] AS rc
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ReportingPeriod
                             WHERE  [Core].[ReportingPeriod].[StartDateID] = rc.StartDateID
                                    AND [Core].[ReportingPeriod].[EndDateID] = rc.EndDateID )



GO

/*Outcomes Meerkat*/

SET IDENTITY_INSERT [app].[Outcome] ON 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  1 ,
                N'Outcome 1' ,
                N'Eradicate Extreme Poverty and Hunger' ,
                N'Outcome 1' ,
                N'Eradicate Extreme Poverty and Hunger' ,
                N'The Ministry of Agriculture formulated the Strategy for Revitalizing Agriculture (2004-2014) and developed a Strategic Plan (2008-2012) both of which put forward fairly elaborate interventions that could contribute very substantially to improved agricultural productivity at the household level thereby touching positively the food security of the poor.' ,
                N'Outcome1' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 1 ) 
 
INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  2 ,
                N'Outcome 2' ,
                N'Achieve Universal Primary Education' ,
                N'Outcome 2' ,
                N'Achieve Universal Primary Education' ,
                N'Enrolment in both public and private schools increased by 2.3% from 8.6 million in 2008 to 8.8 million in 2009. The gross enrolment rate (GER) rose from 109.8% in 2008 to 110% in the year 2009. The net enrolment rate (NER) rose slightly from 92.5% in 2008 to 92.9% in 2009. There has been a consistent improvement of NER from 2005 to 2009. This is attributed to the introduction of the Free Primary Education which enabled children to begin schooling at the right school going age.' ,
                N'Outcome2' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 2 ) 

INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  3 ,
                N'Outcome 3' ,
                N'Gender Equality and Women Empowerment' ,
                N'Outcome 3' ,
                N'Gender Equality and Women Empowerment' ,
                N'The governments commitment to invest in social services to improve the welfare of the population has been consistent in the past 8 years. The total social sector expenditure increased by 19.8 per cent from KES 197,537.4 million in the 2008/09 to KES 236,578.7 million in the 2009/10 Financial Year. The ministry of Gender, Children and Social Services recorded the highest increase in expenditure of 82.3 per cent. The central government expenditure on social services in regard to Gender increased from KES 1,421.42 in 2008/09 to 3,049.36 million in the 2009/10 FY. The new constitution inaugurated in 2010 provides for 30% representation of women in all elected and public offices.' ,
                N'Outcome3' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 3 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  4 ,
                N'Outcome 4' ,
                N'Reduce child mortality' ,
                N'Outcome 4' ,
                N'Reduce child mortality' ,
                N'Government launched a Child Survival and development Strategy that is budgeted in 2009 as an effort to accelerate child survival and provide a framework to improve indicators for children. The strategy is guided by the National Health Sector Strategic Plan II (NHSSP II) and the Vision 2030 Medium Term Plan that aim to reduce inequalities in the health care services and improve on the child health indicators.' ,
                N'Outcome4' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 4 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  5 ,
                N'Outcome 5' ,
                N'Improve maternal health' ,
                N'Outcome 5' ,
                N'Improve maternal health' ,
                N'Maternal mortality in Kenya has remained unacceptably high at 488 maternal deaths per 100,000 live births (with some regions reporting MMRs of 1,000/100,000 live births) in 2008/9, an increase from 414/100,000 in 2003, 590/100,000 in 1998. Most maternal deaths are due to causes directly related to pregnancy and childbirth unsafe abortion and obstetric complications such as severe bleeding, infection, hypertensive disorders, and obstructed labor. Others are due to causes such as malaria, diabetes, hepatitis, and anaemia, which are aggravated by pregnancy.' ,
                N'Outcome5' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 5 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  6 ,
                N'Outcome 6' ,
                N'Combat HIV/AIDS, malaria and other diseases' ,
                N'Outcome 6' ,
                N'Combat HIV/AIDS, malaria and other diseases' ,
                N'Recent studies indicate that whereas Kenya has made significant progress in the fight against HIV/AIDS, the national prevalence rates still raise concern.. The KDHS 2008/09 states that "in Kenya, HIV prevalence has not changed significantly in the past five years. The HIV prevalence is 6.3% for women and men aged 15-49, compared with 6.7% in the 2003 KDHS and 7.4% in the 2007 Kenya AIDS Indicator Survey".' ,
                N'Outcome6' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 6 ) 

INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  7 ,
                N'Outcome 7' ,
                N'Ensure environmental sustainability' ,
                N'Outcome 7' ,
                N'Ensure environmental sustainability' ,
                N'The Environmental Management and Coordination Act (EMCA) of 1999 provides a comprehensive legislative framework for the management of the environment in the country. The legislation provided for the creation of the National Environment Management Authority (NEMA), a competent authority mandated to safeguard and enhance environmental quality through coordination, research, facilitation and enforcement. The organization has an important responsibility coordinating the preparation of Environmental Action Plans (EAPs) at district, provincial and national levels. The country has also ratified and domesticated various multilateral environmental agreements.' ,
                N'Outcome7' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 7 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[OutcomeID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  8 ,
                N'Outcome 8' ,
                N'Develop a global partnership for development' ,
                N'Outcome 8' ,
                N'Develop a global artnership for development' ,
                N'The MDG goal 8 on developing a global partnership for development gives international trade indicators that are intended to improve market access of developing countries and least developed countries exports to the developed economy markets. Trade has increasingly become the cornerstone of the Kenyas economic development in the 21st century. Kenyas trade share of GDP in 2007 stood at about 55.4%. In 2007, merchandize trade contributed about 60.6% of total exports while services constituted about 38.8%. Trade in services also continues to be critical in Kenyas quest for sustainable economic growth and development. In 2007, services accounted for about 60% of Kenyas GDP with leading contributors being Transport and communication, postal and telecommunications, and wholesale and retail trade.' ,
                N'Outcome8' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[OutcomeID] = 8 ) 

SET IDENTITY_INSERT [app].[Outcome]  OFF



/*MilestoneType*/


SET IDENTITY_INSERT [app].[MilestoneType] ON 

GO
INSERT  [app].[MilestoneType]
        ( [app].[MilestoneType].[MilestoneTypeID] ,
          [app].[MilestoneType].[Code] ,
          [app].[MilestoneType].[Name] ,
          [app].[MilestoneType].[Active]
        )
        SELECT  4 ,
                N'Project' ,
                N'Project' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.MilestoneType
                             WHERE  [app].[MilestoneType].[MilestoneTypeID] = 4 )
GO
INSERT  [app].[MilestoneType]
        ( [app].[MilestoneType].[MilestoneTypeID] ,
          [app].[MilestoneType].[Code] ,
          [app].[MilestoneType].[Name] ,
          [app].[MilestoneType].[Active]
        )
        SELECT  5 ,
                N'Activity' ,
                N'Activity' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.MilestoneType
                             WHERE  [app].[MilestoneType].[MilestoneTypeID] = 5 )
GO
SET IDENTITY_INSERT [app].[MilestoneType] OFF
GO


/*IndicatorType*/


SET IDENTITY_INSERT [app].[IndicatorType] ON 

GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active]
        )
        SELECT  1 ,
                N'Outcome' ,
                N'Outcome' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 1 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active]
        )
        SELECT  2 ,
                N'Output' ,
                N'Output' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 2 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active]
        )
        SELECT  3 ,
                N'SubOutput' ,
                N'SubOutput' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 3 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active]
        )
        SELECT  4 ,
                N'Activity' ,
                N'Activity' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 4 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active]
        )
        SELECT  5 ,
                N'Milestone' ,
                N'Milestone' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 5 )
GO
INSERT  [app].[IndicatorType]
        ( [app].[IndicatorType].[IndicatorType_ID] ,
          [app].[IndicatorType].[Code] ,
          [app].[IndicatorType].[Name] ,
          [app].[IndicatorType].[Active]
        )
        SELECT  6 ,
                N'OS' ,
                N'Overall Status' ,
                1
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   app.IndicatorType
                             WHERE  [app].[IndicatorType].[IndicatorType_ID] = 6 )
GO
SET IDENTITY_INSERT [app].[IndicatorType] OFF
GO



/*GeoSpatialData*/

IF ( EXISTS ( SELECT    [master].[dbo].[sysdatabases].[name]
              FROM      master.dbo.sysdatabases
              WHERE     ( '[' + [master].[dbo].[sysdatabases].[name] + ']' = 'SpatialProvince'
                          OR [master].[dbo].[sysdatabases].[name] = 'SpatialProvince'
                        ) ) ) 
    BEGIN
        INSERT  INTO Meerkat.Core.DimMunicipalityGEOM
                ( [Meerkat].[Core].[DimMunicipalityGEOM].[ID] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[LBL] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[FIP] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[MMT_ID] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[SHORT__FRM] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[LONG_FRM] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM0] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM1] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM2] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM3] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM4] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM5] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[geom]
                )
                SELECT  [SpatialProvince].[dbo].[SimpleProvince].[Location_ID] AS [ID] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[ISO] AS [LBL] ,
                        '' AS [FIP] ,
                        '' [MMT_ID] ,
                        '' [SHORT__FRM] ,
                        '' [LONG_FRM] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[ADM0] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[ADM1] ,
                        '' [ADM2] ,
                        '' [ADM3] ,
                        '' [ADM4] ,
                        '' [ADM5] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[Geog] AS [geom]
                FROM    [SpatialProvince].dbo.[SimpleProvince] 
    END

/*ALTER TABLE app.SubOutput ADD CONSTRAINT
    DF_SubOutput_Active DEFAULT 1 FOR Active
GO*/

/*Populate Organistation Type*/
USE [Meerkat]
GO
SET IDENTITY_INSERT [Core].[OrganizationType] ON 

GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 1
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'Food Support', 1, N'dbo', CAST(0x0000A23700F26E2A AS DateTime), N'dbo', CAST(0x0000A23700F26E2A AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 2
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'Agricultural Development Support', 1, N'dbo', CAST(0x0000A23700F27C1C AS DateTime), N'dbo', CAST(0x0000A23700F27C1C AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 3
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'Funding/Financing Support', 1, N'dbo', CAST(0x0000A23700F28B06 AS DateTime), N'dbo', CAST(0x0000A23700F28B06 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 4
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'Educational Support', 1, N'dbo', CAST(0x0000A23700F29855 AS DateTime), N'dbo', CAST(0x0000A23700F29855 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 5
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (5, N'Transport Support', 1, N'dbo', CAST(0x0000A23700F2A66F AS DateTime), N'dbo', CAST(0x0000A23700F2A66F AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 6
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (6, N'Telecomunications Support', 1, N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime), N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 7
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (7, N'Health & Wellbeing Support', 1, N'dbo', CAST(0x0000A23700F2C268 AS DateTime), N'dbo', CAST(0x0000A23700F2C268 AS DateTime))
END
GO
SET IDENTITY_INSERT [Core].[OrganizationType] OFF
GO

/*Populate Organistation */
SET IDENTITY_INSERT [Core].[Organization] ON 

GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 1
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'FOA',N'FOA', N'Food and Agriculture Organization', 1, NULL, 1, N'spinstall', CAST(0x0000A23700F7DA7B AS DateTime), N'spinstall', CAST(0x0000A23700F7DA85 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 2
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'IFAD',N'IFAD', N'International Fund for Agricultural Development', 3, NULL, 1, N'spinstall', CAST(0x0000A23700F875D5 AS DateTime), N'spinstall', CAST(0x0000A23700F875D5 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 3
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'UNESCO',N'UNESCO', N'United Nations Educational, Scientific and Cultural Organization ', 4, NULL, 1, N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime), N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 4
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'WHO',N'WHO', N'World Health Organization', 7, NULL, 1, N'spinstall', CAST(0x0000A23700F8C45C AS DateTime), N'spinstall', CAST(0x0000A23700F8C45C AS DateTime))
END
GO
SET IDENTITY_INSERT [Core].[Organization] OFF
GO





GO


INSERT INTO [app].[Output]
           ([Code]
           ,[LongName]
           ,[BusinessKey]
           ,[OutcomeID]
           ,[ShortName]
           ,[TextDescription]
           )
     SELECT
           'OTP2.1'
           ,'Ensure that, by 2015, children everywhere, boys and girls alike, will be able to complete a full course of primary schooling'
           ,'OTP2.1'
           ,(SELECT OutcomeID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Full Primary Schooling'
           ,'Ensure that, by 2015, children everywhere, boys and girls alike, will be able to complete a full course of primary schooling'
    WHERE NOT EXISTS (SELECT 1 FROM app.Output where code = 'OTP2.1')
    UNION 
    
     SELECT
           'OTP2.2'
           ,'Incentivise good schooling practises in schools'
           ,'OTP2.2'
           ,(SELECT OutcomeID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Good schooling practices'
           ,'Incentivise good schooling practises in schools'
    WHERE NOT EXISTS (SELECT 1 FROM app.Output where code = 'OTP2.2')
    UNION 
     SELECT
           'OTP2.3'
           ,'Ensure the schools are well managed'
           ,'OTP2.3'
           ,(SELECT OutcomeID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Well managed schools'
           ,'Ensure the schools are well managed'
    WHERE NOT EXISTS (SELECT 1 FROM app.Output where code = 'OTP2.3' )


--SubOutput
GO
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
    



--	----Indicator
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

/*Location Types*/
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CONT' ,'Continent' ,'Continent' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CONT')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CNTRY' ,'Country' ,'Country' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTRY')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'REG' ,'Region' ,'Region' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='REG')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'PROV' ,'Province' ,'Province' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='PROV')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CNTY' ,'County' ,'County' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTY')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CTY' ,'City' ,'City' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CTY')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'TWN' ,'Town' ,'Town' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='TWN')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'Municipality' ,'Municipality' ,'Municipality' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='Municipality')

/*Location Types*/

GO


/*Location for Kenya*/

/*Location Insert*/
SET IDENTITY_INSERT [Core].[Location] ON
GO

INSERT [Core].[Location] (
    [Location_ID]
    , [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
    , [Geog]
    ) 
    SELECT 0
    , 'KE' Code
    , 'Kenya' [Name]
    , 562245
    , 38610097
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTRY')
    , NULL
    , NULL [Geog]
    WHERE NOT EXISTS (
    SELECT 1 FROM [Core].[Location] WHERE Code = 'KE'
    )

SET IDENTITY_INSERT [Core].[Location] OFF
GO

INSERT [Core].[Location] (
    [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
    , [Geog]
    ) 
    SELECT '47' Code
    , 'Nairobi' [Name]
    , 694 
    , 3138369
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '47' 
    )	
    

UNION ALL
SELECT '1' Code
    , 'Mombasa' [Name]
    , 212 
    , 939370
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '1' 
    )	
    

UNION ALL
SELECT '2' Code
    , 'Kwale' [Name]
    , 8270 
    , 649931
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '2' 
    )	
    

UNION ALL
SELECT '3' Code
    , 'Kilifi' [Name]
    , 12245 
    , 1109735
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '3' 
    )	
    

UNION ALL
SELECT '4' Code
    , 'Tana River' [Name]
    , 35375 
    , 240075
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '4' 
    )	
    

UNION ALL
SELECT '5' Code
    , 'Lamu' [Name]
    , 6497 
    , 101539
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '5' 
    )	
    

UNION ALL
SELECT '6' Code
    , 'Taita-Taveta' [Name]
    , 17083 
    , 284657
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '6' 
    )	
    

UNION ALL
SELECT '7' Code
    , 'Garissa' [Name]
    , 45720 
    , 623060
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '7' 
    )	
    

UNION ALL
SELECT '8' Code
    , 'Wajir' [Name]
    , 55840 
    , 661941
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '8' 
    )	
    

UNION ALL
SELECT '9' Code
    , 'Mandera' [Name]
    , 25797 
    , 1025756
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '9' 
    )	
    

UNION ALL
SELECT '10' Code
    , 'Marsabit' [Name]
    , 66923 
    , 291166
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '10' 
    )	
    

UNION ALL
SELECT '11' Code
    , 'Isiolo' [Name]
    , 25336 
    , 143294
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '11' 
    )	
    

UNION ALL
SELECT '12' Code
    , 'Meru' [Name]
    , 5127 
    , 1356301
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '12' 
    )	
    

UNION ALL
SELECT '13' Code
    , 'Tharaka-Nithi' [Name]
    , 2409 
    , 365330
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '13' 
    )	
    

UNION ALL
SELECT '14' Code
    , 'Embu' [Name]
    , 2555 
    , 516212
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '14' 
    )	
    

UNION ALL
SELECT '15' Code
    , 'Kitui' [Name]
    , 24385 
    , 1012709
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '15' 
    )	
    

UNION ALL
SELECT '16' Code
    , 'Machakos' [Name]
    , 5952 
    , 1098584
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '16' 
    )	
    

UNION ALL
SELECT '18' Code
    , 'Nyandarua' [Name]
    , 3107 
    , 596268
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '18' 
    )	
    

UNION ALL
SELECT '19' Code
    , 'Nyeri' [Name]
    , 2361 
    , 693558
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '19' 
    )	
    

UNION ALL
SELECT '20' Code
    , 'Kirinyaga' [Name]
    , 1205 
    , 528054
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '20' 
    )	
    

UNION ALL
SELECT '21' Code
    , 'Murang''a' [Name]
    , 2325 
    , 942581
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '21' 
    )	
    

UNION ALL
SELECT '22' Code
    , 'Kiambu' [Name]
    , 2449 
    , 1623282
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '22' 
    )	
    

UNION ALL
SELECT '23' Code
    , 'Turkana' [Name]
    , 71597 
    , 855399
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '23' 
    )	
    

UNION ALL
SELECT '24' Code
    , 'West Pokot' [Name]
    , 8418 
    , 512690
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '24' 
    )	
    

UNION ALL
SELECT '25' Code
    , 'Samburu' [Name]
    , 20182 
    , 223947
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '25' 
    )	
    

UNION ALL
SELECT '27' Code
    , 'Uasin Gishu' [Name]
    , 2955 
    , 894179
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '27' 
    )	
    

UNION ALL
SELECT '28' Code
    , 'Elgeyo-Marakwet' [Name]
    , 3049 
    , 369998
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '28' 
    )	
    

UNION ALL
SELECT '29' Code
    , 'Nandi' [Name]
    , 2884 
    , 752965
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '29' 
    )	
    

UNION ALL
SELECT '30' Code
    , 'Baringo' [Name]
    , 11075 
    , 555561
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '30' 
    )	
    

UNION ALL
SELECT '31' Code
    , 'Laikipia' [Name]
    , 8696 
    , 399227
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '31' 
    )	
    

UNION ALL
SELECT '32' Code
    , 'Nakuru' [Name]
    , 7509 
    , 1603325
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '32' 
    )	
    

UNION ALL
SELECT '33' Code
    , 'Narok' [Name]
    , 17921 
    , 850920
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '33' 
    )	
    

UNION ALL
SELECT '34' Code
    , 'Kajiado' [Name]
    , 21292 
    , 687312
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '34' 
    )	
    

UNION ALL
SELECT '17' Code
    , 'Makueni' [Name]
    , 8008 
    , 884527
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '17' 
    )	
    

UNION ALL
SELECT '35' Code
    , 'Kericho' [Name]
    , 2454 
    , 752396
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '35' 
    )	
    

UNION ALL
SELECT '37' Code
    , 'Kakamega' [Name]
    , 3033 
    , 1660651
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '37' 
    )	
    

UNION ALL
SELECT '38' Code
    , 'Vihiga' [Name]
    , 531 
    , 554622
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '38' 
    )	
    

UNION ALL
SELECT '39' Code
    , 'Bungoma' [Name]
    , 2206 
    , 1375063
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '39' 
    )	
    

UNION ALL
SELECT '40' Code
    , 'Busia' [Name]
    , 1628 
    , 743946
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '40' 
    )	
    

UNION ALL
SELECT '41' Code
    , 'Siaya' [Name]
    , 2496 
    , 842304
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '41' 
    )	
    

UNION ALL
SELECT '43' Code
    , 'Homa Bay' [Name]
    , 3154 
    , 963794
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '43' 
    )	
    

UNION ALL
SELECT '44' Code
    , 'Migori' [Name]
    , 2586 
    , 917170
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '44' 
    )	
    

UNION ALL
SELECT '45' Code
    , 'Kisii' [Name]
    , 1317 
    , 1152282
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '45' 
    )	
    

UNION ALL
SELECT '36' Code
    , 'Bomet' [Name]
    , 1997 
    , 730129
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '36' 
    )	
    

UNION ALL
SELECT '46' Code
    , 'Nyamira' [Name]
    , 912 
    , 598252
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '46' 
    )	
    

UNION ALL
SELECT '42' Code
    , 'Kisumu' [Name]
    , 2009 
    , 968909
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '42' 
    )	
    

UNION ALL
SELECT '26' Code
    , 'Trans Nzoia' [Name]
    , 2469 
    , 818757
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '26' 
    )	
    

    /*Location Insert end*/
    /*Update Geography*/

IF NOT (CHARINDEX(CONVERT(VARCHAR, SERVERPROPERTY('edition')), N'Express') > -1)
BEGIN    
IF NOT EXISTs (select 1 FROM sys.Databases where Name = 'KenyaShapes')
    
    RAISERROR ('You must restore the KenyaShapes DB to get the geography shapes, obtain it at https://www.dropbox.com/s/jtb9ohpuov51wkt/KenyaShapes.bak', -- Message text.
               18, -- Severity.
               1 -- State.
               );

UPDATE [Core].[Location]
SET Geog = (SELECT Geography::UnionAggregate(geom)
  FROM [KenyaShapes].[dbo].[Counties])
  WHERE [Code] = 'KE'

UPDATE [Core].[Location]
SET Geog = geom
FROM [KenyaShapes].[dbo].[Counties]
  WHERE  [Code] = CAST(COUNTY_COD as varchar(10))
END


    /*Update Geography End*/


/*Location for Kenya end*/
--------IV Values 1 province

INSERT INTO [RBM].[IndicatorValues]
           ([Indicator_ID]
           ,[ActualLabel]
           ,[ActualValue]
           ,[ActualDate]
           ,[BusinessKey]
           ,[Notes]
           ,[DataVersion_ID]
           ,[Location_ID]
           ,[ReportPeriodID]
)
SELECT    
Indicator_ID
,Cast(OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID)

as varchar(255))
, OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID)
     
as ActualValue
,CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) As ActualDate
,'IV' as businessKey
,Cast(OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID)

as varchar(255)) as Notes
    ,1 as DataVersionID
    ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') AS Location_ID
    ,ReportPeriodID
 FROM 

 (
SELECT  
i.UnitOfMeasure,
rc.YearNumber financialYear,
rc.id as ReportPeriodID,
ISNULL([IndicatorValues_ID],0) [IndicatorValues_ID] 
      ,i.[IndicatorID] [Indicator_ID]
      ,i.[Baseline] [Baseline]
      , i.[BaselineString] BaselineString
      ,i.Target [TargetValue]
      ,i.TargetString [TargetValueString]
      ,[ActualValue]
      ,[ActualLabel]
      ,i.[Output_ID]
      ,i.[OutcomeID]
      ,iv.[BusinessKey]
      ,iv.[Notes]
      ,iv.ActualLabel Title
      --,iv.Title
      ,rc.ReportingPeriod ReportCycle
      ,i.ShortName
      ,i.Code
      ,i.LongName
      ,null [VerifiedActualValue]
      ,null [VerifiedActualNotes]

      ,i.[IndicatorType_ID]
      --,i.[Activity_ID]
      ,i.[SubOutput_ID]
      ,ISNULL(iv.[DataVersion_ID],0) DataVersion_ID

      ,ISNULL(iv.Location_ID,1) Location_ID

         
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.OutcomeID, o.OutcomeID)
      ,RolledUpToOutput_ID = ISNULL(i.Output_ID, so.Output_ID)
      ,RolledUpToSubOutput_ID = i.SubOutput_ID
      --,RolledUpToActivity_ID = i.Activity_ID
      --  ,TermSetID = DIML.TermsetDeepGrainID
    ,i.Baseline OriginalBaseline
    ,i.Target FinalTarget
    --,rc.StartDateID ReportingPeriodStartDate_ID
    --,rc.EndDateID 	
    ,null NextReportingPeriodReleaseDate_ID
    ,l.Name LocationName
    ,FinalTargetPeriod.ID FinalTargetPeriodID
    ,rc.ID CurrentReportPeriodID
    ,BaselinePeriod.ID BaselinePeriodID
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID
  

  LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
    and iv.ReportPeriodID  = rc.ID 
    --and  (@DataVersion_ID = 0 OR iv.DataVersion_ID = @DataVersion_ID)
    --and (iv.Location_ID = @Location_ID OR @Location_ID = 0 )
    

  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
    INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
  
  
  
    
    
/*LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.ActivityID*/
LEFT OUTER JOIN [app].[SubOutput] SO
on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID
LEFT OUTER JOIN Core.Location l
on (iv.Location_ID = l.Location_ID )



  --where 
/*
*/
) FIV


where Indicator_ID in (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
AND NOT EXISTS (SELECT 1 from rbm.IndicatorValues IVInner where Indicator_ID = FIV.Indicator_ID and 
                IVInner.ReportPeriodID = ReportPeriodID)
AND financialYear <2014
order by ReportCycleDate_ID ASC


GO


----IV 2

INSERT INTO [RBM].[IndicatorValues]
           ([Indicator_ID]
           ,[ActualLabel]
           ,[ActualValue]
           ,[ActualDate]
           ,[BusinessKey]
           ,[Notes]
           ,[DataVersion_ID]
           ,[Location_ID]
           ,[ReportPeriodID]
           )

SELECT    
Indicator_ID

, CAST (  (OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID))
    / (1150.0/ cast(Location.Code as int))	 
    as varchar(255))
as ActualLabel
, (OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID))
    / (1150.0/ cast(Location.Code as int))	 
as ActualValue
,CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) As ActualDate
,'IV' as businessKey
,Cast((OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID))
    / (1551.0* cast(Location.Code as int))

as varchar(255)) as Notes
    ,1 as DataVersionID
    ,Location.Location_ID AS Location_ID
    ,ReportPeriodID
 FROM 
 Core.Location
 INNER JOIN [Core].[LocationType]
 ON Location.LocationType_ID = [LocationType].[LocationType_ID]
 AND [LocationType].[Code] = 'CNTY'
 CROSS JOIN 
 (
SELECT  
i.UnitOfMeasure,
rc.YearNumber financialYear,
rc.id as ReportPeriodID,
ROW_NUMBER() over (partition by i.IndicatorID order by rc.StartDateID) as RowX,
ISNULL([IndicatorValues_ID],0) [IndicatorValues_ID] 
      ,i.[IndicatorID] [Indicator_ID]
      ,i.[Baseline] [Baseline]
      , i.[BaselineString] BaselineString
      ,i.Target [TargetValue]
      ,i.TargetString [TargetValueString]
      ,[ActualValue]
      ,[ActualLabel]
      ,i.[Output_ID]
      ,i.[OutcomeID]
      ,iv.[BusinessKey]
      ,iv.[Notes]
      ,iv.ActualLabel Title
      --,iv.Title
      ,rc.ReportingPeriod ReportCycle
      ,i.ShortName
      ,i.Code
      ,i.LongName
      ,null [VerifiedActualValue]
      ,null [VerifiedActualNotes]

      ,i.[IndicatorType_ID]
      --,i.[Activity_ID]
      ,i.[SubOutput_ID]
      ,ISNULL(iv.[DataVersion_ID],0) DataVersion_ID

      ,ISNULL(iv.Location_ID,1) Location_ID

         
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.OutcomeID, o.OutcomeID)
      ,RolledUpToOutput_ID = ISNULL(i.Output_ID, so.Output_ID)
      ,RolledUpToSubOutput_ID = i.SubOutput_ID
      --,RolledUpToActivity_ID = i.Activity_ID
      --  ,TermSetID = DIML.TermsetDeepGrainID
    ,i.Baseline OriginalBaseline
    ,i.Target FinalTarget
    --,rc.StartDateID ReportingPeriodStartDate_ID
    --,rc.EndDateID 	
    ,null NextReportingPeriodReleaseDate_ID
    ,l.Name LocationName
    ,FinalTargetPeriod.ID FinalTargetPeriodID
    ,rc.ID CurrentReportPeriodID
    ,BaselinePeriod.ID BaselinePeriodID
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID
  

  LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
    and iv.ReportPeriodID  = rc.ID 
    --and  (@DataVersion_ID = 0 OR iv.DataVersion_ID = @DataVersion_ID)
    --and (iv.Location_ID = @Location_ID OR @Location_ID = 0 )
    

  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
    INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
  
  
  
    
    
/*LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.ActivityID*/
LEFT OUTER JOIN [app].[SubOutput] SO
on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID
LEFT OUTER JOIN Core.Location l
on (iv.Location_ID = l.Location_ID )



  --where 
/*
*/
) FIV


where Indicator_ID in (select IndicatorID from app.Indicator where code = 'IND2.1.1.2' ) 
AND NOT EXISTS (SELECT 1 from rbm.IndicatorValues IVInner where Indicator_ID = FIV.Indicator_ID and 
                IVInner.ReportPeriodID = ReportPeriodID)
AND financialYear <2014
order by ReportCycleDate_ID ASC


GO

GO

--- Project

INSERT INTO [app].[Project]
           ([Code]
           ,[LongName]
           ,[OutcomeID]
           ,[ShortName]
           ,[TextDescription]
           )
     SELECT
           'PRJ2.1'
           ,'Build new schools'
           ,(SELECT OutcomeID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Build new schools'
           ,'Build new schools'
    WHERE NOT EXISTS (SELECT 1 FROM app.Project where code = 'PRJ2.1')
    UNION 
    
     SELECT
           'PRJ2.2'
           ,'Add canteens to existing schools'
           ,(SELECT OutcomeID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Add canteens to existing schools'
           ,'Add canteens to existing schools'
    WHERE NOT EXISTS (SELECT 1 FROM app.Project where code = 'PRJ2.2')
--Activities

GO

INSERT INTO [app].[Activity]
           ([ShortName]
           ,[LongName]
           ,[TextDescription]
           ,[ProjectID]
           ,[Code]
)

SELECT 'Choosing areas to build schools', 
        'Choosing areas to build schools', 
        'Choosing areas to build schools', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.1')
        ,'ACT2.1.1'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.1.1')

UNION 

SELECT 'Create plan for school construction', 
        'Create plan for school construction', 
        'Create plan for school construction', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.1')
        ,'ACT2.1.2'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.1.2')
        
UNION 

SELECT 'Build new schools', 
        'Build new schools', 
        'Build new schools', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.1')
        ,'ACT2.1.3'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.1.3')

UNION 
SELECT 'Identify schools needing a canteen', 
        'Identify schools needing a canteen', 
        'Identify schools needing a canteen', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.2')
        ,'ACT2.2.1'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.2.1')

UNION 

SELECT 'Build new canteens', 
        'Build new canteens', 
        'Build new canteens', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.2')
        ,'ACT2.2.2'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.2.2')
        

GO

-----------------------------Milestones
/*alter table aPP.MILESTONE DROP COLUMN ISKEYINDICATOR*/
INSERT INTO [app].[Milestone]
           ([LongName]
           ,[TextDescription]
           ,[Baseline]
           ,[BaselineDate]
           ,[Target]
           ,[TargetDate]
           ,[BusinessKey]
           ,[Code]
           ,MilestoneTypeID
           ,[ActivityID]
           ,[ShortName]
           ,[UnitOfMeasure])

           SELECT 'Identify work committee'
           ,'Identify work committee'
           ,0 As Baseline
           ,'2013/01/01'
           ,20 As target
           ,'2013/04/01'
           ,'#'
           ,'M2.1.2.1'
           ,5
           ,(Select ActivityID from app.Activity  where code = 'ACT2.1.2')
           ,'Identify work committee'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.1')
    UNION ALL
    
           SELECT 'Choose methodology'
           ,'Choose methodology'
           ,0 As Baseline
           ,'2013/01/01'
           ,1 As target
           ,'2013/04/01'
           ,'#'
           ,'M2.1.2.2'
           ,5
           ,(Select ActivityID from app.Activity  where code = 'ACT2.1.2')
           ,'Choose methodology'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.2')


           UNION ALL
    
           SELECT 'Create draft plan'
           ,'Create draft plan'
           ,0 As Baseline
           ,'2013/04/01'
           ,1 As target
           ,'2013/08/01'
           ,'#'
           ,'M2.1.2.3'
           ,5
           ,(Select ActivityID from app.Activity  where code = 'ACT2.1.2')
           ,'Create draft plan'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.3')

           
           UNION ALL
    
           SELECT 'Ratify plan with executive'
           ,'Ratify plan with executive'
           ,0 As Baseline
           ,'2013/08/02'
           ,1 As target
           ,'2013/10/01'
           ,'#'
           ,'M2.1.2.4'
           ,5
           ,(Select ActivityID from app.Activity  where code = 'ACT2.1.2')
           ,'Ratify plan with executive'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.4')

           
           UNION ALL
    
           SELECT 'Ratify plan with provinces'
           ,'Ratify plan with provinces'
           ,0 As Baseline
           ,'2013/10/02'
           ,11 As target
           ,'2013/11/01'
           ,'#'
           ,'M2.1.2.5'
           ,5
           ,(Select ActivityID from app.Activity  where code = 'ACT2.1.2')
           ,'Ratify plan with provinces'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.5')

----------------------------------------------------------------------------------
---MNilestone values

---------------------------------------------------------------------------------

GO
INSERT INTO [RBM].[MilestoneValues]
           ([Milestone_ID]
           ,[ActualLabel]
           ,[ActualValue]
           ,[ActualDate]
           ,[DataVersion_ID]
           ,[Location_ID]
           ,[ReportPeriodID]
           )

           SELECT (select milestoneid from app.Milestone where code = 'M2.1.2.1')
           ,'Identified twelve candidates'
           ,12
           ,Getdate()
           ,1
           ,1
           ,(SELECT ID FROM Core.ReportingPeriod WHERE 20121231 between StartDateID and EndDateID)
           where not exists (select 1 from rbm.MilestoneValues where 
                        Milestone_ID = (select milestoneid from app.Milestone where code = 'M2.1.2.1')
                        and ReportPeriodID = (SELECT ID FROM Core.ReportingPeriod WHERE 20121231 between StartDateID and EndDateID)
                        )
UNION ALL 
                        SELECT (select milestoneid from app.Milestone where code = 'M2.1.2.1')
           ,'Chose committee'
           ,20
           ,Getdate()
           ,1
           ,1
           ,(SELECT ID FROM Core.ReportingPeriod WHERE 20130301 between StartDateID and EndDateID)
           where not exists (select 1 from rbm.MilestoneValues where 
                        Milestone_ID = (select milestoneid from app.Milestone where code = 'M2.1.2.1')
                        and ReportPeriodID = (SELECT ID FROM Core.ReportingPeriod WHERE 20130301 between StartDateID and EndDateID)
                        )

UNION ALL 
           SELECT (select milestoneid from app.Milestone where code = 'M2.1.2.2')
           ,'Chose methodology'
           ,1
           ,Getdate()
           ,1
           ,1
           ,(SELECT ID FROM Core.ReportingPeriod WHERE 20130401 between StartDateID and EndDateID)
           where not exists (select 1 from rbm.MilestoneValues where 
                        Milestone_ID = (select milestoneid from app.Milestone where code = 'M2.1.2.2')
                        and ReportPeriodID = (SELECT ID FROM Core.ReportingPeriod WHERE 20130401 between StartDateID and EndDateID)
                        )

    
           
GO


           ----------------IV Qualitative

           /*select * from app.Indicator where IndicatorID in (201,202)
select * from rbm.IndicatorValues where Indicator_ID in (201)
*/
UPDATE RBM.IndicatorValues
set Actuallabel = CAST (CAST(ROUND(ActualValue,0) as int) as varchar(10)) + ' per class'
where Indicator_ID IN (select IndicatorID from app.Indicator where code in ('IND2.1.1.1')) 

UPDATE RBM.IndicatorValues
set Actuallabel = CAST (CAST(ROUND(ActualValue,0) as int) as varchar(10)) + ' schools'
where Indicator_ID IN (select IndicatorID from app.Indicator where code in ('IND2.1.1.2')) 


UPDATE rbm.IndicatorValues 
SET ActualValue = 52
, ActualLabel = 'Influx of students'
, notes = 'An influx of new students came in before the new facilities came on board'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2012-11-30'

UPDATE rbm.IndicatorValues 
SET ActualValue = 46
, ActualLabel = 'Catching up'
, notes = 'Some new facilities have been constructed, but the majority are still being delayed due to the foundations being wet'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2013-02-28'

UPDATE rbm.IndicatorValues 
SET ActualValue = 43
, ActualLabel = 'Catching up'
, notes = 'Construction has started to happen on the schools, but rains have caused some rework'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2013-05-31'



UPDATE rbm.IndicatorValues 
SET ActualValue = 37
, ActualLabel = 'New schools'
, notes = 'The new facilities are getting rolled out almost on schedule, and the final date is not likely to be pushed out significantly'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2013-08-31'


/*Insert status values*/

INSERT INTO [RBM].[StatusValues]
           ([ProjectID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select projectid ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by id)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.Project P
JOIN core.ReportingPeriod RP 
on startdateid between 20120101 and 20131001
where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.ProjectID = P.ProjectID and sv.ReportingPeriodID = rp.ID)

INSERT INTO [RBM].[StatusValues]
           ([Output_ID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select Output_ID ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by [Output_ID],id)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.Output O
JOIN core.ReportingPeriod RP
on startdateid between 20110101 and 20131001

where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.Output_ID = O.Output_ID and sv.ReportingPeriodID = rp.ID)

INSERT INTO [RBM].[StatusValues]
           ([SubOutput_ID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select SubOutput_ID ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by suboutput_id, id)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.SubOutput SO
JOIN core.ReportingPeriod RP 
on startdateid between 20110101 and 20131001
where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.SubOutput_ID = SO.SubOutput_ID and sv.ReportingPeriodID = rp.ID)


INSERT INTO [RBM].[StatusValues]
           ([OutcomeID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select OutcomeID ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by outcomeid)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.Outcome OM
JOIN core.ReportingPeriod RP 
on startdateid between 20130101 and 20131001
where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.OutcomeID = OM.OutcomeID and sv.ReportingPeriodID = rp.ID)

/*end Insert status values*/
