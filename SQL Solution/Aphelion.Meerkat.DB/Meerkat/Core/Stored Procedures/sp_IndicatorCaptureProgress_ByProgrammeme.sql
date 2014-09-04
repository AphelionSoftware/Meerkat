CREATE PROC [Core].[sp_IndicatorCaptureProgress_ByProgrammeme]
	@DataVersion_ID int
	,@Location_ID int =0
AS



Select 
		(OC.Code + ' : ' + OC.ShortName) as Programme
		,oc.Programme_ID as Programme_ID
		,(PRJ.Code + ' : ' + PRJ.ShortName) as [Project]
		,PRJ.ProjectID
		,(MST.Code + ' : ' + MST.ShortName) as Indicator
		,mst.IndicatorID as Indicator_ID
			,LEFT(RC.YearNumber,4 ) Year
			,RC.YearNumber as FinancialYear
			,rc.Summary as ReportCycle
			,MSV.DataVersion_ID
			,(Case when MSV.ActualValue Is not null 
				then 1
				else 0
			end)   PercentageCaptured
			,OC.Programme_ID as RolledUpToProgramme_ID
			,PRJ.ProjectID as RolledUpToProjectID
			,MSv.ActualDate as ReportingDate
			, HasIndicator = CASE WHEN MST.TargetDate_ID >= RC.EndDateID THEN 1 ELSE 0 END
			
from app.Programme oc
	Left join app.Project PRJ on OC.Programme_ID = PRJ.Programme_ID
	Left join app.Indicator MST on 
	(PRJ.ProjectID = MST.ProjectID or
	OC.Programme_ID = MST.Programme_ID)


	inner Join Core.ReportingPeriod RC 
		on rc.EndDateID <=	    MST.TargetDate_ID 
		and RC.StartDateID  >= MST.BaselineDate_ID
	Left Outer
	 Join RBM.IndicatorValues MSV on MSV.Indicator_ID=MST.IndicatorID
	and (MSV.Location_ID = @Location_ID OR @Location_ID = 0)
		and MSV.ReportPeriodID = RC.ID
	
	
Where (MSV.DataVersion_ID=@DataVersion_ID  or MSV.DataVersion_ID is null )


order by (OC.Code + ' : ' + OC.ShortName)
      ,(PRJ.Code + ' : ' + PRJ.ShortName)
      ,(MST.Code + ' : ' + MST.ShortName)
      ,RC.YearNumber
      ,rC.ReportingPeriod