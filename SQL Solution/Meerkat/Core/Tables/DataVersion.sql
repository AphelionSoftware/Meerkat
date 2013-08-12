﻿CREATE TABLE [Core].[DataVersion] (
    [DataVersion_ID]       INT           IDENTITY (1, 1) NOT NULL,
    [Code]                 VARCHAR (20)  NOT NULL,
    [Name]                 VARCHAR (50)  NOT NULL,
    [Description]          VARCHAR (MAX) NOT NULL,
	[Order]                 INT  NOT NULL,
    [Active]               INT           CONSTRAINT [DF__DataVersi__sys_A__50C5FA01] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255) CONSTRAINT [DF_DataVersion_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME      CONSTRAINT [DF_DataVersion_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255) CONSTRAINT [DF_DataVersion_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME      CONSTRAINT [DF_DataVersion_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED ([DataVersion_ID] ASC),
    CONSTRAINT [FK_DataVersion_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
   
);

