CREATE TABLE [Errors].[DonorReport_Indicator] (
    [QueueID]                  INT            NOT NULL,
    [SSISErrorCode]            INT            NOT NULL,
    [SSISErrorColumn]          INT            NOT NULL,
    [PackageName]              VARCHAR (255)  NOT NULL,
    [ErrorType]                VARCHAR (255)  NOT NULL,
    [DonorReport_Indicator_ID] INT            NULL,
    [DonorReportBusinessKey]   NVARCHAR (400) NULL,
    [IndicatorBusinessKey]     NVARCHAR (400) NULL,
    [DonorReportID]            INT            NULL,
    [IndicatorID]              INT            NULL
);

