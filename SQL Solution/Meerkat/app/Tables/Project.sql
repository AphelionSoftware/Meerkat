CREATE TABLE [app].[Project] (
    [ProjectID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [ShortName]       NVARCHAR (255) NOT NULL,
    [LongName]        VARCHAR (255)  NOT NULL,
    [TextDescription] VARCHAR (MAX)  NOT NULL,
    [ProjectParentID] INT            NULL,
    [Outcome_ID]       INT            NOT NULL,
    [Active]          INT            CONSTRAINT [DF_Project_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([ProjectID] ASC),
    CONSTRAINT [FK_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Project_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [FK_Project_Project] FOREIGN KEY ([ProjectParentID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [UW_Project_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);



