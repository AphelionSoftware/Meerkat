CREATE TABLE [settings].[DeployHistory] (
    [DeployHistory_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]             VARCHAR (50)   NULL,
    [Notes]            VARCHAR (8000) NULL,
    [Date]             DATE           DEFAULT (getdate()) NOT NULL,
    [Active]           INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255)  CONSTRAINT [DF_DH_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME       CONSTRAINT [DF_DH_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255)  CONSTRAINT [DF_DH_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME       CONSTRAINT [DF_DH_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([DeployHistory_ID] ASC),
    CONSTRAINT [FK_DH_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

