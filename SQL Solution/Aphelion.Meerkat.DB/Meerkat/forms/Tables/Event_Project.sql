CREATE TABLE [forms].[Event_Project] (
    [Event_Project_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Event_ID]         INT           NULL,
    [Project_ID]       INT           NULL,
    [Active]           INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255) CONSTRAINT [DF_Event_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME      CONSTRAINT [DF_Event_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255) CONSTRAINT [DF_Event_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME      CONSTRAINT [DF_Event_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectEvent] PRIMARY KEY CLUSTERED ([Event_Project_ID] ASC),
    CONSTRAINT [FK_Event_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Event_Project_Event] FOREIGN KEY ([Event_ID]) REFERENCES [forms].[Event] ([Event_ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'Event_Project';

