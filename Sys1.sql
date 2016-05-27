/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT  
	 [KuplyaevIntensive].[sys].[all_objects].[name] AS TableName,
      [KuplyaevIntensive].[sys].[indexes].[name] AS IndexName
      
  FROM [KuplyaevIntensive].[sys].[indexes] INNER JOIN  [KuplyaevIntensive].[sys].[all_objects] ON [KuplyaevIntensive].[sys].[indexes].object_id=[KuplyaevIntensive].[sys].[all_objects].object_id
  where [KuplyaevIntensive].[sys].[all_objects].type_desc='USER_TABLE'
