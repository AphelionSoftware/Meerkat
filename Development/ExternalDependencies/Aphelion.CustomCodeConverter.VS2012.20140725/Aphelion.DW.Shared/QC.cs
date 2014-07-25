using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.Shared
{
    public static class QC
    {

        #region ExtendedProperties
        /// <summary>
        /// Gets all properties for a specific table name
        /// 0: Table name
        /// 1: Field excl
        /// </summary>
        public const string qryGetExtendedProperties = @"
select ep.name, ep.value, c.name FROM sys.extended_properties AS ep
INNER JOIN sys.tables t on ep.major_id = t.object_id
iNNER JOIN sys.columns c on ep.minor_id = c.column_id
and t.object_id = c.object_id
WHERE t.name = '{0}'
and (c.name not in ({1}))
    
";
        /// <summary>
        /// creates a new extended property at view level
        /// 0: Name
        /// 1: Value
        /// 2: Schema
        /// 3: Table 
        /// </summary>
        public const string qryAddExtendedPropertyView = @"
IF NOT EXISTS (SELECT 1 
FROM sys.extended_properties AS ep
INNER JOIN sys.views t on ep.major_id = t.object_id 
WHERE t.name = '{3}' 
and ep.name = '{0}')

EXEC sys.sp_addextendedproperty 
         @name  = N'{0}', 
         @value = N'{1}', 
         @level0type = N'SCHEMA',
         @level0name = N'{2}', 
         @level1type = N'VIEW',
         @level1name = N'{3}' 
    GO  
;
    ";

        /// <summary>
        /// creates a new extended property
        /// 0: Name
        /// 1: Value
        /// 2: Schema
        /// 3: Table
        /// 4: Column
        /// </summary>
        public const string qryAddExtendedProperty = @"
IF NOT EXISTS (SELECT 1 
FROM sys.extended_properties AS ep
INNER JOIN sys.views t on ep.major_id = t.object_id
iNNER JOIN sys.columns c on ep.minor_id = c.column_id
and t.object_id = c.object_id
WHERE t.name = '{3}'
and c.name = '{4}'
and ep.name = '{0}')

EXEC sys.sp_addextendedproperty 
         @name  = N'{0}', 
         @value = N'{1}', 
         @level0type = N'SCHEMA',
         @level0name = N'{2}', 
         @level1type = N'VIEW',
         @level1name = N'{3}', 
         @level2type = N'COLUMN',
         @level2name = N'{4}'
    GO  
;
    ";

        #endregion
        #region DB
        public const string qryCreateDB = @"
IF NOT EXISTS (SELECT 1 FROM SYS.DATABASES
	WHERE DATABASES.NAME = '{0}')
CREATE DATABASE [{0}]
        GO    
";
        public const string qryDropDB = @"
IF EXISTS (SELECT 1 FROM SYS.DATABASES
	WHERE DATABASES.NAME = '{0}')
DROP DATABASE [{0}]
        GO    
";
        #endregion

        #region Tables
        /// <summary>
        /// Query tables 
        /// 0: Table exclusions
        /// 1: Schema exclusions
        /// </summary>
        public const string qryTableQueryExcl = @"SELECT table_schema, table_name FROM 
information_schema.tables
WHERE table_name not in ({0})
and table_schema not in ({1})
AND Table_type = 'BASE TABLE' 
ORDER BY table_schema, table_name";

        public const string qryTableQuery = @"SELECT table_schema, table_name FROM 
information_schema.tables
WHERE table_name like '{0}%'
AND Table_type = 'BASE TABLE'
ORDER BY table_schema, table_name";
        
        /// <summary>
        /// 0: Table Schema List
        /// </summary>
        public const string qryTableQueryBySchema = @"SELECT table_schema, table_name FROM 
information_schema.tables
WHERE table_schema in ({0})
AND Table_type = 'BASE TABLE'
ORDER BY table_schema, table_name";
        /// <summary>
        /// 0: Table exclusions
        /// 1: Table schema
        /// </summary>
        public const string qryTablesQuery = @"SELECT table_schema, table_name FROM 
information_schema.tables
WHERE (NOT table_name in ({0}) OR {0} = '')
AND Table_type = 'BASE TABLE'
AND Table_Schema = '{1}'
ORDER BY table_schema, table_name";
        /// <summary>
        /// 0: Table exclusions
        /// 1: Table schema
        /// 
        /// Fields
        /// 0: Schema
        /// 1: Name
        /// 2: DisplayName
        /// 3: TableType
        /// 4: Coalesce fields
        /// </summary>
        public const string qryOLAPTablesQuery = @"SELECT 
	table_schema
	, table_name 
    , table_type
	, ISNULL(EPDisplay.value, table_name) DisplayName
	, ISNULL(EPTableType.Value, 'Table') XMLATableType
FROM 
information_schema.tables t
LEFT JOIN sys.extended_properties EPDisplay
    on OBJECT_ID(table_schema +'.' + table_name, table_type)  = EPDisplay.major_id
    and replace(EPDisplay.name, ' ', '') = 'DisplayName'
    and minor_id = 0
LEFT JOIN sys.extended_properties EPTableType
    on OBJECT_ID(table_schema +'.' + table_name, table_type)  = EPTableType.major_id
    and replace(EPTableType.name, ' ', '') = 'XMLATableType'
    and EPTableType.minor_id = 0

WHERE (NOT table_name in ({0}) OR {0} = '')
AND Table_Schema = '{1}'
ORDER BY table_schema, table_name";

        #endregion   
        
        #region Columns
        /// <summary>
        /// 0: Table Schema
        /// 1: Table name
        /// 2: Exclude tables
        /// 3: Exclude schemas
        /// Results:
        ///0 RC.CONSTRAINT_SCHEMA
        ///1 RC.CONSTRAINT_NAME	
        ///2 CCU.TABLE_SCHEMA Ref_Schema
        ///3 CCU.TABLE_NAME Ref_Table
        ///4 CCU.COLUMN_NAME Ref_Column
        ///5 KCU.Table_SChema UNQ_Schema
        ///6 KCU.Table_Name Unq_Table
        ///7 KCU.Column_Name Unq_Column
        ///8 CCU_U.IS_NULLABLE
        ///9 Coalesce Fields in view
        /// </summary>
        public const string qryReferenceQueryExcl = @"
select 
	RC.CONSTRAINT_SCHEMA
	,RC.CONSTRAINT_NAME	
	,CCU.TABLE_SCHEMA Ref_Schema
	,CCU.TABLE_NAME Ref_Table
	,CCU.COLUMN_NAME Ref_Column
	,KCU.Table_SChema UNQ_Schema
	,KCU.Table_Name Unq_Table
	,KCU.Column_Name Unq_Column
	, CCU_C.IS_NULLABLE 
	, ISNULL(EPCoalesce.Value, 'False') CoalesceFields
	 from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
ON RC.CONSTRAINT_SCHEMA = ccu.CONSTRAINT_SCHEMA
and RC.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
ON RC.UNIQUE_CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA
AND RC.UNIQUE_CONSTRAINT_NAME = KCU.CONSTRAINT_NAME


INNER JOIN INFORMATION_SCHEMA.COLUMNS CCU_C
	ON CCU.TABLE_SCHEMA = CCU_C.TABLE_SCHEMA
	AND CCU.TABLE_NAME = CCU_C.TABLE_NAME
	AND CCU.COLUMN_NAME = CCU_C.COLUMN_NAME

LEFT JOIN sys.extended_properties EPCoalesce
    on OBJECT_ID(KCU.TABLE_SCHEMA +'.' + KCU.TABLE_NAME, 'TABLE')  = EPCoalesce.major_id
    and replace(EPCoalesce.name, ' ', '') = 'CoalesceFieldsInView'
    and EPCoalesce.minor_id = 0



WHERE CCU.TABLE_SCHEMA = '{0}'
AND CCU.TABLE_NAME = '{1}'
AND NOT 
	(KCU.TABLE_SCHEMA = CCU.TABLE_SCHEMA
	AND KCU.TABLE_NAME = CCU.TABLE_NAME)


and not kcu.TABLE_NAME in ({2})

and not kcu.TABLE_SCHEMA in ({3})

ORDER BY CONSTRAINT_SCHEMA, CONSTRAINT_NAME
";
        /// <summary>
        /// 0: Table Schema
        /// 1: Table name
        /// Results:
        ///0 RC.CONSTRAINT_SCHEMA
	    ///1 RC.CONSTRAINT_NAME	
	    ///2 CCU.TABLE_SCHEMA Ref_Schema
	    ///3 CCU.TABLE_NAME Ref_Table
	    ///4 CCU.COLUMN_NAME Ref_Column
	    ///5 KCU.Table_SChema UNQ_Schema
	    ///6 KCU.Table_Name Unq_Table
	    ///7 KCU.Column_Name Unq_Column
        ///8 CCU_U.IS_NULLABLE
        ///9 Coalesce Fields in view
        /// </summary>
        public const string qryReferenceQuery = @"
select 
	RC.CONSTRAINT_SCHEMA
	,RC.CONSTRAINT_NAME	
	,CCU.TABLE_SCHEMA Ref_Schema
	,CCU.TABLE_NAME Ref_Table
	,CCU.COLUMN_NAME Ref_Column
	,KCU.Table_SChema UNQ_Schema
	,KCU.Table_Name Unq_Table
	,KCU.Column_Name Unq_Column
	, CCU_C.IS_NULLABLE 
	, ISNULL(EPCoalesce.Value, 'False') CoalesceFields
	 from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
ON RC.CONSTRAINT_SCHEMA = ccu.CONSTRAINT_SCHEMA
and RC.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
ON RC.UNIQUE_CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA
AND RC.UNIQUE_CONSTRAINT_NAME = KCU.CONSTRAINT_NAME


INNER JOIN INFORMATION_SCHEMA.COLUMNS CCU_C
	ON CCU.TABLE_SCHEMA = CCU_C.TABLE_SCHEMA
	AND CCU.TABLE_NAME = CCU_C.TABLE_NAME
	AND CCU.COLUMN_NAME = CCU_C.COLUMN_NAME

LEFT JOIN sys.extended_properties EPCoalesce
    on OBJECT_ID(KCU.TABLE_SCHEMA +'.' + KCU.TABLE_NAME, 'TABLE')  = EPCoalesce.major_id
    and replace(EPCoalesce.name, ' ', '') = 'CoalesceFieldsInView'
    and EPCoalesce.minor_id = 0


WHERE CCU.TABLE_SCHEMA = '{0}'
AND CCU.TABLE_NAME = '{1}'
AND NOT 
	(KCU.TABLE_SCHEMA = CCU.TABLE_SCHEMA
	AND KCU.TABLE_NAME = CCU.TABLE_NAME)


ORDER BY CONSTRAINT_SCHEMA, CONSTRAINT_NAME
";

        /// <summary>
        /// 0: Table name
        /// 1: Schema name
        /// 2: Exclusions
        /// Results:
        ///0 COLUMN_NAME
        ///1  IS_NULLABLE
        ///2  DATA_TYPE 
        ///3  CHARACTER_MAXIMUM_LENGTH
        ///4  NUMERIC_PRECISION
        ///5  NUMERIC_PRECISION_RADIX
        ///6  NUMERIC_PRECISION_SCALE
        ///7  DISPLAYNAME
        ///8  DATA TYPE
        ///9 Hierachy name - can be null
        ///10 Hierarchy level - can be null
        ///11 Is Computed
        /// </summary>
        public const string qryListColumns = @"SELECT COLUMN_NAME
, C.IS_NULLABLE
, C.DATA_TYPE 
, CAST(CHARACTER_MAXIMUM_LENGTH as varchar(255)) CHARACTER_MAXIMUM_LENGTH 
, CAST(NUMERIC_PRECISION as varchar(255)) NUMERIC_PRECISION
, CAST(NUMERIC_PRECISION_RADIX as varchar(255)) NUMERIC_PRECISION_RADIX
, CAST(NUMERIC_SCALE as varchar(255))  NUMERIC_SCALE
, ISNULL(EPDisplay.value, C.COLUMN_NAME) DISPLAYNAME
, C.DATA_TYPE
, EPHierarchy.value HierarchyName
, EPHierarchyLevel.value HierarchyLevel
, csys.is_computed
FROM INFORMATION_SCHEMA.COLUMNS C
inner join sys.columns cSys
ON c.COLUMN_NAME = cSys.name
	and (OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'U') = cSys.object_id
		OR OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'V') = cSys.object_id
		)


