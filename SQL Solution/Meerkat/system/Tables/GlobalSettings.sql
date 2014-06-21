CREATE TABLE [settings].[GlobalSettings]
(
	[GlobalSettings_ID] INT           IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Code]           VARCHAR (50)  NOT NULL,
    [Name]           VARCHAR (255) NOT NULL,
    [Value]			 VARCHAR(8000) NOT NULL,
	[Active]         INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_Age_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_Age_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_Age_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_Age_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [FK_Age_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])

)
