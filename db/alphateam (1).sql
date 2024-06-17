-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2024 a las 23:46:33
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alphateam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(11) NOT NULL,
  `nom_asignatura` char(60) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_asignatura` int(5) NOT NULL,
  `tareas` int(2) NOT NULL,
  `examenes` int(2) NOT NULL,
  `participacion` int(2) NOT NULL,
  `asistencia` int(2) NOT NULL,
  `cali_final` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_final`
--

CREATE TABLE `calificacion_final` (
  `id_asignatura` int(5) NOT NULL,
  `id_estudiante` int(5) NOT NULL,
  `primer_periodo` int(3) NOT NULL,
  `segundo_periodo` int(3) NOT NULL,
  `tecer_periodo` int(3) NOT NULL,
  `cuarto-periodo` int(3) NOT NULL,
  `completivo` int(3) NOT NULL,
  `extraordinario` int(3) NOT NULL,
  `final` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(5) NOT NULL,
  `Id_profesor` int(5) NOT NULL,
  `nivel` char(2) COLLATE utf32_spanish2_ci NOT NULL,
  `seccion` char(1) COLLATE utf32_spanish2_ci NOT NULL,
  `total_estudiante` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(5) NOT NULL,
  `nombre_estudiante` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `apellidop_estudiante` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `apellidom_estudiante` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `sexo_estudinate` varchar(9) COLLATE utf32_spanish2_ci NOT NULL,
  `nacimiento_estudiante` date NOT NULL,
  `id_curso` int(5) NOT NULL,
  `Id_profesor` int(5) NOT NULL,
  `seccion` char(1) COLLATE utf32_spanish2_ci NOT NULL,
  `nombre_tutor` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `apellido_tutor` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `cedula_tutor` varchar(11) COLLATE utf32_spanish2_ci NOT NULL,
  `tel_tutor` varchar(12) COLLATE utf32_spanish2_ci NOT NULL,
  `correo_tutor` varchar(30) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `educacion_tutor` varchar(11) COLLATE utf32_spanish2_ci NOT NULL,
  `ocupacion_tutor` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `parentesco_tutor` varchar(10) COLLATE utf32_spanish2_ci NOT NULL,
  `provincia_tutor` varchar(15) COLLATE utf32_spanish2_ci NOT NULL,
  `sector_tutor` varchar(15) COLLATE utf32_spanish2_ci NOT NULL,
  `calle_tutor` varchar(15) COLLATE utf32_spanish2_ci NOT NULL,
  `edificio_tutor` varchar(15) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre_estudiante`, `apellidop_estudiante`, `apellidom_estudiante`, `sexo_estudinate`, `nacimiento_estudiante`, `id_curso`, `Id_profesor`, `seccion`, `nombre_tutor`, `apellido_tutor`, `cedula_tutor`, `tel_tutor`, `correo_tutor`, `educacion_tutor`, `ocupacion_tutor`, `parentesco_tutor`, `provincia_tutor`, `sector_tutor`, `calle_tutor`, `edificio_tutor`) VALUES
(1, 'Faury', 'García', 'Rodríguez', 'Masculino', '2004-09-17', 0, 0, '', 'Eridania', 'Rodríguez', '40285964536', '8299658756', 'eridania@gmail.com', 'Universitar', 'Licenciada en Contabilidad', 'Madre', 'Santiago', 'La Joya', '16 Agosto', '236');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
