CREATE TABLE [Errors].[Organization] (
    [QueueID]                     INT            NOT NULL,
    [SSISErrorCode]               INT            NOT NULL,
    [SSISErrorColumn]             INT            NOT NULL,
    [PackageName]                 VARCHAR (255)  NOT NULL,
    [ErrorType]                   VARCHAR (255)  NOT NULL,
    [Organization_ID]             INT            NULL,
    [BusinessKey]                 NVARCHAR (400) NOT NULL,
    [Code]                        VARCHAR (50)   NULL,
    [LongName]                    NVARCHAR (500) NULL,
    [OrganizationTypeBusinessKey] NVARCHAR (400) NULL,
    [ParentOrganization_ID]       INT            NULL,
    [ShortName]                   NVARCHAR (50)  NOT NULL,
    [OrganizationType_ID]         INT            NULL
);

