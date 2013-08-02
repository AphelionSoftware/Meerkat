


CREATE PROC [Core].[sp_MilestoneCaptureProgress]
@@DataVersion_ID int
,@@Outcome_ID int

, @Location_ID int =1
, @MilestoneCode varchar(255) = '0'
AS
/*



Select 
		(OC.Code + ' : ' + OC.LongName) as Outcome
		,oc.OutcomeID as Outcome_ID
		,(OTP.Code + ' : ' + OTP.LongName) as [Output]
		,otp.Output_ID
		,(STP.Code + ' : ' + STP.LongName) as SubOutput
		,stp.SubOutput_ID
		,(ACT.Code + ' : ' + ACT.LongName) as Activity
		,act.ActivityID as Activity_ID
		,(MST.Code + ' : ' + MST.LongName) as Milestone
		,mst.MilestoneID as Milestone_ID
			,LEFT(RC.YearNumber,4 ) Year
			,RC.YearNumber as FinancialYear
			,rc.ReportingPeriod as ReportCycle
			,MSV.DataVersion_ID
			,(Case when (MSV.MilestoneStatusPercent Is not null )
				then 1
				else 0
			end)   PercentageCaptured
			,MSV.MilestoneStatusPercent as MilestoneProgressPercent
			,OC.OutcomeID as RolledUpToOutcome_ID
			,OTP.Output_ID as RolledUpToOutput_ID
			,STP.SubOutput_ID as RolledUpToSubOutput_ID
			,MSv.ActualDate as ReportingDate
from app.outcome oc
	inner join app.Output OTP on OC.OutcomeID = OTP.OutcomeID
	inner join app.SubOutput STP on OTP.Output_ID = STP.Output_ID
	inner join app.Activity ACT on stp.SubOutput_ID = ACT.SubOutput_ID
	inner join app.Milestone MST on act.ActivityID = mst.ActivityID
	Left Outer Join RBM.MilestoneValues MSV on MSV.Milestone_ID=MST.MilestoneID
	inner Join Core.ReportCycle RC on MST.TargetDateID Between RC.StartDateID and rc.EndDateID 
	
Where OC.OutcomeID = @@Outcome_ID and MSV.DataVersion_ID=@@DataVersion_ID


order by (OC.Code + ' : ' + OC.LongName)
      ,(OTP.Code + ' : ' + OTP.LongName)
      ,(STP.Code + ' : ' + STP.LongName)
      ,(ACT.Code + ' : ' + ACT.LongName)
      ,(MST.Code + ' : ' + MST.LongName)
      ,RC.YearNumber
      ,rc.ReportingPeriod
      
	  */
	  SELECT 'Not implemented' as X
<<<<<<< HEAD
=======






>>>>>>> remotes/origin/Code-for-Review
