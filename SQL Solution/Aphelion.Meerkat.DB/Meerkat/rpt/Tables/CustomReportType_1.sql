CREATE TABLE [rpt].[CustomReportType] (
    [CustomReportType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]                VARCHAR (50)   NOT NULL,
    [Name]                VARCHAR (255)  NULL,
    [BusinessKey]         NVARCHAR (400) NOT NULL,
    [Active]              INT            CONSTRAINT [DF__CustomRep__Activ__0EC32C7A] DEFAULT ((1)) NOT NULL,
    [NoticeDays]          INT            CONSTRAINT [DF_CustomReportType_WarningDays] DEFAULT ((5)) NOT NULL,
    [WarningDays]         INT            CONSTRAINT [DF_CustomReportType_WarningDays_1] DEFAULT ((5)) NOT NULL,
    [DeadlineDays]        INT            CONSTRAINT [DF_CustomReportType_DeadlineDays] DEFAULT ((5)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255)  CONSTRAINT [DF_CustomReportType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME       CONSTRAINT [DF_CustomReportType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255)  CONSTRAINT [DF_CustomReportType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME       CONSTRAINT [DF_CustomReportType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]           NVARCHAR (255) NULL,
    [Export]              BIT            NOT NULL,
    CONSTRAINT [PK_CustomReportType] PRIMARY KEY CLUSTERED ([CustomReportType_ID] ASC),
    CONSTRAINT [FK_CustomReportType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);




















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_CustomReportType_BusinessKey]
    ON [rpt].[CustomReportType]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReportType', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReportType';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReportType', @level2type = N'COLUMN', @level2name = N'Export';

