
CREATE VIEW [app].[ReportingPeriod]
AS
SELECT        CONVERT(int, CONVERT(Varchar(4), YearNumber) + CONVERT(Varchar(1), ReportingPeriod)) AS ReportingPeriodID, ReportingPeriod, StartDateID, EndDateID, 
                         FirstCycleDate, LastCycleDate, YearName, YearNumber
FROM            Core.ReportCycle