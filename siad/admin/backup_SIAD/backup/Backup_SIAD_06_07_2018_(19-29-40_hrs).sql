SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS siad;

USE siad;

DROP TABLE IF EXISTS asignaciones;

CREATE TABLE `asignaciones` (
  `idAsignacion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `idDocente` int(11) NOT NULL,
  `idAsignatura` int(11) NOT NULL,
  `idGrupo` int(11) NOT NULL,
  `idTurno` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  `Estado` varchar(11) NOT NULL,
  `NumeroAsignacion` int(11) NOT NULL,
  PRIMARY KEY (`idAsignacion`),
  KEY `idDocente` (`idDocente`),
  KEY `idAsignatura` (`idAsignatura`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idTurno` (`idTurno`),
  KEY `idHorario` (`idHorario`),
  CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`),
  CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`),
  CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `asignaciones_ibfk_4` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`idTurno`),
  CONSTRAINT `asignaciones_ibfk_5` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO asignaciones VALUES("1","AsignaciÃ³n de BD al Profesor Elier","1","1","1","1","1","1","11");
INSERT INTO asignaciones VALUES("2","Asignacion de Programacion al Profesor Nelton","2","2","1","1","1","1","13");



DROP TABLE IF EXISTS asignaturas;

CREATE TABLE `asignaturas` (
  `idAsignatura` int(11) NOT NULL AUTO_INCREMENT,
  `NombreAsignatura` varchar(50) NOT NULL,
  `Idcarrera` int(11) NOT NULL,
  `IdGrupo` int(11) NOT NULL,
  `Idcuatrimestre` int(11) NOT NULL,
  PRIMARY KEY (`idAsignatura`),
  KEY `Idcarrera` (`Idcarrera`),
  KEY `IdGrupo` (`IdGrupo`),
  KEY `Idcuatrimestre` (`Idcuatrimestre`),
  CONSTRAINT `asignaturas_ibfk_1` FOREIGN KEY (`Idcarrera`) REFERENCES `carreras` (`idCarrera`),
  CONSTRAINT `asignaturas_ibfk_2` FOREIGN KEY (`IdGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `asignaturas_ibfk_3` FOREIGN KEY (`Idcuatrimestre`) REFERENCES `cuatrimestres` (`idCuatrimestre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO asignaturas VALUES("1","Base de Datos I","1","1","1");
INSERT INTO asignaturas VALUES("2","Programacion I","1","1","1");



DROP TABLE IF EXISTS carreras;

CREATE TABLE `carreras` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCarrera` varchar(50) NOT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO carreras VALUES("1","Ingenieria de Sistemas");
INSERT INTO carreras VALUES("2","Ingenieria Agroindustrial");
INSERT INTO carreras VALUES("3","Ingenieria Civil");



DROP TABLE IF EXISTS cuatrimestres;

CREATE TABLE `cuatrimestres` (
  `idCuatrimestre` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCuatrimestre` varchar(50) NOT NULL,
  PRIMARY KEY (`idCuatrimestre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO cuatrimestres VALUES("1","Semestre I");
INSERT INTO cuatrimestres VALUES("2","Semestre II");



DROP TABLE IF EXISTS docentes;

CREATE TABLE `docentes` (
  `idDocente` int(11) NOT NULL AUTO_INCREMENT,
  `NombresDocente` varchar(50) NOT NULL,
  `ApellidosDocente` varchar(50) NOT NULL,
  `CedulaDocente` varchar(16) NOT NULL,
  `CorreoDocente` varchar(50) NOT NULL,
  `CelularDocente` varchar(8) NOT NULL,
  `TelefonoDocente` varchar(8) NOT NULL,
  `DireccionDocente` varchar(250) NOT NULL,
  `Estado` int(1) NOT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDocente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO docentes VALUES("1","Elier Javier","Solano","362-040489-0000W","elier.aries@gmail.com","84076105","84076105","Ciudad de Juigalpa\nCamoapa, Boaco","1","images/fotos_perfil/perfil.jpg");
INSERT INTO docentes VALUES("2","Nelton Rocha","Solano","362-040489-0000W","neltonelcerebro@gmail.com","84076105","84459500","Ciudad de Juigalpa\nCamoapa, Boaco","1","images/fotos_perfil/perfil.jpg");



DROP TABLE IF EXISTS entrega_tareas;

CREATE TABLE `entrega_tareas` (
  `idEntregaTareas` int(11) NOT NULL AUTO_INCREMENT,
  `CodigoTareaDocente` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `idAsignatura` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `CodigoEnvioTarea` int(11) NOT NULL,
  `Archivo` varchar(200) NOT NULL,
  `FechaEntrega` date DEFAULT NULL,
  PRIMARY KEY (`idEntregaTareas`),
  KEY `idEstudiante` (`idEstudiante`),
  KEY `idAsignatura` (`idAsignatura`),
  CONSTRAINT `entrega_tareas_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`idEstudiante`),
  CONSTRAINT `entrega_tareas_ibfk_2` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS estudiantes;

CREATE TABLE `estudiantes` (
  `idEstudiante` int(11) NOT NULL AUTO_INCREMENT,
  `CarnetEstudiante` varchar(10) NOT NULL,
  `NombresEstudiante` varchar(50) NOT NULL,
  `ApellidosEstudiante` varchar(50) NOT NULL,
  `CedulaEstudiante` varchar(16) NOT NULL,
  `CorreoEstudiante` varchar(50) NOT NULL,
  `CelularEstudiante` varchar(8) NOT NULL,
  `TelefonoEstudiante` varchar(8) NOT NULL,
  `DireccionEstudiante` varchar(250) NOT NULL,
  `Estado` int(1) NOT NULL,
  `IdGrupo` int(11) DEFAULT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `IdGrupo` (`IdGrupo`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`IdGrupo`) REFERENCES `grupos` (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO estudiantes VALUES("1","2012-0345J","Juan Perez","Roa","128-034549-0000L","Juanperez@gmail.com","88456798","25123456","Ciudad de Juigalpa\nCamoapa, Boaco","1","1","images/fotos_perfil/perfil.jpg");
INSERT INTO estudiantes VALUES("2","2012-0995J","Hector","Mairena","128-034549-0000L","hector34@gmail.com","87653212","25432112","Ciudad de Juigalpa\nCamoapa, Boaco","1","2","images/fotos_perfil/perfil.jpg");
INSERT INTO estudiantes VALUES("3","2012-0995J","Maria Jose","Garcia","128-034549-0000L","maria@gmail.com","84076105","84076105","Ciudad de Juigalpa\nCamoapa, Boaco","1","2","images/fotos_perfil/perfil.jpg");



DROP TABLE IF EXISTS evaluaciones;

CREATE TABLE `evaluaciones` (
  `idEvaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `idAsignatura` int(11) NOT NULL,
  `Unidad` varchar(50) NOT NULL,
  `Tarea` varchar(50) NOT NULL,
  `idDocente` int(11) NOT NULL,
  `Puntaje` int(11) NOT NULL,
  `FechaEvaluacion` date NOT NULL,
  PRIMARY KEY (`idEvaluacion`),
  KEY `idDocente` (`idDocente`),
  KEY `idEstudiante` (`idEstudiante`),
  KEY `idAsignatura` (`idAsignatura`),
  CONSTRAINT `evaluaciones_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`),
  CONSTRAINT `evaluaciones_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`idEstudiante`),
  CONSTRAINT `evaluaciones_ibfk_3` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS grupos;

CREATE TABLE `grupos` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroGrupo` varchar(50) NOT NULL,
  `NombreGrupo` varchar(50) NOT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO grupos VALUES("1","1M1-IS","Primer AÃ±o de Sistemas Diario");
INSERT INTO grupos VALUES("2","3T1-IS","Tercer AÃ±o Vespertino");



DROP TABLE IF EXISTS horarios;

CREATE TABLE `horarios` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `NombreHorario` varchar(50) NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO horarios VALUES("1","07:00 AM - 08:40 AM");
INSERT INTO horarios VALUES("2","08:45 AM - 10:25 AM");



DROP TABLE IF EXISTS inscripciones_asignaturas;

CREATE TABLE `inscripciones_asignaturas` (
  `idInscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `idCarrera` int(11) NOT NULL,
  `idAsignatura` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `fechaInscripcion` date NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idInscripcion`),
  KEY `idCarrera` (`idCarrera`),
  KEY `idAsignatura` (`idAsignatura`),
  KEY `idEstudiante` (`idEstudiante`),
  CONSTRAINT `inscripciones_asignaturas_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`),
  CONSTRAINT `inscripciones_asignaturas_ibfk_2` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`),
  CONSTRAINT `inscripciones_asignaturas_ibfk_3` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`idEstudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO inscripciones_asignaturas VALUES("1","1","1","2","2018-07-06","Ninguna");
INSERT INTO inscripciones_asignaturas VALUES("2","1","2","2","2018-07-06","Ninguna");



DROP TABLE IF EXISTS material_didactico;

CREATE TABLE `material_didactico` (
  `idMaterialDidactico` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(200) NOT NULL,
  `Archivo` varchar(200) NOT NULL,
  `CodigoMaterial` int(11) NOT NULL,
  `Fecha_subida` date DEFAULT NULL,
  `idNumeroAsignacion` int(11) NOT NULL,
  `idDocente` int(11) NOT NULL,
  PRIMARY KEY (`idMaterialDidactico`),
  KEY `idNumeroAsignacion` (`idNumeroAsignacion`),
  KEY `idDocente` (`idDocente`),
  CONSTRAINT `material_didactico_ibfk_1` FOREIGN KEY (`idNumeroAsignacion`) REFERENCES `numeros_asignaciones` (`idNumeroAsignacion`),
  CONSTRAINT `material_didactico_ibfk_2` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS mensajes;

CREATE TABLE `mensajes` (
  `idMensaje` int(11) NOT NULL AUTO_INCREMENT,
  `Remitente` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `Mensaje` varchar(500) NOT NULL,
  `FechaEnvio` date DEFAULT NULL,
  PRIMARY KEY (`idMensaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS niveles;

CREATE TABLE `niveles` (
  `idNivel` int(11) NOT NULL AUTO_INCREMENT,
  `NombreNivel` varchar(50) NOT NULL,
  PRIMARY KEY (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO niveles VALUES("1","Administrador");
INSERT INTO niveles VALUES("2","Docente");
INSERT INTO niveles VALUES("3","Estudiante");



DROP TABLE IF EXISTS numeros_asignaciones;

CREATE TABLE `numeros_asignaciones` (
  `idNumeroAsignacion` int(11) NOT NULL AUTO_INCREMENT,
  `numeroAsignado` int(11) NOT NULL,
  `IdDocente` int(11) NOT NULL,
  PRIMARY KEY (`idNumeroAsignacion`),
  KEY `IdDocente` (`IdDocente`),
  CONSTRAINT `numeros_asignaciones_ibfk_1` FOREIGN KEY (`IdDocente`) REFERENCES `docentes` (`idDocente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO numeros_asignaciones VALUES("1","1","1");
INSERT INTO numeros_asignaciones VALUES("2","2","2");



DROP TABLE IF EXISTS plan_estudio;

CREATE TABLE `plan_estudio` (
  `idPlan` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `CantidadAsignaturas` int(11) NOT NULL,
  PRIMARY KEY (`idPlan`),
  KEY `idCarrera` (`idCarrera`),
  CONSTRAINT `plan_estudio_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO plan_estudio VALUES("1","Plan 2015","1","56");
INSERT INTO plan_estudio VALUES("2","Plan 2005","1","54");



DROP TABLE IF EXISTS planificacion_tareas;

CREATE TABLE `planificacion_tareas` (
  `idPlanificacion` int(11) NOT NULL AUTO_INCREMENT,
  `idDocente` int(11) NOT NULL,
  `idNumeroAsignacion` int(11) NOT NULL,
  `idAsignatura` int(11) NOT NULL,
  `Unidad` varchar(50) NOT NULL,
  `DescripcionUnidad` varchar(200) NOT NULL,
  `Tarea` varchar(50) NOT NULL,
  `DescripcionTarea` varchar(200) NOT NULL,
  `FechaPublicacion` date NOT NULL,
  `FechaPresentacion` date NOT NULL,
  `CodigoTarea` int(11) NOT NULL,
  PRIMARY KEY (`idPlanificacion`),
  KEY `idDocente` (`idDocente`),
  KEY `idNumeroAsignacion` (`idNumeroAsignacion`),
  KEY `idAsignatura` (`idAsignatura`),
  CONSTRAINT `planificacion_tareas_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`),
  CONSTRAINT `planificacion_tareas_ibfk_2` FOREIGN KEY (`idNumeroAsignacion`) REFERENCES `numeros_asignaciones` (`idNumeroAsignacion`),
  CONSTRAINT `planificacion_tareas_ibfk_3` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS turnos;

CREATE TABLE `turnos` (
  `idTurno` int(11) NOT NULL AUTO_INCREMENT,
  `NombreTurno` varchar(50) NOT NULL,
  PRIMARY KEY (`idTurno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO turnos VALUES("1","Matutino");
INSERT INTO turnos VALUES("2","Vespertino");



DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `idUsuario` smallint(6) NOT NULL AUTO_INCREMENT,
  `NombreUsuario` varchar(50) NOT NULL,
  `PassUsuario` varchar(150) NOT NULL,
  `NivelUsuario` int(11) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `NivelUsuario` (`NivelUsuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`NivelUsuario`) REFERENCES `niveles` (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO usuarios VALUES("1","elier","elier123","1","12","");
INSERT INTO usuarios VALUES("2","elier.aries@gmail.com","362-040489-0000W","2","1","");
INSERT INTO usuarios VALUES("3","neltonelcerebro@gmail.com","362-040489-0000W","2","2","");
INSERT INTO usuarios VALUES("4","Juanperez@gmail.com","128-034549-0000L","3","1","");
INSERT INTO usuarios VALUES("5","hector34@gmail.com","128-034549-0000L","3","2","");
INSERT INTO usuarios VALUES("6","maria@gmail.com","128-034549-0000L","3","3","");



DROP TABLE IF EXISTS years_academicos;

CREATE TABLE `years_academicos` (
  `idYearAcademico` int(11) NOT NULL AUTO_INCREMENT,
  `NombreYear` varchar(50) NOT NULL,
  PRIMARY KEY (`idYearAcademico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO years_academicos VALUES("1","2018");
INSERT INTO years_academicos VALUES("2","2017");



SET FOREIGN_KEY_CHECKS=1;