CREATE TABLE [Errors].[Organization] (
    [QueueID]                     INT            NOT NULL,
    [SSISErrorCode]               INT            NOT NULL,
    [SSISErrorColumn]             INT            NOT NULL,
    [PackageName]                 VARCHAR (255)  NOT NULL,
    [ErrorType]                   VARCHAR (255)  NOT NULL,
    [Organization_ID]             INT            NULL,
    [BusinessKey]                 NVARCHAR (400) NOT NULL,
    [Code]                        VARCHAR (50)   NULL,
    [LocalLongName]               NVARCHAR (500) NULL,
    [LocalShortName]              NVARCHAR (50)  NULL,
    [LongName]                    VARCHAR (500)  NOT NULL,
    [OrganizationTypeBusinessKey] NVARCHAR (400) NULL,
    [ParentOrganization_ID]       INT            NULL,
    [ShortName]                   VARCHAR (50)   NOT NULL,
    [OrganizationType_ID]         INT            NULL
);



