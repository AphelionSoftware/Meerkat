CREATE TABLE [Staging].[PeopleReachedValues] (
    [PeopleReachedValuesID]                INT             NULL,
    [Notes]                                NVARCHAR (MAX)  NULL,
    [NumberReached]                        INT             NOT NULL,
    [ActivityBusinessKey]                  NVARCHAR (4000) NULL,
    [AgeBandBusinessKey]                   NVARCHAR (4000) NULL,
    [CommunityTypeBusinessKey]             NVARCHAR (4000) NULL,
    [DataVersionBusinessKey]               NVARCHAR (4000) NOT NULL,
    [DonorBusinessKey]                     NVARCHAR (4000) NULL,
    [FrameworkBusinessKey]                 NVARCHAR (4000) NULL,
    [FrameworkDetail_IndicatorBusinessKey] NVARCHAR (4000) NULL,
    [GenderBusinessKey]                    NVARCHAR (4000) NULL,
    [GroupBusinessKey]                     NVARCHAR (4000) NULL,
    [InstitutionBusinessKey]               NVARCHAR (4000) NULL,
    [LocationBusinessKey]                  NVARCHAR (4000) NOT NULL,
    [OutcomeBusinessKey]                   NVARCHAR (4000) NULL,
    [OutputBusinessKey]                    NVARCHAR (4000) NULL,
    [ProgrammeBusinessKey]                 NVARCHAR (4000) NULL,
    [ProjectBusinessKey]                   NVARCHAR (4000) NULL,
    [ReportingPeriodBusinessKey]           NVARCHAR (4000) NOT NULL,
    [ResultAreaBusinessKey]                NVARCHAR (4000) NULL,
    [SectorBusinessKey]                    NVARCHAR (4000) NULL,
    [StatusTypeBusinessKey]                NVARCHAR (4000) NULL,
    [StrategicElementBusinessKey]          NVARCHAR (4000) NULL,
    [SubOutputBusinessKey]                 NVARCHAR (4000) NULL,
    [SubSectorBusinessKey]                 NVARCHAR (4000) NULL
);





