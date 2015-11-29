CREATE TABLE [Errors].[FrameworkDetail] (
    [QueueID]              INT            NOT NULL,
    [SSISErrorCode]        INT            NOT NULL,
    [SSISErrorColumn]      INT            NOT NULL,
    [PackageName]          VARCHAR (255)  NOT NULL,
    [ErrorType]            VARCHAR (255)  NOT NULL,
    [FrameworkDetail_ID]   INT            NULL,
    [BusinessKey]          NVARCHAR (400) NOT NULL,
    [Code]                 VARCHAR (50)   NOT NULL,
    [FrameworkBusinessKey] NVARCHAR (400) NOT NULL,
    [LocalName]            NVARCHAR (255) NULL,
    [Name]                 VARCHAR (255)  NULL,
    [Framework_ID]         INT            NULL
);



