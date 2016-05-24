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
deadline date not null,
id_project int not null
);
GO
create table Tags(
name_tag char(10) PRIMARY KEY not null
);
GO
create table TasksTags (
id_task int not null,
name_tag char(10) not null,
CONSTRAINT pk_TasksTags PRIMARY KEY (id_task,name_tag)
)