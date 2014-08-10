CREATE TABLE [Errors].[FrameworkDetail_Project] (
    [QueueID]                    INT            NOT NULL,
    [SSISErrorCode]              INT            NOT NULL,
    [SSISErrorColumn]            INT            NOT NULL,
    [PackageName]                VARCHAR (255)  NOT NULL,
    [ErrorType]                  VARCHAR (255)  NOT NULL,
    [FrameworkDetail_Project_ID] INT            NULL,
    [FrameworkDetailBusinessKey] NVARCHAR (400) NULL,
    [ProjectBusinessKey]         NVARCHAR (400) NULL,
    [FrameworkDetail_ID]         INT            NULL,
    [ProjectID]                  INT            NULL
);

