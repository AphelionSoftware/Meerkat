CREATE TABLE [Errors].[OutcomeOrganization] (
    [QueueID]                 INT            NOT NULL,
    [SSISErrorCode]           INT            NOT NULL,
    [SSISErrorColumn]         INT            NOT NULL,
    [PackageName]             VARCHAR (255)  NOT NULL,
    [ErrorType]               VARCHAR (255)  NOT NULL,
    [OutcomeOrganization_ID]  INT            NULL,
    [OrganizationBusinessKey] NVARCHAR (400) NULL,
    [OutcomeBusinessKey]      NVARCHAR (400) NULL,
    [Organization_ID]         INT            NULL,
    [Outcome_ID]              INT            NULL
);

