use KuplyaevIntensive
GO
IF (NOT EXISTS (Select name_project from Projects where name_project='������ �����')) 
	BEGIN
	INSERT INTO Projects
			values ('������ �����')
    END
declare some_cursor cursor
--- sql ������ ����� ���������, ����������� ����� ������ ��� �������
for
select  name_project from Projects WHERE name_project not in (Select name_task from Tasks)
open some_cursor
-- ������ ������, ��������� ���������� � ������� ����� ����� � �����
declare  @string_var varchar(45)
declare  @id_project int
set @id_project=(Select id_project from Projects where name_project='������ �����')
-- ������� ������  ������
fetch next from some_cursor INTO   @string_var			
-- ���� � ������� � �������� ���� ����������� ����� ����� ������
while @@FETCH_STATUS = 0
	BEGIN			
		INSERT INTO Tasks 
				values (@string_var,						 
						'description',
						  0,
						  NULL,
						 @id_project)
		fetch next from some_cursor INTO @string_var
	END	
CLOSE some_cursor				