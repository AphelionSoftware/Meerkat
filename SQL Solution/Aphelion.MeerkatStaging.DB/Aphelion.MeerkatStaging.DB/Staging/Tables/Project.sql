CREATE TABLE [Staging].[Project] (
    [ProjectID]              INT            NULL,
    [BusinessKey]            NVARCHAR (400) NOT NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [LocalLongName]          NVARCHAR (500) NULL,
    [LocalShortName]         NVARCHAR (50)  NULL,
    [LongName]               VARCHAR (500)  NOT NULL,
    [ProjectSiteName]        VARCHAR (255)  NOT NULL,
    [ProjectStartDate]       DATETIME       NOT NULL,
    [ShortName]              VARCHAR (50)   NOT NULL,
    [TextDescription]        VARCHAR (4000) NULL,
    [OutcomeBusinessKey]     NVARCHAR (400) NULL,
    [ProgrammeBusinessKey]   NVARCHAR (400) NULL,
    [ProjectTypeBusinessKey] NVARCHAR (400) NOT NULL,
    [SectorBusinessKey]      NVARCHAR (400) NULL,
    [SubSectorBusinessKey]   NVARCHAR (400) NULL
);











