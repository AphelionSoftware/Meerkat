CREATE TABLE [rpt].[CustomReport] (
    [CustomReport_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [Code]                VARCHAR (50)   NOT NULL,
    [Name]                VARCHAR (255)  NOT NULL,
    [BusinessKey]         NVARCHAR (400) NOT NULL,
    [CustomReportType_ID] INT            NOT NULL,
    [Active]              INT            CONSTRAINT [DF_CustomReport_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255)  CONSTRAINT [DF_CustomReport_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME       CONSTRAINT [DF_CustomReport_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255)  CONSTRAINT [DF_CustomReport_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME       CONSTRAINT [DF_CustomReport_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]           NVARCHAR (255) NULL,
    [Export]              BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CustomReport] PRIMARY KEY CLUSTERED ([CustomReport_ID] ASC),
    CONSTRAINT [FK_CustomReport_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_CustomReport_CustomReportType] FOREIGN KEY ([CustomReportType_ID]) REFERENCES [rpt].[CustomReportType] ([CustomReportType_ID])
);




















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_CustomReport_BusinessKey]
    ON [rpt].[CustomReport]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReport', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'2', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReport';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReport', @level2type = N'COLUMN', @level2name = N'Export';

