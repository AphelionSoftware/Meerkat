CREATE VIEW rpt.vwEachReport
AS
select 
	CR.Name CustomReportName
	, CR.Name + ' by ' + P.Name as  Name
	, DD.[Date]
	, DD.DateID
	, P.Name PersonName
	, CR.Name + ' due by ' + P.Name + ' on ' + convert(varchar(255),ReportDueDate, 102) As Label
	, HighlightType = CASE 
		WHEN DD.[Date] < CRC.ReportWarningStartDate THEN 'Notice' 
		WHEN DD.[Date] < CRC.ReportDeadlineStartDate THEN 'Warning'
		WHEN DD.[Date] < CRC.ReportDueDate THEN 'Deadline'
		WHEN DD.[Date] = CRC.ReportDueDate THEN 'Due'
		END
, Value = CASE 
		WHEN DD.[Date] < CRC.ReportWarningStartDate THEN 1 
		WHEN DD.[Date] < CRC.ReportDeadlineStartDate THEN 2
		WHEN DD.[Date] < CRC.ReportDueDate THEN 4
		WHEN DD.[Date] = CRC.ReportDueDate THEN 8
		END
, CR.CustomReport_ID
, CRC.CustomReport_Calendar_ID
, P.Person_ID
FROM rpt.CustomReport_Calendar CRC
INNER JOIN rpt.CustomReport CR
ON CRC.CustomReport_ID = CR.CustomReport_ID

OUTER APPLY (SELECT MAX(PInner.Person_ID) Person_ID, MAX(PInner.Name) Name, CRRP.CustomReport_ID
	FROM core.Person PInner
		INNER JOIN rpt.CustomReport_ResponsiblePerson CRRP
		ON CRRP.ResponsiblePerson_ID = PInner.Person_ID
		AND CRRP.isPrimary = 1 
		WHERE CRRP.CustomReport_ID = CR.CustomReport_ID  
		GROUP BY CRRP.CustomReport_ID
		/* Max only for when a report has multiple people as primary. Shouldn't happen but could be an error...*/
		) P
	

INNER JOIN Core.DimDate DD
ON DD.Date BETWEEN CRC.ReportNoticeStartDate  AND CRC.ReportDueDate
WHERE Year(ReportDueDate) >= year(getdate())