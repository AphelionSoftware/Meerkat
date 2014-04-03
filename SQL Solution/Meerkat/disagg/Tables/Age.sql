CREATE TABLE [disagg].[Age] (
    [Age_ID]         INT           IDENTITY (1, 1) NOT NULL,
    [Active]         INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_Age_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_Age_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_Age_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_Age_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Age] PRIMARY KEY CLUSTERED ([Age_ID] ASC),
    CONSTRAINT [FK_Age_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

