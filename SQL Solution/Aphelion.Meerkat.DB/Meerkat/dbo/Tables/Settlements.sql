CREATE TABLE [dbo].[Settlements] (
    [ID]         INT              IDENTITY (1, 1) NOT NULL,
    [NAME]       NVARCHAR (255)   NULL,
    [ALT_NAME1]  NVARCHAR (255)   NULL,
    [ALT_NAME2]  NVARCHAR (255)   NULL,
    [SOURCE]     NVARCHAR (255)   NULL,
    [DEFINITION] NVARCHAR (255)   NULL,
    [REG_NAME]   NVARCHAR (255)   NULL,
    [DIST_NAME]  NVARCHAR (255)   NULL,
    [RELIABILIT] NVARCHAR (255)   NULL,
    [X_COORD]    FLOAT (53)       NULL,
    [Y_COORD]    FLOAT (53)       NULL,
    [P_CODE]     NVARCHAR (255)   NULL,
    [geom]       [sys].[geometry] NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [enforce_srid_geometry_Settlements] CHECK ([geom].[STSrid]=(0))
);


GO
CREATE SPATIAL INDEX [geom_sidx]
    ON [dbo].[Settlements] ([geom])
    USING GEOMETRY_GRID
    WITH  (
            BOUNDING_BOX = (XMAX = 51.28266, XMIN = 40.99208, YMAX = 51.28266, YMIN = -1.63754),
            GRIDS = (LEVEL_1 = HIGH, LEVEL_2 = HIGH, LEVEL_3 = HIGH, LEVEL_4 = HIGH)
          );

