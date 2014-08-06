CREATE VIEW rpt.FormResponsesByProject
AS


select 
	LT.Code AS LocationTypeCode
	,L.Name LocationName
	,Src.ProjectName
	, RP.Summary ReportPeriod
	, F.Name FormName
from forms.FormResponse FR
INNER JOIN Core.ReportingPeriod RP
ON fr.sys_CreatedOn between RP.FirstCycleDate and RP.LastCycleDate
INNER JOIN Core.Location L
ON FR.Location_ID = L.Location_ID
INNER JOIN Core.LocationType LT
ON L.LocationType_ID = LT.LocationType_ID
INNER JOIN forms.Form F
ON FR.Form_ID = F.Form_ID

OUTER APPLY (
	SELECT P.ProjectID, P.ShortName ProjectName, P.BusinessKey ProjectBusinessKey
		FROM forms.Question_Indicator_Rollup QIR
		INNER JOIN forms.Question Q
			ON QIR.Question_ID = QIR.Question_ID
		INNER JOIN forms.Category C
			ON Q.Category_ID = C.Category_ID
		INNER JOIN app.Indicator I
			ON QIR.Indicator_ID = I.IndicatorID
		INNER JOIN app.Project P
			ON I.ProjectID = P.ProjectID
		WHERE C.Form_ID = F.Form_ID
			)  
		Src
		
		
		
GO


