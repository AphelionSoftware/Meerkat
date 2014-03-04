CREATE TABLE [Core].[ActiveType] (
    [ID]             INT           NOT NULL,
    [Code]           VARCHAR (50)  NOT NULL,
    [Name]           VARCHAR (255) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_ActiveType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_ActiveType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_ActiveType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_ActiveType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ActiveType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UQ_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);



