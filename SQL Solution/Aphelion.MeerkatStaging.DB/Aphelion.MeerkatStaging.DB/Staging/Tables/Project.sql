CREATE TABLE [Staging].[Project] (
    [ProjectID]            INT             NULL,
    [BusinessKey]          NVARCHAR (4000) NOT NULL,
    [Code]                 VARCHAR (50)    NOT NULL,
    [LongName]             VARCHAR (255)   NOT NULL,
    [ProjectSiteName]      VARCHAR (255)   NOT NULL,
    [ProjectStartDate]     DATETIME        NOT NULL,
    [ShortName]            NVARCHAR (255)  NOT NULL,
    [TextDescription]      VARCHAR (MAX)   NOT NULL,
    [OutcomeBusinessKey]   NVARCHAR (4000) NULL,
    [ProgrammeBusinessKey] NVARCHAR (4000) NULL,
    [SectorBusinessKey]    NVARCHAR (4000) NULL,
    [SubSectorBusinessKey] NVARCHAR (4000) NULL
);



