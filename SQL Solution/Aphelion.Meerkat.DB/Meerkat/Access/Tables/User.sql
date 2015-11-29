CREATE TABLE [Access].[User] (
    [UserID]             INT            IDENTITY (1, 1) NOT NULL,
    [UserSourceKey]      VARCHAR (255)  NULL,
    [UserName]           VARCHAR (255)  NOT NULL,
    [UserCode]           VARCHAR (255)  NOT NULL,
    [StartDate]          DATETIME       CONSTRAINT [DF_User_StartDate] DEFAULT (getdate()) NOT NULL,
    [StartDate_ID]       AS             (CONVERT([int],CONVERT([varchar](10),[startdate],(112)),(0))),
    [FinalDate]          DATETIME       NULL,
    [FinalDate_ID]       AS             (CONVERT([int],CONVERT([varchar](10),[finaldate],(112)),(0))),
    [Email]              VARCHAR (255)  NULL,
    [ADUsername]         VARCHAR (255)  NULL,
    [SharepointUserName] VARCHAR (255)  NULL,
    [Active]             INT            CONSTRAINT [DF_User_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedOn]      DATETIME       CONSTRAINT [DF__User__sys_Crea__1A9EF37A] DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]      NVARCHAR (255) CONSTRAINT [DF__User__sys_Crea__1B9317B3] DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]     DATETIME       CONSTRAINT [DF__User__sys_Modi__1C873BEC] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]     NVARCHAR (255) CONSTRAINT [DF__User__sys_Modi__1D7B6025] DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserID] ASC),
    CONSTRAINT [FK_User_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

