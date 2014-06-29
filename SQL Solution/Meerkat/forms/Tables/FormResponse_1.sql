CREATE TABLE [forms].[FormResponse] (
    [FormResponse_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Text]            VARCHAR (MAX) NULL,
    [TrueFalse]       BIT           NULL,
    [isConfidential]  BIT           NULL,
    [Form_ID]         INT           NOT NULL,
    [Location_ID]     INT           NULL,
    [Active]          INT           CONSTRAINT [DF__FormResponse_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_FormResponse_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_FormResponse_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FormResponse_3] PRIMARY KEY CLUSTERED ([FormResponse_ID] ASC),
    CONSTRAINT [FK_FormResponse_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_FormResponse_Form] FOREIGN KEY ([Form_ID]) REFERENCES [forms].[Form] ([Form_ID]),
    CONSTRAINT [FK_FormResponse_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID])
);





