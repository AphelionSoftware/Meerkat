﻿CREATE TABLE [Errors].[SubOutput] (
    [QueueID]           INT            NOT NULL,
    [SSISErrorCode]     INT            NOT NULL,
    [SSISErrorColumn]   INT            NOT NULL,
    [PackageName]       VARCHAR (255)  NOT NULL,
    [ErrorType]         VARCHAR (255)  NOT NULL,
    [SubOutput_ID]      INT            NULL,
    [BusinessKey]       NVARCHAR (400) NOT NULL,
    [Code]              VARCHAR (50)   NOT NULL,
    [LongName]          VARCHAR (500)  NOT NULL,
    [OutputBusinessKey] NVARCHAR (400) NOT NULL,
    [ShortName]         VARCHAR (50)   NOT NULL,
    [TextDescription]   VARCHAR (MAX)  NULL,
    [Output_ID]         INT            NULL
);
