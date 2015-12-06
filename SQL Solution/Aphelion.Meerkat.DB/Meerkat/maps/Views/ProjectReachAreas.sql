
CREATE VIEW [maps].[ProjectReachAreas]
As
SELECT  ISNULL(P.ProjectID,0) ProjectID,
 ISNULL(P.ShortName, 'Programme Indicators') ProjectName
 --,Geography::ConvexHullAggregate(geog) 
  ,  L.Geog--.STBuffer(16384) 
 Geog
 , ISNULL(P.Programme_ID, I.Programme_ID) Programme_ID
 , L.Location_ID
FROM  
(SELECT DISTINCT iv.Location_ID, i.Programme_ID, i.ProjectID FROM rbm.IndicatorValues iv
INNER JOIN app.Indicator I
ON iv.Indicator_ID = i.IndicatorID 
) I
CROSS APPLY (SELECT geog.EnvelopeCenter()  geog, Location_ID  FROM core.Location) L
INNER JOIN app.Project P
ON I.ProjectID = P.ProjectID
WHERE I.Location_ID = L.Location_ID
AND L.geog IS NOT null

--GROUP BY P.ProjectID
--, P.ShortName 
--, P.Programme_ID
--, I.Programme_ID

GO


