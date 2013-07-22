﻿


CREATE PROC [dbo].[rptIndicatorStatus_test]
( @OutcomeID int ,
@ReportingPeriodID int)
as

/*
SELECT 
	OM.ShortName as OutcomeName
	,OP.ShortName as OutputName
	,SO.ShortName As Suboutputname
	,OMIV.IndicatorStatusPercent OutcomeStatus
	,OPIV.IndicatorStatusPercent OutputStatus
	,SOIV.IndicatorStatusPercent SubOutputStatus
			
FROM app.Outcome OM 
	left JOIN app.Indicator OmI 
	ON OM.OutcomeID = OMI.OutcomeID
		AND OMI.IndicatorType_ID = 6
	left JOIN app.Output OP
		ON OM.OutcomeID = OP.OutcomeID 
	
	left JOIN RBM.IndicatorValues OMIV
		ON OMI.IndicatorID = OMIV.Indicator_ID
		
	left JOIN app.Indicator OPI 
	ON OP.Output_ID = OPI.Output_ID 
	 AND OPI.IndicatorType_ID = 6

	 
	left JOIN RBM.IndicatorValues OPIV
		ON OPI.IndicatorID = OPIV.Indicator_ID

	left JOIN app.SubOutput SO
		ON OP.Output_ID = SO.Output_ID
	 left JOIN app.Indicator SOI 
	ON SO.SubOutput_ID = SOI.SubOutput_ID 
	 AND SOI.IndicatorType_ID = 6

	 
	left JOIN RBM.IndicatorValues SOIV
		ON SOI.IndicatorID = SOIV.Indicator_ID

	WHERE (OM.OutcomeID = @OutcomeID 
			OR @OutcomeID = 0)
		AND
			(
				OMIV.ReportPeriodID = @ReportingPeriodID
				AND 
				OPIV.ReportPeriodID = @ReportingPeriodID
				AND 
				SOIV.ReportPeriodID = @ReportingPeriodID
			)
			*/
			
SELECT 
	OM.ShortName as OutcomeName
	,OP.ShortName as OutputName
	,SO.ShortName As Suboutputname
	,CASE 
	WHEN OMI.OutcomeID IS NOT NULL
		THEN OMIV.IndicatorStatusPercent 
		ELSE NULL 
		END OutcomeStatus
		,CASE 
	WHEN OPI.Output_ID IS NOT NULL
		THEN OPIV.IndicatorStatusPercent 
		ELSE NULL 
		END OutputStatus
	,CASE
	WHEN SOI.SubOutput_ID IS NOT NULL
		THEN SOIV.IndicatorStatusPercent 
		ELSE NULL 
		END SubOutputStatus
	
			
FROM app.Outcome OM 
	left JOIN app.Indicator OmI 
	ON OM.OutcomeID = OMI.OutcomeID
		AND OMI.IndicatorType_ID = 6
	left JOIN app.Output OP
		ON OM.OutcomeID = OP.OutcomeID 
	
	left JOIN RBM.IndicatorValues OMIV
		ON OMI.IndicatorID = OMIV.Indicator_ID
		
	left JOIN app.Indicator OPI 
	ON OP.Output_ID = OPI.Output_ID 
	 AND OPI.IndicatorType_ID = 6

	 
	left JOIN RBM.IndicatorValues OPIV
		ON OPI.IndicatorID = OPIV.Indicator_ID

	left JOIN app.SubOutput SO
		ON OP.Output_ID = SO.Output_ID
	 left JOIN app.Indicator SOI 
	ON SO.SubOutput_ID = SOI.SubOutput_ID 
	 AND SOI.IndicatorType_ID = 6

	 
	left JOIN RBM.IndicatorValues SOIV
		ON SOI.IndicatorID = SOIV.Indicator_ID

	WHERE (OM.OutcomeID = @OutcomeID 
			OR @OutcomeID = 0)
		AND
			(
				OMIV.ReportPeriodID = @ReportingPeriodID
				OR 
				OPIV.ReportPeriodID = @ReportingPeriodID
				OR 
				SOIV.ReportPeriodID = @ReportingPeriodID
			)


