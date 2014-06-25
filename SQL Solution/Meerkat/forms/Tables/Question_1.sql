CREATE TABLE [forms].[Question] (
    [Question_ID]              INT           IDENTITY (1, 1) NOT NULL,
    [Name]                     VARCHAR (50)  NOT NULL,
    [Code]                     VARCHAR (50)  NOT NULL,
    [TextDescription]          VARCHAR (MAX) NOT NULL,
    [QuestionType_ID]          INT           NOT NULL,
    [Category_ID]              INT           NOT NULL,
    [QuestionOrder]            INT           NOT NULL,
    [Active]                   INT           CONSTRAINT [DF__Question_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]            VARCHAR (255) CONSTRAINT [DF_Question_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]            DATETIME      CONSTRAINT [DF_Question_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]           VARCHAR (255) CONSTRAINT [DF_Question_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]           DATETIME      CONSTRAINT [DF_Question_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [MultipleChoiceResponseID] INT           NULL,
    [Response]                 VARCHAR (MAX) NULL,
	[IntegerResponse]         INT NULL,
    [DecimalResponse]         DECIMAL(20,12) NULL,
    [TrueOrFalse]              BIT           NULL,
    CONSTRAINT [PK_Question_3] PRIMARY KEY CLUSTERED ([Question_ID] ASC),
    CONSTRAINT [FK_Question_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Question_Category] FOREIGN KEY ([Category_ID]) REFERENCES [forms].[Category] ([Category_ID]),
    CONSTRAINT [FK_Question_PotentialResponse] FOREIGN KEY ([MultipleChoiceResponseID]) REFERENCES [forms].[PotentialResponse] ([PotentialResponse_ID]),
    CONSTRAINT [FK_Question_QuestionType] FOREIGN KEY ([QuestionType_ID]) REFERENCES [forms].[QuestionType] ([QuestionType_ID]),
    CONSTRAINT [IX_Question] UNIQUE NONCLUSTERED ([Category_ID] ASC, [QuestionOrder] ASC)
);







