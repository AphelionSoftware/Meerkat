CREATE TABLE [Staging].[IndicatorValues] (
    [IndicatorValues_ID]          INT             NULL,
    [ActualDate]                  DATE            NULL,
    [ActualLabel]                 VARCHAR (50)    NOT NULL,
    [ActualValue]                 DECIMAL (20, 5) NULL,
    [BusinessKey]                 NVARCHAR (4000) NOT NULL,
    [Notes]                       VARCHAR (MAX)   NULL,
    [AgeBandBusinessKey]          NVARCHAR (4000) NULL,
    [CommunityTypeBusinessKey]    NVARCHAR (4000) NULL,
    [DataVersionBusinessKey]      NVARCHAR (4000) NOT NULL,
    [DonorBusinessKey]            NVARCHAR (4000) NULL,
    [FrameworkBusinessKey]        NVARCHAR (4000) NULL,
    [GenderBusinessKey]           NVARCHAR (4000) NULL,
    [GroupBusinessKey]            NVARCHAR (4000) NULL,
    [IndicatorBusinessKey]        NVARCHAR (4000) NOT NULL,
    [InstitutionBusinessKey]      NVARCHAR (4000) NULL,
    [LocationBusinessKey]         NVARCHAR (4000) NOT NULL,
    [OrganizationBusinessKey]     NVARCHAR (4000) NULL,
    [ReportingPeriodBusinessKey]  NVARCHAR (4000) NOT NULL,
    [ResultAreaBusinessKey]       NVARCHAR (4000) NULL,
    [StrategicElementBusinessKey] NVARCHAR (4000) NULL
);



