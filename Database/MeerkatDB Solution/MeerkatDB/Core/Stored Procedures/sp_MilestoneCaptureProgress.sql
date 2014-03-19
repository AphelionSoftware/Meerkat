CREATE PROC [Core].[sp_MilestoneCaptureProgress]
@DataVersion_ID int = 0
,@Outcome_ID int = 0

AS

Select 
		(OC.Code + ' : ' + OC.LongName) as Outcome
		,oc.OutcomeID as Outcome_ID
		,'' as [Output]
		,0 as Output_ID
		,(PRJ.Code + ' : ' + PRJ.LongName) as Project
		,PRJ.ProjectID
		,(ACT.Code + ' : ' + ACT.LongName) as Activity
		,act.ActivityID as Activity_ID
		,(MST.Code + ' : ' + MST.LongName) as Milestone
		,mst.MilestoneID as Milestone_ID
			,LEFT(RCC.YearNumber,4 ) Year
			,RCC.YearNumber as FinancialYear
			,rcC.ReportingPeriod as ReportCycle
			,MSV.DataVersion_ID
			,(Case when (MSV.ActualValue Is not null )
				then 1
				else 0
			end)   PercentageCaptured
			,MilestoneProgressPercent = (MSV.ActualValue / MST.Target) * 100.0
			,OC.OutcomeID as RolledUpToOutcome_ID
			,0 as RolledUpToOutput_ID
			,PRJ.ProjectID as RolledUpToProjectID
			,MSv.ActualDate as ReportingDate
from [app].[Outcome]		 oc
	--inner join app.Output OTP on OC.OutcomeID = OTP.OutcomeID
	inner join app.Project PRJ on oc.OutcomeID = PRJ.OutcomeID
	inner join app.Activity ACT on PRJ.ProjectID = ACT.ProjectID
	inner join app.Milestone MST on act.ActivityID = mst.ActivityID
	Left Outer Join RBM.MilestoneValues MSV on MSV.Milestone_ID=MST.MilestoneID
		 and (MSV.DataVersion_ID=@DataVersion_ID OR @DataVersion_ID = 0)
	inner Join Core.ReportCycle RC on (MST.TargetDateID Between RC.StartDateID and rc.EndDateID )
	Left Join Core.ReportCycle RCC on rc.YearNumber=RCC.YearNumber
	/* Left Outer Join RBM.IndicatorValues MSV on MSV.Indicator_ID=MST.IndicatorID
 inner Join Core.ReportCycle RC on MST.TargetDate_ID Between RC.StartDateID and rc.EndDateID 
 Left Join Core.ReportCycle RCC on rc.YearNumber=RCC.YearNumber*/
	
Where 
(OC.OutcomeID = @Outcome_ID OR @Outcome_ID = 0)



order by (OC.Code + ' : ' + OC.LongName)
      --,(OTP.Code + ' : ' + OTP.LongName)
      ,(PRJ.Code + ' : ' + PRJ.LongName)
      ,(ACT.Code + ' : ' + ACT.LongName)
      ,(MST.Code + ' : ' + MST.LongName)
      ,RC.YearNumber
      ,rc.ReportingPeriod
      
/*GO

exec [Core].[sp_MilestoneCaptureProgress] 0, 0*/