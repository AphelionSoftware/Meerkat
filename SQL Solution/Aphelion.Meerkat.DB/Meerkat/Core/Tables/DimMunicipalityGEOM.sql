CREATE TABLE [Core].[DimMunicipalityGEOM] (
    [PK_ID]          INT               IDENTITY (1, 1) NOT NULL,
    [ID]             BIGINT            NULL,
    [LBL]            NVARCHAR (255)    NULL,
    [FIP]            NVARCHAR (255)    NULL,
    [MMT_ID]         NVARCHAR (255)    NULL,
    [SHORT__FRM]     NVARCHAR (255)    NULL,
    [LONG_FRM]       NVARCHAR (255)    NULL,
    [ADM0]           NVARCHAR (255)    NULL,
    [ADM1]           NVARCHAR (255)    NULL,
    [ADM2]           NVARCHAR (255)    NULL,
    [ADM3]           NVARCHAR (255)    NULL,
    [ADM4]           NVARCHAR (255)    NULL,
    [ADM5]           NVARCHAR (255)    NULL,
    [geom]           [sys].[geography] NULL,
    [Active]         INT               CONSTRAINT [DF_DimMunicipalityGEOM_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)     CONSTRAINT [DF_DimMunicipalityGEOM_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME          CONSTRAINT [DF_DimMunicipalityGEOM_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)     CONSTRAINT [DF_DimMunicipalityGEOM_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME          CONSTRAINT [DF_DimMunicipalityGEOM_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DimMuicipalityGEOM] PRIMARY KEY CLUSTERED ([PK_ID] ASC),
    CONSTRAINT [enforce_srid_geometry_DimMunicipalityGEOM] CHECK ([geom].[STSrid]=(4326))
);






GO


