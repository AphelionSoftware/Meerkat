CREATE TABLE [Access].[User_Location] (
    [User_Location_ID] INT           IDENTITY (1, 1) NOT NULL,
    [UserID]           INT           NOT NULL,
    [Location_ID]      INT           NOT NULL,
    [Active]           INT           CONSTRAINT [DF__User_Loca__Activ__19E0A4C2] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255) CONSTRAINT [DF_User_Location_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME      CONSTRAINT [DF_User_Location_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255) CONSTRAINT [DF_User_Location_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME      CONSTRAINT [DF_User_Location_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectLocation] PRIMARY KEY CLUSTERED ([UserID] ASC, [Location_ID] ASC),
    CONSTRAINT [FK_User_Location_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_User_Location_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_User_Location_User] FOREIGN KEY ([UserID]) REFERENCES [Access].[User] ([UserID])
);





