CREATE TABLE [Staging].[StatusValues] (
    [StatusValuesID]             INT             NULL,
    [Notes]                      NVARCHAR (MAX)  NULL,
    [ActivityBusinessKey]        NVARCHAR (4000) NULL,
    [DataVersionBusinessKey]     NVARCHAR (4000) NOT NULL,
    [IndicatorBusinessKey]       NVARCHAR (4000) NULL,
    [LocationBusinessKey]        NVARCHAR (4000) NOT NULL,
    [MilestoneBusinessKey]       NVARCHAR (4000) NULL,
    [OutcomeBusinessKey]         NVARCHAR (4000) NULL,
    [OutputBusinessKey]          NVARCHAR (4000) NULL,
    [ProgrammeBusinessKey]       NVARCHAR (4000) NULL,
    [ProjectBusinessKey]         NVARCHAR (4000) NULL,
    [ReportingPeriodBusinessKey] NVARCHAR (4000) NOT NULL,
    [SectorBusinessKey]          NVARCHAR (4000) NULL,
    [StatusTypeBusinessKey]      NVARCHAR (4000) NULL,
    [SubOutputBusinessKey]       NVARCHAR (4000) NULL,
    [SubSectorBusinessKey]       NVARCHAR (4000) NULL
);





