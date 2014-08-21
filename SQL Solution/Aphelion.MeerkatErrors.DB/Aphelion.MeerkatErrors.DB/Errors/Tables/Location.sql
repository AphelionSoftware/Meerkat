CREATE TABLE [Errors].[Location] (
    [QueueID]                 INT             NOT NULL,
    [SSISErrorCode]           INT             NOT NULL,
    [SSISErrorColumn]         INT             NOT NULL,
    [PackageName]             VARCHAR (255)   NOT NULL,
    [ErrorType]               VARCHAR (255)   NOT NULL,
    [Location_ID]             INT             NULL,
    [AreaKM]                  DECIMAL (18, 2) NULL,
    [BusinessKey]             NVARCHAR (400)  NOT NULL,
    [Code]                    VARCHAR (50)    NOT NULL,
    [Density]                 VARCHAR (MAX)   NULL,
    [LocalName]               NVARCHAR (255)  NULL,
    [LocationTypeBusinessKey] NVARCHAR (400)  NULL,
    [Name]                    VARCHAR (255)   NULL,
    [ParentLocation_ID]       INT             NULL,
    [Population]              DECIMAL (18, 2) NULL,
    [LocationType_ID]         INT             NULL
);



