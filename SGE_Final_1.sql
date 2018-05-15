drop database pruebas_michelle_SGE_MASTER
create database pruebas_michelle_SGE_MASTER

use pruebas_michelle_SGE_MASTER
drop table usuarios
drop table divisiones
drop table jefesDeDivision
drop table materias
drop table grupos
drop table docentes
drop table alumnos
drop table historialAcademico
drop table estadisticasDivision
drop table asignacionDocentes
drop table banderasAlumnos

use pruebas_michelle_SGE_MASTER
select top 50 * from usuarios
select top 50 * from divisiones
select top 50 * from jefesDeDivision
select top 50 * from materias
select top 50 * from grupos
select top 50 * from docentes
select top 50 * from alumnos
select top 50 * from historialAcademico
select top 50 * from estadisticasDivision
select top 50 * from asignacionDocentes
select top 50 * from banderasAlumnos

/*
 Tipos de Usuario

	0 - WEBMASTER
	1 - JEFE DE CARRERA
	2 - DOCENTE
	3 - ALUMNO

 Carreras
	IINFO - Ingeriería Informática
	ITICS - Ingeriería en Tecnologías de la Información y Comunicaciones
	IGEST - Ingeriería en Gestión Empresarial
	IADMI - Ingeriería en Administración
	ILOGI - Ingeriería Logística
	IMECT - Ingeriería Mecatrónica
	IELEC - Ingeriería Electrónica
	CONTP - Contador Publico
	MAEST - Maestría
*/

use pruebas_michelle_SGE_MASTER

create table usuarios(
	[ID o MATRICULA] nvarchar(20) not null unique,
	_active numeric(1,0) not null,
	cargo nvarchar(50) not null,
	_tipo int not null,
	_user nvarchar(20) unique not null,
	_pass nvarchar(max) not null,
	_tempMD5hash_pass varchar(max),
	_pregsegu nvarchar(max) not null,
	_respsegu nvarchar(max) not null,
	_estatusSesion numeric(1,0),
	ultimoInicioSesion datetime,
	ultimoCierreSesion datetime,
	ultimaActividad datetime
)
insert into usuarios values('A-14250201', 1, 'IINFO', 1,'admin01', '1234', null,'Marca de mi computadora?', 'mac', 0, null, null, null)
insert into usuarios values('A-14250202', 1, 'ITICS', 2,'docente01', '4321', null,'Que animal me gusta mas?', 'los gatos', 0, null, null, null)
select * from usuarios

select [ID o MATRICULA], _tipo, ultimoCierreSesion, ultimoInicioSesion from usuarios where _active = 1 and _user = 'admin01' and _pass = '1234'

create table divisiones(
	divison varchar(5)not null,
	_active numeric(1,0) not null,
	claveDivision nvarchar(20) not null,
	nombreDivision varchar(max) not null,
	claveEspecialidad nvarchar(20),
	nombreEspecialidad varchar(max),
	totalCreditos numeric(3,0) not null,
	claveMateria nvarchar(10) not null
)
insert into divisiones values('IINFO', 1,'IINF-2010-220', 'Ingeniería Informática', 'IINE-2013-01', 'Sistemas de Información', 260, 'ACF-0901')
insert into divisiones values('IINFO', 1,'IINF-2010-220', 'Ingeniería Informática', 'IINE-2013-01', 'Sistemas de Información', 260, 'IFE-1004')
insert into divisiones values('ITICS', 1,'ITIC-2010-225', 'Ingeniería en Tecnologías de la Información y Comunicaciones', NULL, NULL, 260, 'ACF-0901')
insert into divisiones values('ITICS', 1,'ITIC-2010-225', 'Ingeniería en Tecnologías de la Información y Comunicaciones', NULL, NULL, 260, 'TIP-1017')
select * from divisiones

create table materias(
	claveMateria nvarchar(10) not null unique,
	_active numeric(1,0) not null,
	nombreMateria nvarchar(max) not null,
	creditos numeric(2,0) not null
)
/* Carga de datos - TABLA MATERIAS */
/*TICS*/
insert into materias values('ACF-0901', 1, 'Calculo Diferencial', 5)
insert into materias values('AEF-1032', 1, 'Fundamentos de la Programación', 5)
insert into materias values('TIF-1019', 1, 'Matematicas Discretas I', 5)
insert into materias values('TIP-1017', 1, 'Introducción a las TIC´s', 3)
insert into materias values('ACA-0907', 1, 'Taller de Ética', 4)
insert into materias values('ACC-0906', 1, 'Fundamentos de la Investigación', 4)