LEFT JOIN sys.extended_properties EPDisplay
ON (OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'U') = EPDisplay.major_id
OR OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'V') = EPDisplay.major_id)
and csys.column_id = EPDisplay.minor_id
AND REPLACE(EPDisplay.name, ' ' , '') = 'DisplayName'


LEFT JOIN sys.extended_properties EPHierarchy
ON (OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'U') = EPHierarchy.major_id
OR OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'V') = EPHierarchy.major_id)
and csys.column_id = EPHierarchy.minor_id
AND REPLACE(EPHierarchy.name, ' ' , '') = 'HierarchyName'


LEFT JOIN sys.extended_properties EPHierarchyLevel
ON (OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'U') = EPHierarchyLevel.major_id
OR OBJECT_ID(C.TABLE_SCHEMA + '.' +  C.TABLE_NAME, 'V') = EPHierarchyLevel.major_id)
and csys.column_id = EPHierarchyLevel.minor_id
AND REPLACE(EPHierarchyLevel.name, ' ' , '') = 'HierarchyLevel'


WHERE TABLE_NAME = '{0}'
AND TABLE_SCHEMA = '{1}'
AND NOT COLUMN_NAME IN
({2})
";        /// <summary>
        /// 0: Table name
        /// 1: Schema name
        /// 2: Exclusions
        /// Results:
        ///0 COLUMN_NAME
        ///1  IS_NULLABLE
        ///2  DATA_TYPE 
        ///3  CHARACTER_MAXIMUM_LENGTH
        ///4  NUMERIC_PRECISION
        ///5  NUMERIC_PRECISION_RADIX
        ///6  NUMERIC_PRECISION_RADIX
        /// </summary>
        public const string qryColumnsDisplayName = @"SELECT COLUMN_NAME
