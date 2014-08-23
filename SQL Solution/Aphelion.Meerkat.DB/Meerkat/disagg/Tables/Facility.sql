CREATE TABLE [disagg].[Facility] (
    [Facility_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Active]          INT            CONSTRAINT [DF__Facility__Active__39D87308] DEFAULT ((1)) NOT NULL,
    [FacilityType_ID] INT            NOT NULL,
    [Institution_ID]  INT            NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Facility_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Facility_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Facility_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Facility_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED ([Facility_ID] ASC),
    CONSTRAINT [FK_Facility_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Facility_FacilityType] FOREIGN KEY ([FacilityType_ID]) REFERENCES [disagg].[FacilityType] ([FacilityType_ID]),
    CONSTRAINT [FK_Facility_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID])
);










GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Facility_BusinessKey]
    ON [disagg].[Facility]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'Facility', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'2', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'Facility';

