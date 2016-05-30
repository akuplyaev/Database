use KuplyaevIntensive
GO
--ALTER TABLE  Tasks ADD date_modification date
GO 
ALTER TRIGGER any_change 
ON dbo.Tasks 
AFTER UPDATE
AS if exists (select  * from inserted)
begin 
declare @id_update int
select @id_update=(Select id_task from inserted)
update Tasks set date_modification=GETDATE()
where id_task=@id_update
end 
GO




