CREATE PROC [Core].[sp_IndicatorCaptureProgress]
@@DataVersion_ID int
,@@Outcome_ID int

, @Location_ID int =1
, @MilestoneCode varchar(255) = '0'
AS
Declare @@OTCFilt int = @@Outcome_ID
IF @@Outcome_ID = 9999 set @@OTCFilt = 0


Declare @@MaxYear as INT = (
	Select LEFT(MAX(RC.YearNumber),4 ) 
		
from app.outcome oc
	Left join app.Output OTP on OC.OutcomeID = OTP.OutcomeID
	Left join app.SubOutput STP on OTP.Output_ID = STP.Output_ID
	--Left join app.Activity ACT on stp.SubOutput_ID = ACT.SubOutput_ID
	Left join app.Indicator MST on 
	--(act.ActivityID = mst.Activity_ID or 
	(stp.SubOutput_ID = MST.SubOutput_ID or
	OTP.Output_ID = MST.Output_ID or
	OC.OutcomeID = MST.OutcomeID)


	Left Outer Join RBM.IndicatorValues MSV on MSV.Indicator_ID=MST.IndicatorID
	inner Join Core.ReportCycle RC on MST.TargetDate_ID Between RC.StartDateID and rc.EndDateID 
	
	
	)
Declare @@MinYear as INT = (
	Select LEFT(Min(RC.YearNumber),4 ) 
		
from app.outcome oc
	Left join app.Output OTP on OC.OutcomeID = OTP.OutcomeID
	Left join app.SubOutput STP on OTP.Output_ID = STP.Output_ID
	--Left join app.Activity ACT on stp.SubOutput_ID = ACT.SubOutput_ID
	Left join app.Indicator MST on 
	--(act.ActivityID = mst.Activity_ID or 
	(stp.SubOutput_ID = MST.SubOutput_ID or
	OTP.Output_ID = MST.Output_ID or
	OC.OutcomeID = MST.OutcomeID)


	Left Outer Join RBM.IndicatorValues MSV on MSV.Indicator_ID=MST.IndicatorID
	inner Join Core.ReportCycle RC on MST.TargetDate_ID Between RC.StartDateID and rc.EndDateID 
	
	
	)






Select 
		(OC.Code + ' : ' + OC.LongName) as Outcome
		,oc.OutcomeID as Outcome_ID
		,(OTP.Code + ' : ' + OTP.LongName) as [Output]
		,otp.Output_ID
		,(STP.Code + ' : ' + STP.LongName) as SubOutput
		,stp.SubOutput_ID
		--,(ACT.Code + ' : ' + ACT.LongName) as Activity
		--,act.ActivityID as Activity_ID
		,(MST.Code + ' : ' + MST.LongName) as Indicator
		,mst.IndicatorID as Indicator_ID
			,LEFT(RC.YearNumber,4 ) Year
			,RCC.YearNumber as FinancialYear
			,rcC.ReportingPeriod as ReportCycle
			,MSV.DataVersion_ID
			,(Case when MSV.ActualValue Is not null 
				then 1
				else 0
			end)   PercentageCaptured
			--,MSV.IndicatorStatusPercent as IndicatorProgressPercent
			,OC.OutcomeID as RolledUpToOutcome_ID
			,OTP.Output_ID as RolledUpToOutput_ID
			,STP.SubOutput_ID as RolledUpToSubOutput_ID
			,MSv.ActualDate as ReportingDate
			
from app.outcome oc
	Left join app.Output OTP on OC.OutcomeID = OTP.OutcomeID
	Left join app.SubOutput STP on OTP.Output_ID = STP.Output_ID
	--Left join app.Activity ACT on stp.SubOutput_ID = ACT.SubOutput_ID
	Left join app.Indicator MST on 
	--(act.ActivityID = mst.Activity_ID or 
	(stp.SubOutput_ID = MST.SubOutput_ID or
	OTP.Output_ID = MST.Output_ID or
	OC.OutcomeID = MST.OutcomeID)


	Left Outer Join RBM.IndicatorValues MSV on MSV.Indicator_ID=MST.IndicatorID
	inner Join Core.ReportCycle RC on MST.TargetDate_ID Between RC.StartDateID and rc.EndDateID 
	inner Join Core.ReportCycle RCC on rcc.YearNumber Between @@MinYear and @@MaxYear
	
	
Where (OC.OutcomeID Between @@OTCFilt and  @@Outcome_ID) and (MSV.DataVersion_ID=@@DataVersion_ID  or MSV.DataVersion_ID is null )


order by (OC.Code + ' : ' + OC.LongName)
      ,(OTP.Code + ' : ' + OTP.LongName)
      ,(STP.Code + ' : ' + STP.LongName)
      --,(ACT.Code + ' : ' + ACT.LongName)
      ,(MST.Code + ' : ' + MST.LongName)
      ,RCC.YearNumber
      ,rCc.ReportingPeriod