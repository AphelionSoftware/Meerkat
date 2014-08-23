CREATE TABLE [app].[Activity] (
    [Activity_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [LongName]        VARCHAR (500)  NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [ProjectID]       INT            NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Active]          INT            CONSTRAINT [DF_Activity_Active] DEFAULT ((1)) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Activity_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Activity_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Activity_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Activity_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalShortName]  NVARCHAR (50)  NULL,
    [LocalLongName]   NVARCHAR (500) NULL,
    CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED ([Activity_ID] ASC),
    CONSTRAINT [FK_Activity_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Activity_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [UQ_Activity_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);
































GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Activity';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Activity_BusinessKey]
    ON [app].[Activity]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Activity', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'false', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Activity', @level2type = N'COLUMN', @level2name = N'sys_CreatedBy';




GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Activity', @level2type = N'COLUMN', @level2name = N'sys_ModifiedBy';










GO
EXECUTE sp_addextendedproperty @name = N'ExtendedProperties', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Activity', @level2type = N'COLUMN', @level2name = N'sys_ModifiedOn';






GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Activity';

