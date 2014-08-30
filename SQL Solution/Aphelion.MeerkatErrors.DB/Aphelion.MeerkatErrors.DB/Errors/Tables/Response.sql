CREATE TABLE [Errors].[Response] (
    [QueueID]              INT              NOT NULL,
    [SSISErrorCode]        INT              NOT NULL,
    [SSISErrorColumn]      INT              NOT NULL,
    [PackageName]          VARCHAR (255)    NOT NULL,
    [ErrorType]            VARCHAR (255)    NOT NULL,
    [Response_ID]          INT              NULL,
    [DecimalResponse]      DECIMAL (20, 12) NULL,
    [FormResponse_FNVID]   BIGINT           NOT NULL,
    [FormResponse_ID]      INT              NOT NULL,
    [IntegerResponse]      INT              NULL,
    [PotentialResponse_ID] INT              NULL,
    [Question_ID]          INT              NOT NULL,
    [Response]             VARCHAR (MAX)    NULL
);

