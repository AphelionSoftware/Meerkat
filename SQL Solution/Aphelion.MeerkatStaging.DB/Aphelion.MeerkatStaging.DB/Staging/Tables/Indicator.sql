CREATE TABLE [Staging].[Indicator] (
    [IndicatorID]              INT             NULL,
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
    [IndicatorTypeBusinessKey] NVARCHAR (4000) NOT NULL,
    [OutcomeBusinessKey]       NVARCHAR (4000) NULL,
    [OutputBusinessKey]        NVARCHAR (4000) NULL,
    [ProgrammeBusinessKey]     NVARCHAR (4000) NULL,
    [ProjectBusinessKey]       NVARCHAR (4000) NULL,
    [SectorBusinessKey]        NVARCHAR (4000) NULL,
    [SubOutputBusinessKey]     NVARCHAR (4000) NULL,
    [SubSectorBusinessKey]     NVARCHAR (4000) NULL
);



