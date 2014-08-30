﻿CREATE TABLE [Errors].[DimDate] (
    [QueueID]          INT            NOT NULL,
    [SSISErrorCode]    INT            NOT NULL,
    [SSISErrorColumn]  INT            NOT NULL,
    [PackageName]      VARCHAR (255)  NOT NULL,
    [ErrorType]        VARCHAR (255)  NOT NULL,
    [Date]             DATETIME       NOT NULL,
    [DateID]           INT            NOT NULL,
    [DateSK]           INT            NOT NULL,
    [Day]              INT            NOT NULL,
    [DayOfWeek]        VARCHAR (9)    NOT NULL,
    [DayOfYear]        INT            NOT NULL,
    [DaySuffix]        CHAR (3)       NOT NULL,
    [DOWInMonth]       INT            NOT NULL,
    [HolidayText]      VARCHAR (50)   NULL,
    [LocalMonthName]   NVARCHAR (9)   NULL,
    [LocalQuarterName] NVARCHAR (255) NULL,
    [LocalYearName]    NVARCHAR (4)   NULL,
    [MonthName]        VARCHAR (9)    NOT NULL,
    [MonthNumber]      INT            NOT NULL,
    [Quarter]          INT            NOT NULL,
    [QuarterName]      VARCHAR (255)  NOT NULL,
    [StandardDate]     VARCHAR (10)   NULL,
    [USDayOfWeek]      VARCHAR (9)    NOT NULL,
    [WeekOfMonth]      INT            NOT NULL,
    [WeekOfYear]       INT            NOT NULL,
    [YearName]         CHAR (4)       NOT NULL,
    [YearNumber]       INT            NOT NULL
);

