CREATE TABLE [settings].[LoadTimes] (
    [LoadTimes_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [LoadTime]       DATETIME      NOT NULL,
    [Active]         INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_Loadtimessys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_Loadtimessys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_Loadtimessys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_Loadtimessys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([LoadTimes_ID] ASC)
);