, IS_NULLABLE
, DATA_TYPE 
, CAST(CHARACTER_MAXIMUM_LENGTH as varchar(255)) CHARACTER_MAXIMUM_LENGTH 
, CAST(NUMERIC_PRECISION as varchar(255)) NUMERIC_PRECISION
, CAST(NUMERIC_PRECISION_RADIX as varchar(255)) NUMERIC_PRECISION_RADIX
, CAST(NUMERIC_SCALE as varchar(255))  NUMERIC_SCALE

FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '{0}'
AND TABLE_SCHEMA = '{1}'
AND NOT COLUMN_NAME IN
({2})
";
        ///TODO: Use a query to exclude renaming columns by using referential constraints
        /// <summary>
        /// 0: Dimension name
        /// 1: Dimension prefix
        /// 2: Field exclusions
        /// 3: Schema
        /// 4: Dimension prefix
        /// Fields: 
        /// 0: Column_name
        /// 1: Alias
        /// 2: Src Table
        /// </summary>
        public const string qryDimColumns = @"SELECT  C.COLUMN_NAME ,
    CASE WHEN /*T.TABLE_NAME IS NULL 
	AND KCU.TABLE_NAME IS NULL */
	1=1
	THEN  
	REPLACE ( 
	REPLACE(C.TABLE_NAME, '{4}','') + C.COLUMN_NAME
	,
	C.TABLE_NAME + C.Table_Name, C.TABLE_NAME )
	ELSE C.COLUMN_NAME
	END AS ALIAS