insert into materias values('ACF-0902', 1, 'Calculo Integral', 5)
insert into materias values('AEB-1054', 1, 'Programación Orientada a Objetos', 5)
insert into materias values('TIF-1020', 1, 'Matemasticas Discretas II', 5)
insert into materias values('ACF-0903', 1, 'Álgebra Lineal', 5)
insert into materias values('AEF-1052', 1, 'Probabilidad y Estadistica', 5)
insert into materias values('TIF-1009', 1, 'Contabilidad y Costos', 5)

insert into materias values('TID-1012', 1, 'Estructuras y Organización de Datos', 5)
insert into materias values('TIF-1021', 1, 'Matemáticas para la Toma de Decisiones', 5)
insert into materias values('AEF-1031', 1, 'Fundamentos de Base de Datos', 5)
insert into materias values('TIC-1011', 1, 'Electricidad y Magnetismo', 4)
insert into materias values('TIC-1002', 1, 'Administración Gerencial', 4)

insert into materias values('TIE-1018', 1, 'Matemáticas Aplicadas a Comunicaciones', 4)
insert into materias values('TIB-1024', 1, 'Programación II', 5)
insert into materias values('TIF-1013', 1, 'Fundamentos de Redes', 5)
insert into materias values('AEA-1063', 1, 'Taller de Base de Datos', 4)
insert into materias values('TID-1008', 1, 'Circuitos Eléctricos y Electrónicos', 5)
insert into materias values('TIC-1014', 1, 'Ingeniería de Software', 4)

insert into materias values('TID-1004', 1, 'Análisis de Señales y Sistemas de Comunicación', 5)
insert into materias values('TIF-1001', 1, 'Administración de Proyectos', 5)
insert into materias values('TIF-1025', 1, 'Redes de Computadoras', 5)
insert into materias values('TIF-1007', 1, 'Bases de datos Distribuidas', 5)
insert into materias values('TIC-1005', 1, 'Arquitectura de Computadoras', 4)
insert into materias values('TIC-1027', 1, 'Taller de Ingeniería de Software', 4)

insert into materias values('TIF-1029', 1, 'Telecomunicaciones', 5)
insert into materias values('AEB-1055', 1, 'Programación Web', 5)
insert into materias values('TID-1010', 1, 'Desarrollo de Emprendedores', 5)
insert into materias values('AEC-1061', 1, 'Sistemas Operativos I', 4)
insert into materias values('ACD-0908', 1, 'Desarrollo Sustentable', 5)
insert into materias values('TIC-1028', 1, 'Tecnologías Inalámbricas', 4)

insert into materias values('TIF-1026', 1, 'Redes Emergentes', 5)
insert into materias values('AEB-1011', 1, 'Desarrollo de Aplicaciones para Dispositivos Móviles', 5)
insert into materias values('ACA-0909', 1, 'Taller de Investigación I', 4)
insert into materias values('AED-1062', 1, 'Sistemas Operatívos II', 5)
insert into materias values('TIC-1022', 1, 'Negocios Electónicos I', 4)
insert into materias values('TIH-1016', 1, 'Interacción Humano Computadora', 4)

insert into materias values('TIB-1003', 1, 'Administración y Seguridad de Redes', 5)
insert into materias values('TIC-1006', 1, 'Auditoría en Tecnologías de la Información', 4)
insert into materias values('ACA-0910', 1, 'Taller de Investigación II', 4)
insert into materias values('TIC-1015', 1, 'Ingeniería del Conocimiento', 4)
insert into materias values('TIC-1023', 1, 'Negocios Electrónicos', 4)

