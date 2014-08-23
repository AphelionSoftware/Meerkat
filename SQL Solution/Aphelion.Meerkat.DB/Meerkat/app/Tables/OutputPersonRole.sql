CREATE TABLE [app].[OutputPersonRole] (
    [OutputPersonRole_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Output_ID]           INT           NULL,
    [Person_ID]           INT           NULL,
    [Role_ID]             INT           NULL,
    [Active]              INT           CONSTRAINT [DF_OutputPersonRole_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255) CONSTRAINT [DF_OutputPersonRole_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME      CONSTRAINT [DF_OutputPersonRole_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255) CONSTRAINT [DF_OutputPersonRole_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME      CONSTRAINT [DF_OutputPersonRole_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OutputPersonRole] PRIMARY KEY CLUSTERED ([OutputPersonRole_ID] ASC),
    CONSTRAINT [FK_OutputPersonRole_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_OutputPersonRole_Output] FOREIGN KEY ([Output_ID]) REFERENCES [app].[Output] ([Output_ID]),
    CONSTRAINT [FK_OutputPersonRole_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Core].[Person] ([Person_ID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_OutputPersonRole_Role] FOREIGN KEY ([Role_ID]) REFERENCES [Core].[Role] ([RoleID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Person];


GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Role];




GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Person];


GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Role];




GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Person];


GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Role];




GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Person];


GO
ALTER TABLE [app].[OutputPersonRole] NOCHECK CONSTRAINT [FK_OutputPersonRole_Role];




GO



GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'OutputPersonRole';

