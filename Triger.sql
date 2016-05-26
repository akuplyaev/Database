use KuplyaevIntensive
GO
--ALTER TABLE  Tasks ADD date_modification date
GO 
ALTER TRIGGER any_change 
ON dbo.Tasks 
AFTER UPDATE
AS if exists (select  * from deleted)
begin 
declare @id_update int
set @id_update=(Select id_task from deleted)
update Tasks set date_modification=GETDATE()
where id_task=@id_update
end 
GO




