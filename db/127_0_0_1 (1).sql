-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 23:36:41
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
-- Base de datos: `alfa`
--
CREATE DATABASE IF NOT EXISTS `alfa` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `alfa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(11) NOT NULL,
  `nom_asignatura` char(60) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nom_asignatura`) VALUES
(1, 'Lengua Española'),
(2, 'Matemáticas'),
(3, 'Ciencias Sociales'),
(4, 'Ciencias Naturales'),
(5, 'Física'),
(6, 'Educación Financiera'),
(7, 'Inglés');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(5) NOT NULL,
  `Id_profesor` int(5) NOT NULL,
  `nivel` varchar(20) COLLATE utf32_spanish2_ci NOT NULL,
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
  `apellidop_estudiante` varchar(30) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `apellidom_estudiante` varchar(30) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `sexo_estudinate` varchar(9) COLLATE utf32_spanish2_ci NOT NULL,
  `nacimiento_estudiante` date NOT NULL,
  `id_curso` int(5) NOT NULL,
  `Id_profesor` int(5) NOT NULL,
  `seccion` char(1) COLLATE utf32_spanish2_ci NOT NULL,
  `id_tutor` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre_estudiante`, `apellidop_estudiante`, `apellidom_estudiante`, `sexo_estudinate`, `nacimiento_estudiante`, `id_curso`, `Id_profesor`, `seccion`, `id_tutor`) VALUES
(1, 'Faury', 'García', 'Rodríguez', 'Masculino', '2004-09-17', 0, 0, '', 2),
(2, 'Jose Miguel', 'Bello', 'Acosta', 'Masculino', '2003-09-04', 0, 0, '', 4),
(3, 'Jose Miguel', 'Reyes', '', 'Masculino', '1996-11-08', 0, 0, '', 5),
(4, 'Massiel', 'Rodriguez', 'Rodriguez', 'Femenino', '2004-01-04', 0, 0, '', 8),
(5, 'Manuel De Jesus', 'Diaz', 'Diaz', 'Masculino', '1999-01-13', 0, 0, '', 6),
(6, 'Albiery', 'Rodriguez', 'Almonte', 'Masculino', '2004-08-19', 0, 0, '', 1),
(7, 'Smailyn', 'Gutiérrez', 'Burgos', 'Femenino', '2003-03-04', 0, 0, '', 9),
(8, 'Gissel Esmeralda', 'Velez', 'Cruz', 'Femenino', '1999-09-27', 0, 0, '', 3),
(9, 'Marilin', 'Gil', 'Paulino', 'Femenino', '2005-01-28', 0, 0, '', 7),
(10, 'Tiara', 'Peña', 'Peña', 'Femenino', '2003-12-11', 0, 0, '', 10);

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
  `direccion` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `id_asignatura`, `nombre`, `apellidos`, `fecha_nacimiento`, `correo`, `telefono`, `cedula`, `direccion`) VALUES
(1, 3, 'Eduardo Rafael', 'Rodríguez Domínguez', '1968-08-02', 'eduardo@gmail.com', '8294195674', '046-0024666-6', 'Los Llanos de La Herradura, Calle A, #30'),
(2, 1, 'Hanyi Gersi', 'Castillo', '1990-08-16', 'hanyigc@gmail.com', '829-633-5649', '130-6575967-6', 'Los Castillos, #21'),
(3, 5, 'Jose Luis Manuel', 'Alonzo', '1953-12-06', 'profjosealonzo@gmail.com', '829-55-6545', '046-2285963-6', 'Padre de Las Casas #30'),
(4, 6, 'Ruddys', 'Ferreras', '1950-12-10', 'ruddysf@gmail.com', '849-578-8489', '046-2596451-2', 'Villa Olímpica, Calle principal #2'),
(5, 7, 'Apolinar', 'Rivas Genao', '1960-04-15', 'apolinar@gmail.com', '829-565-3215', '130-5426315-6', 'La Barranquita, Avenida Olímpica, #12'),
(6, 4, 'Jose', 'De La Cruz', '1950-01-16', 'delacruz@gmail.com', '849-424-2424', '046-5526321-6', 'Las Colinas #05'),
(7, 2, 'Faustina', 'Rodriguez', '1979-05-04', 'fausrodriguez@gmail.com', '849-478-9863', '130-1548963-9', 'Los Jardines #40');

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
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `id_roles` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `usuario`, `id_roles`) VALUES
(1, 'Jose Miguel', 'Acosta', 'P00001', 2),
(2, 'Alexander', 'Salaman', 'E00001', 3);

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
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`);

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
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id_usuario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de datos: `jajaja`
--
CREATE DATABASE IF NOT EXISTS `jajaja` DEFAULT CHARACTER SET utf16 COLLATE utf16_spanish2_ci;
USE `jajaja`;
--
-- Base de datos: `jajaja2`
--
CREATE DATABASE IF NOT EXISTS `jajaja2` DEFAULT CHARACTER SET utf32 COLLATE utf32_spanish2_ci;
USE `jajaja2`;

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
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"alfa\",\"table\":\"usuarios\"},{\"db\":\"alfa\",\"table\":\"roles\"},{\"db\":\"alfa\",\"table\":\"tutor\"},{\"db\":\"alfa\",\"table\":\"profesores\"},{\"db\":\"alfa\",\"table\":\"cursos\"},{\"db\":\"alfa\",\"table\":\"calificaciones\"},{\"db\":\"alfa\",\"table\":\"estudiante\"},{\"db\":\"jajaja2\",\"table\":\"cursos\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-06-20 21:27:57', '{\"lang\":\"es\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
