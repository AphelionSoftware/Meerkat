CREATE TABLE [Errors].[Role] (
    [QueueID]         INT            NOT NULL,
    [SSISErrorCode]   INT            NOT NULL,
    [SSISErrorColumn] INT            NOT NULL,
    [PackageName]     VARCHAR (255)  NOT NULL,
    [ErrorType]       VARCHAR (255)  NOT NULL,
    [RoleID]          INT            NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [Description]     VARCHAR (MAX)  NULL,
    [Name]            VARCHAR (255)  NOT NULL
);

