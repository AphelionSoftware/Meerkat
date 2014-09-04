CREATE TABLE [Access].[RoleType] (
    [RoleType_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [RoleTypeSourceKey] VARCHAR (255)  NULL,
    [LoadDate]          DATETIME       CONSTRAINT [DF_RoleType_LoadDate] DEFAULT (getdate()) NOT NULL,
    [Active]            INT            CONSTRAINT [DF_RoleType_Active] DEFAULT ((1)) NOT NULL,
    [RoleTypeName]      VARCHAR (255)  NOT NULL,
    [RoleTypeCode]      VARCHAR (255)  NOT NULL,
    [LoadDateID]        AS             (CONVERT([int],CONVERT([varchar](10),[loaddate],(112)),(0))),
    [sys_CreatedOn]     DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]     NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]    DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_RoleType] PRIMARY KEY CLUSTERED ([RoleType_ID] ASC),
    CONSTRAINT [FK_RoleType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);



