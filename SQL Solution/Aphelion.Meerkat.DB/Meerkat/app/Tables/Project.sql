CREATE TABLE [app].[Project] (
    [ProjectID]           INT            IDENTITY (1, 1) NOT NULL,
    [Code]                VARCHAR (50)   NOT NULL,
    [ShortName]           VARCHAR (50)   NOT NULL,
    [LongName]            VARCHAR (500)  NOT NULL,
    [TextDescription]     VARCHAR (4000) NULL,
    [Outcome_ID]          INT            NULL,
    [Programme_ID]        INT            NULL,
    [Sector_ID]           INT            NULL,
    [SubSector_ID]        INT            NULL,
    [BusinessKey]         NVARCHAR (400) CONSTRAINT [DF_Project_BusinessKey] DEFAULT (N'ShortName') NOT NULL,
    [ProjectSiteName]     VARCHAR (255)  CONSTRAINT [DF_Project_ProjectSiteName] DEFAULT ('ShortName') NOT NULL,
    [Active]              INT            CONSTRAINT [DF_Project_Active] DEFAULT ((1)) NOT NULL,
    [isSiteCreated]       BIT            CONSTRAINT [DF_Project_isSiteCreated] DEFAULT ((0)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255)  CONSTRAINT [DF_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME       CONSTRAINT [DF_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255)  CONSTRAINT [DF_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME       CONSTRAINT [DF_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [ProjectStartDate]    DATETIME       CONSTRAINT [DF__Project__Project__6ADAD1BF] DEFAULT (getdate()) NOT NULL,
    [ProjectStartDate_ID] AS             (CONVERT([int],CONVERT([varchar](8),[ProjectStartDate],(112)))),
    [ProjectType_ID]      INT            CONSTRAINT [DF_Project_ProjectType_ID] DEFAULT ((2)) NULL,
    [LocalShortName]      NVARCHAR (50)  NULL,
    [LocalLongName]       NVARCHAR (500) NULL,
    [StrategicElement_ID] INT            NULL,
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([ProjectID] ASC),
    CONSTRAINT [CK_Project] CHECK ((((case when [Outcome_ID] IS NOT NULL then (1) else (0) end+case when [Programme_ID] IS NOT NULL then (1) else (0) end)+case when [Sector_ID] IS NOT NULL then (1) else (0) end)+case when [SubSector_ID] IS NOT NULL then (1) else (0) end)=(1)),
    CONSTRAINT [FK_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Project_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [FK_Project_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID]),
    CONSTRAINT [FK_Project_ProjectType] FOREIGN KEY ([ProjectType_ID]) REFERENCES [app].[ProjectType] ([ProjectType_ID]),
    CONSTRAINT [FK_Project_Sector] FOREIGN KEY ([Sector_ID]) REFERENCES [app].[Sector] ([Sector_ID]),
    CONSTRAINT [FK_Project_StrategicElement] FOREIGN KEY ([StrategicElement_ID]) REFERENCES [disagg].[StrategicElement] ([StrategicElement_ID]),
    CONSTRAINT [FK_Project_SubSector] FOREIGN KEY ([SubSector_ID]) REFERENCES [app].[SubSector] ([SubSector_ID])
);


















































GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Project';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'isSiteCreated';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Project_BusinessKey]
    ON [app].[Project]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'4', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Project';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromOLAPViews', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Project';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromCube', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Project';

