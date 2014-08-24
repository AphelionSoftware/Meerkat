CREATE TABLE [app].[Programme] (
    [Programme_ID]      INT            IDENTITY (1, 1) NOT NULL,
    [Code]              VARCHAR (50)   NULL,
    [LongName]          VARCHAR (500)  NOT NULL,
    [BusinessKey]       NVARCHAR (400) NOT NULL,
    [ShortName]         VARCHAR (50)   NOT NULL,
    [TextDescription]   VARCHAR (4000) NULL,
    [ProgrammeSiteName] VARCHAR (50)   NULL,
    [Active]            INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255)  CONSTRAINT [DF_Programme_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME       CONSTRAINT [DF_Programme_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255)  CONSTRAINT [DF_Programme_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME       CONSTRAINT [DF_Programme_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalLongName]     NVARCHAR (500) NULL,
    [LocalShortName]    NVARCHAR (50)  NULL,
    [Export]            BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Programme_1] PRIMARY KEY CLUSTERED ([Programme_ID] ASC),
    CONSTRAINT [FK_Programme_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);
























GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Programme', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Programme', @level2type = N'COLUMN', @level2name = N'ShortName';


GO



GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Programme_BusinessKey]
    ON [app].[Programme]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Programme', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Programme';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Programme', @level2type = N'COLUMN', @level2name = N'Export';

