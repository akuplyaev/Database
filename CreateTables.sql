use [KuplyaevIntensive]
GO
create table [Projects] (
[id_project] int identity PRIMARY KEY,
[name_project] nvarchar(45) not null
);
GO
create table [Tasks] (
[id_task] int identity PRIMARY KEY,
[name_task] nvarchar(45) not null,
[description] nvarchar(max),
[mark] bit not null ,
[deadline] date,
[id_project] int not null
);
GO
create table [Tags](
[id_tag]  int identity PRIMARY KEY,
[name_tag] nvarchar(10)

);
GO
create table [TasksTags] (
[id_tasktag] int identity PRIMARY KEY,
[id_task] int not null,
[id_tag] int not null,
)