use KuplyaevIntensive
GO
IF (NOT EXISTS (Select name_project from Projects where name_project='Интенсив')) 
	BEGIN
		INSERT INTO Projects
				values ('Интенсив')
		INSERT INTO Tasks 
				values ('Изучение sql',
						'description',
						0,
						GETDATE()+3,
						(select SCOPE_IDENTITY() from Projects))
	END
ELSE
	BEGIN
	INSERT INTO Tasks 
				values ('Изучение sql',
						'description',
						0,
						GETDATE()+3,
						(select id_project from Projects where name_project='Интенсив'))
	END	
	
	
