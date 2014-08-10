CREATE TABLE [Errors].[SubSector] (
    [QueueID]           INT            NOT NULL,
    [SSISErrorCode]     INT            NOT NULL,
    [SSISErrorColumn]   INT            NOT NULL,
    [PackageName]       VARCHAR (255)  NOT NULL,
    [ErrorType]         VARCHAR (255)  NOT NULL,
    [SubSector_ID]      INT            NULL,
    [BusinessKey]       NVARCHAR (400) NOT NULL,
    [Code]              VARCHAR (50)   NULL,
    [LongName]          VARCHAR (500)  NOT NULL,
    [SectorBusinessKey] NVARCHAR (400) NOT NULL,
    [ShortName]         VARCHAR (50)   NOT NULL,
    [TextDescription]   VARCHAR (MAX)  NULL,
    [Sector_ID]         INT            NULL
);

