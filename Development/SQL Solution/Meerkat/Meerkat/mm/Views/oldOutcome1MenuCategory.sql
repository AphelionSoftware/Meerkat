

CREATE VIEW [mm].[oldOutcome1MenuCategory]
AS
/*---Outputs*/ SELECT Title = 'Outcome Pages', Link = '', ID = 10000
UNION ALL
SELECT     Title = case when len(do.FullName) > 70 then left(do.FullName,70) + '...' else do.FullName end, 
           Link = '' ---/Reports/_layouts/15/ReportServer/RSViewerPage.aspx?rv:RelativeReportUrl=/Reports/MeerkatReports/OutputKeyIndicator.rdl&Source=http%3A%2F%2Fmeerkat%2Ebi%2FReports%2FMeerkatReports%2FForms%2FAllItems%2Easpx&rp:Output=' + CONVERT(Nvarchar(20), do.Output_ID) + '&rv:ParamMode=Hidden' 
	       ,1 - do.Output_ID + 5000 as ID
 FROM app.DimOutput do
WHERE     do.OutcomeID = 7 -- LIKE 'Outcome 1.%'
--end


