





CREATE VIEW [mm].[ALL_OutcomeMenuCategory]
AS
/*---Outputs*/ 
SELECT Title = 'Outcome Pages', Link = '', ID = 10000 , OutcomeID,[OutcomeSiteName]
FROM app.Outcome 

UNION ALL
SELECT     Title = do.ShortName, 
           Link = '' ---/Outcome2/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx' + CONVERT(Nvarchar(20), do.Output_ID) 
		   ,do.Output_ID +	 5000 as ID 
		   ,do.OutcomeID,OC.[OutcomeSiteName]
 FROM app.Output do Left Join app.Outcome as OC on do.OutcomeID=oc.OutcomeID
--WHERE     do.OutcomeID = 9 --- LIKE 'Outcome 2.%'
--end
UNION ALL 
/*---Outputs*/ SELECT Title = 'Projects', Link = '', ID = 30000, OutcomeID,[OutcomeSiteName]
FROM app.Outcome 




