CREATE TABLE [app].[SubOutputPersonRole] (
    [SubOutputPersonRole_ID] INT           IDENTITY (1, 1) NOT NULL,
    [SubOutput_ID]           INT           NULL,
    [Person_ID]              INT           NULL,
    [Role_ID]                INT           NULL,
    [Active]                 INT           CONSTRAINT [DF_SubOutputPersonRole_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]          VARCHAR (255) CONSTRAINT [DF_SubOutputPersonRole_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]          DATETIME      CONSTRAINT [DF_SubOutputPersonRole_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]         VARCHAR (255) CONSTRAINT [DF_SubOutputPersonRole_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]         DATETIME      CONSTRAINT [DF_SubOutputPersonRole_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SubOutputPersonRole] PRIMARY KEY CLUSTERED ([SubOutputPersonRole_ID] ASC),
    CONSTRAINT [FK_SubOutputPersonRole_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_SubOutputPersonRole_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Core].[Person] ([Person_ID]),
    CONSTRAINT [FK_SubOutputPersonRole_Role] FOREIGN KEY ([Role_ID]) REFERENCES [Core].[Role] ([RoleID]),
    CONSTRAINT [FK_SubOutputPersonRole_SubOutput] FOREIGN KEY ([SubOutput_ID]) REFERENCES [app].[SubOutput] ([SubOutput_ID])
);














GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'6', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'SubOutputPersonRole';


GO


