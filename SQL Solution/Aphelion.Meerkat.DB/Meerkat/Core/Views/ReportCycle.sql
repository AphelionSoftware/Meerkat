
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [Core].[ReportCycle]
AS
SELECT        CASE WHEN MonthNumber BETWEEN 3 AND 5 THEN 1 WHEN MonthNumber BETWEEN 6 AND 8 THEN 2 WHEN MonthNumber BETWEEN 9 AND 
                         11 THEN 3 WHEN MonthNumber IN (12, 1, 2) THEN 4 END AS ReportingPeriod, DateID AS StartDateID, DATEPART(year, DATEADD(Day, - 1, DATEADD(month, 
                         3, Date))) * 10000 + DATEPART(month, DATEADD(Day, - 1, DATEADD(month, 3, Date))) * 100 + DATEPART(Day, DATEADD(Day, - 1, DATEADD(month, 3, Date))) 
                         AS EndDateID, Date AS FirstCycleDate, DATEADD(Day, - 1, DATEADD(month, 3, Date)) AS LastCycleDate, YearName, YearNumber
FROM            Core.DimDate
WHERE        (Day = 1) AND (MonthNumber IN (3, 6, 9, 12))

