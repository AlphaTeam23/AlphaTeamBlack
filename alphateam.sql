-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2024 a las 20:53:39
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
  `nombre_estudinate` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `apellidop_estudiante` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `apellidom_estudiante` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `sexo_estudinate` varchar(9) COLLATE utf32_spanish2_ci NOT NULL,
  `nacimiento_estudiante` date NOT NULL,
  `id_curso` int(5) NOT NULL,
  `Id_profesor` int(5) NOT NULL,
  `seccion` char(1) COLLATE utf32_spanish2_ci NOT NULL,
  `nombre_tutor` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `apellido_tutor` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `cedula_tutor` int(11) NOT NULL,
  `tel_tutor` int(12) NOT NULL,
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
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
