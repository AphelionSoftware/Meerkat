﻿CREATE TABLE [Core].[LocationType] (
    [LocationType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [Active]          INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_LocationType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_LocationType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_LocationType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_LocationType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LocationType] PRIMARY KEY CLUSTERED ([LocationType_ID] ASC),
    CONSTRAINT [FK_LocationType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

