CREATE TABLE [Errors].[OrganizationPersonRole] (
    [QueueID]                   INT            NOT NULL,
    [SSISErrorCode]             INT            NOT NULL,
    [SSISErrorColumn]           INT            NOT NULL,
    [PackageName]               VARCHAR (255)  NOT NULL,
    [ErrorType]                 VARCHAR (255)  NOT NULL,
    [OrganizationPersonRole_ID] INT            NULL,
    [EndDate]                   DATETIME2 (7)  NULL,
    [OrganizationBusinessKey]   NVARCHAR (400) NULL,
    [PersonBusinessKey]         NVARCHAR (400) NULL,
    [RoleBusinessKey]           NVARCHAR (400) NULL,
    [StartDate]                 DATETIME2 (7)  NULL,
    [Organization_ID]           INT            NULL,
    [Person_ID]                 INT            NULL,
    [Role_ID]                   INT            NULL
);

