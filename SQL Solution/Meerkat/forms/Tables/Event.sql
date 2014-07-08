CREATE TABLE [forms].[Event] (
    [Event_ID]                INT           IDENTITY (1, 1) NOT NULL,
    [Name]                    VARCHAR (255) NOT NULL,
    [Code]                    VARCHAR (50)  NOT NULL,
    [TextDescription]         VARCHAR (MAX) NOT NULL,
    [EventDate]               DATE          NOT NULL,
    [ScheduledEventStartTime] TIME (7)      NULL,
    [ScheduledEventEndTime]   TIME (7)      NULL,
    [EventStartTime]          TIME (7)      NULL,
    [EventEndTime]            TIME (7)      NULL,
    [Project_ID]              INT           NOT NULL,
    [Location_ID]             INT           NULL,
    [TrainingInstitution_ID]  INT           NULL,
    [Active]                  INT           CONSTRAINT [DF__Event_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]           VARCHAR (255) CONSTRAINT [DF_Event_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]           DATETIME      CONSTRAINT [DF_Event_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]          VARCHAR (255) CONSTRAINT [DF_Event_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]          DATETIME      CONSTRAINT [DF_Event_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [EventDate_ID]            AS            (CONVERT([int],CONVERT([varchar](8),[EventDate],(112)))),
    CONSTRAINT [PK_Event_3] PRIMARY KEY CLUSTERED ([Event_ID] ASC),
    CONSTRAINT [FK_Event_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Event_Institution] FOREIGN KEY ([TrainingInstitution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID]),
    CONSTRAINT [FK_Event_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_Event_Project] FOREIGN KEY ([Project_ID]) REFERENCES [app].[Project] ([ProjectID])
);













