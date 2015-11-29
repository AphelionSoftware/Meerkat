CREATE TABLE [Errors].[Output] (
    [QueueID]            INT            NOT NULL,
    [SSISErrorCode]      INT            NOT NULL,
    [SSISErrorColumn]    INT            NOT NULL,
    [PackageName]        VARCHAR (255)  NOT NULL,
    [ErrorType]          VARCHAR (255)  NOT NULL,
    [Output_ID]          INT            NULL,
    [BusinessKey]        NVARCHAR (400) NOT NULL,
    [Code]               VARCHAR (50)   NOT NULL,
    [LocalLongName]      NVARCHAR (500) NULL,
    [LocalShortName]     NVARCHAR (50)  NULL,
    [LongName]           VARCHAR (500)  NOT NULL,
    [OutcomeBusinessKey] NVARCHAR (400) NOT NULL,
    [ShortName]          VARCHAR (50)   NOT NULL,
    [TextDescription]    VARCHAR (4000) NULL,
    [Outcome_ID]         INT            NULL
);



