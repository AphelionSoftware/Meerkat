
CREATE VIEW [maps].[ProjectReachAreas]
As
SELECT  ISNULL(P.ProjectID,0) ProjectID,
 ISNULL(P.ShortName, 'Programme Indicators') ProjectName
 ,Geography::ConvexHullAggregate(geog) Geog
 , ISNULL(P.Programme_ID, I.Programme_ID) Programme_ID
FROM  
rbm.IndicatorValues iv 
inner join app.Indicator I
on iv.Indicator_ID = i.IndicatorID 
CROSS APPLY (select geog.EnvelopeCenter()  geog, Location_ID  from core.Location) L
inner join app.Project P
on I.ProjectID = P.ProjectID
WHERE iv.Location_ID = L.Location_ID

GROUP BY P.ProjectID
, P.ShortName 
, P.Programme_ID
, I.Programme_ID