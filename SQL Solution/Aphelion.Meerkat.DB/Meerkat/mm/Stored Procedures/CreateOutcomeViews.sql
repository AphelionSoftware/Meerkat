CREATE PROC mm.CreateOutcomeViews
as
------------------------------------------------------------------------------------------------------------------
--Category
------------------------------------------------------------------------------------------------------------------

DECLARE @SQL varchar(max)
DECLARE BuildCategory CURSOR READ_ONLY FORWARD_ONLY
FOR SELECT '

CREATE VIEW [mm].[Outcome' + cast(O.Outcome_ID as varchar(10)) + 'MenuCategory] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         ID 
  FROM   [mm].[ALL_OutcomeMenuCategory] 
  WHERE  Outcome_ID IN (SELECT ID 
                       FROM   (SELECT Row_number() 
                                        OVER ( 
                                          partition BY 1 
                                          ORDER BY Code) AS IDX, 
                                      Outcome_ID          AS ID 
                               FROM   [app].[Outcome] 
                               WHERE  Active = 1) AS IDX 
                       WHERE  IDX.IDx = ' + cast(O.Outcome_ID as varchar(10)) + ')
' As SQLStatement
FROM app.Outcome O
WHERE NOT EXISTS
(SELECT 1 FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'Outcome' + cast(O.Outcome_ID as varchar(10)) + 'MenuCategory' and TABLE_SCHEMA = 'mm'
)


 OPEN BuildCategory
    FETCH NEXT FROM BuildCategory INTO @SQL
	
    WHILE @@FETCH_STATUS = 0
    BEGIN
	EXEC (@SQL)
    FETCH NEXT FROM BuildCategory INTO @SQL
        END

    CLOSE BuildCategory
    DEALLOCATE BuildCategory


	
------------------------------------------------------------------------------------------------------------------
--Group
------------------------------------------------------------------------------------------------------------------
DECLARE BuildGroup CURSOR READ_ONLY FORWARD_ONLY
FOR SELECT '

CREATE VIEW [mm].[Outcome' + cast(O.Outcome_ID as varchar(10)) + 'MenuGroup] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         ID 
  FROM   [mm].[ALL_OutcomeMenuGroup] 
  WHERE  Outcome_ID IN (SELECT ID 
                       FROM   (SELECT Row_number() 
                                        OVER ( 
                                          partition BY 1 
                                          ORDER BY Code) AS IDX, 
                                      Outcome_ID          AS ID 
                               FROM   [app].[Outcome] 
                               WHERE  Active = 1) AS IDX 
                       WHERE  IDX.IDx = ' + cast(O.Outcome_ID as varchar(10)) + ')
' As SQLStatement
FROM app.Outcome O
WHERE NOT EXISTS
(SELECT 1 FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'Outcome' + cast(O.Outcome_ID as varchar(10)) + 'MenuGroup' and TABLE_SCHEMA = 'mm'
)


 OPEN BuildGroup
    FETCH NEXT FROM BuildGroup INTO @SQL
	
    WHILE @@FETCH_STATUS = 0
    BEGIN
	EXEC (@SQL)
    FETCH NEXT FROM BuildGroup INTO @SQL
        END

    CLOSE BuildGroup
    DEALLOCATE BuildGroup


	
------------------------------------------------------------------------------------------------------------------
--Link
------------------------------------------------------------------------------------------------------------------
DECLARE BuildLink CURSOR READ_ONLY FORWARD_ONLY
FOR SELECT '

CREATE VIEW [mm].[Outcome' + cast(O.Outcome_ID as varchar(10)) + 'MenuLink] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         ID 
  FROM   [mm].[ALL_OutcomeMenuLink] 
  WHERE  Outcome_ID IN (SELECT ID 
                       FROM   (SELECT Row_number() 
                                        OVER ( 
                                          partition BY 1 
                                          ORDER BY Code) AS IDX, 
                                      Outcome_ID          AS ID 
                               FROM   [app].[Outcome] 
                               WHERE  Active = 1) AS IDX 
                       WHERE  IDX.IDx = ' + cast(O.Outcome_ID as varchar(10)) + ')
' As SQLStatement
FROM app.Outcome O
WHERE NOT EXISTS
(SELECT 1 FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'Outcome' + cast(O.Outcome_ID as varchar(10)) + 'MenuLink' and TABLE_SCHEMA = 'mm'
)


 OPEN BuildLink
    FETCH NEXT FROM BuildLink INTO @SQL
	

 OPEN BuildLink
    FETCH NEXT FROM BuildLink INTO @SQL
	
    WHILE @@FETCH_STATUS = 0
    BEGIN
	EXEC (@SQL)
    FETCH NEXT FROM BuildLink INTO @SQL
        END

    CLOSE BuildLink
    DEALLOCATE BuildLink