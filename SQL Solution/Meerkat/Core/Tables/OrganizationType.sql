CREATE TABLE [Core].[OrganizationType] (
    [OrganizationType_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Description]         VARCHAR (MAX) NULL,
    [Active]              INT           CONSTRAINT [DF_OrganizationType_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255) CONSTRAINT [DF_OrganizationType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME      CONSTRAINT [DF_OrganizationType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255) CONSTRAINT [DF_OrganizationType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME      CONSTRAINT [DF_OrganizationType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OrganizationType] PRIMARY KEY CLUSTERED ([OrganizationType_ID] ASC),
    CONSTRAINT [FK_OrganizationType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