, ColT.TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS C
INNER JOIN INFORMATION_SCHEMA.TABLES ColT
ON C.TABLE_NAME = ColT.TABLE_NAME
AND C.TABLE_SCHEMA = ColT.TABLE_SCHEMA
WHERE C.TABLE_NAME = '{0}'
AND C.TABLE_SCHEMA = '{3}'
AND NOT C.COLUMN_NAME IN
({2})

ORDER BY C.TABLE_NAME, C.COLUMN_NAME
";
        /*
        public const string qryDimColumns = @"SELECT C.COLUMN_NAME ,
    CASE WHEN T.TABLE_NAME IS NULL 
	AND KCU.TABLE_NAME IS NULL 
	THEN  REPLACE(C.TABLE_NAME, '{4}','') + C.COLUMN_NAME
	ELSE C.COLUMN_NAME
	END AS ALIAS
, ColT.TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS C
INNER JOIN INFORMATION_SCHEMA.TABLES ColT
ON C.TABLE_NAME = ColT.TABLE_NAME
AND C.TABLE_SCHEMA = ColT.TABLE_SCHEMA
LEFT JOIN INFORMATION_SCHEMA.TABLES T
ON REPLACE(T.TABLE_NAME, 'Dim','') = Right( LEFT(
	C.COLUMN_NAME
	, len(column_name) - 2)
	, LEN( REPLACE(T.TABLE_NAME, 'Dim','') ) )
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
    JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
	    ON KCU.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
	    OR KCU.CONSTRAINT_NAME = RC.UNIQUE_CONSTRAINT_NAME

ON C.TABLE_SCHEMA = KCU.TABLE_SCHEMA
AND C.TABLE_NAME = KCU.TABLE_NAME
AND C.COLUMN_NAME = KCU.COLUMN_NAME

WHERE C.TABLE_NAME = '{0}'
AND C.TABLE_SCHEMA = '{3}'
AND NOT C.COLUMN_NAME IN
({2})

ORDER BY C.TABLE_NAME, C.COLUMN_NAME
";*/


        /// <summary>
        /// Get a list of primary columns
        /// {0} table_schema
        /// {1} table_name
        /// 0: Table_schema
        /// 1: table_name
        /// 2: column_name
        /// 3: data type
        /// 4: IS Nullable
        /// </summary>
            public const string qryPrimaryColumns = @"SELECT c.TABLE_SCHEMA , c.TABLE_NAME, c.COLUMN_NAME,c.DATA_TYPE,  c.is_nullable
             
