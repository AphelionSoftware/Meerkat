CREATE TABLE [Errors].[CustomReport_Indicator] (
    [QueueID]                   INT            NOT NULL,
    [SSISErrorCode]             INT            NOT NULL,
    [SSISErrorColumn]           INT            NOT NULL,
    [PackageName]               VARCHAR (255)  NOT NULL,
    [ErrorType]                 VARCHAR (255)  NOT NULL,
    [CustomReport_Indicator_ID] INT            NULL,
    [CustomReportBusinessKey]   NVARCHAR (400) NULL,
    [IndicatorBusinessKey]      NVARCHAR (400) NULL,
    [CustomReport_ID]           INT            NULL,
    [IndicatorID]               INT            NULL
);

