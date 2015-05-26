CREATE PROC Stage.usp_LocationUpdate
AS

INSERT INTO [Core].[Location]
           ([Code]
           ,[Name]
           ,LocalName
           ,[BusinessKey]
           ,[LocationType_ID]
		   ,[ParentLocation_ID]
           )

                select Src.Location, Src.Location, Src.Location
				,Src.Location 
               , (SELECT LocationType_ID FROM Core.LocationType LT
						WHERE LT.Name = Src.LocationType
						OR LT.Code = Src.LocationType
						OR CAST(LT.LocationType_ID as varchar(255)) = Src.LocationType
						) As LocationType_ID
               , (SELECT Location_ID FROM Core.Location L
						WHERE L.Name = Src.ParentLocation
						OR L.Code = Src.ParentLocation
						OR CAST(L.ParentLocation_ID as varchar(255)) = Src.ParentLocation
						) As ParentLocation_ID
                 from Stage.Location Src
                where not exists (select 1 from core.Location lExist
                where lExist.name = src.Location
					OR lExist.Code = src.Location
					OR CAST( lExist.Location_ID as varchar(255)) = src.Location
				)

UPDATE   Core.Location 
SET Geog = Src.Geog
FROM Core.Location L
INNER JOIN Stage.Location  Src
ON L.Name = Src.Location
OR L.Code = Src.Location
OR CAST( L.Location_ID  as varchar(255)) = Src.Location