FROM INFORMATION_SCHEMA.COLUMNS c
INNER JOIN (
            SELECT ku.TABLE_CATALOG,ku.TABLE_SCHEMA,ku.TABLE_NAME,ku.COLUMN_NAME
            FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
            INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS ku
                ON tc.CONSTRAINT_TYPE = 'PRIMARY KEY' 
                AND tc.CONSTRAINT_NAME = ku.CONSTRAINT_NAME
         )   pk 
ON  c.TABLE_CATALOG = pk.TABLE_CATALOG
            AND c.TABLE_SCHEMA = pk.TABLE_SCHEMA
            AND c.TABLE_NAME = pk.TABLE_NAME
            AND c.COLUMN_NAME = pk.COLUMN_NAME
WHERE c.TABLE_SCHEMA  = '{0}'
and c.TABLE_NAME = '{1}' 
ORDER BY c.TABLE_SCHEMA,c.TABLE_NAME, c.ORDINAL_POSITION "
        ;

#endregion

        #region CreateStatements
        /// <summary>
        /// 0: View schema
        /// 1: View name
        /// 2: Column list
        /// 3: Table schema
        /// 4: WHERE clause
        /// </summary>
        public const string qryCreateFactView = @"IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS 
	WHERE VIEWS.TABLE_SCHEMA = '{0}'
		AND VIEWS.TABLE_NAME = '{1}')
	DROP VIEW [{0}].[{1}]
        GO    

CREATE VIEW [{0}].[{1}]
AS

SELECT {2}
FROM [{3}].[{1}]
{4}

        GO    
";
        /// <summary>
        /// 0: Schema
        /// 1: Table name
        /// 2: Column list
        /// </summary>
        public const string qryCreateStageTable = @"IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLES.TABLE_SCHEMA = '{0}'
		AND TABLES.TABLE_NAME = '{1}')
	DROP TABLE [{0}].[{1}]
    GO  

CREATE TABLE [{0}].[{1}]
(
{2}
)
    GO  
