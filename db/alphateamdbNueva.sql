-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2024 a las 23:41:36
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
  `id_asignatura` int(5) NOT NULL,
  `id_profesor` int(5) NOT NULL,
  `nom_asignatura` char(60) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `id_profesor`, `nom_asignatura`) VALUES
(1, 0, 'Lengua Española'),
(2, 0, 'Matemáticas'),
(3, 0, 'Ciencias Sociales'),
(4, 0, 'Ciencias Naturales'),
(5, 0, 'Física'),
(6, 0, 'Educación Financiera'),
(7, 0, 'Inglés');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificaciones` int(5) NOT NULL,
  `id_asignatura` int(5) NOT NULL,
  `id_estudiante` int(5) NOT NULL,
  `tareas` int(2) NOT NULL,
  `examenes` int(2) NOT NULL,
  `participacion` int(2) NOT NULL,
  `asistencia` int(2) NOT NULL,
  `cali_final` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id_calificaciones`, `id_asignatura`, `id_estudiante`, `tareas`, `examenes`, `participacion`, `asistencia`, `cali_final`) VALUES
(1, 1, 1, 0, 0, 0, 0, 0),
(2, 2, 1, 0, 0, 0, 0, 0),
(3, 3, 1, 0, 0, 0, 0, 0),
(4, 4, 1, 0, 0, 0, 0, 0),
(5, 5, 1, 0, 0, 0, 0, 0),
(6, 6, 1, 0, 0, 0, 0, 0),
(7, 7, 1, 0, 0, 0, 0, 0),
(8, 1, 2, 0, 0, 0, 0, 0),
(9, 2, 2, 0, 0, 0, 0, 0),
(11, 3, 2, 0, 0, 0, 0, 0),
(12, 4, 2, 0, 0, 0, 0, 0),
(13, 5, 2, 0, 0, 0, 0, 0),
(14, 6, 2, 0, 0, 0, 0, 0),
(15, 7, 2, 0, 0, 0, 0, 0),
(16, 1, 3, 0, 0, 0, 0, 0),
(17, 2, 3, 0, 0, 0, 0, 0),
(18, 3, 3, 0, 0, 0, 0, 0),
(19, 4, 3, 0, 0, 0, 0, 0),
(20, 5, 3, 0, 0, 0, 0, 0),
(21, 6, 3, 0, 0, 0, 0, 0),
(22, 7, 3, 0, 0, 0, 0, 0),
(23, 1, 4, 0, 0, 0, 0, 0),
(24, 2, 4, 0, 0, 0, 0, 0),
(25, 3, 4, 0, 0, 0, 0, 0),
(26, 4, 4, 0, 0, 0, 0, 0),
(27, 5, 4, 0, 0, 0, 0, 0),
(28, 6, 4, 0, 0, 0, 0, 0),
(29, 7, 4, 0, 0, 0, 0, 0),
(30, 1, 5, 0, 0, 0, 0, 0),
(31, 2, 5, 0, 0, 0, 0, 0),
(32, 3, 5, 0, 0, 0, 0, 0),
(33, 4, 5, 0, 0, 0, 0, 0),
(34, 5, 5, 0, 0, 0, 0, 0),
(35, 6, 5, 0, 0, 0, 0, 0),
(36, 7, 5, 0, 0, 0, 0, 0),
(37, 1, 6, 0, 0, 0, 0, 0),
(38, 2, 6, 0, 0, 0, 0, 0),
(39, 3, 6, 0, 0, 0, 0, 0),
(40, 4, 6, 0, 0, 0, 0, 0),
(41, 5, 6, 0, 0, 0, 0, 0),
(42, 6, 6, 0, 0, 0, 0, 0),
(43, 7, 6, 0, 0, 0, 0, 0),
(44, 1, 7, 0, 0, 0, 0, 0),
(45, 2, 7, 0, 0, 0, 0, 0),
(46, 3, 7, 0, 0, 0, 0, 0),
(47, 4, 7, 0, 0, 0, 0, 0),
(48, 5, 7, 0, 0, 0, 0, 0),
(49, 6, 7, 0, 0, 0, 0, 0),
(50, 7, 7, 0, 0, 0, 0, 0),
(51, 1, 8, 0, 0, 0, 0, 0),
(52, 2, 8, 0, 0, 0, 0, 0),
(53, 3, 8, 0, 0, 0, 0, 0),
(54, 4, 8, 0, 0, 0, 0, 0),
(55, 5, 8, 0, 0, 0, 0, 0),
(56, 6, 8, 0, 0, 0, 0, 0),
(57, 7, 8, 0, 0, 0, 0, 0),
(58, 1, 9, 0, 0, 0, 0, 0),
(59, 2, 9, 0, 0, 0, 0, 0),
(60, 3, 9, 0, 0, 0, 0, 0),
(61, 4, 9, 0, 0, 0, 0, 0),
(62, 5, 9, 0, 0, 0, 0, 0),
(63, 6, 9, 0, 0, 0, 0, 0),
(64, 7, 9, 0, 0, 0, 0, 0),
(65, 1, 10, 0, 0, 0, 0, 0),
(66, 2, 10, 0, 0, 0, 0, 0),
(67, 3, 10, 0, 0, 0, 0, 0),
(68, 4, 10, 0, 0, 0, 0, 0),
(69, 5, 10, 0, 0, 0, 0, 0),
(70, 6, 10, 0, 0, 0, 0, 0),
(71, 7, 10, 0, 0, 0, 0, 0),
(72, 1, 11, 0, 0, 0, 0, 0),
(73, 2, 11, 0, 0, 0, 0, 0),
(74, 3, 11, 0, 0, 0, 0, 0),
(75, 4, 11, 0, 0, 0, 0, 0),
(76, 5, 11, 0, 0, 0, 0, 0),
(77, 6, 11, 0, 0, 0, 0, 0),
(78, 7, 11, 0, 0, 0, 0, 0),
(79, 1, 12, 0, 0, 0, 0, 0),
(80, 2, 12, 0, 0, 0, 0, 0),
(81, 3, 12, 0, 0, 0, 0, 0),
(82, 4, 12, 0, 0, 0, 0, 0),
(83, 5, 12, 0, 0, 0, 0, 0),
(84, 6, 12, 0, 0, 0, 0, 0),
(85, 7, 12, 0, 0, 0, 0, 0),
(86, 1, 13, 0, 0, 0, 0, 0),
(87, 2, 13, 0, 0, 0, 0, 0),
(88, 3, 13, 0, 0, 0, 0, 0),
(89, 4, 13, 0, 0, 0, 0, 0),
(90, 5, 13, 0, 0, 0, 0, 0),
(91, 6, 13, 0, 0, 0, 0, 0),
(92, 7, 13, 0, 0, 0, 0, 0),
(93, 1, 14, 0, 0, 0, 0, 0),
(94, 2, 14, 0, 0, 0, 0, 0),
(95, 3, 14, 0, 0, 0, 0, 0),
(96, 4, 14, 0, 0, 0, 0, 0),
(97, 5, 14, 0, 0, 0, 0, 0),
(98, 6, 14, 0, 0, 0, 0, 0),
(99, 7, 14, 0, 0, 0, 0, 0),
(100, 1, 15, 0, 0, 0, 0, 0),
(101, 2, 15, 0, 0, 0, 0, 0),
(102, 3, 15, 0, 0, 0, 0, 0),
(103, 4, 15, 0, 0, 0, 0, 0),
(104, 5, 15, 0, 0, 0, 0, 0),
(105, 6, 15, 0, 0, 0, 0, 0),
(106, 7, 15, 0, 0, 0, 0, 0),
(107, 1, 16, 0, 0, 0, 0, 0),
(108, 2, 16, 0, 0, 0, 0, 0),
(109, 3, 16, 0, 0, 0, 0, 0),
(110, 4, 16, 0, 0, 0, 0, 0),
(111, 5, 16, 0, 0, 0, 0, 0),
(112, 6, 16, 0, 0, 0, 0, 0),
(113, 7, 16, 0, 0, 0, 0, 0),
(114, 1, 17, 0, 0, 0, 0, 0),
(115, 2, 17, 0, 0, 0, 0, 0),
(116, 3, 17, 0, 0, 0, 0, 0),
(117, 4, 17, 0, 0, 0, 0, 0),
(118, 5, 17, 0, 0, 0, 0, 0),
(119, 6, 17, 0, 0, 0, 0, 0),
(120, 7, 17, 0, 0, 0, 0, 0),
(121, 1, 18, 0, 0, 0, 0, 0),
(122, 2, 18, 0, 0, 0, 0, 0),
(123, 3, 18, 0, 0, 0, 0, 0),
(124, 4, 18, 0, 0, 0, 0, 0),
(125, 5, 18, 0, 0, 0, 0, 0),
(126, 6, 18, 0, 0, 0, 0, 0),
(127, 7, 18, 0, 0, 0, 0, 0),
(128, 1, 19, 0, 0, 0, 0, 0),
(129, 2, 19, 0, 0, 0, 0, 0),
(130, 3, 19, 0, 0, 0, 0, 0),
(131, 4, 19, 0, 0, 0, 0, 0),
(132, 5, 19, 0, 0, 0, 0, 0),
(133, 6, 19, 0, 0, 0, 0, 0),
(134, 7, 19, 0, 0, 0, 0, 0),
(135, 1, 20, 0, 0, 0, 0, 0),
(136, 2, 20, 0, 0, 0, 0, 0),
(137, 3, 20, 0, 0, 0, 0, 0),
(138, 4, 20, 0, 0, 0, 0, 0),
(139, 5, 20, 0, 0, 0, 0, 0),
(140, 6, 20, 0, 0, 0, 0, 0),
(141, 7, 20, 0, 0, 0, 0, 0),
(142, 1, 21, 0, 0, 0, 0, 0),
(143, 2, 21, 0, 0, 0, 0, 0),
(144, 3, 21, 0, 0, 0, 0, 0),
(145, 4, 21, 0, 0, 0, 0, 0),
(146, 5, 21, 0, 0, 0, 0, 0),
(147, 6, 21, 0, 0, 0, 0, 0),
(148, 7, 21, 0, 0, 0, 0, 0),
(149, 1, 22, 0, 0, 0, 0, 0),
(150, 2, 22, 0, 0, 0, 0, 0),
(151, 3, 22, 0, 0, 0, 0, 0),
(152, 4, 22, 0, 0, 0, 0, 0),
(153, 5, 22, 0, 0, 0, 0, 0),
(154, 6, 22, 0, 0, 0, 0, 0),
(155, 7, 22, 0, 0, 0, 0, 0),
(156, 1, 23, 0, 0, 0, 0, 0),
(157, 2, 23, 0, 0, 0, 0, 0),
(158, 3, 23, 0, 0, 0, 0, 0),
(159, 4, 23, 0, 0, 0, 0, 0),
(160, 5, 23, 0, 0, 0, 0, 0),
(161, 6, 23, 0, 0, 0, 0, 0),
(162, 7, 23, 0, 0, 0, 0, 0),
(163, 1, 24, 0, 0, 0, 0, 0),
(164, 2, 24, 0, 0, 0, 0, 0),
(165, 3, 24, 0, 0, 0, 0, 0),
(166, 4, 24, 0, 0, 0, 0, 0),
(167, 5, 24, 0, 0, 0, 0, 0),
(168, 6, 24, 0, 0, 0, 0, 0),
(169, 7, 24, 0, 0, 0, 0, 0),
(170, 1, 25, 0, 0, 0, 0, 0),
(171, 2, 25, 0, 0, 0, 0, 0),
(172, 3, 25, 0, 0, 0, 0, 0),
(173, 4, 25, 0, 0, 0, 0, 0),
(174, 5, 25, 0, 0, 0, 0, 0),
(175, 6, 25, 0, 0, 0, 0, 0),
(176, 7, 25, 0, 0, 0, 0, 0),
(177, 1, 26, 0, 0, 0, 0, 0),
(178, 2, 26, 0, 0, 0, 0, 0),
(179, 3, 26, 0, 0, 0, 0, 0),
(180, 4, 26, 0, 0, 0, 0, 0),
(181, 5, 26, 0, 0, 0, 0, 0),
(182, 6, 26, 0, 0, 0, 0, 0),
(183, 7, 26, 0, 0, 0, 0, 0),
(184, 1, 27, 0, 0, 0, 0, 0),
(185, 2, 27, 0, 0, 0, 0, 0),
(186, 3, 27, 0, 0, 0, 0, 0),
(187, 4, 27, 0, 0, 0, 0, 0),
(188, 5, 27, 0, 0, 0, 0, 0),
(189, 6, 27, 0, 0, 0, 0, 0),
(190, 7, 27, 0, 0, 0, 0, 0),
(191, 1, 28, 0, 0, 0, 0, 0),
(192, 2, 28, 0, 0, 0, 0, 0),
(193, 3, 28, 0, 0, 0, 0, 0),
(194, 4, 28, 0, 0, 0, 0, 0),
(195, 5, 28, 0, 0, 0, 0, 0),
(196, 6, 28, 0, 0, 0, 0, 0),
(197, 7, 28, 0, 0, 0, 0, 0),
(198, 1, 29, 0, 0, 0, 0, 0),
(199, 2, 29, 0, 0, 0, 0, 0),
(200, 3, 29, 0, 0, 0, 0, 0),
(201, 4, 29, 0, 0, 0, 0, 0),
(202, 5, 29, 0, 0, 0, 0, 0),
(203, 6, 29, 0, 0, 0, 0, 0),
(204, 7, 29, 0, 0, 0, 0, 0),
(205, 1, 30, 0, 0, 0, 0, 0),
(206, 2, 30, 0, 0, 0, 0, 0),
(207, 3, 30, 0, 0, 0, 0, 0),
(208, 4, 30, 0, 0, 0, 0, 0),
(209, 5, 30, 0, 0, 0, 0, 0),
(210, 6, 30, 0, 0, 0, 0, 0),
(211, 7, 30, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_final`
--

CREATE TABLE `calificacion_final` (
  `id_asignatura` int(5) NOT NULL,
  `id_estudiante` int(5) NOT NULL,
  `primer_periodo` int(3) NOT NULL,
  `segundo_periodo` int(3) NOT NULL,
  `tercer_periodo` int(3) NOT NULL,
  `cuarto_periodo` int(3) NOT NULL,
  `completivo` int(3) DEFAULT NULL,
  `extraordinario` int(3) DEFAULT NULL,
  `final` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `calificacion_final`
--

INSERT INTO `calificacion_final` (`id_asignatura`, `id_estudiante`, `primer_periodo`, `segundo_periodo`, `tercer_periodo`, `cuarto_periodo`, `completivo`, `extraordinario`, `final`) VALUES
(1, 2, 80, 80, 80, 80, NULL, NULL, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(5) NOT NULL,
  `nivel` varchar(20) NOT NULL,
  `total_est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nivel`, `total_est`) VALUES
(1, '1ro Bachiller', 5),
(2, '2do Bachiller', 5),
(3, '3ro Bachiller', 5),
(4, '4to Bachiller', 5),
(5, '5to Bachiller', 5),
(6, '6to Bachiller', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `id_dias` int(5) NOT NULL,
  `dias` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`id_dias`, `dias`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miércoles'),
(4, 'Jueves'),
(5, 'Viernes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `e_Matricula`, `nombre_estudiante`, `apellidos`, `sexo_estudiante`, `nacimiento_estudiante`, `id_curso`, `id_profesor`, `id_tutor`) VALUES
(1, 'e-00001', 'Faury', 'García Rodríguez', 'Masculino', '2004-09-17', 4, 4, 2),
(2, 'e-00002', 'Jose Miguel', 'Bello Acosta', 'Masculino', '2003-09-04', 4, 4, 4),
(3, 'e-00003', 'Jose Miguel', 'Reyes', 'Masculino', '1996-11-08', 4, 4, 5),
(4, 'e-00004', 'Massiel', 'Rodriguez Rodríguez', 'Femenino', '2004-01-04', 4, 4, 8),
(5, 'e-00005', 'Manuel De Jesus', 'Díaz Díaz', 'Masculino', '1999-01-13', 4, 4, 6),
(6, 'e-00006', 'Albiery', 'Rodriguez Almonte', 'Masculino', '2004-08-19', 5, 5, 1),
(7, 'e-00007', 'Smailyn', 'Gutiérrez Burgos', 'Femenino', '2003-03-04', 5, 5, 9),
(8, 'e-00008', 'Gissel Esmeralda', 'Velez Cruz', 'Femenino', '1999-09-27', 5, 5, 3),
(9, 'e-00009', 'Marilin', 'Gil Paulino', 'Femenino', '2005-01-28', 5, 5, 7),
(10, 'e-00010', 'Tiara', 'Peña Rodríguez', 'Femenino', '2003-12-11', 5, 5, 12),
(11, 'e-00011', 'Ana', 'Martínez', 'Femenino', '2001-03-15', 6, 6, 11),
(12, 'e-00012', 'Luis', 'García', 'Masculino', '1999-06-21', 1, 1, 13),
(13, 'e-00013', 'Marta', 'Fernández', 'Femenino', '2000-08-30', 6, 6, 15),
(14, 'e-00014', 'Carlos', 'López', 'Masculino', '2002-11-05', 6, 6, 18),
(15, 'e-00015', 'Sofía', 'Gómez', 'Femenino', '2003-12-18', 6, 6, 20),
(16, 'e-00016', 'Jorge', 'Sánchez', 'Masculino', '1998-02-25', 2, 2, 22),
(17, 'e-00017', 'Laura', 'Martínez', 'Femenino', '2004-04-10', 2, 2, 25),
(18, 'e-00018', 'Pedro', 'Ramírez', 'Masculino', '2002-07-22', 2, 2, 27),
(19, 'e-00019', 'Isabel', 'Hernández', 'Femenino', '2001-09-14', 2, 2, 29),
(20, 'e-00020', 'Felipe', 'Morales', 'Masculino', '2000-10-30', 2, 2, 30),
(21, 'e-00021', 'Catalina', 'Cano', 'Femenino', '2003-01-05', 3, 3, 21),
(22, 'e-00022', 'Antonio', 'Gómez', 'Masculino', '2002-03-18', 3, 3, 23),
(23, 'e-00023', 'Elena', 'Castro', 'Femenino', '1999-05-27', 3, 3, 24),
(24, 'e-00024', 'Alejandro', 'Ramírez', 'Masculino', '2000-07-15', 3, 3, 26),
(25, 'e-00025', 'Patricia', 'Mendoza', 'Femenino', '2001-09-04', 3, 3, 28),
(26, 'e-00026', 'Manuel', 'Serrano', 'Masculino', '1999-02-20', 1, 1, 10),
(27, 'e-00027', 'Victoria', 'Álvarez', 'Femenino', '2000-04-25', 1, 1, 14),
(28, 'e-00028', 'Julio', 'Paredes', 'Masculino', '2001-06-30', 1, 1, 16),
(29, 'e-00029', 'Natalia', 'Mora', 'Femenino', '2003-08-15', 1, 1, 17),
(30, 'e-00030', 'Diego', 'Velasco', 'Masculino', '2002-10-12', 6, 6, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora`
--

CREATE TABLE `hora` (
  `id_hora` int(5) NOT NULL,
  `hora` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hora`
--

INSERT INTO `hora` (`id_hora`, `hora`) VALUES
(1, '8:00-8:45 AM'),
(2, '8:45-9:50 AM'),
(3, '9:50-10:20 AM'),
(4, '10:20-11:05 AM'),
(5, '11:05-12:00 PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(5) NOT NULL,
  `id_profesor` int(5) NOT NULL,
  `id_curso` int(5) NOT NULL,
  `id_asignatura` int(5) NOT NULL,
  `id_hora` int(5) NOT NULL,
  `id_dias` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planificacion`
--

CREATE TABLE `planificacion` (
  `id_planificacion` int(5) NOT NULL,
  `id_curso` int(5) NOT NULL,
  `periodo` int(11) NOT NULL,
  `archivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(5) NOT NULL,
  `id_asignatura` int(5) NOT NULL,
  `nombre` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula` char(13) COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen_perfil` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `id_asignatura`, `nombre`, `apellidos`, `fecha_nacimiento`, `correo`, `telefono`, `cedula`, `direccion`, `imagen_perfil`) VALUES
(1, 3, 'Eduardo Rafael', 'Rodríguez Domínguez', '1968-08-02', 'eduardo@gmail.com', '8294195674', '046-0024666-6', 'Los Llanos de La Herradura, Calle A, #30', 0x30),
(2, 1, 'Hanyi Gersi', 'Castillo', '1990-08-16', 'hanyigc@gmail.com', '829-633-5649', '130-6575967-6', 'Los Castillos, #21', 0x30),
(3, 5, 'Jose Luis Manuel', 'Alonzo', '1953-12-06', 'profjosealonzo@gmail.com', '829-55-6545', '046-2285963-6', 'Padre de Las Casas #30', 0x30),
(4, 6, 'Ruddys', 'Ferreras', '1950-12-10', 'ruddysf@gmail.com', '849-578-8489', '046-2596451-2', 'Villa Olímpica, Calle principal #2', 0x30),
(5, 7, 'Apolinar', 'Rivas Genao', '1960-04-15', 'apolinar@gmail.com', '829-565-3215', '130-5426315-6', 'La Barranquita, Avenida Olímpica, #12', 0x30),
(6, 4, 'Jose', 'De La Cruz', '1950-01-16', 'delacruz@gmail.com', '849-424-2424', '046-5526321-6', 'Las Colinas #05', 0x30),
(7, 2, 'Faustina', 'Rodriguez', '1979-05-04', 'fausrodriguez@gmail.com', '849-478-9863', '130-1548963-9', 'Los Jardines #40', 0x30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(5) NOT NULL,
  `tipo_rol` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `tipo_rol`) VALUES
(1, 'administrador'),
(2, 'profesor'),
(3, 'estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `id_tutor` int(5) NOT NULL,
  `nombre` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula` char(13) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `correo` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ocupacion` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `parentesco` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`id_tutor`, `nombre`, `apellidos`, `cedula`, `telefono`, `correo`, `ocupacion`, `parentesco`, `direccion`) VALUES
(1, 'Fior', 'Almonte', '04600246644', '8294199874', 'fior@gmail.com', 'Empleada', 'Madre', 'Los Ciruelitos\r\nCalle Principal\r\n# 2\r\nSantiago'),
(2, 'Eridania', 'Rodríguez', '40285964536', '8299658756', 'eridania@gmail.com', 'Licenciada en Contabilidad', 'Madre', 'La Joya\r\nCalle 16 Agosto\r\n# 36\r\nSantiago'),
(3, 'Yenny', 'Cruz', '13054568968', '8292215636', 'yenny@gmail.com', 'Empleada', 'Madre', 'La Herradura\r\nCalle 30 de Marzo\r\n# 7\r\nSantiagp'),
(4, 'Margarita', 'Acosta', '40296385218', '8498592526', 'margarita@gmail.com', 'Estadistica en Hospital', 'Madre', 'Castañuela\r\nCalle 20 de Junio\r\n# 22\r\nMonteCristi'),
(5, 'Sonia ', 'Reyes', '13045015295', '8498592529', 'sonia@gmail.com', 'Empleada', 'Madre', 'Villa Progreso\r\nCalle Principal\r\n# 15\r\nSantiago'),
(6, 'Adela De Jesus', 'Diaz Trinidad', '40214155106', '8295596936', 'adelad@gmail.com', 'Ama de casa', 'Madre', 'La Herradura\r\nCalle 26 de Febrero\r\n# 15\r\nSantiago'),
(7, 'Maria', 'Paulino', '40275848596', '8095465712', 'maria@gmail.com', 'Empleada', 'Madre', 'Licey\r\nCalle Borojoy\r\n# 15\r\nSantiago'),
(8, 'Eduardo ', 'Rodriguez', '04600246666', '8294195674', 'eduardor@gmail.com', 'Profesor', 'Padre', 'Los Llanos de La Herradura\r\nCalle A\r\n# 30\r\nSantiago'),
(9, 'Angelica', 'Burgos', '04621565623', '8295467521', 'angelica@gmail.com', 'Ama de Casa', 'Madre', 'Licey\r\nCalle Pinguito\r\n# 4\r\nSantiago'),
(10, 'Yohan', 'Perez', '40259634518', '8092219494', '8092219494', 'Estudiante', 'Amigo', 'Los Padros\r\nCalle 5 de Abril\r\n# 14\r\nSantiago'),
(11, 'Dolores', 'Perez', '40235363788', '8095693656', 'dolores@gmail.com', 'Asistente de Limpieza', 'Madre', 'Callejon de Pepa, La ceibita, Santiago.'),
(12, 'Maria', 'Vargas', '13056895468', '8495687452', 'mariav@gmail.com', 'Profesora', 'Madre', 'Jaibon, La Caya #20'),
(13, 'Maria Elena', 'Moran', '13056897456', '8295468596', 'mariae@gmail.com', 'Ama de casa', 'Madre', 'Calle Belisario Curiel, #10, Pueblo Nuevo.'),
(14, 'Liberato', 'Angeles', '13047852631', '8495263145', 'liberato@gmail.com', 'Medico', 'Padre', 'La Colinas, #20 '),
(15, 'Juan', 'Pérez', '12345678', '555-1234', 'juan.perez@example.com', 'Abogado', 'Padre', 'Calle Falsa 123, Ciudad'),
(16, 'María', 'González', '87654321', '555-5678', 'maria.gonzalez@example.com', 'Médica', 'Madre', 'Avenida Siempre Viva 456, Ciudad'),
(17, 'Pedro', 'Martínez', '13579246', '555-2468', 'pedro.martinez@example.com', 'Ingeniero', 'Tío', 'Calle del Sol 789, Ciudad'),
(18, 'Laura', 'Fernández', '24681357', '555-1357', 'laura.fernandez@example.com', 'Profesora', 'Tía', 'Calle del Lago 321, Ciudad'),
(19, 'Carlos', 'Ruiz', '35791324', '555-8642', 'carlos.ruiz@example.com', 'Empresario', 'Hermano', 'Calle de la Luna 654, Ciudad'),
(20, 'Ana', 'Romero', '46802468', '555-9753', 'ana.romero@example.com', 'Enfermera', 'Madre', 'Calle de la Flor 987, Ciudad'),
(21, 'Luis', 'García', '11122333', '555-0001', 'luis.garcia@example.com', 'Contador', 'Padre', 'Calle de los Pinos 123, Ciudad'),
(22, 'Sofía', 'Martínez', '44455666', '555-0002', 'sofia.martinez@example.com', 'Diseñadora', 'Madre', 'Avenida del Mar 456, Ciudad'),
(23, 'Jorge', 'Sánchez', '77788999', '555-0003', 'jorge.sanchez@example.com', 'Arquitecto', 'Tío', 'Calle de la Esperanza 789, Ciudad'),
(24, 'Patricia', 'Mendoza', '10111213', '555-0004', 'patricia.mendoza@example.com', 'Abogada', 'Tía', 'Calle de la Niebla 321, Ciudad'),
(25, 'Felipe', 'Morales', '14151617', '555-0005', 'felipe.morales@example.com', 'Ingeniero', 'Hermano', 'Calle del Río 654, Ciudad'),
(26, 'Catalina', 'Cano', '18192021', '555-0006', 'catalina.cano@example.com', 'Enfermera', 'Hermana', 'Calle de la Luna 987, Ciudad'),
(27, 'Alejandro', 'Ramírez', '22232425', '555-0007', 'alejandro.ramirez@example.com', 'Médico', 'Tío', 'Calle del Viento 123, Ciudad'),
(28, 'Isabel', 'Castro', '26272829', '555-0008', 'isabel.castro@example.com', 'Profesor', 'Tía', 'Calle de la Nube 456, Ciudad'),
(29, 'Antonio', 'Gómez', '30313233', '555-0009', 'antonio.gomez@example.com', 'Contador', 'Padre', 'Calle de la Estrella 789, Ciudad'),
(30, 'Elena', 'Hernández', '34353637', '555-0010', 'elena.hernandez@example.com', 'Psicóloga', 'Madre', 'Calle de la Luna 321, Ciudad'),
(31, 'Jose', 'Miguel Reyes', '40225601414', '8296459649', 'josemiguelreyes03@gmail.com', 'primaria', 'contador', 'Villa Progreso La Herrdura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(5) NOT NULL,
  `matricula_usuario` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_roles` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `matricula_usuario`, `id_roles`) VALUES
(1, 'P00001', 2),
(2, 'E00001', 3),
(3, 'A00001', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificaciones`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`id_dias`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `id_curso` (`id_profesor`),
  ADD KEY `id_tutor` (`id_tutor`),
  ADD KEY `Id_profesor` (`id_profesor`),
  ADD KEY `id_curso_2` (`id_curso`);

--
-- Indices de la tabla `hora`
--
ALTER TABLE `hora`
  ADD PRIMARY KEY (`id_hora`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_hora` (`id_hora`),
  ADD KEY `id_dias` (`id_dias`);

--
-- Indices de la tabla `planificacion`
--
ALTER TABLE `planificacion`
  ADD PRIMARY KEY (`id_planificacion`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_tutor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_roles` (`id_roles`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificaciones` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT de la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `dias`
--
ALTER TABLE `dias`
  MODIFY `id_dias` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `hora`
--
ALTER TABLE `hora`
  MODIFY `id_hora` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planificacion`
--
ALTER TABLE `planificacion`
  MODIFY `id_planificacion` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id_tutor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `calificaciones` (`id_calificaciones`);

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`);

--
-- Filtros para la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  ADD CONSTRAINT `calificacion_final_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `calificacion_final_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`),
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`),
  ADD CONSTRAINT `estudiante_ibfk_4` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `estudiante_ibfk_5` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_hora`) REFERENCES `hora` (`id_hora`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`),
  ADD CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `horario_ibfk_4` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `horario_ibfk_5` FOREIGN KEY (`id_dias`) REFERENCES `dias` (`id_dias`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
