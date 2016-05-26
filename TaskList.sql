use KuplyaevIntensive
GO
IF (NOT EXISTS (Select name_project from Projects where name_project='Спискок задач')) 
	BEGIN
		INSERT INTO Projects
			values ('Список задач')	
			WHILE (select COUNT(*) from Projects WHERE name_project not in (Select name_task from Tasks))>0		
			BEGIN
				INSERT INTO Tasks 
					values ((select name_project from Projects 
					WHERE name_project not in (Select name_task from Tasks)
						),
						'description',
						0,
						NULL,
						(select SCOPE_IDENTITY() from Projects))
			END			
	END
ELSE
	BEGIN
	INSERT INTO Tasks 
				values ((select name_task from Tasks
						 WHERE name_task not in (Select name_project from Projects)
						 ),
						'description',
						0,
						NULL,
						(select SCOPE_IDENTITY() from Projects))
	END 