/*INFO*/
insert into materias values('ACC-0905', 1, 'Fundamentos de la Investigación', 4)
insert into materias values('AEF-1041', 1, 'Matemáticas Discretas', 5)
insert into materias values('IFF-1019', 1, 'Fundamentos de Programación', 5)
insert into materias values('IFE-1004', 1, 'Administración para Informática', 4)
insert into materias values('ACF-0901', 1, 'Cálculo Diferencial', 5)
insert into materias values('AEC-1085', 1, 'Contabilidad Financiera', 4)
insert into materias values('ACA-0907', 1, 'Taller de Ética', 4)

insert into materias values('ACD-0908', 1,'Desarrollo Sustentable', 5)
insert into materias values('IFD-1016', 1,'Física para la Informática', 5)
insert into materias values('AEB-1054', 1,'Programación Orientada a Objetos', 5)
insert into materias values('AEF-1052', 1,'Probabilidad y Estadistica', 5)
insert into materias values('ACF-0902', 1,'Calculo Integral', 5)
insert into materias values('IFC-1009', 1,'Costos Empresariales', 4)

insert into materias values('IFE-1016', 1,'Fundamentos de Sistemas de Información', 4)
insert into materias values('IFC-1022', 1,'Sistemas Electrónicos para Informática', 4)
insert into materias values('AED-1026', 1,'Estructura de Datos', 5)
insert into materias values('IFR-1024', 1,'Taller de Legislación Informática', 3)
insert into materias values('ACR-0903', 1,'Álgebra Lineal', 5)
insert into materias values('IFC-1001', 1,'Administración de los Recursos y Función Informática', 4)

insert into materias values('IFF-1005', 1,'Análisis y Modelado de Sistemas de Información', 5)
insert into materias values('IFD-1006', 1,'Arquitectura de Computadoras', 5)
insert into materias values('IFF-1003', 1,'Administración y Organización de Datos', 5)
insert into materias values('AEC-1034', 1,'Fundamentos de las Telecomunicaciónes', 4)
insert into materias values('AEF-1031', 1,'Fundamentos de Base de Datos', 5)
insert into materias values('IFF-1018', 1,'Investigación de Operaciónes I', 5)
insert into materias values('AEC-1061', 1,'Sistemas Operatívos I', 4)

insert into materias values('IFD-1011', 1,'Desarrollo e Implementación de Sistemas de Información', 5)
insert into materias values('IFC-1025', 1,'Tecnologias e Interfaces de Computadoras', 4)
insert into materias values('IFD-1020', 1,'Redes de Computadoras', 5)
insert into materias values('AEH-1053', 1,'Taller de Base de Datos', 4)
insert into materias values('AED-1052', 1,'Sistemas Operativos II', 5)
insert into materias values('ACA-0909', 1,'Taller de Investigación I', 4)
insert into materias values('IFC-1021', 1,'Seguridad Informática', 4)

insert into materias values('IFE-1014', 1, 'Fundamentos de Gestión de Servicios de TI', 4)
insert into materias values('IED-1010', 1, 'Desarrollo de Aplicaciones Web', 5)
insert into materias values('IFC-1009', 1, 'Calidad de Sistemas de Información', 4)
insert into materias values('IFM-1017', 1, 'Interconectividad de Redes', 6)
insert into materias values('IFE-1026', 1, 'Tópicos de Base de Datos', 5)
insert into materias values('SID-1304', 1, 'Tecnologías Innovadoras', 5)
insert into materias values('ACA-0910', 1, 'Taller de Investigación II', 4)

insert into materias values('IFH-1002', 1, 'Administración de Servidores', 4)
insert into materias values('IFF-1019', 1, 'Programación en Ambiente Cliente - Servidor', 5)
insert into materias values('IFF-1016', 1, 'Inteligencia de Negocios', 5)
insert into materias values('IFD-1023', 1, 'Taller de Emprendedores', 5)
insert into materias values('SID-1302', 1, 'Sistemas Embebidos', 5)
insert into materias values('IFF-1012', 1, 'Estrategias de Gestión de Servicios de TI', 4)

insert into materias values('IFH-1007', 1, 'Auditoria Informática', 4)
insert into materias values('IFC-2011', 1, 'Desarrollo de Aplicaciones para Dispositivos Móviles', 5)
insert into materias values('SID-1301', 1, 'Comercio Electrónico', 5)
insert into materias values('SID-1303', 1, 'Seguridad en Infraestructura en Tecnologías de la Información', 5)
insert into materias values('SID-1305', 1, 'Proyecto Integrador de Tecnologías de Información', 5)
select * from materias

