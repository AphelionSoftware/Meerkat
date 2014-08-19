

	DECLARE @exec varchar(max) = ''

	;WITH key_hierarchy(id, qualname, tbl_name, referenced_object_id, LEVEL, treepath, parent_object_id, rootID, schemaname) AS
( 
	SELECT t.object_id,
		SCHEMA_NAME(t.schema_id) +'.' + t.name as qualname,
		 t.name
		 ,0 referenced_object_id
		,0 as Level
		,CAST(t.name   AS VARCHAR(2048)) AS treepath
		, 0 as parentObjectID
		,t.object_id as rootId
		,SCHEMA_NAME(t.schema_id)
	FROM sys.tables as t
	where 
		t.type = 'U'
	and not exists (
	select 1
		from sys.foreign_key_columns as fkc
		where fkc.parent_object_id = t.object_id
		and not fkc.referenced_object_id = object_id('Core.ActiveType')
	)


	UNION ALL
	SELECT t.object_id,
		SCHEMA_NAME(t.schema_id) +'.' + t.name as qualname,
		 t.name
		 ,0 referenced_object_id
		,kh.LEVEL + 1 as Level
		,CAST(t.name + ' -> ' + kh.treepath AS VARCHAR(2048)) AS treepath
		, 0 as parentObjectID
		,t.object_id as rootId
		,SCHEMA_NAME(t.schema_id)
	FROM sys.tables as t
	inner join sys.foreign_keys fk
	on t.object_id = fk.parent_object_id
	INNER JOIN key_hierarchy  kh ON 
		kh.id = fk.referenced_object_id 	
		and not fk.parent_object_id = fk.referenced_object_id
	where 
		t.type = 'U'
		and kh.LEVEL < 15
		and not t.name IN (
		 'PotentialResponse' 
		 , 'Question_Indicator_Rollup')
		 ---Funny cyclical relationship
	--and 1 = 0
	)


	SELect @exec = @exec + 'if exists( select 1 from sys.extended_properties ep where name = ''RelationshipDepth'' and class_desc = ''OBJECT_OR_COLUMN'' and major_id = ' +cast( id as varchar(20))  +' )
BEGIN
EXEC sys.sp_dropextendedproperty @name=N''RelationshipDepth'' , @level0type=N''SCHEMA'',@level0name=N''' + schemaname + ''', @level1type=N''TABLE'',@level1name=N'''+ tbl_name + '''
END

EXEC sys.sp_addextendedproperty @name=N''RelationshipDepth'', @value=N''' + cast(lvl as varchar(3)) + ''' , @level0type=N''SCHEMA'',@level0name=N''' + schemaname + ''', @level1type=N''TABLE'',@level1name=N'''+ tbl_name  + '''

'
	FROM (
	select qualname, schemaname, tbl_name, id, max(level) Lvl from key_hierarchy 
	GROUP by qualname, schemaname, tbl_name, id
	) src
	ORDER BY lvl asc, QualName asc
	--select @exec
	exec (@exec )