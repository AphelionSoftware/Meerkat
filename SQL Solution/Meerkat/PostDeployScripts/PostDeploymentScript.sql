

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
          [app].[Outcome].[OutcomeSitename] ,
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
          [app].[Outcome].[OutcomeSitename] ,
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
          [app].[Outcome].[OutcomeSitename] ,
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
          [app].[Outcome].[OutcomeSitename] ,
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
          [app].[Outcome].[OutcomeSitename] ,
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
          [app].[Outcome].[OutcomeSitename] ,
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
          [app].[Outcome].[OutcomeSitename] ,
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
          [app].[Outcome].[OutcomeSitename] ,
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



/*Status Indicators*/

INSERT  INTO [app].[Indicator]
        ( [app].[Indicator].[LongName] ,
          [app].[Indicator].[TextDescription] ,
          [app].[Indicator].[Baseline] ,
          [app].[Indicator].[BaselineString] ,
          [app].[Indicator].[BaselineDate] ,
          [app].[Indicator].[Target] ,
          [app].[Indicator].[TargetString] ,
          [app].[Indicator].[TargetDate] ,
          [app].[Indicator].[ReleaseDate] ,
          [app].[Indicator].[Output_ID] ,
          [app].[Indicator].[OutcomeID] ,
          [app].[Indicator].[BusinessKey] ,
          [app].[Indicator].[Notes] ,
          [app].[Indicator].[Code] ,
          [app].[Indicator].[IndicatorType_ID] ,
          [app].[Indicator].[SubOutput_ID] ,
          [app].[Indicator].[ShortName] ,
          [app].[Indicator].[UnitOfMeasure]
           
        )
        SELECT  OM.ShortName + ' Status' ,                                  /* Long Name */
                OM.ShortName + ' Status' ,                                     /* Text Description */
                0 ,                                                            /* Baseline */
                0 ,                                                            /* Baseline String */
                '2012/01/01' AS BaselineDate ,                                 /* Baseline Date */
                0 ,                                                            /* Target */
                0 ,                                                            /* Target String */
                '2012/01/01' AS TargetDate ,                                   /* Target Date */
                '2012/01/01' AS ReleaseDate ,                                  /* Release Date */
                NULL AS OutputID ,                                             /* Output ID */
                OM.OutcomeID AS OutcomeID ,                                    /* OutcomeID */
                OM.ShortName + ' Status' AS BusinessKey ,                      /* Business Key */
                '' AS NOTES ,                                                  /* Notes */
                CAST(OM.OutcomeID AS VARCHAR(10)) + ' Status' AS Code ,        /* Code */
                6 AS IndicatorType_ID ,                                       /* Indicator Type ID */
                NULL AS SubOutput_ID ,                                        /* Sub output ID */
                LEFT('Status of ' + OM.ShortName, 50)                        /* Short Name */ ,
                'Percentage'
        FROM    [app].[Outcome] OM
        UNION ALL
        SELECT  OP.ShortName + ' Status' ,
                OP.ShortName + ' Status' ,
                0 ,
                0 ,
                '2012/01/01' AS BaselineDate ,
                0 ,
                0 ,
                '2012/01/01' AS TargetDate ,
                '2012/01/01' AS ReleaseDate ,
                OP.Output_ID AS Output_ID ,
                NULL AS OutcomeID ,
                OP.ShortName + ' Status' AS BusinessKey ,
                '' AS NOTES ,
                CAST(OP.Output_ID AS VARCHAR(10)) + ' Status' AS Code ,
                6 AS IndicatorType_ID ,
                NULL AS SubOutput_ID ,
                LEFT('Status of ' + OP.ShortName, 50) ,
                'Percentage'
        FROM    app.Output OP
        UNION ALL
        SELECT  SO.ShortName + ' Status' ,
                SO.ShortName + ' Status' ,
                0 ,
                0 ,
                '2012/01/01' AS BaselineDate ,
                0 ,
                0 ,
                '2012/01/01' AS TargetDate ,
                '2012/01/01' AS ReleaseDate ,
                NULL AS Output_ID ,
                NULL AS OutcomeID ,
                SO.ShortName + ' Status' AS BusinessKey ,
                '' AS NOTES ,
                CAST(SO.SubOutput_ID AS VARCHAR(10)) + ' Status' AS Code ,
                6 AS IndicatorType_ID ,
                SO.SubOutput_ID AS SubSubOutput_ID ,
                LEFT('Status of ' + SO.ShortName, 50) ,
                'Percentage'
        FROM    [app].[SubOutput] SO

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
INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'Food Support', 1, N'dbo', CAST(0x0000A23700F26E2A AS DateTime), N'dbo', CAST(0x0000A23700F26E2A AS DateTime))
GO
INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'Agricultural Development Support', 1, N'dbo', CAST(0x0000A23700F27C1C AS DateTime), N'dbo', CAST(0x0000A23700F27C1C AS DateTime))
GO
INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'Funding/Financing Support', 1, N'dbo', CAST(0x0000A23700F28B06 AS DateTime), N'dbo', CAST(0x0000A23700F28B06 AS DateTime))
GO
INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'Educational Support', 1, N'dbo', CAST(0x0000A23700F29855 AS DateTime), N'dbo', CAST(0x0000A23700F29855 AS DateTime))
GO
INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (5, N'Transport Support', 1, N'dbo', CAST(0x0000A23700F2A66F AS DateTime), N'dbo', CAST(0x0000A23700F2A66F AS DateTime))
GO
INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (6, N'Telecomunications Support', 1, N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime), N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime))
GO
INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (7, N'Health & Wellbeing Support', 1, N'dbo', CAST(0x0000A23700F2C268 AS DateTime), N'dbo', CAST(0x0000A23700F2C268 AS DateTime))
GO
SET IDENTITY_INSERT [Core].[OrganizationType] OFF
GO

