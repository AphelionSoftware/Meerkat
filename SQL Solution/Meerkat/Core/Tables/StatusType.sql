CREATE TABLE [Core].[StatusType] (
    [ID]             INT             NOT NULL,
    [Code]           VARCHAR (50)    NOT NULL,
    [Name]           VARCHAR (255)   NOT NULL,
    [Value]          DECIMAL (20, 2) NOT NULL,
    [BusinessKey]    NVARCHAR (4000) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)   CONSTRAINT [DF_StatusType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME        CONSTRAINT [DF_StatusType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)   CONSTRAINT [DF_StatusType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME        CONSTRAINT [DF_StatusType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [Active]         INT             CONSTRAINT [DF_StatusType_Active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_StatusType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_StatusType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ_StatusType_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);




GO


