﻿CREATE TABLE [disagg].[StructureType] (
    [StructureType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]             VARCHAR (50)   NOT NULL,
    [Name]             VARCHAR (255)  NOT NULL,
    [BusinessKey]      NVARCHAR (400) NOT NULL,
    [Active]           INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255)  CONSTRAINT [DF_StructureType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME       CONSTRAINT [DF_StructureType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255)  CONSTRAINT [DF_StructureType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME       CONSTRAINT [DF_StructureType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]        NVARCHAR (255) NULL,
    CONSTRAINT [PK_StructureType] PRIMARY KEY CLUSTERED ([StructureType_ID] ASC),
    CONSTRAINT [FK_StructureType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'StructureType', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'StructureType';