/*Populate Organistation */
SET IDENTITY_INSERT [Core].[Organization] ON 

GO
INSERT [Core].[Organization] ([Organization_ID], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'FOA', N'Food and Agriculture Organization', 1, NULL, 1, N'spinstall', CAST(0x0000A23700F7DA7B AS DateTime), N'spinstall', CAST(0x0000A23700F7DA85 AS DateTime))
GO
INSERT [Core].[Organization] ([Organization_ID], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'IFAD', N'International Fund for Agricultural Development', 3, NULL, 1, N'spinstall', CAST(0x0000A23700F875D5 AS DateTime), N'spinstall', CAST(0x0000A23700F875D5 AS DateTime))
GO
INSERT [Core].[Organization] ([Organization_ID], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'UNESCO', N'United Nations Educational, Scientific and Cultural Organization ', 4, NULL, 1, N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime), N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime))
GO
INSERT [Core].[Organization] ([Organization_ID], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'WHO', N'World Health Organization', 7, NULL, 1, N'spinstall', CAST(0x0000A23700F8C45C AS DateTime), N'spinstall', CAST(0x0000A23700F8C45C AS DateTime))
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
	



--	----INdicator
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
		   ,'Indicator 2.1.1.1'
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
		   ,'Indicator 2.1.1.2'
		   ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Indicator where code = 'IND2.1.1.2')
           

GO

SET IDENTITY_INSERT [Core].[Location]  ON 
INSERT INTO [Core].[Location] ([Location_ID], [Code], [Name]) VALUES
(1, 'One', 'One')
SET IDENTITY_INSERT[Core].[Location]  OFF

GO
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
	,1 AS Location_ID
	,ReportPeriodID
 FROM 

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
,Cast((OriginalBaseline + (
    (
		( FinalTarget - OriginalBaseline) / 
		(	 FinalTargetPeriodID -BaselinePeriodID ) 
		)
	* (CurrentReportPeriodID-BaselinePeriodID)
	) * RAND(ReportPeriodID))
	/Location.Location_ID
as varchar(255))
, (OriginalBaseline + (
    (
		( FinalTarget - OriginalBaseline) / 
		(	 FinalTargetPeriodID -BaselinePeriodID ) 
		)
	* (CurrentReportPeriodID-BaselinePeriodID)
	) * RAND(ReportPeriodID))
	/Location.Location_ID	 
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
	/Location.Location_ID

as varchar(255)) as Notes
	,1 as DataVersionID
	,Location.Location_ID AS Location_ID
	,ReportPeriodID
 FROM 
 Core.Location
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
		   ,'Milestone 2.1.2.1'
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
		   ,'Milestone 2.1.2.2'
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
		   ,'Milestone 2.1.2.3'
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
		   ,'Milestone 2.1.2.4'
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
		   ,'Milestone 2.1.2.5'
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
where Indicator_ID IN (select Indicator_ID from app.Indicator where code in ('IND2.1.1.1')) 

UPDATE RBM.IndicatorValues
set Actuallabel = CAST (CAST(ROUND(ActualValue,0) as int) as varchar(10)) + ' schools'
where Indicator_ID IN (select Indicator_ID from app.Indicator where code in ('IND2.1.1.2')) 


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


