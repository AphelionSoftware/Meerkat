﻿CREATE TABLE [disagg].[FacilityType] (
    [FacilityType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Active]          INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_FacilityType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_FacilityType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_FacilityType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_FacilityType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FacilityType] PRIMARY KEY CLUSTERED ([FacilityType_ID] ASC),
    CONSTRAINT [FK_FacilityType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);
