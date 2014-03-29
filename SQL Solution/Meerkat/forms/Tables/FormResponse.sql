CREATE TABLE [forms].[FormResponse] (
    [FormResponseID] INT           IDENTITY (1, 1) NOT NULL,
    [Text]           VARCHAR (MAX) NULL,
    [TrueFalse]      BIT           NULL,
    [FormID]         INT           NOT NULL,
    [Active]         INT           CONSTRAINT [DF__FormResponse_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_FormResponse_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_FormResponse_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FormResponse_3] PRIMARY KEY CLUSTERED ([FormResponseID] ASC),
    CONSTRAINT [FK_FormResponse_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_FormResponse_Form] FOREIGN KEY ([FormID]) REFERENCES [forms].[Form] ([FormID])
);

