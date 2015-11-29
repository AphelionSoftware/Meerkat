INSERT INTO [Core].[Location]
           ([Code]
           ,[Name]
           ,LocalName
           ,[BusinessKey]
           ,[LocationType_ID]
           ,[AreaKM]
           ,[Geog]
           )

		   select REG_CODE, Reg_name, Reg_alt
		   ,cast(reg_code as nvarchar(255)) + ' ' + reg_name
		   , 3
		   ,Area_sqKm
		   , geom
		    from Meerkat.[dbo].[Regional_boundary] rb
		   where not exists (select 1 from core.Location l
		   where l.name = rb.REG_NAME)
		   

INSERT INTO [Core].[Location]
           ([Code]
           ,[Name]
           
           ,[BusinessKey]
           ,[LocationType_ID]
           ,[AreaKM]
           ,[Geog]
		   ,ParentLocation_ID 
           )
    
SELECT Dis_Code , Dist_Name,
cast(Dis_Code  as nvarchar(255)) + ' ' + DIST_NAME
, 4
, Area
, geom
, (SELECT   [Location_ID]
  FROM [Core].[Location] L
  WHERE L.BusinessKey = cast(reg_code as nvarchar(255)) + ' ' + reg_name
  )

  FROM Meerkat.[dbo].[District_boundary] db
  where not exists ( 
  select 1 FROM Core.Location l
  where  db.dist_name = l.Name
  )


 

UPDATE Core.Location 
SET Geog = Geom
FROM Core.Location L
INNER JOIN Meerkat.dbo.Regional_boundary RB
ON L.Name = RB.REG_NAME


UPDATE Core.Location 
SET Geog = Geom
FROM Core.Location L
INNER JOIN Meerkat.dbo.District_boundary DB
ON L.Name = DB.DIST_NAME


GO



INSERT INTO [Core].[Location]
           ([Code]
           ,[Name]
           
           ,[BusinessKey]
           ,[LocationType_ID]
           ,[AreaKM]
           ,[Geog]
		   ,ParentLocation_ID 
           )
    
SELECT ID , Name,
cast(ID  as nvarchar(255)) + ' ' + Name
, 9
, NULL Area
, geography::STPointFromText(geom.STAsText(), 4326)
, (SELECT   [Location_ID]
  FROM [Core].[Location] L
  WHERE L.Name = cast(dist_name as nvarchar(255)) 
  )
  --select *
  FROM Meerkat.[dbo].[Settlements] S
  where not exists ( 
  select 1 FROM Core.Location l
  where  s.Name = l.Name
  )


