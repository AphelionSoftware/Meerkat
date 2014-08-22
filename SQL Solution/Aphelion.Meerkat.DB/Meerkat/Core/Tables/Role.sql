CREATE TABLE [Core].[Role] (
    [RoleID]         INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Name]           VARCHAR (255)  NULL,
    [Description]    VARCHAR (MAX)  NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [Active]         INT            CONSTRAINT [DF_Role_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_Role_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_Role_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_Role_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_Role_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]      NVARCHAR (255) NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([RoleID] ASC),
    CONSTRAINT [FK_Role_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ_Role_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);












GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Role_BusinessKey]
    ON [Core].[Role]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Role', @level2type = N'COLUMN', @level2name = N'BusinessKey';

