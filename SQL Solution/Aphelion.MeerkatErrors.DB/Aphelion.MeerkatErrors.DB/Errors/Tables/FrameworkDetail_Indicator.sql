CREATE TABLE [Errors].[FrameworkDetail_Indicator] (
    [QueueID]                      INT            NOT NULL,
    [SSISErrorCode]                INT            NOT NULL,
    [SSISErrorColumn]              INT            NOT NULL,
    [PackageName]                  VARCHAR (255)  NOT NULL,
    [ErrorType]                    VARCHAR (255)  NOT NULL,
    [FrameworkDetail_Indicator_ID] INT            NULL,
    [BusinessKey]                  NVARCHAR (400) NOT NULL,
    [FrameworkDetailBusinessKey]   NVARCHAR (400) NULL,
    [IndicatorBusinessKey]         NVARCHAR (400) NULL,
    [FrameworkDetail_ID]           INT            NULL,
    [IndicatorID]                  INT            NULL
);

