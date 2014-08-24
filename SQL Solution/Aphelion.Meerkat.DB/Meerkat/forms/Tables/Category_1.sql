CREATE TABLE [forms].[Category] (
    [Category_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [Form_ID]         INT            NOT NULL,
    [CategoryOrder]   INT            NOT NULL,
    [Active]          INT            CONSTRAINT [DF__Category_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Category_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Category_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Category_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Category_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    [Export]          BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Category_3] PRIMARY KEY CLUSTERED ([Category_ID] ASC),
    CONSTRAINT [FK_Category_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Category_Form] FOREIGN KEY ([Form_ID]) REFERENCES [forms].[Form] ([Form_ID]),
    CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED ([Form_ID] ASC, [CategoryOrder] ASC)
);














GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'7', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'Category', @level2type = N'COLUMN', @level2name = N'Export';

