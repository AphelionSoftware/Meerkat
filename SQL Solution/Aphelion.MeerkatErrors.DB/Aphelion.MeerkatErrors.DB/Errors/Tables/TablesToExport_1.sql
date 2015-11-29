CREATE TABLE [Errors].[TablesToExport] (
    [QueueID]           INT           NOT NULL,
    [SSISErrorCode]     INT           NOT NULL,
    [SSISErrorColumn]   INT           NOT NULL,
    [PackageName]       VARCHAR (255) NOT NULL,
    [ErrorType]         VARCHAR (255) NOT NULL,
    [TablesToExport_ID] INT           NULL,
    [Table_Name]        VARCHAR (255) NOT NULL,
    [Table_Schema]      VARCHAR (255) NOT NULL
);