";
        /// <summary>
        /// 0: Schema
        /// 1: Src Table
        /// 2: Src Column
        /// 3: Table
        /// 4: Column
        /// 5: Alias
        /// 6: Interleaved joins
        /// </summary>
        public const string qryInterJoins = @"
    JOIN [{0}].[{3}] AS [{5}] 
    {6}
        ON  [{1}].[{2}] = [{5}].[{4}]
";


        /// <summary>
        /// 0: Schema
        /// 1: Src Table
        /// 2: Src Column
        /// 3: Table
        /// 4: Column
        /// 5: Alias
        /// 6: Interleaved joins
        /// </summary>
        public const string qryInterLeftJoins = @"
    LEFT JOIN [{0}].[{3}] AS [{5}] 
    {6}
    ON  [{1}].[{2}] = [{5}].[{4}]
        
";
        
        /// <summary>
        /// 0: Schema
        /// 1: Src Table
        /// 2: Src Column
        /// 3: Table
        /// 4: Column
        /// 5: Alias
        /// </summary>
        public const string qryJoins = @"
    JOIN [{0}].[{3}] AS [{5}] ON
        [{1}].[{2}] = [{5}].[{4}]
        
";

        /// <summary>
        /// 0: Schema
        /// 1: Src Table
        /// 2: Src Column
        /// 3: Table
        /// 4: Column
        /// 5: Alias
        /// </summary>
        public const string qryLeftJoins = @"
    LEFT JOIN [{0}].[{3}] AS [{5}] ON
        [{1}].[{2}] = [{5}].[{4}]
        
";

        /// <summary>
        /// 0: Table
        /// 1: Column
        /// 2: Src Table
        /// 3: src Column
        /// </summary>
        public const string qryJoinsAnd = @"
            AND
                    [{0}].[{1}] = [{2}].[{3}]
";

        /// <summary>
        /// 0: View schema
        /// 1: View name
        /// 2: Column list
        /// 3: Table schema
        /// 4: JOINS
        /// 5: WHERE clause
        /// </summary>
        public const string qryCreateDimView = @"IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS 
	WHERE VIEWS.TABLE_SCHEMA = '{0}'
		AND VIEWS.TABLE_NAME = '{1}')
	DROP VIEW [{0}].[{1}]
    GO  

CREATE VIEW [{0}].[{1}]
AS

SELECT {2}
FROM [{3}].[{1}]
{4}
{5}

    GO  
";/// <summary>
        /// 0: View schema
        /// 1: View name
        /// 2: Column list
        /// 3: Table schema
        /// 4: Alias
        /// 5: JOINS
        /// 6: WHERE clause
        /// </summary>
        public const string qryCreateDimViewAliased = @"IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS 
	WHERE VIEWS.TABLE_SCHEMA = '{0}'
		AND VIEWS.TABLE_NAME = '{1}')
	DROP VIEW [{0}].[{1}]
    GO  

CREATE VIEW [{0}].[{1}]
AS

SELECT {2}
FROM [{3}].[{1}] AS [{4}]
{5}
{6}

    GO  
";
        #endregion

        #region Schema
        /// <summary>
        /// 0: SCHEMA name
        /// </summary>
        public static string qryCreateSchema = @"IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.SCHEMATA
	WHERE SCHEMA_NAME = '{0}')
	BEGIN
	DECLARE @sql varchar(max)
	SET @sql = 'CREATE SCHEMA {0}'
	EXEC (@SQL)
	END

    GO  
";
        #endregion

        #region Use
        /// <summary>
        /// Database name
        /// </summary>
        public const string qryUse = @"USE {0}
    GO  
";
        #endregion

        #region Views
        public const string qryViewTableUsage = @"SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.VIEW_TABLE_USAGE
WHERE VIEW_SCHEMA = '{0}'
AND VIEW_NAME = '{1}'
";

        /// <summary>
        /// 0: Schema
        /// 1: View name
        /// Fields:
        /// 0: VIEW_SCHEMA
	    /// 1: VIEW_NAME
	    /// 2: TABLE_SCHEMA
	    /// 3: TABLE_NAME
	    /// 4: COLUMN_NAME
	    /// 5: UNIQUE_TABLE_SCHEMA
	    /// 6: UNIQUE_TABLE_NAME
	    /// 7: UNIQUE_COLUMN_NAME
 
        /// </summary>
        public const string qryViewReferences = @"WITH CTE as (select c.name Column_Name
