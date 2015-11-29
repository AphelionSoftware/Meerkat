CREATE TABLE [Errors].[Person] (
    [QueueID]                            INT            NOT NULL,
    [SSISErrorCode]                      INT            NOT NULL,
    [SSISErrorColumn]                    INT            NOT NULL,
    [PackageName]                        VARCHAR (255)  NOT NULL,
    [ErrorType]                          VARCHAR (255)  NOT NULL,
    [Person_ID]                          INT            NULL,
    [BusinessKey]                        NVARCHAR (400) NOT NULL,
    [Category]                           VARCHAR (MAX)  NULL,
    [ContactDetails]                     VARCHAR (MAX)  NULL,
    [Name]                               VARCHAR (255)  NULL,
    [PersonParticipationTypeBusinessKey] NVARCHAR (400) NULL,
    [Title]                              VARCHAR (MAX)  NULL,
    [UserDetails]                        VARCHAR (50)   NULL,
    [PersonParticipationType_ID]         INT            NULL
);





