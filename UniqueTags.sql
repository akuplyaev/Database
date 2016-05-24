use KuplyaevIntensive
GO
ALTER TABLE Tags
ADD CONSTRAINT uc_NAME_TAG  UNIQUE (name_tag)