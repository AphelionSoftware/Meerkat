CREATE TABLE [forms].[QuestionType] (
    [QuestionTypeID]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Code]            VARCHAR (50)  NOT NULL,
    [TextDescription] VARCHAR (MAX) NOT NULL,
    [Active]          INT           CONSTRAINT [DF__QuestionType_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_QuestionType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_QuestionType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_QuestionType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_QuestionType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_QuestionType_3] PRIMARY KEY CLUSTERED ([QuestionTypeID] ASC),
    CONSTRAINT [FK_QuestionType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ__Question__A25C5AA73ACB3951] UNIQUE NONCLUSTERED ([Code] ASC)
);

