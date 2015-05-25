
CREATE VIEW [DQ].[MilestoneWithDeletedLocations]
as
SELECT Distinct lt.name LocationType, l.name LocationName, i.shortname Milestonehortname, i.code IndicatorCode
  FROM [Core].[LocationType] Lt 
  inner join core.location l
  on lt.LocationType_ID = l.LocationType_ID
  inner join rbm.indicatorvalues iv
  on l.Location_ID = iv.Location_ID
  inner join app.Indicator i
  on i.IndicatorID = iv.Indicator_ID
  where lt.Active < 1