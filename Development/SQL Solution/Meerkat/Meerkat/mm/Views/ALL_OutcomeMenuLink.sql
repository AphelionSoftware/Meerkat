






CREATE VIEW [mm].[ALL_OutcomeMenuLink]
AS
SELECT     Title = 'Indicator Details', 
                      Link = '/'+[OutcomeSiteName]+'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID
                       AS varchar(8)) + ']', ID = 100 * dso.suboutput_id, Parent =
                          (SELECT     ID
                            FROM          mm.ALL_OutcomeMenuGROUP G
                            WHERE      G.Title  = dso.ShortName
							AND G.OutcomeID = do.OutcomeID)
							, do.OutcomeID
FROM         app.SubOutput dso INNER JOIN
                      app.Output do ON dso.Output_ID = do.Output_ID
					  inner join app.Outcome as OC on do.OutcomeID=oc.OutcomeID
					  WHERE dso.Active = 1

UNION ALL
SELECT     Title = 'Provincial Indicator Details', 
                      Link = '/'+[OutcomeSiteName]+'/Dashboards/Template%20Pages/Provincial%20Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID
                       AS varchar(8)) + ']', Priority = 100 * dso.suboutput_id, Parent =
                          (SELECT     ID
                            FROM          mm.ALL_OutcomeMenuGROUP G
                            WHERE      G.Title  = dso.ShortName
							AND G.OutcomeID = DO.OutcomeID
							) 
							,do.OutcomeID
FROM         app.SubOutput dso INNER JOIN
                      app.Output do ON dso.Output_ID = do.Output_ID
					  inner join app.Outcome as OC on do.OutcomeID=oc.OutcomeID
					  WHERE dso.Active = 1

UNION ALL



SELECT     
 Title = Da.ShortName
,Link = '/'+[OutcomeSiteName]+'/Dashboards/Template%20Pages/Milestones%20Page.aspx?qsActivity=' + '[Activity].[Activity].%26[' + CAST(da.activityID AS varchar(8)) + ']'
, Priority = 1 - da.ActivityID + 5000
, Parent = (SELECT     SRC.ID +  P.ProjectID as ID
								FROM app.Project P
								CROSS APPLY 
								(SELECT ID
										FROM mm.Outcome2MenuCategory O2MC 
											WHERE Title = 'Projects') Src
								WHERE OutcomeID = dp.OutcomeID
								AND P.ProjectID = da.ProjectID
								) 
, Dp.OutcomeID
FROM
app.Activity da INNER JOIN
app.Project dp ON da.ProjectID = dp.ProjectID
inner join app.Outcome as OC on dp.OutcomeID=oc.OutcomeID
WHERE da.Active = 1








