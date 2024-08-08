-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-08-2024 a las 23:41:41
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

INSERT INTO `calificaciones` (`id_asignatura`, `id_estudiante`, `tareas`, `examenes`, `participacion`, `asistencia`, `cali_final`) VALUES
(1, 1, 25, 25, 25, 25, 0),
(2, 2, 20, 18, 23, 25, 0),
(3, 3, 18, 23, 15, 20, 0),
(4, 4, 23, 24, 25, 22, 0),
(5, 5, 25, 23, 25, 22, 0),
(6, 6, 21, 19, 16, 24, 0),
(7, 7, 25, 25, 25, 25, 0),
(8, 8, 21, 22, 25, 25, 0),
(9, 9, 16, 22, 19, 20, 0);

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
  `completivo` int(3) DEFAULT NULL,
  `extraordinario` int(3) DEFAULT NULL,
  `final` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `calificacion_final`
--

INSERT INTO `calificacion_final` (`id_asignatura`, `id_estudiante`, `primer_periodo`, `segundo_periodo`, `tecer_periodo`, `cuarto-periodo`, `completivo`, `extraordinario`, `final`) VALUES
(1, 2, 80, 80, 80, 80, NULL, NULL, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(5) NOT NULL,
  `id_profesor` int(5) NOT NULL,
  `nivel` varchar(10) COLLATE utf32_spanish2_ci NOT NULL,
  `total_estudiante` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `id_profesor`, `nivel`, `total_estudiante`) VALUES
(1, 5, '1ro Bachil', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(5) NOT NULL,
  `nombre_estudiante` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `apellidop_estudiante` varchar(30) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `apellidom_estudiante` varchar(30) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `sexo_estudinate` varchar(9) COLLATE utf32_spanish2_ci NOT NULL,
  `nacimiento_estudiante` date NOT NULL,
  `id_curso` int(5) NOT NULL,
  `Id_profesor` int(5) NOT NULL,
  `id_seccion` int(5) NOT NULL,
  `id_tutor` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre_estudiante`, `apellidop_estudiante`, `apellidom_estudiante`, `sexo_estudinate`, `nacimiento_estudiante`, `id_curso`, `Id_profesor`, `id_seccion`, `id_tutor`) VALUES
(1, 'Faury', 'García', 'Rodríguez', 'Masculino', '2004-09-17', 1, 1, 0, 2),
(2, 'Jose Miguel', 'Bello', 'Acosta', 'Masculino', '2003-09-04', 2, 1, 0, 4),
(3, 'Jose Miguel', 'Reyes', '', 'Masculino', '1996-11-08', 3, 1, 0, 5),
(4, 'Massiel', 'Rodriguez', 'Rodriguez', 'Femenino', '2004-01-04', 1, 2, 0, 8),
(5, 'Manuel De Jesus', 'Diaz', 'Diaz', 'Masculino', '1999-01-13', 2, 3, 0, 6),
(6, 'Albiery', 'Rodriguez', 'Almonte', 'Masculino', '2004-08-19', 3, 2, 0, 1),
(7, 'Smailyn', 'Gutiérrez', 'Burgos', 'Femenino', '2003-03-04', 1, 3, 0, 9),
(8, 'Gissel Esmeralda', 'Velez', 'Cruz', 'Femenino', '1999-09-27', 2, 4, 0, 3),
(9, 'Marilin', 'Gil', 'Paulino', 'Femenino', '2005-01-28', 3, 4, 0, 7),
(10, 'Tiara', 'Peña', 'Peña', 'Femenino', '2003-12-11', 0, 5, 0, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(5) NOT NULL,
  `id_asignatura` int(5) NOT NULL,
  `nombre` blob,
  `apellidos` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula` char(13) COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `id_asignatura`, `nombre`, `apellidos`, `fecha_nacimiento`, `correo`, `telefono`, `cedula`, `direccion`) VALUES
(1, 3, 0x4564756172646f2052616661656c, 'Rodríguez Domínguez', '1968-08-02', 'eduardo@gmail.com', '8294195674', '046-0024666-6', 'Los Llanos de La Herradura, Calle A, #30'),
(2, 1, 0x48616e7969204765727369, 'Castillo', '1990-08-16', 'hanyigc@gmail.com', '829-633-5649', '130-6575967-6', 'Los Castillos, #21'),
(3, 5, 0x4a6f7365204c756973204d616e75656c, 'Alonzo', '1953-12-06', 'profjosealonzo@gmail.com', '829-55-6545', '046-2285963-6', 'Padre de Las Casas #30'),
(4, 6, 0x527564647973, 'Ferreras', '1950-12-10', 'ruddysf@gmail.com', '849-578-8489', '046-2596451-2', 'Villa Olímpica, Calle principal #2'),
(5, 7, 0x41706f6c696e6172, 'Rivas Genao', '1960-04-15', 'apolinar@gmail.com', '829-565-3215', '130-5426315-6', 'La Barranquita, Avenida Olímpica, #12'),
(6, 4, 0x4a6f7365, 'De La Cruz', '1950-01-16', 'delacruz@gmail.com', '849-424-2424', '046-5526321-6', 'Las Colinas #05'),
(7, 2, 0x4661757374696e61, 'Rodriguez', '1979-05-04', 'fausrodriguez@gmail.com', '849-478-9863', '130-1548963-9', 'Los Jardines #40');

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
(10, 'Yohan', 'Perez', '40259634518', '8092219494', '8092219494', 'Estudiante', 'Amigo', 'Los Padros\r\nCalle 5 de Abril\r\n# 14\r\nSantiago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(5) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `usuario` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_roles` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `usuario`, `id_roles`) VALUES
(1, 'Jose Miguel', 'Reyes', 'P00001', 2),
(2, 'Alexander', 'Salaman', 'E00001', 3),
(3, 'Jose Miguel', 'Acosta', 'A00001', 1);

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
  ADD PRIMARY KEY (`id_asignatura`),
  ADD KEY `id_estudiante` (`id_estudiante`);

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
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `Id_profesor` (`id_profesor`),
  ADD KEY `id_nivel` (`nivel`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `id_curso` (`id_curso`,`Id_profesor`),
  ADD KEY `id_tutor` (`id_tutor`),
  ADD KEY `Id_profesor` (`Id_profesor`),
  ADD KEY `id_seccion` (`id_seccion`);

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
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id_tutor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `calificaciones` (`id_asignatura`);

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Filtros para la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  ADD CONSTRAINT `calificacion_final_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `calificacion_final_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`),
  ADD CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`),
  ADD CONSTRAINT `cursos_ibfk_5` FOREIGN KEY (`id_curso`) REFERENCES `estudiante` (`id_curso`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`),
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`Id_profesor`) REFERENCES `profesores` (`id_profesor`);

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
