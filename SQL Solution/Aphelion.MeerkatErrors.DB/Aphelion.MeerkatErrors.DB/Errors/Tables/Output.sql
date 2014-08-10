﻿CREATE TABLE [Errors].[Output] (
    [QueueID]            INT            NOT NULL,
    [SSISErrorCode]      INT            NOT NULL,
    [SSISErrorColumn]    INT            NOT NULL,
    [PackageName]        VARCHAR (255)  NOT NULL,
    [ErrorType]          VARCHAR (255)  NOT NULL,
    [Output_ID]          INT            NULL,
    [BusinessKey]        NVARCHAR (400) NOT NULL,
    [Code]               VARCHAR (50)   NOT NULL,
    [LongName]           NVARCHAR (500) NOT NULL,
    [OutcomeBusinessKey] NVARCHAR (400) NOT NULL,
    [ShortName]          VARCHAR (50)   NOT NULL,
    [TextDescription]    VARCHAR (MAX)  NULL,
    [Outcome_ID]         INT            NULL
);