, v.Name  ViewName 
, MAX(CASE WHEN ep.name = 'SrcColumn' THEN ep.value  END) as SrcColumn_Name
, MAX(CASE WHEN ep.name = 'SrcTable' THEN ep.value  END) as SrcTable_Name
, MAX(CASE WHEN ep.name = 'SrcSchema' THEN ep.value  END) as SrcSchema_Name

FROM sys.extended_properties AS ep
INNER JOIN sys.views v on ep.major_id = v.object_id
iNNER JOIN sys.columns c on ep.minor_id = c.column_id

and v.object_id = c.object_id


WHERE ep.name in ( 'SrcColumn', 'SrcTable', 'SrcSchema')

GROUP BY c.name, v.name
)

select 
	VTU.VIEW_SCHEMA
	, VTU.VIEW_NAME
	, VTU.TABLE_SCHEMA
	, VTU.TABLE_NAME
	, /*CCU.COLUMN_NAME*/ CTEChild.Column_name
	, CTUUnq.TABLE_SCHEMA UNIQUE_TABLE_SCHEMA
	, CTUUnq.TABLE_NAME UNIQUE_TABLE_NAME
	, /*CCUUnq.COLUMN_NAME UNIQUE_COLUMN_NAME*/
	CTEParent.Column_Name UNIQUE_COLUMN_NAME


 from INFORMATION_SCHEMA.VIEW_TABLE_USAGE VTU
 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE CTU
 ON		VTU.TABLE_SCHEMA = CTU.TABLE_SCHEMA
		AND VTU.TABLE_NAME = CTU.TABLE_NAME
 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
		ON VTU.TABLE_SCHEMA = CCU.TABLE_SCHEMA
			AND VTU.TABLE_NAME = CCU.TABLE_NAME
			AND CTU.CONSTRAINT_SCHEMA = CCU.CONSTRAINT_SCHEMA
			AND CTU.CONSTRAINT_NAME = CCU.CONSTRAINT_NAME
 INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
	ON CTU.CONSTRAINT_SCHEMA = TC.CONSTRAINT_SCHEMA
	AND CTU.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
	AND TC.CONSTRAINT_TYPE = 'FOREIGN KEY'
 INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC 
	ON CCU.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
	AND CCU.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCUUnq
	ON RC.UNIQUE_CONSTRAINT_SCHEMA = CCUUnq.CONSTRAINT_SCHEMA
	AND RC.UNIQUE_CONSTRAINT_NAME = CCUUnq.CONSTRAINT_NAME

 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE CTUUnq
	ON CCUUnq.TABLE_SCHEMA = CTUUnq.TABLE_SCHEMA
	AND CCUUnq.TABLE_NAME = CTUUnq.TABLE_NAME
	AND CTUUnq.CONSTRAINT_SCHEMA = CCUUnq.CONSTRAINT_SCHEMA
			AND CTUUnq.CONSTRAINT_NAME = CCUUnq.CONSTRAINT_NAME

	INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TCUnq
	ON CTUUnq.CONSTRAINT_SCHEMA = TCUnq.CONSTRAINT_SCHEMA
	AND CTUUnq.CONSTRAINT_NAME = TCUnq.CONSTRAINT_NAME
	AND TCUnq.CONSTRAINT_TYPE = 'PRIMARY KEY'

JOIN CTE CTEChild
	on VTU.TABLE_NAME = CTEChild.SrcTable_Name
		AND CCU.COLUMN_NAME = CTEChild.SrcColumn_Name

	JOIN CTE CTEParent
	on CTUUnq.TABLE_NAME = CTEParent.SrcTable_Name
		AND CCUUnq.COLUMN_NAME = CTEParent.SrcColumn_Name

 
 WHERE VIEW_SCHEMA = '{0}'
