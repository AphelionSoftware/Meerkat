

CREATE VIEW [mm].[Outcome1MenuLink]
AS
/*
SELECT     Title = 'Indicator Details', 
                      Link = '/Outcome1/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID
                       AS varchar(8)) + ']', ID = 100 * dso.suboutput_id, Parent =
                          (SELECT     ID
                            FROM          mm.Outcome1MenuGROUP G
                            WHERE      G.Title  = replace(dso.Code,'STP','') + ' : ' + dso.LongName)
FROM         app.DimSubOutput dso INNER JOIN
                      app.DimOutput do ON dso.Output_ID = do.Output_ID
WHERE     do.outcomeId=7
UNION ALL
SELECT     Title = 'Provincial Indicator Details', 
                      Link = '/Outcome1/Dashboards/Template%20Pages/Provincial%20Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID
                       AS varchar(8)) + ']', Priority = 100 * dso.suboutput_id, Parent =
                          (SELECT     ID
                            FROM          mm.Outcome1MenuGROUP G
                            WHERE      G.Title  = replace(dso.Code,'STP','') + ' : ' + dso.LongName)
FROM         app.DimSubOutput dso INNER JOIN
                      app.DimOutput do ON dso.Output_ID = do.Output_ID
WHERE     do.outcomeId=7
UNION ALL
SELECT     
 Title = Replace(replace(da.FullName, '"', ''),'ACT1','1')
,Link = '/Outcome1/Dashboards/Template%20Pages/Milestones%20Page.aspx?qsActivity=' + '[Activity].[Activity].%26[' + CAST(da.activity_ID AS varchar(8)) + ']'
, Priority = 1 - da.Activity_ID + 5000
, Parent = (SELECT ID FROM mm.Outcome1MenuGROUP G WHERE G.ID = dso.SubOutput_ID)
FROM
app.DimActivity da INNER JOIN
app.DimSubOutput dso ON da.SubOutput_ID = dso.SubOutput_ID INNER JOIN
app.DimOutput do ON dso.Output_ID = do.Output_ID
WHERE do.outcomeId=7
*/
/*SELECT 'Not implemented' as X
*/

SELECT     Substring(Title,1,50) as Title, Link, ID, Parent 
FROM mm.ALL_OutcomeMenuLink
WHERE OutcomeID = 2
