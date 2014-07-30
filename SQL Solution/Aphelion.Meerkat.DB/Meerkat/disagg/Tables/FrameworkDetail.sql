﻿CREATE TABLE [disagg].[FrameworkDetail] (
    [FrameworkDetail_ID]         INT           IDENTITY (1, 1) NOT NULL,
    [Code]                 VARCHAR (50)  NOT NULL,
    [Name]                 VARCHAR (255) NOT NULL,
    [BusinessKey]          NVARCHAR(4000) NOT NULL,
    [Active]               INT           CONSTRAINT [DF__FrameworkDetail__Activ__168449D3] DEFAULT ((1)) NOT NULL,
    [Framework_ID]			INT     NOT NULL,
    [sys_CreatedBy]        VARCHAR (255) CONSTRAINT [DF_FrameworkDetail_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME      CONSTRAINT [DF_FrameworkDetail_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255) CONSTRAINT [DF_FrameworkDetail_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME      CONSTRAINT [DF_FrameworkDetail_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FrameworkDetail] PRIMARY KEY CLUSTERED ([FrameworkDetail_ID] ASC),
    CONSTRAINT [FK_FrameworkDetail_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_FrameworkDetail_Framework] FOREIGN KEY ([Framework_ID]) REFERENCES [disagg].[Framework] ([Framework_ID])
);
