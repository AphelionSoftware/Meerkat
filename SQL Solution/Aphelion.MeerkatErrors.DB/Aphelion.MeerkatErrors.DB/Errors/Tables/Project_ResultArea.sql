CREATE TABLE [Errors].[Project_ResultArea] (
    [QueueID]               INT            NOT NULL,
    [SSISErrorCode]         INT            NOT NULL,
    [SSISErrorColumn]       INT            NOT NULL,
    [PackageName]           VARCHAR (255)  NOT NULL,
    [ErrorType]             VARCHAR (255)  NOT NULL,
    [Project_ResultArea_ID] INT            NULL,
    [ProjectBusinessKey]    NVARCHAR (400) NULL,
    [ResultAreaBusinessKey] NVARCHAR (400) NULL,
    [ProjectID]             INT            NULL,
    [ResultAreaID]          INT            NULL
);

