CREATE TABLE [disagg].[Project_ResultArea] (
    [Project_ResultArea_ID] INT           IDENTITY (1, 1) NOT NULL,
    [ResultAreaID]          INT           NULL,
    [ProjectID]             INT           NULL,
    [Active]                INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]         VARCHAR (255) CONSTRAINT [DF_Project_ResultArea_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]         DATETIME      CONSTRAINT [DF_Project_ResultArea_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]        VARCHAR (255) CONSTRAINT [DF_Project_ResultArea_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]        DATETIME      CONSTRAINT [DF_Project_ResultArea_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectResultArea] PRIMARY KEY CLUSTERED ([Project_ResultArea_ID] ASC),
    CONSTRAINT [FK_Project_ResultArea_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Project_ResultArea_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [FK_Project_ResultArea_ResultArea] FOREIGN KEY ([ResultAreaID]) REFERENCES [disagg].[ResultArea] ([ResultArea_ID])
);








GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'Project_ResultArea';

