SELECT  [KuplyaevIntensive].[sys].[indexes].[name] AS IndexName,
	    [KuplyaevIntensive].[sys].[all_objects].[name] AS TableName,	 
		[KuplyaevIntensive].[sys].[dm_db_index_usage_stats].[user_seeks] AS Seeks,
		[KuplyaevIntensive].[sys].[dm_db_index_usage_stats].[user_scans] AS Scan,
		[KuplyaevIntensive].[sys].[dm_db_index_usage_stats].[user_updates] AS Updates
		FROM [KuplyaevIntensive].[sys].[indexes]
	inner JOIN  [KuplyaevIntensive].[sys].[all_objects] ON
	[KuplyaevIntensive].[sys].[indexes].object_id=[KuplyaevIntensive].[sys].[all_objects].object_id
	LEFT join [KuplyaevIntensive].[sys].[dm_db_index_usage_stats]
	ON [KuplyaevIntensive].[sys].[indexes].index_id=[KuplyaevIntensive].[sys].[dm_db_index_usage_stats].index_id
	AND [KuplyaevIntensive].[sys].[indexes].object_id=[KuplyaevIntensive].[sys].[dm_db_index_usage_stats].object_id
	 
	 WHERE [KuplyaevIntensive].[sys].[all_objects].[type_desc]='USER_TABLE'