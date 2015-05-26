


CREATE VIEW [DQ].[IndicatorsWithDeletedLocations]
as
SELECT Distinct lt.name LocationType, l.name LocationName, i.shortname IndicatorShortname, i.code IndicatorCode, RP.Summary
  FROM [Core].[LocationType] Lt 
  inner join core.location l
  on lt.LocationType_ID = l.LocationType_ID
  inner join rbm.indicatorvalues iv
  on l.Location_ID = iv.Location_ID
  inner join app.Indicator i
  on i.IndicatorID = iv.Indicator_ID
    inner join Core.ReportingPeriod RP
	ON IV.ReportPeriodID  = RP.ReportingPeriod

  where lt.Active < 1
  OR L.Active < 1