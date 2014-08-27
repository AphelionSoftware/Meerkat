﻿/*
Deployment script for MeerkatErrors

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MeerkatErrors"
:setvar DefaultFilePrefix "MeerkatErrors"
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
PRINT N'Altering [Errors].[CustomReport_Indicator]...';


GO
ALTER TABLE [Errors].[CustomReport_Indicator] ALTER COLUMN [CustomReportBusinessKey] NVARCHAR (400) NOT NULL;

ALTER TABLE [Errors].[CustomReport_Indicator] ALTER COLUMN [IndicatorBusinessKey] NVARCHAR (400) NOT NULL;


GO
/*
The column [Errors].[Facility].[LocationBusinessKey] on table [Errors].[Facility] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [Errors].[Facility]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Errors].[tmp_ms_xx_Facility] (
    [QueueID]                 INT            NOT NULL,
    [SSISErrorCode]           INT            NOT NULL,
    [SSISErrorColumn]         INT            NOT NULL,
    [PackageName]             VARCHAR (255)  NOT NULL,
    [ErrorType]               VARCHAR (255)  NOT NULL,
    [Facility_ID]             INT            NULL,
    [BusinessKey]             NVARCHAR (400) NOT NULL,
    [Code]                    VARCHAR (50)   NOT NULL,
    [FacilityTypeBusinessKey] NVARCHAR (400) NOT NULL,
    [InstitutionBusinessKey]  NVARCHAR (400) NULL,
    [LocalName]               NVARCHAR (255) NULL,
    [LocationBusinessKey]     NVARCHAR (400) NOT NULL,
    [Name]                    VARCHAR (255)  NOT NULL,
    [FacilityType_ID]         INT            NULL,
    [Institution_ID]          INT            NULL,
    [Location_ID]             INT            NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Errors].[Facility])
    BEGIN
        INSERT INTO [Errors].[tmp_ms_xx_Facility] ([QueueID], [SSISErrorCode], [SSISErrorColumn], [PackageName], [ErrorType], [Facility_ID], [BusinessKey], [Code], [FacilityTypeBusinessKey], [InstitutionBusinessKey], [LocalName], [Name], [FacilityType_ID], [Institution_ID])
        SELECT [QueueID],
               [SSISErrorCode],
               [SSISErrorColumn],
               [PackageName],
               [ErrorType],
               [Facility_ID],
               [BusinessKey],
               [Code],
               [FacilityTypeBusinessKey],
               [InstitutionBusinessKey],
               [LocalName],
               [Name],
               [FacilityType_ID],
               [Institution_ID]
        FROM   [Errors].[Facility];
    END

DROP TABLE [Errors].[Facility];

EXECUTE sp_rename N'[Errors].[tmp_ms_xx_Facility]', N'Facility';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [Errors].[Project]...';


GO
ALTER TABLE [Errors].[Project] ALTER COLUMN [ProjectTypeBusinessKey] NVARCHAR (400) NULL;


GO
PRINT N'Altering [Errors].[Sector]...';


GO
ALTER TABLE [Errors].[Sector] ALTER COLUMN [ProgrammeBusinessKey] NVARCHAR (400) NULL;


GO
PRINT N'Update complete.';


GO