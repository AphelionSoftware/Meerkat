CREATE TABLE [Errors].[SubOutputPersonRole] (
    [QueueID]                INT            NOT NULL,
    [SSISErrorCode]          INT            NOT NULL,
    [SSISErrorColumn]        INT            NOT NULL,
    [PackageName]            VARCHAR (255)  NOT NULL,
    [ErrorType]              VARCHAR (255)  NOT NULL,
    [SubOutputPersonRole_ID] INT            NULL,
    [PersonBusinessKey]      NVARCHAR (400) NULL,
    [RoleBusinessKey]        NVARCHAR (400) NULL,
    [SubOutputBusinessKey]   NVARCHAR (400) NULL,
    [Person_ID]              INT            NULL,
    [Role_ID]                INT            NULL,
    [SubOutput_ID]           INT            NULL
);

