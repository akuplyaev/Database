use KuplyaevIntensive
/*go
SELECT  [sys].[indexes].[name] AS IndexName,
	    [sys].[all_objects].[name] AS TableName,	 
		[sys].[dm_db_index_usage_stats].[user_seeks] AS Seeks,
		[sys].[dm_db_index_usage_stats].[user_scans] AS Scan,
		[sys].[dm_db_index_usage_stats].[user_updates] AS Updates		
		FROM [sys].[indexes]
		inner JOIN  [sys].[all_objects] ON
		[sys].[indexes].object_id=[sys].[all_objects].object_id
		LEFT join [sys].[dm_db_index_usage_stats]
		ON [sys].[indexes].index_id=[sys].[dm_db_index_usage_stats].index_id
		AND [sys].[indexes].object_id=[sys].[dm_db_index_usage_stats].object_id	 
		WHERE [sys].[all_objects].[type_desc]='USER_TABLE' */
GO
SELECT 
		Indexes.name as IndexName,
	    Tables.name AS TableName,	 
		Usage_stats.user_seeks AS Seeks,
		Usage_stats.user_scans AS Scan,
		Usage_stats.user_updates AS Updates,
		avg_fragmentation_in_percent AS AVG_in_percent
		FROM sys.dm_db_index_physical_stats (DB_ID(N'KuplyaevIntensive'), null, NULL, NULL, NULL) as Physical_stats
		INNER JOIN sys.indexes as Indexes ON Physical_stats.object_id = Indexes.object_id
			AND Physical_stats.index_id = Indexes.index_id
		INNER JOIN  sys.tables as Tables ON
		Physical_stats.object_id=Tables.object_id
		LEFT JOIN sys.dm_db_index_usage_stats as Usage_stats
		ON Physical_stats.index_id=Usage_stats.index_id
			AND Physical_stats.object_id=Usage_stats.object_id

go
--Select * from sys.dm_db_index_physical_stats (DB_ID(N'KuplyaevIntensive'), null, NULL, NULL, NULL)