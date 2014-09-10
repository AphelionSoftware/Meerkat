CREATE VIEW OLAP_GEN.IndicatorTargets
as

SELECT
FIV.Indicator_ID, 
ReportPeriodID,
FIV.ReportCycleDate_ID, 
                         CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) AS ReportCycleDate
       ,                  
OriginalBaseline + (
    (
		Case wHEN FinalTargetPeriodID -BaselinePeriodID = 0 THEN 0 ELSE ( FinalTarget - OriginalBaseline) / 
		(	 FinalTargetPeriodID -BaselinePeriodID )END 
		)
	* (CurrentReportPeriodID-BaselinePeriodID)
	)
 AS ExtrapolatedTarget

 FROM (
SELECT  
     i.[IndicatorID] [Indicator_ID]
	 ,rc.ID ReportPeriodID
      ,rc.ReportingPeriod ReportCycle
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
	,i.Baseline OriginalBaseline
	,i.Target FinalTarget
	,FinalTargetPeriod.ID FinalTargetPeriodID
	,rc.ID CurrentReportPeriodID
	,BaselinePeriod.ID BaselinePeriodID
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID    

  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
	INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
  
) FIV

GO
EXECUTE sp_addextendedproperty @name = N'AdditionalRelationship02', @value = N'ReportingPeriod[ReportingPeriodID]', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorTargets', @level2type = N'COLUMN', @level2name = N'Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalRelationship01', @value = N'Indicator[Indicator_ID]', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorTargets', @level2type = N'COLUMN', @level2name = N'Indicator_ID';

