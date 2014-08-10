﻿CREATE TABLE [Errors].[StatusValues] (
    [QueueID]                    INT            NOT NULL,
    [SSISErrorCode]              INT            NOT NULL,
    [SSISErrorColumn]            INT            NOT NULL,
    [PackageName]                VARCHAR (255)  NOT NULL,
    [ErrorType]                  VARCHAR (255)  NOT NULL,
    [StatusValuesID]             INT            NULL,
    [ActivityBusinessKey]        NVARCHAR (400) NULL,
    [DataVersionBusinessKey]     NVARCHAR (400) NOT NULL,
    [IndicatorBusinessKey]       NVARCHAR (400) NULL,
    [LocationBusinessKey]        NVARCHAR (400) NOT NULL,
    [MilestoneBusinessKey]       NVARCHAR (400) NULL,
    [Notes]                      NVARCHAR (MAX) NULL,
    [OutcomeBusinessKey]         NVARCHAR (400) NULL,
    [OutputBusinessKey]          NVARCHAR (400) NULL,
    [ProgrammeBusinessKey]       NVARCHAR (400) NULL,
    [ProjectBusinessKey]         NVARCHAR (400) NULL,
    [ReportingPeriodBusinessKey] NVARCHAR (400) NOT NULL,
    [SectorBusinessKey]          NVARCHAR (400) NULL,
    [StatusTypeBusinessKey]      NVARCHAR (400) NULL,
    [SubOutputBusinessKey]       NVARCHAR (400) NULL,
    [SubSectorBusinessKey]       NVARCHAR (400) NULL,
    [Activity_ID]                INT            NULL,
    [DataVersionID]              INT            NULL,
    [Indicator_ID]               INT            NULL,
    [LocationID]                 INT            NULL,
    [Milestone_ID]               INT            NULL,
    [Outcome_ID]                 INT            NULL,
    [Output_ID]                  INT            NULL,
    [Programme_ID]               INT            NULL,
    [ProjectID]                  INT            NULL,
    [ReportingPeriodID]          INT            NULL,
    [Sector_ID]                  INT            NULL,
    [StatusTypeID]               INT            NULL,
    [SubOutput_ID]               INT            NULL,
    [SubSector_ID]               INT            NULL
);

