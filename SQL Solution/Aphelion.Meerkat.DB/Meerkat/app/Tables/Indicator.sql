CREATE TABLE [app].[Indicator] (
    [IndicatorID]            INT             IDENTITY (1, 1) NOT NULL,
    [LongName]               VARCHAR (500)   NOT NULL,
    [TextDescription]        VARCHAR (4000)  NULL,
    [Baseline]               DECIMAL (20, 5) NULL,
    [BaselineString]         VARCHAR (MAX)   NULL,
    [BaselineDate]           DATETIME        NOT NULL,
    [Target]                 DECIMAL (20, 5) NULL,
    [TargetString]           VARCHAR (MAX)   NULL,
    [TargetDate]             DATETIME        NOT NULL,
    [ReleaseDate]            DATE            NULL,
    [ReportingDate]          DATE            NULL,
    [Output_ID]              INT             NULL,
    [Outcome_ID]             INT             NULL,
    [BusinessKey]            NVARCHAR (400)  NOT NULL,
    [Notes]                  NVARCHAR (MAX)  NULL,
    [Code]                   VARCHAR (50)    NOT NULL,
    [IndicatorType_ID]       INT             NOT NULL,
    [SubOutput_ID]           INT             NULL,
    [ShortName]              VARCHAR (50)    NOT NULL,
    [BaselineDate_ID]        AS              (CONVERT([int],CONVERT([varchar](8),[BaselineDate],(112)))),
    [TargetDate_ID]          AS              (CONVERT([int],CONVERT([varchar](8),[TargetDate],(112)))),
    [UnitOfMeasure]          VARCHAR (50)    NOT NULL,
    [Active]                 INT             CONSTRAINT [DF_Indicator_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]          VARCHAR (255)   CONSTRAINT [DF_Indicator_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]          DATETIME        CONSTRAINT [DF_Indicator_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]         VARCHAR (255)   CONSTRAINT [DF_Indicator_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]         DATETIME        CONSTRAINT [DF_Indicator_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [Programme_ID]           INT             NULL,
    [Sector_ID]              INT             NULL,
    [SubSector_ID]           INT             NULL,
    [ProjectID]              INT             NULL,
    [IndicatorSimpleType_ID] INT             NULL,
    [LocalLongName]          NVARCHAR (500)  NULL,
    [LocalShortName]         NVARCHAR (50)   NULL,
    CONSTRAINT [PK_Indicator] PRIMARY KEY CLUSTERED ([IndicatorID] ASC),
    CONSTRAINT [CK_Indicator] CHECK (((((case when [Output_ID] IS NOT NULL then (1) else (0) end+case when [Outcome_ID] IS NOT NULL then (1) else (0) end)+case when [SubOutput_ID] IS NOT NULL then (1) else (0) end)+case when [Programme_ID] IS NOT NULL then (1) else (0) end)+case when [ProjectID] IS NOT NULL then (1) else (0) end)=(1)),
    CONSTRAINT [FK_Indicator_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Indicator_IndicatorSimpleType] FOREIGN KEY ([IndicatorSimpleType_ID]) REFERENCES [app].[IndicatorSimpleType] ([IndicatorSimpleType_ID]),
    CONSTRAINT [FK_Indicator_IndicatorType] FOREIGN KEY ([IndicatorType_ID]) REFERENCES [app].[IndicatorType] ([IndicatorType_ID]),
    CONSTRAINT [FK_Indicator_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [FK_Indicator_Output] FOREIGN KEY ([Output_ID]) REFERENCES [app].[Output] ([Output_ID]),
    CONSTRAINT [FK_Indicator_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID]),
    CONSTRAINT [FK_Indicator_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [FK_Indicator_Sector] FOREIGN KEY ([Sector_ID]) REFERENCES [app].[Sector] ([Sector_ID]),
    CONSTRAINT [FK_Indicator_SubOutput] FOREIGN KEY ([SubOutput_ID]) REFERENCES [app].[SubOutput] ([SubOutput_ID]),
    CONSTRAINT [FK_Indicator_SubSector] FOREIGN KEY ([SubSector_ID]) REFERENCES [app].[SubSector] ([SubSector_ID])
);






























GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Indicator';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Indicator_BusinessKey]
    ON [app].[Indicator]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'6', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Indicator';

