CREATE PROC [dbo].[rptStatusValuesOutput]
( 
	@OutcomeID int ,
	@ReportingPeriodID int
)
AS

			
SELECT 
	OM.ShortName as OutcomeName
	,OP.ShortName as OutputName
	,SO.ShortName As SubOutputname
	,ST.Value StatusTypeValue
	,ST.Name StatusType
	,SV.Percentage
	,RP.YearName
	,RP.ReportingPeriod
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
	
			
FROM  app.StatusValues SV
inner join Core.StatusType ST
on SV.StatusTypeID = ST.ID
LEFT JOIN [app].[SubOutput] SO
		ON SV.SubOutput_ID = SO.SubOutput_ID
	LEFT JOIN app.Output OP
		ON SV.Output_ID = OP.Output_ID
			OR SO.Output_ID = OP.Output_ID
LEFT JOIN 
[app].[Outcome] OM 
on SV.OutcomeID = OM.OutcomeID
		OR OP.OutcomeID = OM.OutcomeID
	
	INNER JOIN Core.ReportingPeriod RP
		on SV.ReportingPeriodID = RP.ID
	WHERE (OM.OutcomeID = @OutcomeID 
			OR @OutcomeID = 0)
		AND
			(
				SV.ReportingPeriodID = @ReportingPeriodID
				OR @ReportingPeriodID = 0
							)