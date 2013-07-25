CREATE TABLE [app].[Activity] (
    [ActivityID]      INT            IDENTITY (1, 1) NOT NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [LongName]        VARCHAR(500) NOT NULL,
    [TextDescription] VARCHAR (MAX)  NOT NULL,
    [ProjectID]       INT            NOT NULL,
    [Active]          INT            CONSTRAINT [DF__Activity__sys_Ac__3AA1AEB8] DEFAULT ((1)) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Activity_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Activity_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Activity_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Activity_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Activity_3] PRIMARY KEY CLUSTERED ([ActivityID] ASC),
    CONSTRAINT [FK_Activity_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Activity_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID])
);

