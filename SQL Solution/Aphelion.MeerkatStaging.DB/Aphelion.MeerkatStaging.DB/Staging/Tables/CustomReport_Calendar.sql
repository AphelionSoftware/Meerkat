CREATE TABLE [Staging].[CustomReport_Calendar] (
    [CustomReport_Calendar_ID] INT            NULL,
    [ReportDeadlineStartDate]  DATE           NOT NULL,
    [ReportDueDate]            DATE           NOT NULL,
    [ReportNoticeStartDate]    DATE           NOT NULL,
    [ReportWarningStartDate]   DATE           NOT NULL,
    [CustomReportBusinessKey]  NVARCHAR (400) NULL
);







