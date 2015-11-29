
/*USE SSISDB*/
/*CONFIGURATION - PARAMETERS
 this table will hold all environment variables to be defined and mapped
 there are two ways to go about defining what needs to be mapped, so check out the options below
 */
DECLARE @Variables TABLE
(
    MyKey INT IDENTITY (1, 1) NOT NULL PRIMARY KEY CLUSTERED, /* Iteration Index, don't worry about this. */
    EnvironmentVariableName     SYSNAME         NOT NULL,       /* Name of the new environment variable. */
    EnvironmentVariableValue    SQL_VARIANT     NOT NULL,       /* Use N' (unicode) notation or CAST for strings to ensure you get an NVARCHAR. Use CAST with numeric values to ensure you get the correct type. */
    /* Duplicate environment variable names are not allowed. */
    UNIQUE (EnvironmentVariableName)
)

INSERT INTO @Variables (
		 EnvironmentVariableName  
		,EnvironmentVariableValue 
		)
SELECT N'EventBasePath', N'C:\Dropbox\CARE Somalia\Data\AttendanceRegisters\'
UNION ALL
SELECT N'FormBasePath', N'C:\Dropbox\CARE Somalia\Data\Forms\'
UNION ALL
SELECT N'LoadQueueConn', N'Data Source=icmkgil6ip.database.windows.net;User ID=Aphelion;Password=@ph3l10n;Initial Catalog=Aphelion.Care.LoadQueue;Provider=SQLNCLI11.1;Persist Security Info=True;Auto Translate=False;'
UNION ALL
SELECT N'MeerkatConn', N'Data Source=.\SQL2012;Initial Catalog=Meerkat;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;'
UNION ALL
SELECT N'MeerkatStagingConn', N'Data Source=.\SQL2012;Initial Catalog=MeerkatStaging;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;'
UNION ALL
SELECT N'Server', N'.\SQL2012'
UNION ALL
SELECT N'StagingBasePath', N'C:\Dropbox\CARE Somalia\Data\StagingTemplates\'


DECLARE @EnvironmentName SYSNAME = N'Meerkat';
DECLARE @ExcelFolderName SYSNAME = N'Meerkat';
DECLARE @QueueFolderName SYSNAME = N'QueueCode';



DECLARE @ExcelFolderID BIGINT;
DECLARE @ExcelEnvironmentID BIGINT;
DECLARE @QueueFolderID BIGINT;
DECLARE @QueueEnvironmentID BIGINT;

IF NOT EXISTS ( SELECT F.folder_id FROM [catalog].folders AS F WHERE F.name = @ExcelFolderName)
BEGIN
    EXECUTE [catalog].[create_folder]
        @folder_name	 = @ExcelFolderName,
		@folder_id  = @ExcelFolderID OUT;
END
ELSE 
BEGIN 
SELECT @ExcelFolderID = F.folder_id FROM [catalog].folders AS F WHERE F.name = @ExcelFolderName
END

IF NOT EXISTS ( SELECT F.folder_id FROM [catalog].folders AS F WHERE F.name = @QueueFolderName)
BEGIN
    EXECUTE [catalog].[create_folder]
        @folder_name	 = @QueueFolderName,
		@folder_id  = @QueueFolderID OUT;
END
ELSE 
BEGIN 
SELECT @QueueFolderID = F.folder_id FROM [catalog].folders AS F WHERE F.name = @QueueFolderName
END


/* create the environment now */
IF NOT EXISTS (SELECT * FROM catalog.environments WHERE name = @EnvironmentName and folder_id = @ExcelFolderID)
BEGIN
    EXECUTE [catalog].[create_environment]
        @environment_name = @EnvironmentName,
        @environment_description= N'',
        @folder_name = @ExcelFolderName;
END
SET @ExcelEnvironmentID = (SELECT environment_id FROM [catalog].environments WHERE name = @EnvironmentName and folder_id = @ExcelEnvironmentID);

IF NOT EXISTS (SELECT * FROM catalog.environments WHERE name = @EnvironmentName and folder_id = @QueueFolderID)
BEGIN
    EXECUTE [catalog].[create_environment]
        @environment_name = @EnvironmentName,
        @environment_description= N'',
        @folder_name = @QueueFolderName;
END
SET @QueueEnvironmentID = (SELECT environment_id FROM [catalog].environments WHERE name = @EnvironmentName and folder_id = @QueueEnvironmentID);



/*
------------------------------------------------------------
--Variables Insert
------------------------------------------------------------

-- create all the variables in the environment now
*/
DECLARE @VariableKey INT, @LastVariableKey INT;
DECLARE @VariableName SYSNAME, @VariableValue SQL_VARIANT;

/*--Excel environment*/
SET @VariableKey = 1;
SET @LastVariableKey = (SELECT MAX(MyKey) FROM @Variables);
WHILE (@VariableKey <= @LastVariableKey)
BEGIN
 
    SELECT
        @VariableName = EnvironmentVariableName,
        @VariableValue = EnvironmentVariableValue

    FROM
        @Variables
    WHERE
        MyKey = @VariableKey;
 
    IF NOT EXISTS (SELECT * FROM [catalog].environment_variables AS V WHERE V.name = @VariableName AND V.environment_id = @ExcelEnvironmentID)
    BEGIN
        EXEC [catalog].[create_environment_variable]
            @variable_name = @VariableName,
            @sensitive = False,
            @description = N'',
            @environment_name = @EnvironmentName,
            @folder_name = @ExcelFolderName,
            @value = @VariableValue,
            @data_type = 'String'
    END
 
    SET @VariableKey += 1;
 
END

/*--Queue environment*/
SET @VariableKey = 1;
SET @LastVariableKey = (SELECT MAX(MyKey) FROM @Variables);
WHILE (@VariableKey <= @LastVariableKey)
BEGIN
 
    SELECT
        @VariableName = EnvironmentVariableName,
        @VariableValue = EnvironmentVariableValue

    FROM
        @Variables
    WHERE
        MyKey = @VariableKey;
 
    IF NOT EXISTS (SELECT * FROM [catalog].environment_variables AS V WHERE V.name = @VariableName AND V.environment_id = @QueueEnvironmentID)
    BEGIN
        EXEC [catalog].[create_environment_variable]
            @variable_name = @VariableName,
            @sensitive = False,
            @description = N'',
            @environment_name = @EnvironmentName,
            @folder_name = @QueueFolderName,
            @value = @VariableValue,
            @data_type = 'String'
    END
 
    SET @VariableKey += 1;
 
END

