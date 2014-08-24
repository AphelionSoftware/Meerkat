CREATE TABLE [forms].[PotentialResponse] (
    [PotentialResponse_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Name]                 VARCHAR (255)  NOT NULL,
    [Code]                 VARCHAR (50)   NOT NULL,
    [TextDescription]      VARCHAR (4000) NULL,
    [Question_ID]          INT            NOT NULL,
    [ResponseOrder]        INT            NOT NULL,
    [Active]               INT            CONSTRAINT [DF__PotentialResponse_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255)  CONSTRAINT [DF_PotentialResponse_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME       CONSTRAINT [DF_PotentialResponse_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255)  CONSTRAINT [DF_PotentialResponse_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME       CONSTRAINT [DF_PotentialResponse_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]            NVARCHAR (255) NULL,
    [Export]               BIT            NOT NULL,
    CONSTRAINT [PK_PotentialResponse_3] PRIMARY KEY CLUSTERED ([PotentialResponse_ID] ASC),
    CONSTRAINT [FK_PotentialResponse_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_PotentialResponse_Question] FOREIGN KEY ([Question_ID]) REFERENCES [forms].[Question] ([Question_ID])
);














GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'PotentialResponse', @level2type = N'COLUMN', @level2name = N'Export';

