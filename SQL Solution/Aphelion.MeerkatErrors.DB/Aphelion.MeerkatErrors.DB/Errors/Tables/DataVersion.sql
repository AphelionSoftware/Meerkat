CREATE TABLE [Errors].[DataVersion] (
    [QueueID]         INT            NOT NULL,
    [SSISErrorCode]   INT            NOT NULL,
    [SSISErrorColumn] INT            NOT NULL,
    [PackageName]     VARCHAR (255)  NOT NULL,
    [ErrorType]       VARCHAR (255)  NOT NULL,
    [DataVersion_ID]  INT            NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [Description]     VARCHAR (MAX)  NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    [Name]            VARCHAR (255)  NULL,
    [Order]           INT            NOT NULL
);



