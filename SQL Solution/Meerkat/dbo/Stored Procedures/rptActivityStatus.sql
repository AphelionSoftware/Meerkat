
--CREATE PROC [dbo].[rptActivityStatusValues]
--( @OutcomeID int ,
--@ReportingPeriodID int)
--as

--/*
--SELECT 
--	OM.ShortName as OutcomeName
--	,PR.ShortName as OutputName
--	,ACT.ShortName As SubOutputname
--	,OMIV.IndicatorStatusValuesPercent OutcomeStatusValues
--	,OPIV.IndicatorStatusValuesPercent OutputStatusValues
--	,SOIV.IndicatorStatusValuesPercent SubOutputStatusValues
			
--FROM [app].[Outcome] OM 
--	INNER JOIN app.Indicator OmI 
--	ON OM.OutcomeID = OMI.OutcomeID
--		AND OMI.IndicatorType_ID = 6
--	Inner JOIN app.Output OP
--		ON OM.OutcomeID = PR.OutcomeID 
	
--	INNER JOIN RBM.IndicatorValues OMIV
--		ON OMI.IndicatorID = OMIV.Indicator_ID
		
--	INNER JOIN app.Indicator OPI 
--	ON PR.Output_ID = OPI.Output_ID 
--	 AND OPI.IndicatorType_ID = 6

	 
--	INNER JOIN RBM.IndicatorValues OPIV
--		ON OPI.IndicatorID = OPIV.Indicator_ID

--	INNER JOIN [app].[SubOutput] SO
--		ON PR.Output_ID = ACT.Output_ID
--	 INNER JOIN app.Indicator SOI 
--	ON ACT.SubOutput_ID = SOI.SubOutput_ID 
--	 AND SOI.IndicatorType_ID = 6

	 
--	INNER JOIN RBM.IndicatorValues SOIV
--		ON SOI.IndicatorID = SOIV.Indicator_ID

--	WHERE (OM.OutcomeID = @OutcomeID 
--			OR @OutcomeID = 0)
--		AND
--			(
--				OMIV.ReportPeriodID = @ReportingPeriodID
--				AND 
--				OPIV.ReportPeriodID = @ReportingPeriodID
--				AND 
--				SOIV.ReportPeriodID = @ReportingPeriodID
--			)
--			*/
			
--SELECT 
--	OM.ShortName as OutcomeName
--	,PR.ShortName as ProjectName
--	,ACT.ShortName As ActivityName
--	,CASE 
--	WHEN OMI.OutcomeID IS NOT NULL
--		THEN OMIV.IndicatorStatusValuesPercent 
--		ELSE NULL 
--		END OutcomeStatusValues
--		,CASE 
--	WHEN OPP.ProjectID IS NOT NULL
--		THEN OPIV.IndicatorStatusValuesPercent 
--		ELSE NULL 
--		END ProjectStatusValues
--	,CASE
--	WHEN SOI.Activity_ID IS NOT NULL
--		THEN SOIV.IndicatorStatusValuesPercent 
--		ELSE NULL 
--		END ActivityStatusValues
	
			
--FROM [app].[Outcome] OM 
--	INNER JOIN app.Indicator OmI 
--	ON OM.OutcomeID = OMI.OutcomeID
--		AND OMI.IndicatorType_ID = 6
--	Inner JOIN app.Project PR
--		ON OM.OutcomeID = PR.OutcomeID 
	
--	INNER JOIN RBM.IndicatorValues OMIV
--		ON OMI.IndicatorID = OMIV.Indicator_ID
		
--	INNER JOIN app.Indicator OPP 
--	ON PR.ProjectID = OPP.Output_ID 
--	 AND OPP.IndicatorType_ID = 6

	 
--	INNER JOIN RBM.IndicatorValues OPIV
--		ON OPP.IndicatorID = OPIV.Indicator_ID

--	INNER JOIN app.Activity ACT
--		ON PR.ProjectID = ACT.ProjectID
--	 INNER JOIN app.Indicator SOI 
--	 /* MGS Fixed */
--	ON ACT.ActivityID = SOI.Activity_ID 
--	 AND SOI.IndicatorType_ID = 6

	 
--	INNER JOIN RBM.IndicatorValues SOIV
--		ON SOI.IndicatorID = SOIV.Indicator_ID

--	WHERE (OM.OutcomeID = @OutcomeID 
--			OR @OutcomeID = 0)
--		AND
--			(
--				OMIV.ReportPeriodID = @ReportingPeriodID
--				AND 
--				OPIV.ReportPeriodID = @ReportingPeriodID
--				AND 
--				SOIV.ReportPeriodID = @ReportingPeriodID
--			)
