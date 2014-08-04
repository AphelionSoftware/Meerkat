CREATE TABLE [Staging].[MilestoneValues] (
    [MilestoneValues_ID]          INT             NULL,
    [ActualDate]                  DATE            NULL,
    [ActualLabel]                 VARCHAR (50)    NOT NULL,
    [ActualValue]                 DECIMAL (20, 5) NULL,
    [BusinessKey]                 NVARCHAR (400)  NOT NULL,
    [GroupVersion]                INT             NOT NULL,
    [Notes]                       VARCHAR (MAX)   NULL,
    [AgeBandBusinessKey]          NVARCHAR (400)  NULL,
    [CommunityTypeBusinessKey]    NVARCHAR (400)  NULL,
    [DataVersionBusinessKey]      NVARCHAR (400)  NOT NULL,
    [DonorBusinessKey]            NVARCHAR (400)  NULL,
    [FrameworkBusinessKey]        NVARCHAR (400)  NULL,
    [GenderBusinessKey]           NVARCHAR (400)  NULL,
    [GroupBusinessKey]            NVARCHAR (400)  NULL,
    [InstitutionBusinessKey]      NVARCHAR (400)  NULL,
    [LocationBusinessKey]         NVARCHAR (400)  NOT NULL,
    [MilestoneBusinessKey]        NVARCHAR (400)  NOT NULL,
    [OrganizationBusinessKey]     NVARCHAR (400)  NULL,
    [ReportingPeriodBusinessKey]  NVARCHAR (400)  NOT NULL,
    [ResultAreaBusinessKey]       NVARCHAR (400)  NULL,
    [StrategicElementBusinessKey] NVARCHAR (400)  NULL
);





