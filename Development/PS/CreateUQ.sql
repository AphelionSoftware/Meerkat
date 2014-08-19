select 'ALTER TABLE [' + TABLE_SCHEMA +'].[' + table_name + ']  DROP CONSTRAINT [' + CONSTRAINT_NAME + ']'
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'UNIQUE'

and CONSTRAINT_NAME like 'UQ%businesskey'


select '
CREATE UNIQUE NONCLUSTERED INDEX UQ_' + table_name + '_BusinessKey ON app.Sector
	(
	BusinessKey
	)
	WHERE Active >=0
' from INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'BusinessKey'
and NOT TABLE_SCHEMA like 'OLAP%'
