use Oferta_Academica

create PROCEDURE Oferta_Academic
	
	@Codigo varchar(128) = '',
	@Materia varchar(128) = '',
	@Grupo varchar(128) = '',
	@Carrera varchar(128) = '',
	@Inicio_Cuatrimestre varchar(128) = '',
	@Final_Cuatrimestre varchar(128) = '',
	@Horas varchar(128) = '',
	@dia varchar(128) = '',
	@Cupos varchar(128) = '',
	@Matricula varchar(128) = '',
	@Inicio varchar(128) = '',
	@Salida varchar(128) = '',
	@Profesor varchar(128) = ''
	AS
/* METODOS PARA LA GESTION DE HORARIOS */
BEGIN
	
	BEGIN
		INSERT into OfertaAcademica values(@Codigo,@Materia,@Grupo,@Carrera,@Inicio_Cuatrimestre,@Final_Cuatrimestre,@Horas,@dia,@Cupos,@Matricula,@Inicio,@Salida,@Profesor)
	END
END


create PROCEDURE asignacion
	
	@CodigoMateria varchar(100) = '',
	@NumeroAula varchar(100) = '',
	@horario varchar(100) = '',
	@Hora_Inicio varchar(100) = '',
	@Hora_Salida varchar(100) = '',
	@dia varchar(1) = '',
	@grupo varchar(100) = ''
	
	AS
/* METODOS PARA LA GESTION DE HORARIOS */
BEGIN
	
	BEGIN
		INSERT into aulasAsignadas values (@CodigoMateria,@NumeroAula,@horario,@Hora_Inicio,@Hora_Salida,@dia,@grupo)
		
		update HorariosAulas set estado = '1' where dia = @dia and Hora_Inicio = @Hora_Inicio and NumeroAula = @NumeroAula
		
	END
END

alter PROCEDURE Oferta_Academica
	/*GENERAL*/
	@option varchar(128) = '',



	/*AULAS*/
	@N_aula varchar(128) = '',
	@Numero_Nuevo varchar(128) = '',
	@Nombre_Edificio varchar(128) = '',
	@Tipo varchar(128) = '',
	@Capacidad varchar(128) = '',
	@Estado_Aula varchar(128) = '',

	/*EDIFICIOS*/
	@Nombre varchar(128) = '',
	@Nombre_Nuevo varchar(128) = '',
	@Imagen image = '',
	@Provincia varchar(1000) = '',
	@N_aulas varchar(128) = '',
	@N_laboratorios varchar(128) = '',
	@Disponibilidad varchar(128) = ''

AS

/*METODOS PARA LA GESTION DE EDIFICIOS*/

BEGIN
	if(@option = 'SELECT_EDIFICIO')
	BEGIN
		Select * from Edificios
	END
END

BEGIN
	if(@option = 'BUSCAR_EDIFICIO')
	BEGIN
		Select * from Edificios where Nombre=@Nombre
	END
END

BEGIN
	if(@option = 'EDIT_EDIFICIO')
	BEGIN
		UPDATE Edificios
		   SET Nombre = @Nombre_Nuevo,
			  Provincia = @Provincia,
			  NumeroAulas = @N_aulas,
			  NumeroLavoratorio = @N_laboratorios,
			  Disponibilidad = @Disponibilidad
		 WHERE Nombre=@Nombre

		if(@Disponibilidad = 'Innabilitado')
		BEGIN
			UPDATE Aulas
				SET EstadoAula = 'Innabilitada'
				WHERE NombreEdificio=@Nombre
		END
	END
END

/*METODOS PARA LA GESTION DE AULAS*/

BEGIN
	if(@option = 'INSERT_AULA')
	BEGIN
		INSERT into Aulas values(@N_aula,@Nombre_Edificio,@Tipo,@Capacidad,@Estado_Aula)
	END
END

BEGIN
	if(@option = 'SELECT_AULA')
	BEGIN
		Select * from Aulas
	END
END

BEGIN
	if(@option = 'BUSCAR_AULA')
	BEGIN
		Select * from Aulas where NumeroAula = @N_aula
	END
END

BEGIN
	if(@option = 'EDIT_AULA')
	BEGIN
		UPDATE Aulas
		   SET NumeroAula = @Numero_Nuevo,
			  Tipo = @Tipo,
			  Capacidad = @Capacidad,
			  EstadoAula = @Estado_Aula
		 WHERE NumeroAula = @N_aula	
	END
END

go



create PROCEDURE Asignar_Aula
	/*GENERAL*/
	@option varchar(128) = '',
	@dia varchar(128) = '',
	@inicio varchar(128) = ''


