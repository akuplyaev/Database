use KuplyaevIntensive
GO
create table Projects (
id_project int identity PRIMARY KEY,
name_project char(10) not null
);
GO
create table Tasks (
id_task int identity PRIMARY KEY,
name_task char(10) not null,
descript text not null,
mark bit not null,
deadline date,
id_project int not null
);
GO
create table Tags(
id_tag  int identity PRIMARY KEY,
name_tag char(5)

);
GO
create table TasksTags (
id_task int not null,
id_tag int not null,
CONSTRAINT pk_TasksTags PRIMARY KEY (id_task,id_tag)
)