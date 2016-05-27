/**или с этой [KuplyaevIntensive].[sys].[tables]  ******/
SELECT  
     [KuplyaevIntensive].[sys].[indexes].[name] AS IndexName,
	 [KuplyaevIntensive].[sys].[all_objects].[name] AS TableName,
	 /**или rowcnt **/
	 [KuplyaevIntensive].[sys].[sysindexes].[rows] AS CountRow,
	 [KuplyaevIntensive].[sys].[sysindexes].[indid],
	  cast([KuplyaevIntensive].[sys].[sysindexes].[reserved] as float) *8/1024 AS Reserved_mb , 
	  cast([KuplyaevIntensive].[sys].[sysindexes].[dpages] as float ) *8/1024 AS Dpages_mb ,
	  cast ([KuplyaevIntensive].[sys].[sysindexes].[used] as float ) *8/1024 AS USED_mb, /**dpages+iternal pages **/
	 cast([KuplyaevIntensive].[sys].[sysindexes].[reserved] -[KuplyaevIntensive].[sys].[sysindexes].[used] as float) *8/1024 AS NoUsed_mb
	 FROM [KuplyaevIntensive].[sys].[indexes]
		inner JOIN  [KuplyaevIntensive].[sys].[all_objects] ON
		[KuplyaevIntensive].[sys].[indexes].object_id=[KuplyaevIntensive].[sys].[all_objects].object_id
		INNER JOIN [KuplyaevIntensive].[sys].[sysindexes] ON
		[KuplyaevIntensive].[sys].[sysindexes].[name]=[KuplyaevIntensive].[sys].[indexes].[name]

 WHERE [KuplyaevIntensive].[sys].[all_objects].[type_desc]='USER_TABLE'

 GO
 use KuplyaevIntensive
 GO
 exec sp_spaceused N'Projects'
 GO
 exec sp_spaceused N'Tasks'

 
