

CREATE VIEW [rpt].[vwFormResponsesCount]
AS

select 
	'Project' As LevelType
	,LT.Code AS LocationTypeCode
	,L.Name Location_Name
	,Src.ProjectName As ShortName
	, RP.Summary ReportPeriod
	, F.Name   FormName
	, AB.Name  AgeBandName
	, CT.Name  CommunityTypeName
	, G.Name   GenderName
	, GR.Name  GroupName
	, I.Name   InstitutionName
	, Count(*) ResponseCount
from forms.FormResponse FR
INNER JOIN Core.ReportingPeriod RP
ON fr.sys_CreatedOn between RP.FirstCycleDate and RP.LastCycleDate
INNER JOIN Core.Location L
ON FR.Location_ID = L.Location_ID
INNER JOIN Core.LocationType LT
ON L.LocationType_ID = LT.LocationType_ID
INNER JOIN forms.Form F
ON FR.Form_ID = F.Form_ID
LEFT JOIN disagg.AgeBand AB
	ON FR.AgeBand_ID = Ab.AgeBand_ID

LEFT JOIN disagg.CommunityType CT
	ON FR.CommunityType_ID = CT.CommunityType_ID
	
LEFT JOIN disagg.Gender G
	ON FR.Gender_ID = G.Gender_ID

LEFT JOIN disagg.[Group] GR
	ON FR.Group_ID = GR.Group_ID

LEFT JOIN disagg.Institution I
	on FR.Institution_ID = I.Institution_ID

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

GROUP BY 
	LT.Code  
	,L.Name 
	,Src.ProjectName
	, RP.Summary 
	, F.Name 	
	, AB.Name 
	, CT.Name 
	, G.Name  
	, GR.Name 
	, I.Name