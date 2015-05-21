CREATE TABLE [dbo].[Regional_boundary] (
    [ID]         INT               IDENTITY (1, 1) NOT NULL,
    [REG_CODE]   BIGINT            NULL,
    [REG_NAME]   NVARCHAR (255)    NULL,
    [REG_ALT]    NVARCHAR (255)    NULL,
    [NOTE]       NVARCHAR (255)    NULL,
    [LABEL_ANGL] INT               NULL,
    [Area]       INT               NULL,
    [Area_sqKm]  BIGINT            NULL,
    [Reg_Nm_2]   NVARCHAR (255)    NULL,
    [geom]       [sys].[geography] NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [enforce_srid_geometry_Regional_boundary] CHECK ([geom].[STSrid]=(4326))
);


GO
CREATE SPATIAL INDEX [geog_sidx]
    ON [dbo].[Regional_boundary] ([geom]);

