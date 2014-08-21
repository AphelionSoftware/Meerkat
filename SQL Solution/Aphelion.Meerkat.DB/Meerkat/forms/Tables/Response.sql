CREATE TABLE [forms].[Response] (
    [Response_ID]          INT              IDENTITY (1, 1) NOT NULL,
    [FormResponse_ID]      INT              NOT NULL,
    [Question_ID]          INT              NOT NULL,
    [PotentialResponse_ID] INT              NULL,
    [Response]             VARCHAR (MAX)    NULL,
    [IntegerResponse]      INT              NULL,
    [DecimalResponse]      DECIMAL (20, 12) NULL,
    [TrueFalse]            BIT              NULL,
    [Active]               INT              CONSTRAINT [DF_Response_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255)    CONSTRAINT [DF_Response_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME         CONSTRAINT [DF_Response_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255)    CONSTRAINT [DF_Response_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME         CONSTRAINT [DF_Response_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [FormResponse_FNVID]   BIGINT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Response] PRIMARY KEY CLUSTERED ([Response_ID] ASC),
    CONSTRAINT [FK_Response_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Response_FormResponse] FOREIGN KEY ([FormResponse_ID]) REFERENCES [forms].[FormResponse] ([FormResponse_ID]),
    CONSTRAINT [FK_Response_PotentialResponse] FOREIGN KEY ([PotentialResponse_ID]) REFERENCES [forms].[PotentialResponse] ([PotentialResponse_ID]),
    CONSTRAINT [FK_Response_Question] FOREIGN KEY ([Question_ID]) REFERENCES [forms].[Question] ([Question_ID])
);









GO


