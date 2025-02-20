﻿CREATE TABLE [Errors].[Milestone] (
    [QueueID]                  INT             NOT NULL,
    [SSISErrorCode]            INT             NOT NULL,
    [SSISErrorColumn]          INT             NOT NULL,
    [PackageName]              VARCHAR (255)   NOT NULL,
    [ErrorType]                VARCHAR (255)   NOT NULL,
    [MilestoneID]              INT             NULL,
    [ActivityBusinessKey]      NVARCHAR (400)  NULL,
    [Baseline]                 DECIMAL (20, 5) NULL,
    [BaselineDate]             DATETIME        NOT NULL,
    [BaselineString]           VARCHAR (MAX)   NULL,
    [BusinessKey]              NVARCHAR (400)  NOT NULL,
    [Code]                     VARCHAR (50)    NOT NULL,
    [LocalLongName]            NVARCHAR (500)  NULL,
    [LocalShortName]           NVARCHAR (50)   NULL,
    [LongName]                 VARCHAR (500)   NOT NULL,
    [MilestoneTypeBusinessKey] NVARCHAR (400)  NOT NULL,
    [Notes]                    NVARCHAR (MAX)  NULL,
    [ProjectBusinessKey]       NVARCHAR (400)  NULL,
    [ReleaseDate]              DATE            NULL,
    [ReportingDate]            DATE            NULL,
    [ShortName]                VARCHAR (50)    NOT NULL,
    [Target]                   DECIMAL (20, 5) NULL,
    [TargetDate]               DATETIME        NOT NULL,
    [TargetString]             VARCHAR (MAX)   NULL,
    [TextDescription]          VARCHAR (4000)  NULL,
    [UnitOfMeasure]            VARCHAR (50)    NOT NULL,
    [Activity_ID]              INT             NULL,
    [MilestoneTypeID]          INT             NULL,
    [ProjectID]                INT             NULL
);



