CREATE TABLE [settings].[TablesToExport] (
    [TablesToExport_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Table_Schema]      VARCHAR (255) NOT NULL,
    [Table_Name]        VARCHAR (255) NOT NULL,
    [Export]            BIT           CONSTRAINT [DF__TablesToE__Expor__63CEACD4] DEFAULT ((0)) NOT NULL,
    [Active]            INT           CONSTRAINT [DF__TablesToE__Activ__64C2D10D] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255) CONSTRAINT [DF_TablesToExport_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME      CONSTRAINT [DF_TablesToExport_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255) CONSTRAINT [DF_TablesToExport_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME      CONSTRAINT [DF_TablesToExport_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__TablesTo__0C91590DA0E643C6] PRIMARY KEY CLUSTERED ([TablesToExport_ID] ASC),
    CONSTRAINT [FK_TablesToExport_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

