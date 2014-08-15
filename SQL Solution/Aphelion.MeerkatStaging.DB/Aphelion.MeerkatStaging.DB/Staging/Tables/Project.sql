CREATE TABLE [Staging].[Project] (
    [ProjectID]            INT            NULL,
    [BusinessKey]          NVARCHAR (400) NOT NULL,
    [Code]                 VARCHAR (50)   NOT NULL,
    [LongName]             VARCHAR (255)  NOT NULL,
    [ProjectSiteName]      VARCHAR (255)  NOT NULL,
    [ProjectStartDate]     DATETIME       NOT NULL,
    [ShortName]            VARCHAR (255)  NOT NULL,
    [TextDescription]      VARCHAR (MAX)  NOT NULL,
    [OutcomeBusinessKey]   NVARCHAR (400) NULL,
    [ProgrammeBusinessKey] NVARCHAR (400) NULL,
    [SectorBusinessKey]    NVARCHAR (400) NULL,
    [SubSectorBusinessKey] NVARCHAR (400) NULL
);







