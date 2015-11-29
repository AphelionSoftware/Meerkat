CREATE VIEW settings.vwAllTablesToExport
as


/*SELECT 
CASE WHEN ROW_NUMBER() over (order by table_schema, table_name) > 1
THEN '
UNION 
'
ELSE '' END +
'SELECT ''' + table_schema + ''' as table_schema, 
''' + table_name + ''' as table_name
FROM [' + table_schema + '].[' + table_name +']
WHERE Export = 1 '
from INFORMATION_SCHEMA.COLUMNS
where column_name = 'Export'
order  by table_schema, table_name*/
SELECT 'app' as table_schema, 
'Activity' as table_name
FROM [app].[Activity]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Impact' as table_name
FROM [app].[Impact]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Indicator' as table_name
FROM [app].[Indicator]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'IndicatorLocation' as table_name
FROM [app].[IndicatorLocation]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'IndicatorSimpleType' as table_name
FROM [app].[IndicatorSimpleType]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'IndicatorType' as table_name
FROM [app].[IndicatorType]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Milestone' as table_name
FROM [app].[Milestone]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'MilestoneLocation' as table_name
FROM [app].[MilestoneLocation]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'MilestoneType' as table_name
FROM [app].[MilestoneType]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Outcome' as table_name
FROM [app].[Outcome]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'OutcomeOrganization' as table_name
FROM [app].[OutcomeOrganization]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'OutcomePersonRole' as table_name
FROM [app].[OutcomePersonRole]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Output' as table_name
FROM [app].[Output]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'OutputOutputLink' as table_name
FROM [app].[OutputOutputLink]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'OutputPersonRole' as table_name
FROM [app].[OutputPersonRole]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Programme' as table_name
FROM [app].[Programme]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Project' as table_name
FROM [app].[Project]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'ProjectType' as table_name
FROM [app].[ProjectType]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'Sector' as table_name
FROM [app].[Sector]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'SubOutput' as table_name
FROM [app].[SubOutput]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'SubOutputPersonRole' as table_name
FROM [app].[SubOutputPersonRole]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'SubOutputSubOutputLink' as table_name
FROM [app].[SubOutputSubOutputLink]
WHERE Export = 1 

UNION 
SELECT 'app' as table_schema, 
'SubSector' as table_name
FROM [app].[SubSector]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'ActiveType' as table_name
FROM [Core].[ActiveType]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'DataSource' as table_name
FROM [Core].[DataSource]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'DataVersion' as table_name
FROM [Core].[DataVersion]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'DimDate' as table_name
FROM [Core].[DimDate]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'DimMunicipalityGEOM' as table_name
FROM [Core].[DimMunicipalityGEOM]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'Location' as table_name
FROM [Core].[Location]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'LocationType' as table_name
FROM [Core].[LocationType]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'Organization' as table_name
FROM [Core].[Organization]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'OrganizationPersonRole' as table_name
FROM [Core].[OrganizationPersonRole]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'OrganizationType' as table_name
FROM [Core].[OrganizationType]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'Person' as table_name
FROM [Core].[Person]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'ReportingPeriod' as table_name
FROM [Core].[ReportingPeriod]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'Role' as table_name
FROM [Core].[Role]
WHERE Export = 1 

UNION 
SELECT 'Core' as table_schema, 
'StatusType' as table_name
FROM [Core].[StatusType]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Age' as table_name
FROM [disagg].[Age]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'AgeBand' as table_name
FROM [disagg].[AgeBand]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'CommunityType' as table_name
FROM [disagg].[CommunityType]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Donor' as table_name
FROM [disagg].[Donor]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Facility' as table_name
FROM [disagg].[Facility]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'FacilityType' as table_name
FROM [disagg].[FacilityType]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Framework' as table_name
FROM [disagg].[Framework]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'FrameworkDetail' as table_name
FROM [disagg].[FrameworkDetail]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'FrameworkDetail_Indicator' as table_name
FROM [disagg].[FrameworkDetail_Indicator]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'FrameworkDetail_Project' as table_name
FROM [disagg].[FrameworkDetail_Project]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Gender' as table_name
FROM [disagg].[Gender]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Group' as table_name
FROM [disagg].[Group]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Institution' as table_name
FROM [disagg].[Institution]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'Project_ResultArea' as table_name
FROM [disagg].[Project_ResultArea]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'ResultArea' as table_name
FROM [disagg].[ResultArea]
WHERE Export = 1 

UNION 
SELECT 'disagg' as table_schema, 
'StrategicElement' as table_name
FROM [disagg].[StrategicElement]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'Category' as table_name
FROM [forms].[Category]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'Event' as table_name
FROM [forms].[Event]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'Event_Indicator_Rollup' as table_name
FROM [forms].[Event_Indicator_Rollup]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'EventRegister' as table_name
FROM [forms].[EventRegister]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'Form' as table_name
FROM [forms].[Form]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'FormResponse' as table_name
FROM [forms].[FormResponse]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'PotentialResponse' as table_name
FROM [forms].[PotentialResponse]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'Question' as table_name
FROM [forms].[Question]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'Question_Indicator_Rollup' as table_name
FROM [forms].[Question_Indicator_Rollup]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'QuestionType' as table_name
FROM [forms].[QuestionType]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'Response' as table_name
FROM [forms].[Response]
WHERE Export = 1 

UNION 
SELECT 'forms' as table_schema, 
'RollupType' as table_name
FROM [forms].[RollupType]
WHERE Export = 1 

UNION 
SELECT 'RBM' as table_schema, 
'IndicatorValues' as table_name
FROM [RBM].[IndicatorValues]
WHERE Export = 1 

UNION 
SELECT 'RBM' as table_schema, 
'MilestoneValues' as table_name
FROM [RBM].[MilestoneValues]
WHERE Export = 1 

UNION 
SELECT 'RBM' as table_schema, 
'PeopleReachedValues' as table_name
FROM [RBM].[PeopleReachedValues]
WHERE Export = 1 

UNION 
SELECT 'RBM' as table_schema, 
'StatusValues' as table_name
FROM [RBM].[StatusValues]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'CustomReport' as table_name
FROM [rpt].[CustomReport]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'CustomReport_Calendar' as table_name
FROM [rpt].[CustomReport_Calendar]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'CustomReport_Indicator' as table_name
FROM [rpt].[CustomReport_Indicator]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'CustomReport_Project' as table_name
FROM [rpt].[CustomReport_Project]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'CustomReport_ResponsiblePerson' as table_name
FROM [rpt].[CustomReport_ResponsiblePerson]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'CustomReportType' as table_name
FROM [rpt].[CustomReportType]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'DonorReport' as table_name
FROM [rpt].[DonorReport]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'DonorReport_Indicator' as table_name
FROM [rpt].[DonorReport_Indicator]
WHERE Export = 1 

UNION 
SELECT 'rpt' as table_schema, 
'DonorReport_Project' as table_name
FROM [rpt].[DonorReport_Project]
WHERE Export = 1