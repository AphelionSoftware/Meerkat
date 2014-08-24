CREATE TABLE [Core].[Person] (
    [Person_ID]      INT            IDENTITY (1, 1) NOT NULL,
    [Title]          VARCHAR (MAX)  NULL,
    [Name]           VARCHAR (255)  NULL,
    [ContactDetails] VARCHAR (MAX)  NULL,
    [Category]       VARCHAR (MAX)  NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [UserDetails]    VARCHAR (50)   NULL,
    [Active]         INT            CONSTRAINT [DF_Person_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_Person_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_Person_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_Person_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_Person_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [Export]         BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([Person_ID] ASC),
    CONSTRAINT [FK_Person_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);
















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Person_BusinessKey]
    ON [Core].[Person]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Person';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Export';

