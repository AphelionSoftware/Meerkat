CREATE TABLE [Staging].[Response] (
    [Response_ID]          INT              NULL,
    [DecimalResponse]      DECIMAL (20, 12) NULL,
    [FormResponse_FNVID]   BIGINT           NOT NULL,
    [IntegerResponse]      INT              NULL,
    [Response]             VARCHAR (MAX)    NULL,
    [FormResponse_ID]      INT              NOT NULL,
    [PotentialResponse_ID] INT              NULL,
    [Question_ID]          INT              NOT NULL
);

