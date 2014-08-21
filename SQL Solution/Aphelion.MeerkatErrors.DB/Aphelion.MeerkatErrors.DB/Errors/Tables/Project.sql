CREATE TABLE [Errors].[Project] (
    [QueueID]                INT            NOT NULL,
    [SSISErrorCode]          INT            NOT NULL,
    [SSISErrorColumn]        INT            NOT NULL,
    [PackageName]            VARCHAR (255)  NOT NULL,
    [ErrorType]              VARCHAR (255)  NOT NULL,
    [ProjectID]              INT            NULL,
    [BusinessKey]            NVARCHAR (400) NOT NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [LocalLongName]          NVARCHAR (500) NULL,
    [LocalShortName]         NVARCHAR (50)  NULL,
    [LongName]               VARCHAR (500)  NOT NULL,
    [OutcomeBusinessKey]     NVARCHAR (400) NULL,
    [ProgrammeBusinessKey]   NVARCHAR (400) NULL,
    [ProjectSiteName]        VARCHAR (255)  NOT NULL,
    [ProjectStartDate]       DATETIME       NOT NULL,
    [ProjectTypeBusinessKey] NVARCHAR (400) NOT NULL,
    [SectorBusinessKey]      NVARCHAR (400) NULL,
    [ShortName]              VARCHAR (50)   NOT NULL,
    [SubSectorBusinessKey]   NVARCHAR (400) NULL,
    [TextDescription]        VARCHAR (4000) NULL,
    [Outcome_ID]             INT            NULL,
    [Programme_ID]           INT            NULL,
    [ProjectType_ID]         INT            NULL,
    [Sector_ID]              INT            NULL,
    [SubSector_ID]           INT            NULL
);







