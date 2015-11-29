CREATE TABLE [Staging].[StatusValues] (
    [StatusValuesID]             INT            NULL,
    [Notes]                      NVARCHAR (MAX) NULL,
    [ActivityBusinessKey]        NVARCHAR (400) NULL,
    [DataVersionBusinessKey]     NVARCHAR (400) NOT NULL,
    [IndicatorBusinessKey]       NVARCHAR (400) NULL,
    [LocationBusinessKey]        NVARCHAR (400) NOT NULL,
    [MilestoneBusinessKey]       NVARCHAR (400) NULL,
    [OutcomeBusinessKey]         NVARCHAR (400) NULL,
    [OutputBusinessKey]          NVARCHAR (400) NULL,
    [ProgrammeBusinessKey]       NVARCHAR (400) NULL,
    [ProjectBusinessKey]         NVARCHAR (400) NULL,
    [ReportingPeriodBusinessKey] NVARCHAR (400) NOT NULL,
    [SectorBusinessKey]          NVARCHAR (400) NULL,
    [StatusTypeBusinessKey]      NVARCHAR (400) NULL,
    [SubOutputBusinessKey]       NVARCHAR (400) NULL,
    [SubSectorBusinessKey]       NVARCHAR (400) NULL
);







