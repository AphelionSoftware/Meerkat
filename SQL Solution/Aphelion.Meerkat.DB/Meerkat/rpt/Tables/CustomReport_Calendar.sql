CREATE TABLE [rpt].[CustomReport_Calendar] (
    [CustomReport_Calendar_ID] INT           IDENTITY (1, 1) NOT NULL,
    [CustomReport_ID]          INT           NULL,
    [Active]                   INT           CONSTRAINT [DF__CustomRep__Activ__0A7378A9] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]            VARCHAR (255) CONSTRAINT [DF_CustomReport_Calendar_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]            DATETIME      CONSTRAINT [DF_CustomReport_Calendar_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]           VARCHAR (255) CONSTRAINT [DF_CustomReport_Calendar_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]           DATETIME      CONSTRAINT [DF_CustomReport_Calendar_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [ReportDueDate]            DATE          NOT NULL,
    [ReportDeadlineStartDate]  DATE          NOT NULL,
    [ReportWarningStartDate]   DATE          NOT NULL,
    [ReportNoticeStartDate]    DATE          NOT NULL,
    CONSTRAINT [PK_CustomReport_Calendar] PRIMARY KEY CLUSTERED ([CustomReport_Calendar_ID] ASC),
    CONSTRAINT [FK_CustomReport_Calendar_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_CustomReport_Calendar_CustomReport] FOREIGN KEY ([CustomReport_ID]) REFERENCES [rpt].[CustomReport] ([CustomReport_ID])
);




GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'3', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReport_Calendar';

