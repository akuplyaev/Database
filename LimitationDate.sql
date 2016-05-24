use KuplyaevIntensive
GO
ALTER TABLE Tasks
ADD CONSTRAINT chkLimitDate CHECK (deadline>GETDATE ( ));
GO