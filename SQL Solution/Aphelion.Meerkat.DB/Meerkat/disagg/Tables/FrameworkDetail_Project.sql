CREATE TABLE [disagg].[FrameworkDetail_Project] (
    [FrameworkDetail_Project_ID] INT           IDENTITY (1, 1) NOT NULL,
    [FrameworkDetail_ID]         INT           NULL,
    [ProjectID]                  INT           NULL,
    [Active]                     INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]              VARCHAR (255) CONSTRAINT [DF_FrameworkDetail_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]              DATETIME      CONSTRAINT [DF_FrameworkDetail_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]             VARCHAR (255) CONSTRAINT [DF_FrameworkDetail_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]             DATETIME      CONSTRAINT [DF_FrameworkDetail_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectFrameworkDetail] PRIMARY KEY CLUSTERED ([FrameworkDetail_Project_ID] ASC),
    CONSTRAINT [FK_FrameworkDetail_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_FrameworkDetail_Project_FrameworkDetail] FOREIGN KEY ([FrameworkDetail_ID]) REFERENCES [disagg].[FrameworkDetail] ([FrameworkDetail_ID]),
    CONSTRAINT [FK_FrameworkDetail_Project_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID])
);














GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'FrameworkDetail_Project';


GO


