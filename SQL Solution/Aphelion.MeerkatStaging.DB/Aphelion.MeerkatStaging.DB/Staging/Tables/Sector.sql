CREATE TABLE [Staging].[Sector] (
    [Sector_ID]            INT             NULL,
    [BusinessKey]          NVARCHAR (4000) NOT NULL,
    [Code]                 VARCHAR (50)    NULL,
    [LongName]             VARCHAR (500)   NULL,
    [ShortName]            VARCHAR (50)    NOT NULL,
    [TextDescription]      VARCHAR (MAX)   NULL,
    [ProgrammeBusinessKey] NVARCHAR (4000) NOT NULL
);



