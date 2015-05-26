


CREATE VIEW [DQ].[PeopleReachedWithDeletedLocations]
as
SELECT Distinct lt.name LocationType, l.name LocationName, RP.Summary
  FROM [Core].[LocationType] Lt 
  inner join core.location l
  on lt.LocationType_ID = l.LocationType_ID
  inner join rbm.PeopleReachedValues prv
  on l.Location_ID = prv.Location_ID
  inner join Core.ReportingPeriod RP
	ON PRV.ReportingPeriod_ID  = RP.ReportingPeriod

  where lt.Active < 1
  OR L.Active < 1