use KuplyaevIntensive
GO
IF (NOT EXISTS (Select name_project from Projects where name_project='Список задач')) 
	BEGIN
	INSERT INTO Projects
			values ('Список задач')
    END
declare some_cursor cursor
--- sql запрос любой сложности, формирующий набор данных для курсора
for
select  name_project from Projects WHERE name_project not in (Select name_task from Tasks)
open some_cursor
-- курсор создан, обьявляем переменные и обходим набор строк в цикле
declare  @string_var varchar(45)
declare  @id_project int
set @id_project=(Select id_project from Projects where name_project='Список задач')
-- выборка первой  строки
fetch next from some_cursor INTO   @string_var			
-- цикл с логикой и выборкой всех последующих строк после первой
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