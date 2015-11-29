using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate
{
    /*
    public static class QC
    {

        #region ExtendedProperties
        /// <summary>
        /// Gets all properties for a specific table name
        /// 0: Table name
        /// </summary>
        public const string qryGetExtendedProperties = @"
select ep.name, ep.value, c.name FROM sys.extended_properties AS ep
INNER JOIN sys.tables t on ep.major_id = t.object_id
iNNER JOIN sys.columns c on ep.minor_id = c.column_id
and t.object_id = c.object_id
WHERE t.name = '{0}'
    
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
WHERE t.name = '{2}'
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
        public const string qryTableQuery = @"SELECT table_schema, table_name FROM 
information_schema.tables
WHERE table_name like '{0}%'
AND Table_type = 'BASE TABLE'
ORDER BY table_schema, table_name";

        public const string qryTablesQuery = @"SELECT table_schema, table_name FROM 
information_schema.tables
WHERE (NOT table_name in ({0}) OR {0} = ''
AND Table_type = 'BASE TABLE'
AND Table_Schema = '{1}'
ORDER BY table_schema, table_name";
        #endregion   
        
        #region Columns
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
	 from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
ON RC.CONSTRAINT_SCHEMA = ccu.CONSTRAINT_SCHEMA
and RC.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
ON RC.UNIQUE_CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA
AND RC.UNIQUE_CONSTRAINT_NAME = KCU.CONSTRAINT_NAME

WHERE CCU.TABLE_SCHEMA = '{0}'
AND CCU.TABLE_NAME = '{1}'";

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
        ///6  NUMERIC_PRECISION_RADIX
            /// </summary>
        public const string qryListColumns = @"SELECT COLUMN_NAME
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

        /// <summary>
        /// 0: Dimension name
        /// 1: Dimension prefix
        /// 2: Field exclusions
        /// 3: Schema
        /// </summary>
        public const string qryDimColumns = @"SELECT C.COLUMN_NAME ,
    CASE WHEN T.TABLE_NAME IS NULL 
	THEN  REPLACE(C.TABLE_NAME, '{1}','') + COLUMN_NAME
	ELSE C.COLUMN_NAME
	END AS ALIAS
FROM INFORMATION_SCHEMA.COLUMNS C
LEFT JOIN INFORMATION_SCHEMA.TABLES T
ON REPLACE(T.TABLE_NAME, '{1}','') = LEFT( COLUMN_NAME, LEN( REPLACE(T.TABLE_NAME, '{1}','') ) )
WHERE C.TABLE_NAME = '{0}'
AND C.TABLE_SCHEMA = '{3}'
AND NOT COLUMN_NAME IN
({2})

ORDER BY C.TABLE_NAME, C.COLUMN_NAME
";


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
        /// </summary>
        public const string qryJoins = @"
    JOIN [{0}].[{3}] ON
        [{1}].[{2}] = [{3}].[{4}]
        
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

        #endregion
    }

    */
}
