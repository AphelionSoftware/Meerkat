﻿CREATE TABLE [forms].[PotentialResponse] (
    [PotentialResponseID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]                VARCHAR (50)  NOT NULL,
    [Code]                VARCHAR (50)  NOT NULL,
    [TextDescription]     VARCHAR (MAX) NOT NULL,
    [QuestionID]          INT           NOT NULL,
    [Active]              INT           CONSTRAINT [DF__PotentialResponse_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255) CONSTRAINT [DF_PotentialResponse_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME      CONSTRAINT [DF_PotentialResponse_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255) CONSTRAINT [DF_PotentialResponse_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME      CONSTRAINT [DF_PotentialResponse_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PotentialResponse_3] PRIMARY KEY CLUSTERED ([PotentialResponseID] ASC),
    CONSTRAINT [FK_PotentialResponse_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_PotentialResponse_Question] FOREIGN KEY ([QuestionID]) REFERENCES [forms].[Question] ([QuestionID])
);

