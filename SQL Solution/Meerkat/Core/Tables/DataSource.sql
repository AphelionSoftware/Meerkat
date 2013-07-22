CREATE TABLE [Core].[DataSource] (
    [DataSource_ID]    INT              IDENTITY (1, 1) NOT NULL,
    [Name]             VARCHAR (MAX)    NULL,
    [ContactDetails]   VARCHAR (MAX)    NULL,
    [Custodian]        VARCHAR (MAX)    NULL,
    [Format]           VARCHAR (MAX)    NULL,
    [CollectionMethod] VARCHAR (MAX)    NULL,
    [MetadataStatus]   VARCHAR (MAX)    NULL,
    [BusinessKey]      VARCHAR (MAX)    NULL,
    [Sharepoint_ID]    UNIQUEIDENTIFIER NULL,
    [Active]           INT              DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255)    CONSTRAINT [DF_DataSource_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME         CONSTRAINT [DF_DataSource_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255)    CONSTRAINT [DF_DataSource_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME         CONSTRAINT [DF_DataSource_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED ([DataSource_ID] ASC),
    CONSTRAINT [FK_DataSource_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

