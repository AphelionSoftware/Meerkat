CREATE TABLE [Errors].[templateMenueGroup] (
    [QueueID]         INT           NOT NULL,
    [SSISErrorCode]   INT           NOT NULL,
    [SSISErrorColumn] INT           NOT NULL,
    [PackageName]     VARCHAR (255) NOT NULL,
    [ErrorType]       VARCHAR (255) NOT NULL,
    [ID]              INT           NULL,
    [Link]            VARCHAR (119) NULL,
    [Parent]          INT           NULL,
    [Title]           VARCHAR (148) NULL
);

