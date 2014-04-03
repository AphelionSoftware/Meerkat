
CREATE PROC [dbo].[uspIndicatorTimelineWithLocation_ByReportPeriod]

    @DataVersion_ID int --varchar(255)
, @indicator_id int --varchar(255)

, @ReportPeriodID int
as



    SELECT 
	iv.ActualValue,
    L.Location_ID,
    L.Geog,
      rp.ReportingPeriod ReportCycle
    
         
          ,RP.EndDateID  ReportCycleDate_ID
          ,RP.StartDateID ReportCycleStartDateID
        ,L.Name LocationName
   	FROM RBM.IndicatorValues IV 

      INNER JOIN Core.ReportingPeriod RP
          on iv.ActualDate BETWEEN RP.FirstCycleDate and RP.LastCycleDate
  
      
    INNER JOIN Core.Location L
	ON iv.Location_ID   = l.Location_ID

	WHERE 
	(IV.DataVersion_ID = @DataVersion_ID OR @DataVersion_ID = 0)
	and
	iv.Indicator_ID = @indicator_id
	and 
	rp.ID = @ReportPeriodID


