CREATE TABLE [Errors].[OutputOutputLink] (
    [QueueID]             INT            NOT NULL,
    [SSISErrorCode]       INT            NOT NULL,
    [SSISErrorColumn]     INT            NOT NULL,
    [PackageName]         VARCHAR (255)  NOT NULL,
    [ErrorType]           VARCHAR (255)  NOT NULL,
    [OutputOutputLink_ID] INT            NULL,
    [OutputBusinessKey]   NVARCHAR (400) NOT NULL,
    [PrimaryOutput_ID]    INT            NULL,
    [SecondaryOutput_ID]  INT            NULL
);

