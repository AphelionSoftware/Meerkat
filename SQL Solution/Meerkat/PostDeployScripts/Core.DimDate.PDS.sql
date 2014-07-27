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


		UPDATE core.DimDate
		SET IsWorkDay = 0
		WHERE USDayOfWeek in (6,7)

    END
GO