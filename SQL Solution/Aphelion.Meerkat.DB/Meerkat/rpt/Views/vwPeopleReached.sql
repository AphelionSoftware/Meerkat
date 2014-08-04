CREATE view Rpt.vwPeopleReached
as
SELECT 
	[PeopleReachedValues].[PeopleReachedValuesID] 
	,CASE
		 WHEN [Activity].[BusinessKey]  IS NOT NULL THEN 'ACT'
		 WHEN [Outcome].[BusinessKey]  IS NOT NULL THEN 'OM'
		 WHEN [Output].[BusinessKey]  IS NOT NULL THEN 'OT{'
		 WHEN [Programme].[BusinessKey]  IS NOT NULL THEN 'PROG'
		 WHEN [Project].[BusinessKey]  IS NOT NULL THEN 'PRJ'
		 WHEN [Sector].[BusinessKey]  IS NOT NULL THEN 'SEC'
		 WHEN [SubOutput].[BusinessKey]  IS NOT NULL THEN 'SO'
		 WHEN [SubSector].[BusinessKey]  IS NOT NULL THEN 'SS'
	END AS KeyType
	,[LocationType].Code AS LocationTypeCode
	, COALESCE([Activity].[BusinessKey] 
, [Outcome].[BusinessKey] 
, [Output].[BusinessKey] 
, [Programme].[BusinessKey] 
, [Project].[BusinessKey] 
, [Sector].[BusinessKey] 
, [SubOutput].[BusinessKey] 
, [SubSector].[BusinessKey] ) AS BusinessKey
	, COALESCE([Activity].[ShortName] 
, [Outcome].[ShortName] 
, [Output].[ShortName] 
, [Programme].[ShortName] 
, [Project].[ShortName] 
, [Sector].[ShortName] 
, [SubOutput].[ShortName] 
, [SubSector].[ShortName] ) AS ShortName
	,[PeopleReachedValues].[ReportingPeriod_ID] 
	, RP.Summary ReportPeriod
	, [AgeBand].[Name] AS AgeBand_Name
	, [CommunityType].[Name] AS CommunityType_Name
	, [Donor].[Name] AS Donor_Name
	, [Framework].[Name] AS Framework_Name
	, [Gender].[Name] AS Gender_Name
	, [Group].[Name] AS Group_Name
	, [Institution].[Name] AS Institution_Name
	, [Location].[Name] AS Location_Name
	, [Location].[BusinessKey] AS Location_BusinessKey
	, [ResultArea].[Name] AS ResultArea_Name
	, [StrategicElement].[Name] AS StrategicElement_Name
	, NumberReached
FROM [RBM].[PeopleReachedValues] [PeopleReachedValues]

 LEFT JOIN [app].[Activity] 
	ON PeopleReachedValues.Activity_ID = 
	Activity.Activity_ID
 LEFT JOIN [disagg].[AgeBand] 
	ON PeopleReachedValues.AgeBand_ID = 
	AgeBand.AgeBand_ID
 LEFT JOIN [disagg].[CommunityType] 
	ON PeopleReachedValues.CommunityType_ID = 
	CommunityType.CommunityType_ID
 LEFT JOIN [Core].[DataVersion] 
	ON PeopleReachedValues.DataVersion_ID = 
	DataVersion.DataVersion_ID
 LEFT JOIN [disagg].[Donor] 
	ON PeopleReachedValues.Donor_ID = 
	Donor.Donor_ID
 LEFT JOIN [disagg].[Framework] 
	ON PeopleReachedValues.Framework_ID = 
	Framework.Framework_ID
 LEFT JOIN [disagg].[FrameworkDetail_Indicator] 
	ON PeopleReachedValues.FrameworkDetail_Indicator_ID = 
	FrameworkDetail_Indicator.FrameworkDetail_Indicator_ID
 LEFT JOIN [disagg].[Gender] 
	ON PeopleReachedValues.Gender_ID = 
	Gender.Gender_ID
 LEFT JOIN [disagg].[Group] 
	ON PeopleReachedValues.Group_ID = 
	[Group].Group_ID
 LEFT JOIN [disagg].[Institution] 
	ON PeopleReachedValues.Institution_ID = 
	Institution.Institution_ID
 LEFT JOIN [app].[Outcome] 
	ON PeopleReachedValues.Outcome_ID = 
	Outcome.Outcome_ID
 LEFT JOIN [app].[Output] 
	ON PeopleReachedValues.Output_ID = 
	Output.Output_ID
 LEFT JOIN [app].[Programme] 
	ON PeopleReachedValues.Programme_ID = 
	Programme.Programme_ID
 LEFT JOIN [app].[Project] 
	ON PeopleReachedValues.ProjectID = 
	Project.ProjectID
 LEFT JOIN [Core].[ReportingPeriod] 
	ON PeopleReachedValues.ReportingPeriod_ID = 
	ReportingPeriod.ID
 LEFT JOIN [disagg].[ResultArea] 
	ON PeopleReachedValues.ResultArea_ID = 
	ResultArea.ResultArea_ID
 LEFT JOIN [app].[Sector] 
	ON PeopleReachedValues.Sector_ID = 
	Sector.Sector_ID
 LEFT JOIN [Core].[StatusType] 
	ON PeopleReachedValues.StatusType_ID = 
	StatusType.ID
 LEFT JOIN [disagg].[StrategicElement] 
	ON PeopleReachedValues.StrategicElement_ID = 
	StrategicElement.StrategicElement_ID
 LEFT JOIN [app].[SubOutput] 
	ON PeopleReachedValues.SubOutput_ID = 
	SubOutput.SubOutput_ID
 LEFT JOIN [app].[SubSector] 
	ON PeopleReachedValues.SubSector_ID = 
	SubSector.SubSector_ID

JOIN [core].ReportingPeriod RP
	ON PeopleReachedValues.ReportingPeriod_ID = RP.ID

JOIN [Core].[Location] 
	ON PeopleReachedValues.Location_ID = 	Location.Location_ID

JOIN [Core].[LocationType] 
	ON [Location].LocationType_ID = [LocationType].[LocationType_ID]
 