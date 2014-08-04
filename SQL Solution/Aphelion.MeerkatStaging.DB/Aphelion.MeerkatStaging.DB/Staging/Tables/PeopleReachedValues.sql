CREATE TABLE [Staging].[PeopleReachedValues] (
    [PeopleReachedValuesID]                INT            NULL,
    [Notes]                                NVARCHAR (MAX) NULL,
    [NumberReached]                        INT            NOT NULL,
    [ActivityBusinessKey]                  NVARCHAR (400) NULL,
    [AgeBandBusinessKey]                   NVARCHAR (400) NULL,
    [CommunityTypeBusinessKey]             NVARCHAR (400) NULL,
    [DataVersionBusinessKey]               NVARCHAR (400) NOT NULL,
    [DonorBusinessKey]                     NVARCHAR (400) NULL,
    [FrameworkBusinessKey]                 NVARCHAR (400) NULL,
    [FrameworkDetail_IndicatorBusinessKey] NVARCHAR (400) NULL,
    [GenderBusinessKey]                    NVARCHAR (400) NULL,
    [GroupBusinessKey]                     NVARCHAR (400) NULL,
    [InstitutionBusinessKey]               NVARCHAR (400) NULL,
    [LocationBusinessKey]                  NVARCHAR (400) NOT NULL,
    [OutcomeBusinessKey]                   NVARCHAR (400) NULL,
    [OutputBusinessKey]                    NVARCHAR (400) NULL,
    [ProgrammeBusinessKey]                 NVARCHAR (400) NULL,
    [ProjectBusinessKey]                   NVARCHAR (400) NULL,
    [ReportingPeriodBusinessKey]           NVARCHAR (400) NOT NULL,
    [ResultAreaBusinessKey]                NVARCHAR (400) NULL,
    [SectorBusinessKey]                    NVARCHAR (400) NULL,
    [StatusTypeBusinessKey]                NVARCHAR (400) NULL,
    [StrategicElementBusinessKey]          NVARCHAR (400) NULL,
    [SubOutputBusinessKey]                 NVARCHAR (400) NULL,
    [SubSectorBusinessKey]                 NVARCHAR (400) NULL
);







