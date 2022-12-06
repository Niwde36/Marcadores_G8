CREATE SCHEMA `marcadores_g8` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `marcadores_g8`;

CREATE TABLE `deporte` (
  `Pk_Id_Deporte` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Genero` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `equipo` (
  `Pk_Id_Equipo` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Foto` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `eventodeportivo` (
  `Pk_Id_EventoDeportivo` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Final` date DEFAULT NULL,
  `Id_Deporte` int NOT NULL,
  `Id_Equipo_Ganador` int DEFAULT NULL,
  KEY `Fk_EventoDeportivo_Deporte_idx` (`Id_Deporte`),
  KEY `Fk_EventoDeportivo_EquipoGanador_idx` (`Id_Equipo_Ganador`),
  CONSTRAINT `Fk_EventoDeportivo_Deporte` FOREIGN KEY (`Id_Deporte`) REFERENCES `deporte` (`Pk_Id_Deporte`),
  CONSTRAINT `Fk_EventoDeportivo_EquipoGanador` FOREIGN KEY (`Id_Equipo_Ganador`) REFERENCES `equipo` (`Pk_Id_Equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `encuentro` (
  `Pk_Id_Encuentro` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Fecha` date NOT NULL,
  `Id_Equipo1` int NOT NULL,
  `Marcador_Equipo1` varchar(100) NOT NULL,
  `Id_Equipo2` int DEFAULT NULL,
  `Marcador_Equipo2` varchar(100) DEFAULT NULL,
  `Id_EventoDeportivo` int NOT NULL,
  KEY `Fk_Encuentro_Equipo1_idx` (`Id_Equipo1`),
  KEY `Fk_Encuentro_Equipo2_idx` (`Id_Equipo2`),
  KEY `Fk_Encuentro_EventoDeportivo_idx` (`Id_EventoDeportivo`),
  CONSTRAINT `Fk_Encuentro_Equipo1` FOREIGN KEY (`Id_Equipo1`) REFERENCES `equipo` (`Pk_Id_Equipo`),
  CONSTRAINT `Fk_Encuentro_Equipo2` FOREIGN KEY (`Id_Equipo2`) REFERENCES `equipo` (`Pk_Id_Equipo`),
  CONSTRAINT `Fk_Encuentro_EventoDeportivo` FOREIGN KEY (`Id_EventoDeportivo`) REFERENCES `eventodeportivo` (`Pk_Id_EventoDeportivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `usuario` (
  `Pk_Id_Usuario` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(200) NOT NULL,
  `Apellidos` varchar(200) NOT NULL,
  `Correo` varchar(200) NOT NULL,
  `NombreUsuario` varchar(200) NOT NULL,
  `Contrasenia` varchar(200) NOT NULL,
  `Permisos` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `marcadores_g8`.`deporte` (`Nombre`, `Genero`) VALUES 
('Futbol', 'Masculino'),
('Baloncesto', 'Femenino');

INSERT INTO `marcadores_g8`.`equipo` (`Nombre`, `Foto`) VALUES 
('Colombia', NULL),
('España', NULL);

INSERT INTO `marcadores_g8`.`eventodeportivo` (`Nombre`, `Fecha_Inicio`, `Fecha_Final`, `Id_Deporte`) VALUES 
('Mundial 2022', '2022-11-15', '2022-12-15', '1');

INSERT INTO `marcadores_g8`.`encuentro` (`Nombre`, `Fecha`, `Id_Equipo1`, `Marcador_Equipo1`, `Id_Equipo2`, `Marcador_Equipo2`, `Id_EventoDeportivo`) VALUES 
# Colombia, España, Mundial 2022
('Seminfinal', '2022-12-10', '1', '0', '2', '1', '1');
