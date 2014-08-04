
CREATE VIEW [rpt].[vwEachPerson] AS

SELECT TOP 2147483647 
P.Name
, P.Person_ID
		, RptSrc.Label
		, RptSrc.Value AS Value
		, CAST(ISNULL(RptSrc.[Date] ,'2000/01/01' ) as Date) AS [Date]
		, ISNULL(RptSrc.DateID, 20000101) DateID
 FROM Core.Person P

OUTER APPLY (
	SELECT 
		[Date]
		, DateID 
		
		, Label = CASE WHEN COUNT(*) = 1 THEN Max(Label) ELSE CAST(Count(*) as varchar(8)) + ' reports due' END
		, Sum(Value) as Value
	FROM rpt.vwAllReportsByPeople Rpt
	WHERE Rpt.Person_ID = P.Person_ID
	GROUP BY [Date], DateID
	) RptSrc 

WHERE RptSrc.DateID IS NOT NULL

ORDER BY P.name, RptSrc.DateID