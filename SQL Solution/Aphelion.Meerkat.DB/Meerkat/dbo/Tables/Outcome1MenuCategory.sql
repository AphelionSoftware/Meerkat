CREATE TABLE [dbo].[Outcome1MenuCategory] (
    [Title]          VARCHAR (133) NULL,
    [Link]           VARCHAR (111) NULL,
    [ID]             INT           NULL,
    [sys_Active]     INT           DEFAULT ((1)) NOT NULL,
    [Active]         INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_Outcome1MenuCategory_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_Outcome1MenuCategory_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_Outcome1MenuCategory_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_Outcome1MenuCategory_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL
);

