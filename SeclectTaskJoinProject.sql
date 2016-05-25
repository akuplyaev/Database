use KuplyaevIntensive
GO
Select Tasks.name_task,Projects.name_project from Tasks INNER JOIN Projects
 ON Tasks.id_project=Projects.id_project;