create table grupos(
	grupo nvarchar(10) not null,
	_active numeric(1,0) not null,
	divison varchar(5) not null,
	periodoEscolar nvarchar(10) not null,
	semestre numeric(2,0),
	turno nvarchar(2) not null,
	claveMateria nvarchar(10) not null,
	lunes nvarchar(20),
	martes nvarchar(20),
	miercoles nvarchar(20),
	jueves nvarchar(20),
	viernes nvarchar(20),
	sabado nvarchar(20)
)
insert into grupos values('201M', 1, 'IINFO', '2018-1', 1, 'M', 'ACC-0905', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('201M', 1, 'IINFO', '2018-1', 1, 'M', 'AEF-1041', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('201M', 1, 'IINFO', '2018-1', 1, 'M', 'IFF-1019', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('201M', 1, 'IINFO', '2018-1', 1, 'M', 'IFE-1004', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('201M', 1, 'IINFO', '2018-1', 1, 'M', 'ACF-0901', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('201M', 1, 'IINFO', '2018-1', 1, 'M', 'AEC-1085', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('201M', 1, 'IINFO', '2018-1', 1, 'M', 'ACA-0907', NULL, NULL, NULL, NULL, NULL, NULL)

insert into grupos values('1021M', 1, 'ITICS', '2018-1', 1, 'M', 'ACF-0901', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('1021M', 1, 'ITICS', '2018-1', 1, 'M', 'AEF-1032', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('1021M', 1, 'ITICS', '2018-1', 1, 'M', 'TIF-1019', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('1021M', 1, 'ITICS', '2018-1', 1, 'M', 'TIP-1017', NULL, NULL, NULL, NULL, NULL, NULL)
insert into grupos values('1021M', 1, 'ITICS', '2018-1', 1, 'M', 'ACC-0906', NULL, NULL, NULL, NULL, NULL, NULL)
select * from grupos

create table jefesDeDivision(
	[ID o MATRICULA] nvarchar(20) not null,
	_active numeric(1,0) not null,
	nombre varchar(200) not null,
	tel1 numeric(10,0) not null,
	tel2 numeric(10,0),
	mail1 nvarchar(100) not null,
	mail2 nvarchar(100),
	rfc nvarchar(100),
	divison varchar(5)not null unique,
)
insert into jefesDeDivision values('A-14250201', 1, 'MEE. Verónica Cruz Olivares', '5500000000', null, 'infotics@tesci.edu.mx', null, 'CUOV000000000', 'IINFO')
select * from jefesDeDivision

create table estadisticasDivision(
	divison varchar(5)not null,
	periodoEscolar nvarchar(10) not null,
	totalHombres numeric(6,0),				-- grafica 1 
	totalMujeres numeric(6,0),				-- grafica 1
	totalIngresados numeric(6,0),			-- grafica 2 periodo actual vs periodo anterior
	totalEgresados numeric(6,0),			-- grafica 3 periodo actual vs periodo anterior
	totalDesertores numeric(6,0),			-- grafica 4 periodo actual vs periodo anterior
	totalAlumnosActivos numeric(6,0),		-- solo porcentaje
	totalRegulares numeric(6,0),			-- grafica 5 y porcentaje
	totalIrregulares numeric(6,0),			-- grafica 5 y porcentaje
	totalRecursando numeric(6,0),			-- grafica 5 y porcentaje
	totalEspeciales numeric(6,0),			-- grafica 5 y porcentaje
	totalComplementariasLib numeric(6,0),	-- solo porcentaje
	totalServicioLib numeric(6,0),			-- solo porcentaje
	totalResidenciasLib numeric(6,0),		-- solo porcentaje
	totalSistemaDual numeric(6,0),			-- solo porcentaje
	totalConvalidacion numeric(6,0)			-- solo porcentaje
)
insert into estadisticasDivision values('IINFO', '2018-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null)
select * from estadisticasDivision

create table docentes(
	[ID o MATRICULA] nvarchar(20) not null,
	_active numeric(1,0) not null,
	nombre varchar(200) not null,
	tel1 numeric(10,0) not null,
	tel2 numeric(10,0),
	mail1 nvarchar(100) not null,
	mail2 nvarchar(100),
	rfc nvarchar(100)
)
insert into docentes values('A-14250202', 1, 'Génesis Merari Esqueda Tovar', 5500000000, null, 'gemerari@tesci.edu.mx', null, 'ESTG950125000')
select * from docentes

create table asignacionDocentes(
	[ID o MATRICULA] nvarchar(20) not null,
	periodoEscolar nvarchar(10) not null,
	divison varchar(5)not null,
	claveMateria nvarchar(10) not null,
	grupo nvarchar(10) not null,
)
insert into asignacionDocentes values('A-14250202', '2018-1', 'IINFO', '201M', 'IFF-1019')
insert into asignacionDocentes values('A-14250202', '2018-1', 'IINFO', '201M', 'IFE-1004')
select * from asignacionDocentes

create table alumnos(
	[ID o MATRICULA] nvarchar(20) not null unique,
	_active numeric(1,0) not null,
	aPaterno varchar(100) not null,
	aMaterno varchar(100) not null,
	nombre varchar(100) not null,
	sexo varchar(2) not null,
	curp nvarchar(100) not null,
	rfc nvarchar(100),
	fechaNacimiento date not null,
	tel1 numeric(10,0) not null,
	tel2 numeric(10,0),
	mail1 nvarchar(100) not null,
	mail2 nvarchar(100),
	dir_calle nvarchar(500) not null,
	dir_noExt nvarchar(500) not null,
	dir_noInt nvarchar(500) not null,
	dir_colonia varchar(200) not null,
	dir_delegMunici varchar(200) not null,
	dir_edo varchar(200) not null,
	dir_cp numeric(6) not null,
	trabaja_sn numeric(1,0) not null,
	padreOmadre_sn numeric(1,0) not null,
	enfermedadCronica_sn numeric(1,0) not null,
	enfermedadCronica_cual nvarchar(max),
	sistemaDual_sn numeric(1,0) not null,
	sistemaDual_empresa nvarchar(200),
	historialAcademico nvarchar(20) not null,
)
insert into alumnos values(
'153109022', 1, 'García', 'Trejo', 'Michelle Ulises', 'H', 'GATM920211HMCRC09', 'GATM920211633', convert(date,'11/02/1992',103), 5519000933, null, 'michelle@auxwave.mx', null,
'Av. Iztaciihuatl', 'Sector 132 A', 'Depto. 101', 'Infonavit Norte', 'Cuautitlán Izcalli', 'Edo. de México', 54720, 1, 0, 0, null, 0, null, '153109022'
)
select * from alumnos

/*
	ESTATUS

	0 - SIN INSCRIBIR
	1 - EN CURSO
	3 - RECURSANDO
	4 - APROBADA
	5 - NA 1
	6 - NA 2
	7 - ESPECIAL
	8 - ESPECIAL NA
*/

create table historialAcademico(
	[ID o MATRICULA] nvarchar(20) not null,
	periodoEscolar nvarchar(10) not null,
	semestre numeric(2,0),
	grupo nvarchar(10) not null,
	claveMateria nvarchar(10) not null unique,
	calificacion numeric(3,2) not null,
	estatus numeric (1,0) not null,
	observaciones nvarchar(max)
)
insert into  historialAcademico values('153109022', '2018-1', 1, '201M', 'ACC-0905', 0, '1', null)
insert into  historialAcademico values('153109022', '2018-1', 1, '201M', 'AEF-1041', 0, '1', null)
insert into  historialAcademico values('153109022', '2018-1', 1, '201M', 'ACF-0901', 0, '1', null)
select * from historialAcademico

create table banderasAlumnos(
	[Estandar de semestres cursados] numeric(2,0),
	[Maximo de semestres cursados] numeric(2,0),
	[Maximo de recurses por materia] numeric(2,0),
	[Total creditos complementarios] numeric(2,0),
	[Minimo niveles de ingles] numeric(2,0),
)
insert into banderasAlumnos values(9, 12, 3, 5, 10)
select * from banderasAlumnos



