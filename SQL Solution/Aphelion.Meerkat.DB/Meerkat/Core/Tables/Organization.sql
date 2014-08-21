CREATE TABLE [Core].[Organization] (
    [Organization_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [ShortName]             VARCHAR (50)   NOT NULL,
    [LongName]              VARCHAR (500)  NOT NULL,
    [Code]                  VARCHAR (50)   NULL,
    [BusinessKey]           NVARCHAR (400) NOT NULL,
    [OrganizationType_ID]   INT            NULL,
    [ParentOrganization_ID] INT            NULL,
    [Active]                INT            CONSTRAINT [DF_Organization_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]         VARCHAR (255)  CONSTRAINT [DF_Organization_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]         DATETIME       CONSTRAINT [DF_Organization_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]        VARCHAR (255)  CONSTRAINT [DF_Organization_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]        DATETIME       CONSTRAINT [DF_Organization_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalShortName]        NVARCHAR (50)  NULL,
    [LocalLongName]         NVARCHAR (500) NULL,
    CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED ([Organization_ID] ASC),
    CONSTRAINT [FK_Organization_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Organization_Organization] FOREIGN KEY ([ParentOrganization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_Organization_OrganizationType] FOREIGN KEY ([OrganizationType_ID]) REFERENCES [Core].[OrganizationType] ([OrganizationType_ID]),
    CONSTRAINT [UQ_Organization_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);












GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Organization_BusinessKey]
    ON [Core].[Organization]([BusinessKey] ASC) WHERE ([Active]>=(0));

