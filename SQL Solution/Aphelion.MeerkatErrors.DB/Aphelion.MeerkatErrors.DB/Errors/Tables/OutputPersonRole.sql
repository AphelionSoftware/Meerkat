CREATE TABLE [Errors].[OutputPersonRole] (
    [QueueID]             INT            NOT NULL,
    [SSISErrorCode]       INT            NOT NULL,
    [SSISErrorColumn]     INT            NOT NULL,
    [PackageName]         VARCHAR (255)  NOT NULL,
    [ErrorType]           VARCHAR (255)  NOT NULL,
    [OutputPersonRole_ID] INT            NULL,
    [OutputBusinessKey]   NVARCHAR (400) NULL,
    [PersonBusinessKey]   NVARCHAR (400) NULL,
    [RoleBusinessKey]     NVARCHAR (400) NULL,
    [Output_ID]           INT            NULL,
    [Person_ID]           INT            NULL,
    [Role_ID]             INT            NULL
);

