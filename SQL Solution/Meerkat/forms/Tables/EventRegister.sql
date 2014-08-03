﻿CREATE TABLE [forms].[EventRegister] (
    [EventRegister_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [Event_ID]             INT           NOT NULL,
    [FirstName]            VARCHAR (255) NULL,
    [Surname]              VARCHAR (255) NULL,
    [IdentificationNumber] VARCHAR (255) NULL,
    [Age_ID]               INT           NULL,
    [DateOfBirth]          DATE          NULL,
    [Gender_ID]            INT           NULL,
    [Active]               INT           CONSTRAINT [DF__EventRegister_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255) CONSTRAINT [DF_EventRegister_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME      CONSTRAINT [DF_EventRegister_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255) CONSTRAINT [DF_EventRegister_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME      CONSTRAINT [DF_EventRegister_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EventRegister_3] PRIMARY KEY CLUSTERED ([EventRegister_ID] ASC),
    CONSTRAINT [FK_EventRegister_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_EventRegister_Age1] FOREIGN KEY ([Age_ID]) REFERENCES [disagg].[Age] ([Age_ID]),
    CONSTRAINT [FK_EventRegister_Event] FOREIGN KEY ([Event_ID]) REFERENCES [forms].[Event] ([Event_ID]),
    CONSTRAINT [FK_EventRegister_Gender] FOREIGN KEY ([Gender_ID]) REFERENCES [disagg].[Gender] ([Gender_ID])
);






