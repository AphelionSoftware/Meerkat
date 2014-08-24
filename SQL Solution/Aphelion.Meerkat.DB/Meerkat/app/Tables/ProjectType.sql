CREATE TABLE [app].[ProjectType] (
    [ProjectType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Name]           VARCHAR (255)  NOT NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [Active]         INT            CONSTRAINT [DF_ProjectType_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_ProjectType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_ProjectType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_ProjectType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_ProjectType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]      NVARCHAR (255) NULL,
    [Export]         BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ProjectType] PRIMARY KEY CLUSTERED ([ProjectType_ID] ASC),
    CONSTRAINT [FK_ProjectType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ_ProjectType_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);










GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_ProjectType_BusinessKey]
    ON [app].[ProjectType]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'ProjectType', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'ProjectType';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'ProjectType', @level2type = N'COLUMN', @level2name = N'Export';

