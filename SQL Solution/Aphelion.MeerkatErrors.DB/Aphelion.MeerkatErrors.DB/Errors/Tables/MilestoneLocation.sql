CREATE TABLE [Errors].[MilestoneLocation] (
    [QueueID]              INT            NOT NULL,
    [SSISErrorCode]        INT            NOT NULL,
    [SSISErrorColumn]      INT            NOT NULL,
    [PackageName]          VARCHAR (255)  NOT NULL,
    [ErrorType]            VARCHAR (255)  NOT NULL,
    [MilestoneLocation_ID] INT            NULL,
    [LocationBusinessKey]  NVARCHAR (400) NOT NULL,
    [MilestoneBusinessKey] NVARCHAR (400) NOT NULL,
    [Location_ID]          INT            NULL,
    [MilestoneID]          INT            NULL
);

