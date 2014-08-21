CREATE TABLE [disagg].[Group] (
    [Group_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Name]           VARCHAR (255)  NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [Active]         INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_Group_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_Group_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_Group_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_Group_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]      NVARCHAR (255) NULL,
    CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED ([Group_ID] ASC),
    CONSTRAINT [FK_Group_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);








GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Group_BusinessKey]
    ON [disagg].[Group]([BusinessKey] ASC) WHERE ([Active]>=(0));

