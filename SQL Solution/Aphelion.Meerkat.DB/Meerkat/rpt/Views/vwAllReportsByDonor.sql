

CREATE VIEW [rpt].[vwAllReportsByDonor]
AS
select TOP 2147483647 
	CR.Name + ' work for ' + DON.Name AS Name 
	, CR.Name CustomReportName
	, CRC.ReportDueDate
	--, CRRP.isPrimary
	, DD.[Date]
	, DD.DateID
	, DON.Name PersonName
	, CR.Name + ' due by ' + DON.Name + ' on ' + convert(varchar(255),ReportDueDate, 102) + ' , in ' +
	CASE 
		WHEN DD.[Date] < CRC.ReportWarningStartDate THEN 'Notice' 
		WHEN DD.[Date] < CRC.ReportDeadlineStartDate THEN 'Warning'
		WHEN DD.[Date] < CRC.ReportDueDate THEN 'Deadline'
		WHEN DD.[Date] = CRC.ReportDueDate THEN 'Due'
		END + ' period'
	 As Label
	, HighlightType = CASE 
		WHEN DD.[Date] < CRC.ReportWarningStartDate THEN 'Notice' 
		WHEN DD.[Date] < CRC.ReportDeadlineStartDate THEN 'Warning'
		WHEN DD.[Date] < CRC.ReportDueDate THEN 'Deadline'
		WHEN DD.[Date] = CRC.ReportDueDate THEN 'Due'
		END
, Value = CASE 
		WHEN DD.[Date] < CRC.ReportWarningStartDate THEN 2 
		WHEN DD.[Date] < CRC.ReportDeadlineStartDate THEN 4
		WHEN DD.[Date] < CRC.ReportDueDate THEN 8
		WHEN DD.[Date] = CRC.ReportDueDate THEN 32 /*Massively higher*/
		END
, CR.CustomReport_ID
, CRC.CustomReport_Calendar_ID
, DON.Donor_ID
FROM rpt.CustomReport_Calendar CRC
INNER JOIN rpt.CustomReport CR
ON CRC.CustomReport_ID = CR.CustomReport_ID

LEFT JOIN disagg.Donor DON
	ON CRC.Donor_ID = DON.Donor_ID
INNER JOIN Core.DimDate DD
ON DD.Date BETWEEN CRC.ReportNoticeStartDate  AND CRC.ReportDueDate
WHERE Year(ReportDueDate) >= year(getdate())
ORDER BY DON.Name, CR.Name, DateID