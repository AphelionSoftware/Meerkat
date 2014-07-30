CREATE TABLE [Staging].[Activity] (
    [Activity_ID]        INT             NULL,
    [BusinessKey]        NVARCHAR (4000) NOT NULL,
    [Code]               VARCHAR (50)    NOT NULL,
    [LongName]           VARCHAR (500)   NOT NULL,
    [ShortName]          VARCHAR (50)    NOT NULL,
    [TextDescription]    VARCHAR (MAX)   NOT NULL,
    [ProjectBusinessKey] NVARCHAR (4000) NOT NULL
);



