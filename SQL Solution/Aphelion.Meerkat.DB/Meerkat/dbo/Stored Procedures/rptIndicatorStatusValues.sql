﻿CREATE PROC [dbo].[rptIndicatorStatusValues]
( 
	@OutcomeID int ,
	@ReportingPeriodID int
)
AS

			
SELECT 
	OM.ShortName as OutcomeName
	,OP.ShortName as OutputName
	,SO.ShortName As SubOutputname
	--,CASE 
	--WHEN OMI.OutcomeID IS NOT NULL
	--	THEN OMIV.IndicatorStatusValuesPercent 
	--	ELSE NULL 
	--	END OutcomeStatusValues
	--	,CASE 
	--WHEN OPI.Output_ID IS NOT NULL
	--	THEN OPIV.IndicatorStatusValuesPercent 
	--	ELSE NULL 
	--	END OutputStatusValues
	--,CASE
	--WHEN SOI.SubOutput_ID IS NOT NULL
	--	THEN SOIV.IndicatorStatusValuesPercent 
	--	ELSE NULL 
	--	END SubOutputStatusValues
	
			
FROM [app].[Outcome] OM 
	INNER JOIN app.Indicator OmI 
	ON OM.OutcomeID = OMI.OutcomeID
		AND OMI.IndicatorType_ID = 6
	Inner JOIN app.Output OP
		ON OM.OutcomeID = OP.OutcomeID 
	
	INNER JOIN RBM.IndicatorValues OMIV
		ON OMI.IndicatorID = OMIV.Indicator_ID
		
	INNER JOIN app.Indicator OPI 
	ON OP.Output_ID = OPI.Output_ID 
	 AND OPI.IndicatorType_ID = 6

	 
	INNER JOIN RBM.IndicatorValues OPIV
		ON OPI.IndicatorID = OPIV.Indicator_ID

	INNER JOIN [app].[SubOutput] SO
		ON OP.Output_ID = SO.Output_ID
	 INNER JOIN app.Indicator SOI 
	ON SO.SubOutput_ID = SOI.SubOutput_ID 
	 AND SOI.IndicatorType_ID = 6

	 
	INNER JOIN RBM.IndicatorValues SOIV
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