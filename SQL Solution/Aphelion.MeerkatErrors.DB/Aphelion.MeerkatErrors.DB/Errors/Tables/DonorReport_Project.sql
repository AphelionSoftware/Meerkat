CREATE TABLE [Errors].[DonorReport_Project] (
    [QueueID]                INT            NOT NULL,
    [SSISErrorCode]          INT            NOT NULL,
    [SSISErrorColumn]        INT            NOT NULL,
    [PackageName]            VARCHAR (255)  NOT NULL,
    [ErrorType]              VARCHAR (255)  NOT NULL,
    [DonorReport_Project_ID] INT            NULL,
    [DonorReportBusinessKey] NVARCHAR (400) NULL,
    [ProjectBusinessKey]     NVARCHAR (400) NULL,
    [DonorReportID]          INT            NULL,
    [ProjectID]              INT            NULL
);

