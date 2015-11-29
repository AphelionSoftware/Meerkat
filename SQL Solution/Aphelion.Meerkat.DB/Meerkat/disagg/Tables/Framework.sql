CREATE TABLE [disagg].[Framework] (
    [Framework_ID]         INT            IDENTITY (1, 1) NOT NULL,
    [Code]                 VARCHAR (50)   NOT NULL,
    [Name]                 VARCHAR (255)  NULL,
    [BusinessKey]          NVARCHAR (400) NOT NULL,
    [Active]               INT            CONSTRAINT [DF__Framework__Activ__168449D3] DEFAULT ((1)) NOT NULL,
    [SourceOrganizationID] INT            NULL,
    [sys_CreatedBy]        VARCHAR (255)  CONSTRAINT [DF_Framework_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME       CONSTRAINT [DF_Framework_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255)  CONSTRAINT [DF_Framework_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME       CONSTRAINT [DF_Framework_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]            NVARCHAR (255) NULL,
    CONSTRAINT [PK_Framework] PRIMARY KEY CLUSTERED ([Framework_ID] ASC),
    CONSTRAINT [FK_Framework_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Framework_Organization] FOREIGN KEY ([SourceOrganizationID]) REFERENCES [Core].[Organization] ([Organization_ID])
);


















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Framework_BusinessKey]
    ON [disagg].[Framework]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'3', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'Framework';


GO


