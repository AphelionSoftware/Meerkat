CREATE TABLE [Staging].[Question_Indicator_Rollup] (
    [Question_Indicator_RollupID] INT            NULL,
    [Question_ID]                 INT            NOT NULL,
    [RollupType_ID]               INT            NOT NULL,
    [IndicatorBusinessKey]        NVARCHAR (400) NOT NULL
);

