CREATE TABLE [Staging].[Milestone] (
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









