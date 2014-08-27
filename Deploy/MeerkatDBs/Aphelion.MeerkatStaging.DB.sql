﻿/*
Deployment script for MeerkatStaging

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MeerkatStaging"
:setvar DefaultFilePrefix "MeerkatStaging"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Starting rebuilding table [Staging].[AgeBand]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Staging].[tmp_ms_xx_AgeBand] (
    [AgeBand_ID]         INT            NULL,
    [BusinessKey]        NVARCHAR (400) NOT NULL,
    [Code]               VARCHAR (50)   NULL,
    [LocalName]          NVARCHAR (255) NULL,
    [Name]               VARCHAR (255)  NULL,
    [TextDescription]    VARCHAR (4000) NULL,
    [AgeBandMax_ID]      INT            NOT NULL,
    [AgeBandMin_ID]      INT            NOT NULL,
    [ProjectBusinessKey] NVARCHAR (400) NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Staging].[AgeBand])
    BEGIN
        INSERT INTO [Staging].[tmp_ms_xx_AgeBand] ([AgeBand_ID], [AgeBandMax_ID], [AgeBandMin_ID], [BusinessKey], [Code], [LocalName], [Name], [TextDescription], [ProjectBusinessKey])
        SELECT [AgeBand_ID],
               [AgeBandMax_ID],
               [AgeBandMin_ID],
               [BusinessKey],
               [Code],
               [LocalName],
               [Name],
               [TextDescription],
               [ProjectBusinessKey]
        FROM   [Staging].[AgeBand];
    END

DROP TABLE [Staging].[AgeBand];

EXECUTE sp_rename N'[Staging].[tmp_ms_xx_AgeBand]', N'AgeBand';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [Staging].[CustomReport_Indicator]...';


GO
ALTER TABLE [Staging].[CustomReport_Indicator] ALTER COLUMN [CustomReportBusinessKey] NVARCHAR (400) NOT NULL;

ALTER TABLE [Staging].[CustomReport_Indicator] ALTER COLUMN [IndicatorBusinessKey] NVARCHAR (400) NOT NULL;


GO
PRINT N'Altering [Staging].[Facility]...';


GO
ALTER TABLE [Staging].[Facility] ALTER COLUMN [InstitutionBusinessKey] NVARCHAR (400) NULL;


GO
ALTER TABLE [Staging].[Facility]
    ADD [LocationBusinessKey] NVARCHAR (400) NOT NULL;


GO
PRINT N'Starting rebuilding table [Staging].[Indicator]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Staging].[tmp_ms_xx_Indicator] (
    [IndicatorID]                    INT             NULL,
    [BusinessKey]                    NVARCHAR (400)  NOT NULL,
    [Baseline]                       DECIMAL (20, 5) NULL,
    [BaselineDate]                   DATETIME        NOT NULL,
    [BaselineString]                 VARCHAR (MAX)   NULL,
    [Code]                           VARCHAR (50)    NOT NULL,
    [LocalLongName]                  NVARCHAR (500)  NULL,
    [LocalShortName]                 NVARCHAR (50)   NULL,
    [LongName]                       VARCHAR (500)   NOT NULL,
    [Notes]                          NVARCHAR (MAX)  NULL,
    [ReleaseDate]                    DATE            NULL,
    [ReportingDate]                  DATE            NULL,
    [ShortName]                      VARCHAR (50)    NOT NULL,
    [Target]                         DECIMAL (20, 5) NULL,
    [TargetDate]                     DATETIME        NOT NULL,
    [TargetString]                   VARCHAR (MAX)   NULL,
    [TextDescription]                VARCHAR (4000)  NULL,
    [UnitOfMeasure]                  VARCHAR (50)    NOT NULL,
    [IndicatorSimpleTypeBusinessKey] NVARCHAR (400)  NULL,
    [IndicatorTypeBusinessKey]       NVARCHAR (400)  NOT NULL,
    [OutcomeBusinessKey]             NVARCHAR (400)  NULL,
    [OutputBusinessKey]              NVARCHAR (400)  NULL,
    [ProgrammeBusinessKey]           NVARCHAR (400)  NULL,
    [ProjectBusinessKey]             NVARCHAR (400)  NULL,
    [SectorBusinessKey]              NVARCHAR (400)  NULL,
    [SubOutputBusinessKey]           NVARCHAR (400)  NULL,
    [SubSectorBusinessKey]           NVARCHAR (400)  NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Staging].[Indicator])
    BEGIN
        INSERT INTO [Staging].[tmp_ms_xx_Indicator] ([IndicatorID], [Baseline], [BaselineDate], [BaselineString], [BusinessKey], [Code], [LocalLongName], [LocalShortName], [LongName], [Notes], [ReleaseDate], [ReportingDate], [ShortName], [Target], [TargetDate], [TargetString], [TextDescription], [UnitOfMeasure], [IndicatorSimpleTypeBusinessKey], [IndicatorTypeBusinessKey], [OutcomeBusinessKey], [OutputBusinessKey], [ProgrammeBusinessKey], [ProjectBusinessKey], [SectorBusinessKey], [SubOutputBusinessKey], [SubSectorBusinessKey])
        SELECT [IndicatorID],
               [Baseline],
               [BaselineDate],
               [BaselineString],
               [BusinessKey],
               [Code],
               [LocalLongName],
               [LocalShortName],
               [LongName],
               [Notes],
               [ReleaseDate],
               [ReportingDate],
               [ShortName],
               [Target],
               [TargetDate],
               [TargetString],
               [TextDescription],
               [UnitOfMeasure],
               [IndicatorSimpleTypeBusinessKey],
               [IndicatorTypeBusinessKey],
               [OutcomeBusinessKey],
               [OutputBusinessKey],
               [ProgrammeBusinessKey],
               [ProjectBusinessKey],
               [SectorBusinessKey],
               [SubOutputBusinessKey],
               [SubSectorBusinessKey]
        FROM   [Staging].[Indicator];
    END

DROP TABLE [Staging].[Indicator];

EXECUTE sp_rename N'[Staging].[tmp_ms_xx_Indicator]', N'Indicator';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [Staging].[IndicatorValues]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Staging].[tmp_ms_xx_IndicatorValues] (
    [IndicatorValues_ID]          INT             NULL,
    [BusinessKey]                 NVARCHAR (400)  NOT NULL,
    [ActualDate]                  DATE            NULL,
    [ActualLabel]                 VARCHAR (50)    NOT NULL,
    [ActualValue]                 DECIMAL (20, 5) NULL,
    [Notes]                       VARCHAR (MAX)   NULL,
    [AgeBandBusinessKey]          NVARCHAR (400)  NULL,
    [CommunityTypeBusinessKey]    NVARCHAR (400)  NULL,
    [DataVersionBusinessKey]      NVARCHAR (400)  NOT NULL,
    [DonorBusinessKey]            NVARCHAR (400)  NULL,
    [FrameworkBusinessKey]        NVARCHAR (400)  NULL,
    [GenderBusinessKey]           NVARCHAR (400)  NULL,
    [GroupBusinessKey]            NVARCHAR (400)  NULL,
    [IndicatorBusinessKey]        NVARCHAR (400)  NOT NULL,
    [InstitutionBusinessKey]      NVARCHAR (400)  NULL,
    [LocationBusinessKey]         NVARCHAR (400)  NOT NULL,
    [OrganizationBusinessKey]     NVARCHAR (400)  NULL,
    [ReportingPeriodBusinessKey]  NVARCHAR (400)  NOT NULL,
    [ResultAreaBusinessKey]       NVARCHAR (400)  NULL,
    [StrategicElementBusinessKey] NVARCHAR (400)  NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Staging].[IndicatorValues])
    BEGIN
        INSERT INTO [Staging].[tmp_ms_xx_IndicatorValues] ([IndicatorValues_ID], [ActualDate], [ActualLabel], [ActualValue], [BusinessKey], [Notes], [AgeBandBusinessKey], [CommunityTypeBusinessKey], [DataVersionBusinessKey], [DonorBusinessKey], [FrameworkBusinessKey], [GenderBusinessKey], [GroupBusinessKey], [IndicatorBusinessKey], [InstitutionBusinessKey], [LocationBusinessKey], [OrganizationBusinessKey], [ReportingPeriodBusinessKey], [ResultAreaBusinessKey], [StrategicElementBusinessKey])
        SELECT [IndicatorValues_ID],
               [ActualDate],
               [ActualLabel],
               [ActualValue],
               [BusinessKey],
               [Notes],
               [AgeBandBusinessKey],
               [CommunityTypeBusinessKey],
               [DataVersionBusinessKey],
               [DonorBusinessKey],
               [FrameworkBusinessKey],
               [GenderBusinessKey],
               [GroupBusinessKey],
               [IndicatorBusinessKey],
               [InstitutionBusinessKey],
               [LocationBusinessKey],
               [OrganizationBusinessKey],
               [ReportingPeriodBusinessKey],
               [ResultAreaBusinessKey],
               [StrategicElementBusinessKey]
        FROM   [Staging].[IndicatorValues];
    END

DROP TABLE [Staging].[IndicatorValues];

EXECUTE sp_rename N'[Staging].[tmp_ms_xx_IndicatorValues]', N'IndicatorValues';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [Staging].[Location]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Staging].[tmp_ms_xx_Location] (
    [Location_ID]             INT             NULL,
    [BusinessKey]             NVARCHAR (400)  NOT NULL,
    [AreaKM]                  DECIMAL (18, 2) NULL,
    [Code]                    VARCHAR (50)    NOT NULL,
    [Density]                 VARCHAR (MAX)   NULL,
    [LocalName]               NVARCHAR (255)  NULL,
    [Name]                    VARCHAR (255)   NULL,
    [Population]              DECIMAL (18, 2) NULL,
    [ParentLocation_ID]       INT             NULL,
    [LocationTypeBusinessKey] NVARCHAR (400)  NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Staging].[Location])
    BEGIN
        INSERT INTO [Staging].[tmp_ms_xx_Location] ([Location_ID], [AreaKM], [BusinessKey], [Code], [Density], [LocalName], [Name], [ParentLocation_ID], [Population], [LocationTypeBusinessKey])
        SELECT [Location_ID],
               [AreaKM],
               [BusinessKey],
               [Code],
               [Density],
               [LocalName],
               [Name],
               [ParentLocation_ID],
               [Population],
               [LocationTypeBusinessKey]
        FROM   [Staging].[Location];
    END

DROP TABLE [Staging].[Location];

EXECUTE sp_rename N'[Staging].[tmp_ms_xx_Location]', N'Location';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [Staging].[Milestone]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Staging].[tmp_ms_xx_Milestone] (
    [MilestoneID]              INT             NULL,
    [BusinessKey]              NVARCHAR (400)  NOT NULL,
    [Baseline]                 DECIMAL (20, 5) NULL,
    [BaselineDate]             DATETIME        NOT NULL,
    [BaselineString]           VARCHAR (MAX)   NULL,
    [Code]                     VARCHAR (50)    NOT NULL,
    [LocalLongName]            NVARCHAR (500)  NULL,
    [LocalShortName]           NVARCHAR (50)   NULL,
    [LongName]                 VARCHAR (500)   NOT NULL,
    [Notes]                    NVARCHAR (MAX)  NULL,
    [ReleaseDate]              DATE            NULL,
    [ReportingDate]            DATE            NULL,
    [ShortName]                VARCHAR (50)    NOT NULL,
    [Target]                   DECIMAL (20, 5) NULL,
    [TargetDate]               DATETIME        NOT NULL,
    [TargetString]             VARCHAR (MAX)   NULL,
    [TextDescription]          VARCHAR (4000)  NULL,
    [UnitOfMeasure]            VARCHAR (50)    NOT NULL,
    [ActivityBusinessKey]      NVARCHAR (400)  NULL,
    [MilestoneTypeBusinessKey] NVARCHAR (400)  NOT NULL,
    [ProjectBusinessKey]       NVARCHAR (400)  NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Staging].[Milestone])
    BEGIN
        INSERT INTO [Staging].[tmp_ms_xx_Milestone] ([MilestoneID], [Baseline], [BaselineDate], [BaselineString], [BusinessKey], [Code], [LocalLongName], [LocalShortName], [LongName], [Notes], [ReleaseDate], [ReportingDate], [ShortName], [Target], [TargetDate], [TargetString], [TextDescription], [UnitOfMeasure], [ActivityBusinessKey], [MilestoneTypeBusinessKey], [ProjectBusinessKey])
        SELECT [MilestoneID],
               [Baseline],
               [BaselineDate],
               [BaselineString],
               [BusinessKey],
               [Code],
               [LocalLongName],
               [LocalShortName],
               [LongName],
               [Notes],
               [ReleaseDate],
               [ReportingDate],
               [ShortName],
               [Target],
               [TargetDate],
               [TargetString],
               [TextDescription],
               [UnitOfMeasure],
               [ActivityBusinessKey],
               [MilestoneTypeBusinessKey],
               [ProjectBusinessKey]
        FROM   [Staging].[Milestone];
    END

DROP TABLE [Staging].[Milestone];

EXECUTE sp_rename N'[Staging].[tmp_ms_xx_Milestone]', N'Milestone';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [Staging].[MilestoneValues]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Staging].[tmp_ms_xx_MilestoneValues] (
    [MilestoneValues_ID]          INT             NULL,
    [BusinessKey]                 NVARCHAR (400)  NOT NULL,
    [ActualDate]                  DATE            NULL,
    [ActualLabel]                 VARCHAR (50)    NOT NULL,
    [ActualValue]                 DECIMAL (20, 5) NULL,
    [GroupVersion]                INT             NOT NULL,
    [Notes]                       VARCHAR (MAX)   NULL,
    [AgeBandBusinessKey]          NVARCHAR (400)  NULL,
    [CommunityTypeBusinessKey]    NVARCHAR (400)  NULL,
    [DataVersionBusinessKey]      NVARCHAR (400)  NOT NULL,
    [DonorBusinessKey]            NVARCHAR (400)  NULL,
    [FrameworkBusinessKey]        NVARCHAR (400)  NULL,
    [GenderBusinessKey]           NVARCHAR (400)  NULL,
    [GroupBusinessKey]            NVARCHAR (400)  NULL,
    [InstitutionBusinessKey]      NVARCHAR (400)  NULL,
    [LocationBusinessKey]         NVARCHAR (400)  NOT NULL,
    [MilestoneBusinessKey]        NVARCHAR (400)  NOT NULL,
    [OrganizationBusinessKey]     NVARCHAR (400)  NULL,
    [ReportingPeriodBusinessKey]  NVARCHAR (400)  NOT NULL,
    [ResultAreaBusinessKey]       NVARCHAR (400)  NULL,
    [StrategicElementBusinessKey] NVARCHAR (400)  NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Staging].[MilestoneValues])
    BEGIN
        INSERT INTO [Staging].[tmp_ms_xx_MilestoneValues] ([MilestoneValues_ID], [ActualDate], [ActualLabel], [ActualValue], [BusinessKey], [GroupVersion], [Notes], [AgeBandBusinessKey], [CommunityTypeBusinessKey], [DataVersionBusinessKey], [DonorBusinessKey], [FrameworkBusinessKey], [GenderBusinessKey], [GroupBusinessKey], [InstitutionBusinessKey], [LocationBusinessKey], [MilestoneBusinessKey], [OrganizationBusinessKey], [ReportingPeriodBusinessKey], [ResultAreaBusinessKey], [StrategicElementBusinessKey])
        SELECT [MilestoneValues_ID],
               [ActualDate],
               [ActualLabel],
               [ActualValue],
               [BusinessKey],
               [GroupVersion],
               [Notes],
               [AgeBandBusinessKey],
               [CommunityTypeBusinessKey],
               [DataVersionBusinessKey],
               [DonorBusinessKey],
               [FrameworkBusinessKey],
               [GenderBusinessKey],
               [GroupBusinessKey],
               [InstitutionBusinessKey],
               [LocationBusinessKey],
               [MilestoneBusinessKey],
               [OrganizationBusinessKey],
               [ReportingPeriodBusinessKey],
               [ResultAreaBusinessKey],
               [StrategicElementBusinessKey]
        FROM   [Staging].[MilestoneValues];
    END

DROP TABLE [Staging].[MilestoneValues];

EXECUTE sp_rename N'[Staging].[tmp_ms_xx_MilestoneValues]', N'MilestoneValues';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [Staging].[Organization]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Staging].[tmp_ms_xx_Organization] (
    [Organization_ID]             INT            NULL,
    [BusinessKey]                 NVARCHAR (400) NOT NULL,
    [Code]                        VARCHAR (50)   NULL,
    [LocalLongName]               NVARCHAR (500) NULL,
    [LocalShortName]              NVARCHAR (50)  NULL,
    [LongName]                    VARCHAR (500)  NOT NULL,
    [ShortName]                   VARCHAR (50)   NOT NULL,
    [ParentOrganization_ID]       INT            NULL,
    [OrganizationTypeBusinessKey] NVARCHAR (400) NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Staging].[Organization])
    BEGIN
        INSERT INTO [Staging].[tmp_ms_xx_Organization] ([Organization_ID], [BusinessKey], [Code], [LocalLongName], [LocalShortName], [LongName], [ParentOrganization_ID], [ShortName], [OrganizationTypeBusinessKey])
        SELECT [Organization_ID],
               [BusinessKey],
               [Code],
               [LocalLongName],
               [LocalShortName],
               [LongName],
               [ParentOrganization_ID],
               [ShortName],
               [OrganizationTypeBusinessKey]
        FROM   [Staging].[Organization];
    END

DROP TABLE [Staging].[Organization];

EXECUTE sp_rename N'[Staging].[tmp_ms_xx_Organization]', N'Organization';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [Staging].[Sector]...';


GO
ALTER TABLE [Staging].[Sector] ALTER COLUMN [ProgrammeBusinessKey] NVARCHAR (400) NULL;


GO
PRINT N'Creating [Staging].[TablesToExport]...';


GO
CREATE TABLE [Staging].[TablesToExport] (
    [TablesToExport_ID] INT           NULL,
    [Table_Name]        VARCHAR (255) NOT NULL,
    [Table_Schema]      VARCHAR (255) NOT NULL
);


GO
PRINT N'Update complete.';


GO