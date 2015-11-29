
IF EXISTS (SELECT 1 FROM SYS.DATABASES
	WHERE DATABASES.NAME = 'MeerkatStaging')
DROP DATABASE [MeerkatStaging]
        GO    

IF NOT EXISTS (SELECT 1 FROM SYS.DATABASES
	WHERE DATABASES.NAME = 'MeerkatStaging')
CREATE DATABASE [MeerkatStaging]
        GO    
USE MeerkatStaging
    GO  
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.SCHEMATA
	WHERE SCHEMA_NAME = 'Staging')
	BEGIN
	DECLARE @sql varchar(max)
	SET @sql = 'CREATE SCHEMA Staging'
	EXEC (@SQL)
	END

    GO 
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Impact')
	DROP TABLE [Staging].[Impact]
    GO  

CREATE TABLE [Staging].[Impact]
(

	[Impact_ID] int NULL,
	[ShortName] nvarchar(50) NOT NULL,
	[LongName] nvarchar(500) NOT NULL,
	[TextDescription] nvarchar(max) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Code] varchar(50) NOT NULL,
	[ImpactSiteName] nvarchar(50) NULL,
    [DataVersionBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
     
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Activity')
	DROP TABLE [Staging].[Activity]
    GO  

CREATE TABLE [Staging].[Activity]
(

	[Activity_ID] int NULL,
	[ShortName] varchar(50) NOT NULL,
	[LongName] varchar(500) NOT NULL,
	[TextDescription] varchar(max) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Code] varchar(50) NOT NULL,
	[ProjectBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Indicator')
	DROP TABLE [Staging].[Indicator]
    GO  

CREATE TABLE [Staging].[Indicator]
(

	[IndicatorID] int NULL,
	[LongName] varchar(500) NOT NULL,
	[TextDescription] varchar(max) NULL,
	[Baseline] decimal(20,5) NULL,
	[BaselineString] varchar(max) NULL,
	[BaselineDate] datetime NOT NULL,
	[Target] decimal(20,5) NULL,
	[TargetString] varchar(max) NULL,
	[TargetDate] datetime NOT NULL,
	[ReleaseDate] date NULL,
	[ReportingDate] date NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Notes] nvarchar(max) NULL,
	[Code] varchar(50) NOT NULL,
	[ShortName] varchar(50) NOT NULL,
	[UnitOfMeasure] varchar(50) NOT NULL,
	[IndicatorTypeBusinessKey] nvarchar(4000) NOT NULL,
	[OutcomeBusinessKey] nvarchar(4000) NULL,
	[OutputBusinessKey] nvarchar(4000) NULL,
	[ProgrammeBusinessKey] nvarchar(4000) NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL,
	[SectorBusinessKey] nvarchar(4000) NULL,
	[SubOutputBusinessKey] nvarchar(4000) NULL,
	[SubSectorBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'IndicatorLocation')
	DROP TABLE [Staging].[IndicatorLocation]
    GO  

CREATE TABLE [Staging].[IndicatorLocation]
(

	[IndicatorLocation_ID] int NULL,
	[IndicatorBusinessKey] nvarchar(4000) NULL,
	[LocationBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'IndicatorType')
	DROP TABLE [Staging].[IndicatorType]
    GO  

CREATE TABLE [Staging].[IndicatorType]
(

	[IndicatorType_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Milestone')
	DROP TABLE [Staging].[Milestone]
    GO  

CREATE TABLE [Staging].[Milestone]
(

	[MilestoneID] int NULL,
	[LongName] varchar(500) NOT NULL,
	[TextDescription] varchar(max) NULL,
	[Baseline] decimal(20,5) NULL,
	[BaselineString] varchar(max) NULL,
	[BaselineDate] datetime NOT NULL,
	[Target] decimal(20,5) NULL,
	[TargetString] varchar(max) NULL,
	[TargetDate] datetime NOT NULL,
	[ReleaseDate] date NULL,
	[ReportingDate] date NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Notes] nvarchar(max) NULL,
	[Code] varchar(50) NOT NULL,
	[ShortName] varchar(50) NOT NULL,
	[UnitOfMeasure] varchar(50) NOT NULL,
	[ActivityBusinessKey] nvarchar(4000) NULL,
	[MilestoneTypeBusinessKey] nvarchar(4000) NOT NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'MilestoneLocation')
	DROP TABLE [Staging].[MilestoneLocation]
    GO  

CREATE TABLE [Staging].[MilestoneLocation]
(

	[MilestoneLocation_ID] int NULL,
	[LocationBusinessKey] nvarchar(4000) NOT NULL,
	[MilestoneBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'MilestoneType')
	DROP TABLE [Staging].[MilestoneType]
    GO  

CREATE TABLE [Staging].[MilestoneType]
(

	[MilestoneTypeID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Outcome')
	DROP TABLE [Staging].[Outcome]
    GO  

CREATE TABLE [Staging].[Outcome]
(

	[Outcome_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[LongName] nvarchar(500) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ShortName] nvarchar(50) NOT NULL,
	[TextDescription] nvarchar(max) NULL,
	[OutcomeSiteName] nvarchar(50) NULL,
	[DataVersionBusinessKey] nvarchar(4000) NOT NULL,
    [ImpactBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'OutcomeOrganization')
	DROP TABLE [Staging].[OutcomeOrganization]
    GO  

CREATE TABLE [Staging].[OutcomeOrganization]
(

	[OutcomeOrganization_ID] int NULL,
	[OrganizationBusinessKey] nvarchar(4000) NULL,
	[OutcomeBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'OutcomePersonRole')
	DROP TABLE [Staging].[OutcomePersonRole]
    GO  

CREATE TABLE [Staging].[OutcomePersonRole]
(

	[OutcomePersonRole_ID] int NULL,
	[OutcomeBusinessKey] nvarchar(4000) NULL,
	[PersonBusinessKey] nvarchar(4000) NULL,
	[RoleBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Output')
	DROP TABLE [Staging].[Output]
    GO  

CREATE TABLE [Staging].[Output]
(

	[Output_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[LongName] nvarchar(500) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ShortName] varchar(50) NOT NULL,
	[TextDescription] varchar(max) NULL,
	[OutcomeBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'OutputOutputLink')
	DROP TABLE [Staging].[OutputOutputLink]
    GO  

CREATE TABLE [Staging].[OutputOutputLink]
(

	[OutputOutputLink_ID] int NULL,
	[OutputBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'OutputPersonRole')
	DROP TABLE [Staging].[OutputPersonRole]
    GO  

CREATE TABLE [Staging].[OutputPersonRole]
(

	[OutputPersonRole_ID] int NULL,
	[OutputBusinessKey] nvarchar(4000) NULL,
	[PersonBusinessKey] nvarchar(4000) NULL,
	[RoleBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Programme')
	DROP TABLE [Staging].[Programme]
    GO  

CREATE TABLE [Staging].[Programme]
(

	[Programme_ID] int NULL,
	[Code] varchar(50) NULL,
	[LongName] varchar(500) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ShortName] varchar(50) NULL,
	[TextDescription] varchar(max) NULL,
	[ProgrammeSiteName] varchar(50) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Project')
	DROP TABLE [Staging].[Project]
    GO  

CREATE TABLE [Staging].[Project]
(

	[ProjectID] int NULL,
	[Code] varchar(50) NOT NULL,
	[ShortName] nvarchar(255) NOT NULL,
	[LongName] varchar(255) NOT NULL,
	[TextDescription] varchar(max) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ProjectSiteName] varchar(255) NOT NULL,
	[OutcomeBusinessKey] nvarchar(4000) NULL,
	[ProgrammeBusinessKey] nvarchar(4000) NULL,
	[SectorBusinessKey] nvarchar(4000) NULL,
	[SubSectorBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Sector')
	DROP TABLE [Staging].[Sector]
    GO  

CREATE TABLE [Staging].[Sector]
(

	[Sector_ID] int NULL,
	[Code] varchar(50) NULL,
	[LongName] varchar(500) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ShortName] varchar(50) NOT NULL,
	[TextDescription] varchar(max) NULL,
	[ProgrammeBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'SubOutput')
	DROP TABLE [Staging].[SubOutput]
    GO  

CREATE TABLE [Staging].[SubOutput]
(

	[SubOutput_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[ShortName] varchar(50) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[LongName] varchar(500) NOT NULL,
	[TextDescription] varchar(max) NULL,
	[OutputBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'SubOutputPersonRole')
	DROP TABLE [Staging].[SubOutputPersonRole]
    GO  

CREATE TABLE [Staging].[SubOutputPersonRole]
(

	[SubOutputPersonRole_ID] int NULL,
	[PersonBusinessKey] nvarchar(4000) NULL,
	[RoleBusinessKey] nvarchar(4000) NULL,
	[SubOutputBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'SubOutputSubOutputLink')
	DROP TABLE [Staging].[SubOutputSubOutputLink]
    GO  

CREATE TABLE [Staging].[SubOutputSubOutputLink]
(

	[SubOutputSubOutputLink_ID] int NULL,
	[SubOutputBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'SubSector')
	DROP TABLE [Staging].[SubSector]
    GO  

CREATE TABLE [Staging].[SubSector]
(

	[SubSector_ID] int NULL,
	[Code] varchar(50) NULL,
	[ShortName] varchar(50) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[LongName] varchar(500) NOT NULL,
	[TextDescription] varchar(max) NULL,
	[SectorBusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'DataSource')
	DROP TABLE [Staging].[DataSource]
    GO  

CREATE TABLE [Staging].[DataSource]
(

	[DataSource_ID] int NULL,
	[Name] varchar(255) NOT NULL,
	[ContactDetails] varchar(max) NULL,
	[Custodian] varchar(max) NULL,
	[Format] varchar(max) NULL,
	[CollectionMethod] varchar(max) NULL,
	[MetadataStatus] varchar(max) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'DataVersion')
	DROP TABLE [Staging].[DataVersion]
    GO  

CREATE TABLE [Staging].[DataVersion]
(

	[DataVersion_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[Description] varchar(max) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Order] int NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Location')
	DROP TABLE [Staging].[Location]
    GO  

CREATE TABLE [Staging].[Location]
(

	[Location_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[AreaKM] decimal(18,2) NULL,
	[Population] decimal(18,2) NULL,
	[Density] varchar(max) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ParentLocation_ID] int NULL,
	[LocationTypeBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'LocationType')
	DROP TABLE [Staging].[LocationType]
    GO  

CREATE TABLE [Staging].[LocationType]
(

	[LocationType_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[Description] varchar(max) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Organization')
	DROP TABLE [Staging].[Organization]
    GO  

CREATE TABLE [Staging].[Organization]
(

	[Organization_ID] int NULL,
	[ShortName] nvarchar(50) NOT NULL,
    [LongName] nvarchar(500) NULL,
	[Code] varchar(50) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ParentOrganization_ID] int NULL,
	[OrganizationTypeBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'OrganizationPersonRole')
	DROP TABLE [Staging].[OrganizationPersonRole]
    GO  

CREATE TABLE [Staging].[OrganizationPersonRole]
(

	[OrganizationPersonRole_ID] int NULL,
    [StartDate] datetime2(7) NULL,
    [EndDate] datetime2(7) NULL,
	[OrganizationBusinessKey] nvarchar(4000) NULL,
	[PersonBusinessKey] nvarchar(4000) NULL,
	[RoleBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'OrganizationType')
	DROP TABLE [Staging].[OrganizationType]
    GO  

CREATE TABLE [Staging].[OrganizationType]
(

	[OrganizationType_ID] int NULL,
    [Code]          varchar(50) NOT NULL,
    [Name]          varchar(255) NOT NULL,
	[Description] varchar(max) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Person')
	DROP TABLE [Staging].[Person]
    GO  

CREATE TABLE [Staging].[Person]
(

	[Person_ID] int NULL,
	[Title] varchar(max) NULL,
	[Name] varchar(255) NOT NULL,
	[ContactDetails] varchar(max) NULL,
	[Category] varchar(max) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[UserDetails] varchar(50) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'ReportingPeriod')
	DROP TABLE [Staging].[ReportingPeriod]
    GO  

CREATE TABLE [Staging].[ReportingPeriod]
(

	[ID] int NULL,
	[ReportingPeriod] int NOT NULL,
	[StartDateID] int NOT NULL,
	[EndDateID] int NOT NULL,
	[FirstCycleDate] datetime NOT NULL,
	[LastCycleDate] datetime NOT NULL,
    [YearName] char(4) NOT NULL,
	[YearNumber] int NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Summary] varchar(50) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Role')
	DROP TABLE [Staging].[Role]
    GO  

CREATE TABLE [Staging].[Role]
(

	[RoleID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[Description] varchar(max) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'StatusType')
	DROP TABLE [Staging].[StatusType]
    GO  

CREATE TABLE [Staging].[StatusType]
(

	[ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[Value] decimal(20,2) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'AgeBand')
	DROP TABLE [Staging].[AgeBand]
    GO  

CREATE TABLE [Staging].[AgeBand]
(

	[AgeBand_ID] int NULL,
	[AgeBandMin_ID] int NOT NULL,
	[AgeBandMax_ID] int NOT NULL,
	[TextDescription] varchar(max) NULL,
	[Name] varchar(255) NULL,
	[Code] varchar(50) NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'CommunityType')
	DROP TABLE [Staging].[CommunityType]
    GO  

CREATE TABLE [Staging].[CommunityType]
(

	[CommunityType_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Donor')
	DROP TABLE [Staging].[Donor]
    GO  

CREATE TABLE [Staging].[Donor]
(

	[Donor_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Framework')
	DROP TABLE [Staging].[Framework]
    GO  

CREATE TABLE [Staging].[Framework]
(

	[Framework_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[OrganizationBusinessKey] nvarchar(4000) NULL
)
    GO  

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'FrameworkDetail')
	DROP TABLE [Staging].[FrameworkDetail]
    GO  

CREATE TABLE [Staging].[FrameworkDetail]
(

	[FrameworkDetail_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[FrameworkBusinessKey] nvarchar(4000) NULL
)
    GO  

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'FrameworkDetail_Indicator')
	DROP TABLE [Staging].[FrameworkDetail_Indicator]
    GO  

CREATE TABLE [Staging].[FrameworkDetail_Indicator]
(

	[FrameworkDetail_Indicator_ID] int NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[FrameworkDetailBusinessKey] nvarchar(4000) NULL,
	[IndicatorBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'FrameworkDetail_Project')
	DROP TABLE [Staging].[FrameworkDetail_Project]
    GO  

CREATE TABLE [Staging].[FrameworkDetail_Project]
(

	[FrameworkDetail_Project_ID] int NULL,
	[FrameworkDetailBusinessKey] nvarchar(4000) NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Gender')
	DROP TABLE [Staging].[Gender]
    GO  

CREATE TABLE [Staging].[Gender]
(

	[Gender_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Group')
	DROP TABLE [Staging].[Group]
    GO  

CREATE TABLE [Staging].[Group]
(

	[Group_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Institution')
	DROP TABLE [Staging].[Institution]
    GO  

CREATE TABLE [Staging].[Institution]
(

	[Institution_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'Project_ResultArea')
	DROP TABLE [Staging].[Project_ResultArea]
    GO  

CREATE TABLE [Staging].[Project_ResultArea]
(

	[Project_ResultArea_ID] int NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL,
	[ResultAreaBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'ResultArea')
	DROP TABLE [Staging].[ResultArea]
    GO  

CREATE TABLE [Staging].[ResultArea]
(

	[ResultArea_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'StrategicElement')
	DROP TABLE [Staging].[StrategicElement]
    GO  

CREATE TABLE [Staging].[StrategicElement]
(

	[StrategicElement_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'IndicatorValues')
	DROP TABLE [Staging].[IndicatorValues]
    GO  

CREATE TABLE [Staging].[IndicatorValues]
(

	[IndicatorValues_ID] int NULL,
	[ActualLabel] varchar(50) NOT NULL,
	[ActualValue] decimal(20,5) NULL,
	[ActualDate] date NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Notes] varchar(max) NULL,
	[AgeBandBusinessKey] nvarchar(4000) NULL,
	[CommunityTypeBusinessKey] nvarchar(4000) NULL,
	[DataVersionBusinessKey] nvarchar(4000) NOT NULL,
	[DonorBusinessKey] nvarchar(4000) NULL,
	[FrameworkBusinessKey] nvarchar(4000) NULL,
	[GenderBusinessKey] nvarchar(4000) NULL,
	[GroupBusinessKey] nvarchar(4000) NULL,
	[IndicatorBusinessKey] nvarchar(4000) NOT NULL,
	[InstitutionBusinessKey] nvarchar(4000) NULL,
	[LocationBusinessKey] nvarchar(4000) NOT NULL,
	[OrganizationBusinessKey] nvarchar(4000) NULL,
	[ReportingPeriodBusinessKey] nvarchar(4000) NOT NULL,
	[ResultAreaBusinessKey] nvarchar(4000) NULL,
	[StrategicElementBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'MilestoneValues')
	DROP TABLE [Staging].[MilestoneValues]
    GO  

CREATE TABLE [Staging].[MilestoneValues]
(

	[MilestoneValues_ID] int NULL,
	[ActualLabel] varchar(50) NOT NULL,
	[ActualValue] decimal(20,5) NULL,
	[ActualDate] date NULL,
	[BusinessKey] nvarchar(4000) NOT NULL,
	[Notes] varchar(max) NULL,
	[GroupVersion] int NOT NULL,
	[AgeBandBusinessKey] nvarchar(4000) NULL,
	[CommunityTypeBusinessKey] nvarchar(4000) NULL,
	[DataVersionBusinessKey] nvarchar(4000) NOT NULL,
	[DonorBusinessKey] nvarchar(4000) NULL,
	[FrameworkBusinessKey] nvarchar(4000) NULL,
	[GenderBusinessKey] nvarchar(4000) NULL,
	[GroupBusinessKey] nvarchar(4000) NULL,
	[InstitutionBusinessKey] nvarchar(4000) NULL,
	[LocationBusinessKey] nvarchar(4000) NOT NULL,
	[MilestoneBusinessKey] nvarchar(4000) NOT NULL,
	[OrganizationBusinessKey] nvarchar(4000) NULL,
	[ReportingPeriodBusinessKey] nvarchar(4000) NOT NULL,
	[ResultAreaBusinessKey] nvarchar(4000) NULL,
	[StrategicElementBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'PeopleReachedValues')
	DROP TABLE [Staging].[PeopleReachedValues]
    GO  

CREATE TABLE [Staging].[PeopleReachedValues]
(

	[PeopleReachedValuesID] int NULL,
	[Notes] nvarchar(max) NULL,
    [NumberReached] int NOT NULL,
	[ActivityBusinessKey] nvarchar(4000) NULL,
	[AgeBandBusinessKey] nvarchar(4000) NULL,
	[CommunityTypeBusinessKey] nvarchar(4000) NULL,
	[DataVersionBusinessKey] nvarchar(4000) NOT NULL,
	[DonorBusinessKey] nvarchar(4000) NULL,
	[FrameworkBusinessKey] nvarchar(4000) NULL,
	[FrameworkDetail_IndicatorBusinessKey] nvarchar(4000) NULL,
	[GenderBusinessKey] nvarchar(4000) NULL,
	[GroupBusinessKey] nvarchar(4000) NULL,
	[InstitutionBusinessKey] nvarchar(4000) NULL,
	[LocationBusinessKey] nvarchar(4000) NOT NULL,
	[OutcomeBusinessKey] nvarchar(4000) NULL,
	[OutputBusinessKey] nvarchar(4000) NULL,
	[ProgrammeBusinessKey] nvarchar(4000) NULL,
    [SectorBusinessKey] nvarchar(4000) NULL,
    [SubSectorBusinessKey] nvarchar(4000) NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL,
	[ReportingPeriodBusinessKey] nvarchar(4000) NOT NULL,
	[ResultAreaBusinessKey] nvarchar(4000) NULL,
	[StatusTypeBusinessKey] nvarchar(4000) NULL,
	[StrategicElementBusinessKey] nvarchar(4000) NULL,
	[SubOutputBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'StatusValues')
	DROP TABLE [Staging].[StatusValues]
    GO  

CREATE TABLE [Staging].[StatusValues]
(

	[StatusValuesID] int NULL,
	[Notes] nvarchar(max) NULL,
	[ActivityBusinessKey] nvarchar(4000) NULL,
	[DataVersionBusinessKey] nvarchar(4000) NOT NULL,
	[LocationBusinessKey] nvarchar(4000) NOT NULL,
	[OutcomeBusinessKey] nvarchar(4000) NULL,
	[OutputBusinessKey] nvarchar(4000) NULL,
	[ProgrammeBusinessKey] nvarchar(4000) NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL,
	[ReportingPeriodBusinessKey] nvarchar(4000) NOT NULL,
	[StatusTypeBusinessKey] nvarchar(4000) NULL,
	[SubOutputBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'CustomReport')
	DROP TABLE [Staging].[CustomReport]
    GO  

CREATE TABLE [Staging].[CustomReport]
(

	[CustomReport_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'CustomReport_Indicator')
	DROP TABLE [Staging].[CustomReport_Indicator]
    GO  

CREATE TABLE [Staging].[CustomReport_Indicator]
(

	[CustomReport_Indicator_ID] int NULL,
	[CustomReportBusinessKey] nvarchar(4000) NULL,
	[IndicatorBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'CustomReport_Project')
	DROP TABLE [Staging].[CustomReport_Project]
    GO  

CREATE TABLE [Staging].[CustomReport_Project]
(

	[CustomReport_Project_ID] int NULL,
	[CustomReportBusinessKey] nvarchar(4000) NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'CustomReportType')
	DROP TABLE [Staging].[CustomReportType]
    GO  

CREATE TABLE [Staging].[CustomReportType]
(

	[CustomReportType_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'DonorReport')
	DROP TABLE [Staging].[DonorReport]
    GO  

CREATE TABLE [Staging].[DonorReport]
(

	[DonorReport_ID] int NULL,
	[Code] varchar(50) NOT NULL,
	[Name] varchar(255) NOT NULL,
	[BusinessKey] nvarchar(4000) NOT NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'DonorReport_Indicator')
	DROP TABLE [Staging].[DonorReport_Indicator]
    GO  

CREATE TABLE [Staging].[DonorReport_Indicator]
(

	[DonorReport_Indicator_ID] int NULL,
	[DonorReportBusinessKey] nvarchar(4000) NULL,
	[IndicatorBusinessKey] nvarchar(4000) NULL
)
    GO  
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = 'Staging'
		AND TABLES.TABLE_NAME = 'DonorReport_Project')
	DROP TABLE [Staging].[DonorReport_Project]
    GO  

CREATE TABLE [Staging].[DonorReport_Project]
(

	[DonorReport_Project_ID] int NULL,
	[DonorReportBusinessKey] nvarchar(4000) NULL,
	[ProjectBusinessKey] nvarchar(4000) NULL
)
    GO  
