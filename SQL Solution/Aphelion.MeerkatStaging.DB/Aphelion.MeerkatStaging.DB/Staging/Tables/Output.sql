CREATE TABLE [Staging].[Output] (
    [Output_ID]          INT            NULL,
    [BusinessKey]        NVARCHAR (400) NOT NULL,
    [Code]               VARCHAR (50)   NOT NULL,
    [LongName]           NVARCHAR (500) NOT NULL,
    [ShortName]          VARCHAR (50)   NOT NULL,
    [TextDescription]    VARCHAR (MAX)  NULL,
    [OutcomeBusinessKey] NVARCHAR (400) NOT NULL
);





