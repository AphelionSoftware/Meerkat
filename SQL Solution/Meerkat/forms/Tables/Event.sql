CREATE TABLE [forms].[Event] (
    [Event_ID]                INT           IDENTITY (1, 1) NOT NULL,
    [EventDate]               DATE          NULL,
    [ScheduledEventStartTime] TIME (7)      NULL,
    [ScheduledEventEndTime]   TIME (7)      NULL,
    [EventStartTime]          TIME (7)      NULL,
    [EventEndTime]            TIME (7)      NULL,
    [Active]                  INT           CONSTRAINT [DF__Event_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]           VARCHAR (255) CONSTRAINT [DF_Event_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]           DATETIME      CONSTRAINT [DF_Event_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]          VARCHAR (255) CONSTRAINT [DF_Event_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]          DATETIME      CONSTRAINT [DF_Event_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Event_3] PRIMARY KEY CLUSTERED ([Event_ID] ASC),
    CONSTRAINT [FK_Event_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

