CREATE TABLE [Staging].[EventRegister] (
    [EventRegister_ID]     INT            NULL,
    [DateOfBirth]          DATE           NULL,
    [FirstName]            VARCHAR (255)  NULL,
    [IdentificationNumber] VARCHAR (255)  NULL,
    [Surname]              VARCHAR (255)  NULL,
    [Age_ID]               INT            NULL,
    [Event_ID]             INT            NOT NULL,
    [GenderBusinessKey]    NVARCHAR (400) NULL
);

