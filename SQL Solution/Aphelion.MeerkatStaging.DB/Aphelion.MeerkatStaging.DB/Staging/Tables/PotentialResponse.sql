CREATE TABLE [Staging].[PotentialResponse] (
    [PotentialResponse_ID] INT            NULL,
    [Code]                 VARCHAR (50)   NOT NULL,
    [LocalName]            NVARCHAR (255) NULL,
    [Name]                 VARCHAR (255)  NOT NULL,
    [ResponseOrder]        INT            NOT NULL,
    [TextDescription]      VARCHAR (4000) NULL,
    [Question_ID]          INT            NOT NULL
);

