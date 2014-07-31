CREATE TABLE [Staging].[Programme] (
    [Programme_ID]      INT             NULL,
    [BusinessKey]       NVARCHAR (4000) NOT NULL,
    [Code]              VARCHAR (50)    NULL,
    [LongName]          VARCHAR (500)   NULL,
    [ProgrammeSiteName] VARCHAR (50)    NULL,
    [ShortName]         VARCHAR (50)    NULL,
    [TextDescription]   VARCHAR (MAX)   NULL
);



