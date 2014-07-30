CREATE TABLE [Core].[Person] (
    [Person_ID]      INT              IDENTITY (1, 1) NOT NULL,
    [Title]          VARCHAR (MAX)    NULL,
    [Name]                 VARCHAR (255)    NOT NULL,
    [ContactDetails] VARCHAR (MAX)    NULL,
    [Category]       VARCHAR (MAX)    NULL,
    [BusinessKey]    NVARCHAR(4000)    NOT NULL,
    [UserDetails]    VARCHAR (50)     NULL,
    [Active]         INT              CONSTRAINT [DF_Person_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)    CONSTRAINT [DF_Person_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME         CONSTRAINT [DF_Person_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)    CONSTRAINT [DF_Person_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME         CONSTRAINT [DF_Person_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([Person_ID] ASC),
    CONSTRAINT [FK_Person_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

