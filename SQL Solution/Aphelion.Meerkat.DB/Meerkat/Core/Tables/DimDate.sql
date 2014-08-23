CREATE TABLE [Core].[DimDate] (
    [DateSK]           INT            IDENTITY (1, 1) NOT NULL,
    [DateID]           INT            NOT NULL,
    [Date]             DATETIME       NOT NULL,
    [Day]              INT            NOT NULL,
    [DaySuffix]        CHAR (3)       NOT NULL,
    [USDayOfWeek]      VARCHAR (9)    NOT NULL,
    [DayOfWeek]        VARCHAR (9)    NOT NULL,
    [DOWInMonth]       INT            NOT NULL,
    [DayOfYear]        INT            NOT NULL,
    [WeekOfYear]       INT            NOT NULL,
    [WeekOfMonth]      INT            NOT NULL,
    [MonthNumber]      INT            NOT NULL,
    [MonthName]        VARCHAR (9)    NOT NULL,
    [Quarter]          INT            NOT NULL,
    [QuarterName]      VARCHAR (255)  NOT NULL,
    [YearName]         CHAR (4)       NOT NULL,
    [YearNumber]       INT            NOT NULL,
    [StandardDate]     VARCHAR (10)   NULL,
    [IsPublicHoliday]  BIT            CONSTRAINT [DF__DimDate__IsPubli__477199F1] DEFAULT ((0)) NULL,
    [HolidayText]      VARCHAR (50)   NULL,
    [IsWorkDay]        BIT            CONSTRAINT [DF_DimDate_IsWorkDay] DEFAULT ((1)) NOT NULL,
    [Active]           INT            CONSTRAINT [DF_DimDate_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255)  CONSTRAINT [DF_DimDate_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME       CONSTRAINT [DF_DimDate_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255)  CONSTRAINT [DF_DimDate_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME       CONSTRAINT [DF_DimDate_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalMonthName]   NVARCHAR (9)   NULL,
    [LocalQuarterName] NVARCHAR (255) NULL,
    [LocalYearName]    NVARCHAR (4)   NULL,
    CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([DateID] ASC),
    CONSTRAINT [FK_DimDate_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);










GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'DimDate';

