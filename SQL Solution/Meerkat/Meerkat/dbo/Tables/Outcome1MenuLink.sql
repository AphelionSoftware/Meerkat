CREATE TABLE [dbo].[Outcome1MenuLink] (
    [Title]          VARCHAR (8000) NULL,
    [Link]           VARCHAR (132)  NULL,
    [ID]             INT            NULL,
    [Parent]         INT            NULL,
    [sys_Active]     INT            DEFAULT ((1)) NOT NULL,
    [Active]         INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_Outcome1MenuLink_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_Outcome1MenuLink_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_Outcome1MenuLink_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_Outcome1MenuLink_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL
);

