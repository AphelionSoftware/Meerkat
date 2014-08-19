CREATE TABLE [app].[Sector] (
    [Sector_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NULL,
    [LongName]        VARCHAR (500)  NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Programme_ID]    INT            NOT NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (MAX)  NULL,
    [Active]          INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Sector_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Sector_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Sector_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Sector_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Sector_] PRIMARY KEY CLUSTERED ([Sector_ID] ASC),
    CONSTRAINT [FK_Sector_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Sector_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID]),
    UNIQUE NONCLUSTERED ([ShortName] ASC)
);












GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_vwPeopleReached_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SubSector_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SubOutput_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_StrategicElement_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_StatusType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Sector_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Role_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_ResultArea_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_ReportingPeriod_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_ProjectType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Project_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Programme_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Person_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Output_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Outcome_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_OrganizationType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Organization_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_MilestoneValues_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_MilestoneType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Milestone_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_LocationType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Location_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Institution_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_IndicatorValues_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_IndicatorType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Indicator_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Impact_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Group_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Gender_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_FrameworkDetail_Indicator_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_FrameworkDetail_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Framework_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_FacilityType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Facility_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DonorReport_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Donor_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DimSubOutput_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DimOutput_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DimOutcome_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DataVersion_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DataSource_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_CustomReportType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_CustomReport_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_CommunityType_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_AgeBand_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Activity_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));

