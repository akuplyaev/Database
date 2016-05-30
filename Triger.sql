use KuplyaevIntensive
GO
--ALTER TABLE  Tasks ADD date_modification date
GO 
ALTER TRIGGER any_change 
ON dbo.Tasks 
AFTER UPDATE
AS if exists (select  * from inserted)
begin 
update Tasks set Tasks.date_modification=GETDATE()
from Tasks inner join inserted
on	Tasks.id_task=inserted.id_task
end 
GO
GO




