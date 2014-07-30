CREATE TABLE [Staging].[SubSector] (
    [SubSector_ID]      INT             NULL,
    [BusinessKey]       NVARCHAR (4000) NOT NULL,
    [Code]              VARCHAR (50)    NULL,
    [LongName]          VARCHAR (500)   NOT NULL,
    [ShortName]         VARCHAR (50)    NOT NULL,
    [TextDescription]   VARCHAR (MAX)   NULL,
    [SectorBusinessKey] NVARCHAR (4000) NOT NULL
);