AS

BEGIN
	if(@option = 'CuposManumales')
	BEGIN
		select c.* from OfertaAcademica a , HorariosAulas c where a.Dia = @dia and c.dia = @dia and c.Hora_Inicio = @inicio and a.Inicio = @inicio and c.estado = '0'
	END
END


go




create PROCEDURE eliminar
	
	@CodigoMateria varchar(100) = '',
	@NumeroAula varchar(100) = '',
	@Hora_Inicio varchar(100) = '',
	@dia varchar(1) = '',
	@grupo varchar(100) = ''
	
	AS

BEGIN
	
	BEGIN
		delete aulasAsignadas where CodigoMateria=@CodigoMateria and grupo = @grupo
		update HorariosAulas set estado = '0'where dia = @dia and Hora_Inicio = @Hora_Inicio and NumeroAula = @NumeroAula
		
	END
END


create PROCEDURE OfertaMacro
	@option varchar(100) = '',
	@Edificio varchar(100) = ''
	
	AS
BEGIN
	if(@option = 'OFERTA_MACRO')
	BEGIN
		select a.CodigoMateria,a.NumeroAula,a.Horario,a.Hora_Inicio,a.Hora_Salida,a.Dia,b.NombreEdificio,c.Imagen from aulasAsignadas a
			inner join Aulas b on (a.NumeroAula=b.NumeroAula)
			inner join Edificios c on (c.Nombre = b.NombreEdificio)
			where c.Nombre = @Edificio order by NumeroAula
	END
END

create PROCEDURE UsuariosValidar
	/*GENERAL*/
	@option varchar(128) = '',
	@Usuario varchar(128) = '',
	@Contraseña varchar(128) = '',
	@Nombre varchar(128) = '',
	@Email varchar(128) = '',
	@Rol varchar(128) = ''

AS

/*METODOS PARA LA GESTION DE EDIFICIOS*/
BEGIN
	if(@option = 'BUSCAR_USUARIO')
	BEGIN
		Select * from Usuarios_Sistema where Usuario = @Usuario
	END
END

BEGIN
	if(@option = 'SELECT_USER')
	BEGIN
		Select Usuario from Usuarios_Sistema where Usuario = @Usuario
	END
END

BEGIN
	if(@option = 'SELECT_CONTRASEÑA')
	BEGIN
		Select Contraseña from Usuarios_Sistema where Usuario = @Usuario
	END
END

BEGIN
	if(@option = 'SELECT_ROL')
	BEGIN
		Select Rol from Usuarios_Sistema where Usuario = @Usuario and Contraseña = @Contraseña
	END
END

BEGIN
	if(@option = 'SELECT_PROFESOR')
	BEGIN
		Select Nombre from Usuarios_Sistema where Usuario=@Usuario
	END
END

GO


alter PROCEDURE Nomenclatura
	/*GENERAL*/
	@option varchar(128) = '',
	@Edificio varchar(128) = ''

AS

BEGIN
	if(@option = 'Ver_Aulas')
	BEGIN
		select * from aulasAsignadas a
		inner join Aulas c on (a.NumeroAula=c.NumeroAula) where  c.NombreEdificio=@Edificio
	END
END



BEGIN
	if(@option = 'Ver_Aulas_Disponible')
	BEGIN
		select b.NumeroAula,c.NombreEdificio,b.horario,b.dia,b.capasidad from HorariosAulas b, Aulas c where b.estado='0'
		and b.NumeroAula=c.NumeroAula and c.NombreEdificio=@Edificio
	END
END


go

ALTER PROCEDURE Directores_Carrera
	/*GENERAL*/
	@option varchar(128) = '',
	@Usuario varchar(128) = '',
	@Contra varchar(128) = '',
	@Nombre varchar(128) = '',
	@Email varchar(128) = '',
	@Carrera varchar(128) = ''

AS

BEGIN
	if(@option = 'Registrar_Director')
	BEGIN
		insert into Directores_Sistema values(@Usuario,@Contra,@Nombre,@Email,@Carrera)
	END
END

BEGIN
	if(@option = 'BUSCAR_DIRECTOR')
	BEGIN
		Select * from Directores_Sistema where Usuario = @Usuario
	END
END


BEGIN
	if(@option = 'SELECT_CONTRASEÑA')
	BEGIN
		Select Contraseña from Directores_Sistema where Usuario = @Usuario
	END
END

BEGIN
	if(@option = 'SELECT_ROL')
	BEGIN
		Select Carrera from Directores_Sistema where Usuario = '30522' and Contraseña = '1234'
	END
END

go