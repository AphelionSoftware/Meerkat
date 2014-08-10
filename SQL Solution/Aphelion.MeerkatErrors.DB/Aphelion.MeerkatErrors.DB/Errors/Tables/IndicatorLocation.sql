CREATE TABLE [Errors].[IndicatorLocation] (
    [QueueID]              INT            NOT NULL,
    [SSISErrorCode]        INT            NOT NULL,
    [SSISErrorColumn]      INT            NOT NULL,
    [PackageName]          VARCHAR (255)  NOT NULL,
    [ErrorType]            VARCHAR (255)  NOT NULL,
    [IndicatorLocation_ID] INT            NULL,
    [IndicatorBusinessKey] NVARCHAR (400) NULL,
    [LocationBusinessKey]  NVARCHAR (400) NULL,
    [Indicator_ID]         INT            NULL,
    [Location_ID]          INT            NULL
);

