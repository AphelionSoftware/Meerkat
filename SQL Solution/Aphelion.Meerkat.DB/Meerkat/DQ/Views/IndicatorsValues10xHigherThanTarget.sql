


CREATE VIEW [DQ].[IndicatorsValues10xHigherThanTarget]
as
SELECT  IV.ActualLabel, IV.ActualValue, IV.ActualDate, 
I.TargetString, I.Target, I.TargetDate,
I.BaselineString, I.Baseline, I.BaselineDate,
 RP.Summary ReportPeriod,
DV.Name DataVersionName,
I.ShortName, I.Code, 
P.Code ProjectCode, 
P.ShortName ProjectName,
Prog.Code ProgrammeCode,
Prog.ShortName ProgrammeName

FROM RBM.IndicatorValues IV
	INNER JOIN App.Indicator I
		ON IV.Indicator_ID = I.IndicatorID
	LEFT JOIN App.Project P
		ON I.ProjectID = P.ProjectID
	INNER JOIN App.Programme Prog
		ON I.Programme_ID  = Prog.Programme_ID
		OR P.Programme_ID = P.Programme_ID
	INNER JOIN Core.DataVersion DV
		ON IV.DataVersion_ID = DV.DataVersion_ID
   inner join Core.ReportingPeriod RP
	ON IV.ReportPeriodID  = RP.ID

WHERE IV.ActualValue >= (I.Target * 10)