and NOT VTU.table_name = CTUUnq.TABLE_NAME 
";

              /// <summary>
        /// 0: Schema
        /// 1: View name
        /// Fields:
        /// 0: VIEW_SCHEMA
	    /// 1: VIEW_NAME
	    /// 2: TABLE_SCHEMA
	    /// 3: TABLE_NAME
	    /// 4: COLUMN_NAME
	    
        /// </summary>
        public const string qryViewPrimaryKeys = @";WITH SrcQuery AS (select 
	VTU.VIEW_SCHEMA
	, VTU.VIEW_NAME
	, VTU.TABLE_SCHEMA
	, VTU.TABLE_NAME
	, CCU.COLUMN_NAME
 from INFORMATION_SCHEMA.VIEW_TABLE_USAGE VTU
 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
		ON VTU.TABLE_SCHEMA = CCU.TABLE_SCHEMA
			AND VTU.TABLE_NAME = CCU.TABLE_NAME
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
	ON CCU.CONSTRAINT_SCHEMA = TC.CONSTRAINT_SCHEMA
	AND CCU.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
	AND TC.CONSTRAINT_TYPE = 'PRIMARY KEY'

	WHERE VIEW_SCHEMA = '{0}'
        AND VIEW_NAME = '{1}'
) 
select * from SrcQuery 
WHERE NOT EXISTS (
	select 
		CTUUnq.TABLE_SCHEMA UNIQUE_TABLE_SCHEMA
		, CCUUnq.TABLE_NAME UNIQUE_TABLE_NAME
		, CCUUnq.COLUMN_NAME UNIQUE_COLUMN_NAME

	 from INFORMATION_SCHEMA.VIEW_TABLE_USAGE VTU
	 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
			ON VTU.TABLE_SCHEMA = CCU.TABLE_SCHEMA
				AND VTU.TABLE_NAME = CCU.TABLE_NAME
			
	INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE CTU
	 ON		VTU.TABLE_SCHEMA = CTU.TABLE_SCHEMA
			AND VTU.TABLE_NAME = CTU.TABLE_NAME
	 AND CTU.CONSTRAINT_SCHEMA = CCU.CONSTRAINT_SCHEMA
				AND CTU.CONSTRAINT_NAME = CCU.CONSTRAINT_NAME
	 INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
		ON CTU.CONSTRAINT_SCHEMA = TC.CONSTRAINT_SCHEMA
		AND CTU.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
		AND TC.CONSTRAINT_TYPE = 'FOREIGN KEY'
	 INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC 
		ON CCU.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
		AND CCU.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
	 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCUUnq
		ON RC.UNIQUE_CONSTRAINT_SCHEMA = CCUUnq.CONSTRAINT_SCHEMA
		AND RC.UNIQUE_CONSTRAINT_NAME = CCUUnq.CONSTRAINT_NAME

	 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE CTUUnq
		ON CCUUnq.TABLE_SCHEMA = CTUUnq.TABLE_SCHEMA
		AND CCUUnq.TABLE_NAME = CTUUnq.TABLE_NAME
		AND CTUUnq.CONSTRAINT_SCHEMA = CCUUnq.CONSTRAINT_SCHEMA
				AND CTUUnq.CONSTRAINT_NAME = CCUUnq.CONSTRAINT_NAME

		INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TCUnq
		ON CTUUnq.CONSTRAINT_SCHEMA = TCUnq.CONSTRAINT_SCHEMA
		AND CTUUnq.CONSTRAINT_NAME = TCUnq.CONSTRAINT_NAME
		AND TCUnq.CONSTRAINT_TYPE = 'PRIMARY KEY'
 
	WHERE VIEW_SCHEMA = '{0}'
        AND VIEW_NAME = '{1}'
AND CTUUnq.TABLE_SCHEMA = SrcQuery.TABLE_SCHEMA
and CTUUnq.TABLE_NAME = SrcQuery.TABLE_NAME
and CCUUnq.COLUMN_NAME = SrcQuery.COLUMN_NAME
and VTU.VIEW_NAME = SrcQuery.VIEW_NAME
and VTU.VIEW_SCHEMA = SrcQuery.VIEW_SCHEMA
)

and  VIEW_SCHEMA = '{0}'
        AND VIEW_NAME = '{1}'

	
";
        #endregion
    }
}
