use KuplyaevIntensive
GO
INSERT INTO Projects
values ('Интенсив')
GO
INSERT INTO Tasks 
values ('Изучение sql',
		'description',
		0,
		GETDATE()+3,
		(select SCOPE_IDENTITY() from Projects))
