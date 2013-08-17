CREATE TABLE [app].[SubOutput] (
    [SubOutput_ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)  NOT NULL,
    [ShortName]       VARCHAR (50)  NOT NULL,
    [BusinessKey]     VARCHAR (MAX) NULL,
    [Output_ID]       INT           NOT NULL,
    [LongName]        VARCHAR (500) NOT NULL,
    [TextDescription] VARCHAR (MAX) NULL,
    [Active]          INT            NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_SubOutput_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_SubOutput_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_SubOutput_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_SubOutput_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SubOutput] PRIMARY KEY CLUSTERED ([SubOutput_ID] ASC),
    CONSTRAINT [FK_SubOutput_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_SubOutput_Output] FOREIGN KEY ([Output_ID]) REFERENCES [app].[Output] ([Output_ID])
);

