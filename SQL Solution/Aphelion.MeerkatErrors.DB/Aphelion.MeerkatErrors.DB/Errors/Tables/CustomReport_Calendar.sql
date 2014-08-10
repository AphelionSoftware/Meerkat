CREATE TABLE [Errors].[CustomReport_Calendar] (
    [QueueID]                  INT            NOT NULL,
    [SSISErrorCode]            INT            NOT NULL,
    [SSISErrorColumn]          INT            NOT NULL,
    [PackageName]              VARCHAR (255)  NOT NULL,
    [ErrorType]                VARCHAR (255)  NOT NULL,
    [CustomReport_Calendar_ID] INT            NULL,
    [CustomReportBusinessKey]  NVARCHAR (400) NULL,
    [ReportDeadlineStartDate]  DATE           NOT NULL,
    [ReportDueDate]            DATE           NOT NULL,
    [ReportNoticeStartDate]    DATE           NOT NULL,
    [ReportWarningStartDate]   DATE           NOT NULL,
    [CustomReport_ID]          INT            NULL
);

