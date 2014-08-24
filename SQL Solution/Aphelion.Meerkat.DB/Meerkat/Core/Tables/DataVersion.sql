CREATE TABLE [Core].[DataVersion] (
    [DataVersion_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Name]           VARCHAR (255)  NULL,
    [Description]    VARCHAR (MAX)  NOT NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [Order]          INT            CONSTRAINT [DF_DataVersion_Order] DEFAULT ((10)) NOT NULL,
    [Active]         INT            CONSTRAINT [DF_DataVersion_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_DataVersion_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_DataVersion_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_DataVersion_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_DataVersion_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]      NVARCHAR (255) NULL,
    [Export]         BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED ([DataVersion_ID] ASC),
    CONSTRAINT [FK_DataVersion_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ_DataVersion_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);
















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DataVersion_BusinessKey]
    ON [Core].[DataVersion]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'DataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'Export';

