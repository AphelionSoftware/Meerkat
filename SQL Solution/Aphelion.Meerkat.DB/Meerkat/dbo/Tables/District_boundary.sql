CREATE TABLE [dbo].[District_boundary] (
    [ID]         INT               IDENTITY (1, 1) NOT NULL,
    [REG_NAME]   NVARCHAR (255)    NULL,
    [REG_CODE]   BIGINT            NULL,
    [REG_ALT]    NVARCHAR (255)    NULL,
    [DIST_NAME]  NVARCHAR (255)    NULL,
    [DIS_CODE]   BIGINT            NULL,
    [DIST_ALT]   NVARCHAR (255)    NULL,
    [NOTE]       NVARCHAR (255)    NULL,
    [Area]       REAL              NULL,
    [DIST_2_NAM] NVARCHAR (255)    NULL,
    [geom]       [sys].[geography] NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [enforce_srid_geometry_District_boundary] CHECK ([geom].[STSrid]=(4326))
);


GO
CREATE SPATIAL INDEX [geog_sidx]
    ON [dbo].[District_boundary] ([geom]);

