use KuplyaevIntensive
GO
INSERT INTO Projects
values ('��������')
GO
INSERT INTO Tasks 
values ('�������� sql',
		'description',
		0,
		GETDATE()+3,
		(select SCOPE_IDENTITY() from Projects))
