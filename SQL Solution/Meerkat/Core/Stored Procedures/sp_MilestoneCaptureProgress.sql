CREATE PROC [Core].[usp_MilestoneCaptureProgress]
	@DataVersion_ID int = 0,
	@Outcome_ID int = 0

AS

SELECT
	Outcome = (OC.Code + ' : ' + OC.LongName),
	Outcome_ID = oc.Outcome_ID, 
	[Output] = '',
	Output_ID = 0,
	Project = (PRJ.Code + ' : ' + PRJ.LongName),
	PRJ.ProjectID,
	Activity = (ACT.Code + ' : ' + ACT.LongName), 
	Activity_ID = act.Activity_ID, 
	Milestone = (MST.Code + ' : ' + MST.LongName),
	Milestone_ID = mst.MilestoneID,
	[Year] = LEFT(RCC.YearNumber,4),
	FinancialYear = RCC.YearNumber, 
	ReportCycle = rcC.ReportingPeriod,
	MSV.DataVersion_ID,
	PercentageCaptured =
		CASE 
			WHEN MSV.ActualValue IS NOT NULL
			THEN 1
			ELSE 0
		END,
	MilestoneProgressPercent = (MSV.ActualValue / MST.Target) * 100.0,
	RolledUpToOutcome_ID = OC.Outcome_ID,
	RolledUpToOutput_ID	= 0,
	RolledUpToProjectID = PRJ.ProjectID,
	ReportingDate = MSv.ActualDate 
FROM [app].[Outcome] AS oc
INNER JOIN app.Project AS PRJ ON 
	oc.Outcome_ID = PRJ.Outcome_ID
INNER JOIN app.Activity AS ACT ON 
	PRJ.ProjectID = ACT.ProjectID
INNER JOIN app.Milestone AS MST ON act.Activity_ID = mst.Activity_ID
LEFT OUTER JOIN RBM.MilestoneValues AS MSV ON 
	MSV.Milestone_ID=MST.MilestoneID
	AND (MSV.DataVersion_ID = @DataVersion_ID OR @DataVersion_ID = 0)
INNER JOIN Core.ReportCycle AS RC ON 
	(MST.TargetDateID BETWEEN RC.StartDateID AND rc.EndDateID)
LEFT OUTER JOIN Core.ReportCycle AS RCC ON 
	rc.YearNumber=RCC.YearNumber
WHERE  
	(OC.Outcome_ID = @Outcome_ID OR @Outcome_ID = 0)
ORDER BY
	(OC.Code + ' : ' + OC.LongName),
    (PRJ.Code + ' : ' + PRJ.LongName),
    (ACT.Code + ' : ' + ACT.LongName),
    (MST.Code + ' : ' + MST.LongName),
    RC.YearNumber,
    rc.ReportingPeriod
      

