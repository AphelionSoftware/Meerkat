CREATE TABLE [disagg].[Framework_Project] (
    [Framework_Project_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Framework_ID]         INT           NULL,
    [ProjectID]            INT           NULL,
    [Active]               INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255) CONSTRAINT [DF_Framework_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME      CONSTRAINT [DF_Framework_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255) CONSTRAINT [DF_Framework_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME      CONSTRAINT [DF_Framework_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectFramework] PRIMARY KEY CLUSTERED ([Framework_Project_ID] ASC),
    CONSTRAINT [FK_Framework_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Framework_Project_Framework] FOREIGN KEY ([Framework_ID]) REFERENCES [disagg].[Framework] ([Framework_ID]),
    CONSTRAINT [FK_Framework_Project_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID])
);

