CREATE TABLE [Staging].[Indicator] (
    [IndicatorID]                    INT             NULL,
    [BusinessKey]                    NVARCHAR (400)  NOT NULL,
    [Baseline]                       DECIMAL (20, 5) NULL,
    [BaselineDate]                   DATETIME        NOT NULL,
    [BaselineString]                 VARCHAR (MAX)   NULL,
    [Code]                           VARCHAR (50)    NOT NULL,
    [LocalLongName]                  NVARCHAR (500)  NULL,
    [LocalShortName]                 NVARCHAR (50)   NULL,
    [LongName]                       VARCHAR (500)   NOT NULL,
    [Notes]                          NVARCHAR (MAX)  NULL,
    [ReleaseDate]                    DATE            NULL,
    [ReportingDate]                  DATE            NULL,
    [ShortName]                      VARCHAR (50)    NOT NULL,
    [Target]                         DECIMAL (20, 5) NULL,
    [TargetDate]                     DATETIME        NOT NULL,
    [TargetString]                   VARCHAR (MAX)   NULL,
    [TextDescription]                VARCHAR (4000)  NULL,
    [UnitOfMeasure]                  VARCHAR (50)    NOT NULL,
    [IndicatorSimpleTypeBusinessKey] NVARCHAR (400)  NULL,
    [IndicatorTypeBusinessKey]       NVARCHAR (400)  NOT NULL,
    [OutcomeBusinessKey]             NVARCHAR (400)  NULL,
    [OutputBusinessKey]              NVARCHAR (400)  NULL,
    [ProgrammeBusinessKey]           NVARCHAR (400)  NULL,
    [ProjectBusinessKey]             NVARCHAR (400)  NULL,
    [SectorBusinessKey]              NVARCHAR (400)  NULL,
    [SubOutputBusinessKey]           NVARCHAR (400)  NULL,
    [SubSectorBusinessKey]           NVARCHAR (400)  NULL
);











