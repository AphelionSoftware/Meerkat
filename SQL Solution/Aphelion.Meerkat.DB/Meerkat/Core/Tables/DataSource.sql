CREATE TABLE [Core].[DataSource] (
    [DataSource_ID]    INT            IDENTITY (1, 1) NOT NULL,
    [Name]             VARCHAR (255)  NULL,
    [ContactDetails]   VARCHAR (MAX)  NULL,
    [Custodian]        VARCHAR (MAX)  NULL,
    [Format]           VARCHAR (MAX)  NULL,
    [CollectionMethod] VARCHAR (MAX)  NULL,
    [MetadataStatus]   VARCHAR (MAX)  NULL,
    [BusinessKey]      NVARCHAR (400) NOT NULL,
    [Active]           INT            CONSTRAINT [DF_DataSource_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255)  CONSTRAINT [DF_DataSource_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME       CONSTRAINT [DF_DataSource_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255)  CONSTRAINT [DF_DataSource_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME       CONSTRAINT [DF_DataSource_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]        NVARCHAR (255) NULL,
    CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED ([DataSource_ID] ASC),
    CONSTRAINT [FK_DataSource_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);




















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DataSource_BusinessKey]
    ON [Core].[DataSource]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'DataSource', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'DataSource';


GO


