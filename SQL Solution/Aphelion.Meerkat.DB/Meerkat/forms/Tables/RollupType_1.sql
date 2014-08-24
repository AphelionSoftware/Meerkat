CREATE TABLE [forms].[RollupType] (
    [RollupType_ID]   INT            IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [Active]          INT            CONSTRAINT [DF__RollupType_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_RollupType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_RollupType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_RollupType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_RollupType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    [Export]          BIT            NOT NULL,
    CONSTRAINT [PK_RollupType_3] PRIMARY KEY CLUSTERED ([RollupType_ID] ASC),
    CONSTRAINT [FK_RollupType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ__RollupType_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);














GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'RollupType';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'RollupType', @level2type = N'COLUMN', @level2name = N'Export';

