CREATE TABLE [Errors].[EventRegister] (
    [QueueID]              INT            NOT NULL,
    [SSISErrorCode]        INT            NOT NULL,
    [SSISErrorColumn]      INT            NOT NULL,
    [PackageName]          VARCHAR (255)  NOT NULL,
    [ErrorType]            VARCHAR (255)  NOT NULL,
    [EventRegister_ID]     INT            NULL,
    [Age_ID]               INT            NULL,
    [DateOfBirth]          DATE           NULL,
    [Event_ID]             INT            NOT NULL,
    [FirstName]            VARCHAR (255)  NULL,
    [GenderBusinessKey]    NVARCHAR (400) NULL,
    [IdentificationNumber] VARCHAR (255)  NULL,
    [Surname]              VARCHAR (255)  NULL,
    [Gender_ID]            INT            NULL
);

