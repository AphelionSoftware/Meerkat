﻿CREATE TABLE [Staging].[IndicatorValues] (
    [IndicatorValues_ID]         INT             NULL,
    [BusinessKey]                NVARCHAR (400)  NOT NULL,
    [ActualDate]                 DATE            NULL,
    [ActualLabel]                VARCHAR (50)    NOT NULL,
    [ActualValue]                DECIMAL (20, 5) NULL,
    [Notes]                      VARCHAR (MAX)   NULL,
    [AgeBandBusinessKey]         NVARCHAR (400)  NULL,
    [CommunityTypeBusinessKey]   NVARCHAR (400)  NULL,
    [DataVersionBusinessKey]     NVARCHAR (400)  NOT NULL,
    [DonorBusinessKey]           NVARCHAR (400)  NULL,
    [FrameworkBusinessKey]       NVARCHAR (400)  NULL,
    [GenderBusinessKey]          NVARCHAR (400)  NULL,
    [GroupBusinessKey]           NVARCHAR (400)  NULL,
    [IndicatorBusinessKey]       NVARCHAR (400)  NOT NULL,
    [InstitutionBusinessKey]     NVARCHAR (400)  NULL,
    [LocationBusinessKey]        NVARCHAR (400)  NOT NULL,
    [OrganizationBusinessKey]    NVARCHAR (400)  NULL,
    [ReportingPeriodBusinessKey] NVARCHAR (400)  NOT NULL,
    [StructureBusinessKey]       NVARCHAR (400)  NULL
);









