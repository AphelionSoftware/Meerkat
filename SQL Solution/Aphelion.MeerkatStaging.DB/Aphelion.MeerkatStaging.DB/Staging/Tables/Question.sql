CREATE TABLE [Staging].[Question] (
    [Question_ID]              INT              NULL,
    [Code]                     VARCHAR (50)     NOT NULL,
    [DecimalResponse]          DECIMAL (20, 12) NULL,
    [FormResponse_FNVID]       BIGINT           NULL,
    [IntegerResponse]          INT              NULL,
    [LocalName]                NVARCHAR (255)   NULL,
    [Name]                     VARCHAR (255)    NOT NULL,
    [QuestionOrder]            INT              NOT NULL,
    [Response]                 VARCHAR (MAX)    NULL,
    [TextDescription]          VARCHAR (4000)   NULL,
    [Age_ID]                   INT              NULL,
    [Category_ID]              INT              NOT NULL,
    [MultipleChoiceResponseID] INT              NULL,
    [QuestionType_ID]          INT              NOT NULL,
    [AgeBandBusinessKey]       NVARCHAR (400)   NULL,
    [CommunityTypeBusinessKey] NVARCHAR (400)   NULL,
    [GenderBusinessKey]        NVARCHAR (400)   NULL,
    [GroupBusinessKey]         NVARCHAR (400)   NULL,
    [InstitutionBusinessKey]   NVARCHAR (400)   NULL,
    [LocationBusinessKey]      NVARCHAR (400)   NULL
);

