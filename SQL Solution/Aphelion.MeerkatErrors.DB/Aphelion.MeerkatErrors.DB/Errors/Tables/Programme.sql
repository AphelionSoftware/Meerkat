CREATE TABLE [Errors].[Programme] (
    [QueueID]           INT            NOT NULL,
    [SSISErrorCode]     INT            NOT NULL,
    [SSISErrorColumn]   INT            NOT NULL,
    [PackageName]       VARCHAR (255)  NOT NULL,
    [ErrorType]         VARCHAR (255)  NOT NULL,
    [Programme_ID]      INT            NULL,
    [BusinessKey]       NVARCHAR (400) NOT NULL,
    [Code]              VARCHAR (50)   NULL,
    [LongName]          VARCHAR (500)  NULL,
    [ProgrammeSiteName] VARCHAR (50)   NULL,
    [ShortName]         VARCHAR (50)   NULL,
    [TextDescription]   VARCHAR (MAX)  NULL
);

