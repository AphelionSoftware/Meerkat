CREATE TABLE [disagg].[Institution] (
    [Institution_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Name]           VARCHAR (255)  NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [Active]         INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_Institution_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_Institution_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_Institution_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_Institution_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]      NVARCHAR (255) NULL,
    CONSTRAINT [PK_Institution] PRIMARY KEY CLUSTERED ([Institution_ID] ASC),
    CONSTRAINT [FK_Institution_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);








GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Institution_BusinessKey]
    ON [disagg].[Institution]([BusinessKey] ASC) WHERE ([Active]>=(0));

