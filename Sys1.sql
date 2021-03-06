Use KuplyaevIntensive
GO
SELECT  
     sys.indexes.name AS IndexName,
	 sys.all_objects.name AS TableName,
	 /**или rowcnt **/
	 sys.sysindexes.rows AS CountRow,
	 sys.sysindexes.indid,
	  cast(sys.sysindexes.reserved as float) *8/1024 AS Reserved_mb , 
	  cast(sys.sysindexes.dpages as float ) *8/1024 AS Dpages_mb ,
	  cast (sys.sysindexes.used as float ) *8/1024 AS USED_mb, /**dpages+iternal pages **/
	  cast(sys.sysindexes.reserved -sys.sysindexes.used as float) *8/1024 AS NoUsed_mb,
	  cast(sys.dm_db_partition_stats.reserved_page_count as float)*8/1024 AS Reserved_mb_partiton_stats ,
	  cast(sys.dm_db_partition_stats.used_page_count as float) *8/1024 AS Used_mb_partiton_stats
	 FROM sys.indexes
		inner JOIN  sys.all_objects ON
		sys.indexes.object_id=sys.all_objects.object_id
		INNER JOIN sys.sysindexes ON
		sys.sysindexes.name=sys.indexes.name
		INNER JOIN sys.dm_db_partition_stats ON
		sys.indexes.object_id=sys.dm_db_partition_stats.object_id and sys.indexes.index_id=sys.dm_db_partition_stats.index_id
 WHERE  sys.all_objects.type_desc='USER_TABLE'

GO



 
