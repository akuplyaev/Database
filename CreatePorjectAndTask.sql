use KuplyaevIntensive
GO
IF (NOT EXISTS (Select name_project from Projects where name_project=N'Интенсив')) 
	BEGIN
		INSERT INTO Projects
				values (N'Интенсив')
		INSERT INTO Tasks 
				values (N'Изучение sql',
						'description',
						0,
					    DATEADD(DAY,3,GETDATE()),
						(select SCOPE_IDENTITY() from Projects),NULL)
	END
ELSE
	BEGIN
	INSERT INTO Tasks 
				values (N'Изучение sql',
						'description',
						0,
						DATEADD(DAY,3,GETDATE()),
						(select id_project from Projects where name_project=N'Интенсив'),NULL)
	END	
	
	
