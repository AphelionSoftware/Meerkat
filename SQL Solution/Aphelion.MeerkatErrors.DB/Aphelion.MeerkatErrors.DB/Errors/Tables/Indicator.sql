﻿CREATE TABLE [Errors].[Indicator] (
    [QueueID]                        INT             NOT NULL,
    [SSISErrorCode]                  INT             NOT NULL,
    [SSISErrorColumn]                INT             NOT NULL,
    [PackageName]                    VARCHAR (255)   NOT NULL,
    [ErrorType]                      VARCHAR (255)   NOT NULL,
    [IndicatorID]                    INT             NULL,
    [Baseline]                       DECIMAL (20, 5) NULL,
    [BaselineDate]                   DATETIME        NOT NULL,
    [BaselineString]                 VARCHAR (MAX)   NULL,
    [BusinessKey]                    NVARCHAR (400)  NOT NULL,
    [Code]                           VARCHAR (50)    NOT NULL,
    [IndicatorSimpleTypeBusinessKey] NVARCHAR (400)  NULL,
    [IndicatorTypeBusinessKey]       NVARCHAR (400)  NOT NULL,
    [LocalLongName]                  NVARCHAR (500)  NULL,
    [LocalShortName]                 NVARCHAR (50)   NULL,
    [LongName]                       VARCHAR (500)   NOT NULL,
    [Notes]                          NVARCHAR (MAX)  NULL,
    [OutcomeBusinessKey]             NVARCHAR (400)  NULL,
    [OutputBusinessKey]              NVARCHAR (400)  NULL,
    [ProgrammeBusinessKey]           NVARCHAR (400)  NULL,
    [ProjectBusinessKey]             NVARCHAR (400)  NULL,
    [ReleaseDate]                    DATE            NULL,
    [ReportingDate]                  DATE            NULL,
    [ResultAreaBusinessKey]          NVARCHAR (400)  NULL,
    [SectorBusinessKey]              NVARCHAR (400)  NULL,
    [ShortName]                      VARCHAR (50)    NOT NULL,
    [StrategicElementBusinessKey]    NVARCHAR (400)  NULL,
    [SubOutputBusinessKey]           NVARCHAR (400)  NULL,
    [SubSectorBusinessKey]           NVARCHAR (400)  NULL,
    [Target]                         DECIMAL (20, 5) NULL,
    [TargetDate]                     DATETIME        NOT NULL,
    [TargetString]                   VARCHAR (MAX)   NULL,
    [TextDescription]                VARCHAR (4000)  NULL,
    [UnitOfMeasure]                  VARCHAR (50)    NOT NULL,
    [IndicatorSimpleType_ID]         INT             NULL,
    [IndicatorType_ID]               INT             NULL,
    [Outcome_ID]                     INT             NULL,
    [Output_ID]                      INT             NULL,
    [Programme_ID]                   INT             NULL,
    [ProjectID]                      INT             NULL,
    [ResultArea_ID]                  INT             NULL,
    [Sector_ID]                      INT             NULL,
    [SubOutput_ID]                   INT             NULL,
    [SubSector_ID]                   INT             NULL
);









