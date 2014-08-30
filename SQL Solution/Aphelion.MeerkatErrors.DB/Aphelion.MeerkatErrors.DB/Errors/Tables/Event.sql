CREATE TABLE [Errors].[Event] (
    [QueueID]                INT            NOT NULL,
    [SSISErrorCode]          INT            NOT NULL,
    [SSISErrorColumn]        INT            NOT NULL,
    [PackageName]            VARCHAR (255)  NOT NULL,
    [ErrorType]              VARCHAR (255)  NOT NULL,
    [Event_ID]               INT            NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [EventDate]              DATE           NOT NULL,
    [InstitutionBusinessKey] NVARCHAR (400) NULL,
    [LocalName]              NVARCHAR (255) NULL,
    [LocationBusinessKey]    NVARCHAR (400) NULL,
    [Name]                   VARCHAR (255)  NOT NULL,
    [ProjectBusinessKey]     NVARCHAR (400) NOT NULL,
    [TextDescription]        VARCHAR (4000) NULL,
    [Location_ID]            INT            NULL,
    [Project_ID]             INT            NULL,
    [TrainingInstitution_ID] INT            NULL
);

