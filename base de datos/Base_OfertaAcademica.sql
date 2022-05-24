create database Oferta_Academica
go

use Oferta_Academica


create table Edificios
(
	Nombre varchar(100) primary key,
	Imagen image not null,
	Provincia varchar(1000) not null,
	NumeroAulas int not null,
	NumeroLavoratorio int not null,
	Disponibilidad varchar(100) not null
)
go

create table Aulas
(
    NumeroAula varchar(100) primary key not null,
	NombreEdificio varchar(100) not null,
	Tipo varchar(100) not null,
	Capacidad int not null,
	EstadoAula varchar(100) not null,
	foreign key (NombreEdificio) references Edificios (Nombre)
)
go
create table OfertaAcademica
(
    Codigo varchar(100) ,
	Materia varchar(100),
	Grupo int not null,
	Carrera varchar(100) not null,
	Inicio_Cuatrimestre varchar(100) not null,
	Final_Cuatrimestre varchar(100) not null,
	Horas varchar(100) not null,
	Dia varchar(100) not null,
	Cupos varchar(100) not null,
	Matricula varchar(100) not null,
	Inicio varchar(100) not null,
	Salida varchar(100) not null,
	Profesor varchar(100) not null
)

create table Horarios
(
	Turno varchar(100) not null primary key,
	Hora_Inicio varchar(100) not null,
	Hora_Salida varchar(100) not null
)
go

create table Dias
(
    Key_Dia varchar(1) not null primary key,
	Dia varchar(100) not null
)
go

insert into Dias values('L','Lunes')
insert into Dias values('K','Martes')
insert into Dias values('M','Miercoles')
insert into Dias values('J','Jueves')
insert into Dias values('V','Viernes')
insert into Dias values('S','Sabado')
go

select * from Dias


select * from Horarios



create table HorariosAulas(
	NumeroAula varchar(100) not null,
	horario varchar(100) not null,
	Hora_Inicio varchar(100) not null,
	Hora_Salida varchar(100) not null,
	dia varchar(1) not null,
	estado varchar(100) not null,
	capasidad varchar(100) not null,
	foreign key (NumeroAula) references Aulas (NumeroAula),
	foreign key (dia) references Dias (Key_Dia)
)

create table aulasAsignadas(
	CodigoMateria varchar(100),
	NumeroAula varchar(100) not null,
	horario varchar(100) not null,
	Hora_Inicio varchar(100) not null,
	Hora_Salida varchar(100) not null,
	dia varchar(1) not null,
	grupo varchar(100) not null,
	foreign key (NumeroAula) references Aulas (NumeroAula),
	foreign key (dia) references Dias (Key_Dia)
)

select a.CodigoMateria, a.NumeroAula,c.NombreEdificio,a.horario,a.dia,a.grupo,b.capasidad from aulasAsignadas a,
HorariosAulas b, Aulas c where a.NumeroAula=b.NumeroAula and b.horario='1' and c.NombreEdificio=

select b.NumeroAula,c.NombreEdificio,b.horario,b.dia,b.capasidad from HorariosAulas b, Aulas c where b.estado='0'
and b.NumeroAula=c.NumeroAula and c.NombreEdificio=



create table solicitud(
Codigo_Materia varchar(100) not null,
Nombre_Materia varchar(100) not null,
Grupo varchar(100) not null,
Numero_Aula varchar(100) not null,
Capasidad_Aula varchar(100) not null,
Cupos_Grupo varchar(100) not null,
Dia varchar(100) not null,
Hora_Entrada varchar(100) not null,
Hora_salida varchar(100) not null

)


select Hora_Inicio,Hora_Salida from Horarios

insert Horarios values('Mañana','08:00','11:40')
insert Horarios values('Tarde','13:00','17:40')
insert Horarios values('Noche','18:00','21:40')

select * from aulasAsignadas

select * from HorariosAulas

select * from Aulas

create table Usuarios_Sistema(
	Usuario varchar(100) primary key,
	Contraseña varchar(100) not null,
	Nombre varchar(100) not null,
	Email varchar(100) not null,
	Rol varchar(100) not null,
)

create table Directores_Sistema(
	Usuario varchar(100) primary key,
	Contraseña varchar(100) not null,
	Nombre varchar(100) not null,
	Email varchar(100) not null,
	Carrera varchar(100) not null,
)

insert into Usuarios_Sistema values('30111','1234','Luis','aj1999cs@gmail.com','Carga Oferta')
insert into Usuarios_Sistema values('30522','1234','Adrian','adrian19calderon@gmail.com','Distribucion')
insert into Usuarios_Sistema values('30555','1234','Armando Segura','adrian19calderon@gmail.com','Estudiante')
insert into Usuarios_Sistema values('30333','1234','Pedro Morales','adrian19calderon@gmail.com','Profesor')
insert into Usuarios_Sistema values('12345','1234','Abarca Cerdas Damaris','adrian19calderon@gmail.com','Profesor')
go

delete Usuarios_Sistema

select* from Usuarios_Sistema
select* from Directores_Sistema

create table estudiantes(
nombre varchar(100) not null,
codigoMateria varchar(100) not null,
grupo varchar(100) not null

)

insert estudiantes values('307890123','AA-404','1')
insert estudiantes values('307890123','AM-404','3')
insert estudiantes values('307890123','AC-101','6')
insert estudiantes values('307890123','AF-101','5')

select * from HorariosAulas where estado='0'