CREATE TABLE [Staging].[Milestone] (
    [MilestoneID]              INT             NULL,
    [Baseline]                 DECIMAL (20, 5) NULL,
    [BaselineDate]             DATETIME        NOT NULL,
    [BaselineString]           VARCHAR (MAX)   NULL,
    [BusinessKey]              NVARCHAR (4000) NOT NULL,
    [Code]                     VARCHAR (50)    NOT NULL,
    [LongName]                 VARCHAR (500)   NOT NULL,
    [Notes]                    NVARCHAR (MAX)  NULL,
    [ReleaseDate]              DATE            NULL,
    [ReportingDate]            DATE            NULL,
    [ShortName]                VARCHAR (50)    NOT NULL,
    [Target]                   DECIMAL (20, 5) NULL,
    [TargetDate]               DATETIME        NOT NULL,
    [TargetString]             VARCHAR (MAX)   NULL,
    [TextDescription]          VARCHAR (MAX)   NULL,
    [UnitOfMeasure]            VARCHAR (50)    NOT NULL,
    [ActivityBusinessKey]      NVARCHAR (4000) NULL,
    [MilestoneTypeBusinessKey] NVARCHAR (4000) NOT NULL,
    [ProjectBusinessKey]       NVARCHAR (4000) NULL
);



