CREATE TABLE [Errors].[CustomReport_Project] (
    [QueueID]                 INT            NOT NULL,
    [SSISErrorCode]           INT            NOT NULL,
    [SSISErrorColumn]         INT            NOT NULL,
    [PackageName]             VARCHAR (255)  NOT NULL,
    [ErrorType]               VARCHAR (255)  NOT NULL,
    [CustomReport_Project_ID] INT            NULL,
    [CustomReportBusinessKey] NVARCHAR (400) NULL,
    [ProjectBusinessKey]      NVARCHAR (400) NULL,
    [CustomReport_ID]         INT            NULL,
    [ProjectID]               INT            NULL
);

