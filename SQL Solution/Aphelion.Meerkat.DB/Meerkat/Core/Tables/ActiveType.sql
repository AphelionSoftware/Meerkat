CREATE TABLE [Core].[ActiveType] (
    [ID]             INT            NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Name]           VARCHAR (255)  NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_ActiveType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_ActiveType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_ActiveType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_ActiveType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]      NVARCHAR (255) NULL,
    [Export]         BIT            NOT NULL,
    CONSTRAINT [PK_ActiveType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UQ_ActiveType_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);














GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'0', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'ActiveType';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'ActiveType', @level2type = N'COLUMN', @level2name = N'Export';

