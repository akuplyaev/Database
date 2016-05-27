/**или с этой [KuplyaevIntensive].[sys].[tables]  ******/
SELECT  
     [KuplyaevIntensive].[sys].[indexes].[name] AS IndexName,
	 [KuplyaevIntensive].[sys].[all_objects].[name] AS TableName,
	 /**или rowcnt **/
	 [KuplyaevIntensive].[sys].[sysindexes].[rows] AS CountRow,
	  [KuplyaevIntensive].[sys].[sysindexes].[reserved] AS AllSize, 
	 [KuplyaevIntensive].[sys].[sysindexes].[dpages],
	 [KuplyaevIntensive].[sys].[sysindexes].[used]
	 FROM [KuplyaevIntensive].[sys].[indexes]
		inner JOIN  [KuplyaevIntensive].[sys].[all_objects] ON
		[KuplyaevIntensive].[sys].[indexes].object_id=[KuplyaevIntensive].[sys].[all_objects].object_id
		INNER JOIN [KuplyaevIntensive].[sys].[sysindexes] ON
		[KuplyaevIntensive].[sys].[sysindexes].[name]=[KuplyaevIntensive].[sys].[indexes].[name]

 WHERE [KuplyaevIntensive].[sys].[all_objects].[type_desc]='USER_TABLE'

 GO
