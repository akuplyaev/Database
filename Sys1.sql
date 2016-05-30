Use KuplyaevIntensive
GO
SELECT  
     [sys].[indexes].[name] AS IndexName,
	 [sys].[all_objects].[name] AS TableName,
	 /**или rowcnt **/
	 [sys].[sysindexes].[rows] AS CountRow,
	 [sys].[sysindexes].[indid],
	  cast([sys].[sysindexes].[reserved] as float) *8/1024 AS Reserved_mb , 
	  cast([sys].[sysindexes].[dpages] as float ) *8/1024 AS Dpages_mb ,
	  cast ([sys].[sysindexes].[used] as float ) *8/1024 AS USED_mb, /**dpages+iternal pages **/
	  cast([sys].[sysindexes].[reserved] -[KuplyaevIntensive].[sys].[sysindexes].[used] as float) *8/1024 AS NoUsed_mb
	 FROM [sys].[indexes]
		inner JOIN  [sys].[all_objects] ON
		[sys].[indexes].object_id=[KuplyaevIntensive].[sys].[all_objects].object_id
		INNER JOIN [sys].[sysindexes] ON
		[sys].[sysindexes].[name]=[KuplyaevIntensive].[sys].[indexes].[name]

 WHERE  [sys].[all_objects].[type_desc]='USER_TABLE'

 GO
 exec sp_spaceused N'Projects'
 GO
 exec sp_spaceused N'Tasks'

 
