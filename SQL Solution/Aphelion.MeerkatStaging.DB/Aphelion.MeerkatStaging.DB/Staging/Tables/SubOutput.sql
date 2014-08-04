CREATE TABLE [Staging].[SubOutput] (
    [SubOutput_ID]      INT            NULL,
    [BusinessKey]       NVARCHAR (400) NOT NULL,
    [Code]              VARCHAR (50)   NOT NULL,
    [LongName]          VARCHAR (500)  NOT NULL,
    [ShortName]         VARCHAR (50)   NOT NULL,
    [TextDescription]   VARCHAR (MAX)  NULL,
    [OutputBusinessKey] NVARCHAR (400) NOT NULL
);





