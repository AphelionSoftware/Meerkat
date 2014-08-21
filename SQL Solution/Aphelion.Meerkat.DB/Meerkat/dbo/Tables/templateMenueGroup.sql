CREATE TABLE [dbo].[templateMenueGroup] (
    [Title]          VARCHAR (148) NULL,
    [Link]           VARCHAR (119) NULL,
    [Parent]         INT           NULL,
    [ID]             INT           NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_templateMenueGroup_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_templateMenueGroup_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_templateMenueGroup_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_templateMenueGroup_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL
);






GO


