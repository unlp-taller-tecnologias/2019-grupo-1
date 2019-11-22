-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2019 a las 21:56:17
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `red_comedores`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimento`
--

CREATE TABLE `alimento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alimento`
--

INSERT INTO `alimento` (`id`, `nombre`) VALUES
(1, 'tira de asado'),
(2, 'papa'),
(3, 'sopa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimento_xreg`
--

CREATE TABLE `alimento_xreg` (
  `id` int(11) NOT NULL,
  `registro_id` int(11) NOT NULL,
  `alimento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alimento_xreg`
--

INSERT INTO `alimento_xreg` (`id`, `registro_id`, `alimento_id`) VALUES
(11, 8, 1),
(12, 8, 2),
(13, 9, 1),
(14, 9, 2),
(15, 10, 3),
(16, 11, 1),
(17, 11, 3),
(18, 12, 2),
(19, 12, 3),
(20, 13, 1),
(21, 13, 2),
(22, 13, 3),
(23, 14, 1),
(24, 14, 2),
(25, 14, 3),
(26, 15, 1),
(27, 15, 2),
(28, 15, 3),
(29, 16, 2),
(30, 16, 3),
(31, 17, 1),
(32, 17, 2),
(33, 17, 3),
(34, 18, 1),
(35, 18, 2),
(36, 18, 3),
(40, 20, 1),
(41, 20, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comedor`
--

CREATE TABLE `comedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organizacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `red_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_yhorario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comedor`
--

INSERT INTO `comedor` (`id`, `nombre`, `direccion`, `descripcion`, `organizacion`, `foto`, `estado`, `telefono`, `red_social`, `latitud`, `longitud`, `dia_yhorario`) VALUES
(3, 'comedor1', '123', 'Lorem ipsum dolor sit amet consectetur adipiscing elit sed velit vehicula mus aliquam porttitor, ultricies bibendum tempor egestas odio risus eleifend lectus neque cursus est.', 'ninguna', '', '1', '1234678456456456', 'facebook', '-34.92915780546703', '-57.944258586549864', 'martes 18:00'),
(7, 'com2', 'aaca', '', 'com2', '', '1', '', 'viernes 18:00', '-34.92501471420279', '-57.954511500258114', ''),
(8, 'com4', '1234', '', '', '', '1', '', 'hoy 20:00', '-34.976959740168844', '-57.982151299774294', ''),
(9, 'comedor piola', 'gh', '', '', '', '1', '', 'lunes 20:00', '-34.92369521446426', '-57.954940852777625', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comedor_usuario`
--

CREATE TABLE `comedor_usuario` (
  `id` int(11) NOT NULL,
  `comedor_id` int(11) NOT NULL,
  `referente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comedor_usuario`
--

INSERT INTO `comedor_usuario` (`id`, `comedor_id`, `referente_id`) VALUES
(1, 3, 10),
(2, 7, 11),
(3, 8, 12),
(4, 9, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_evento` date NOT NULL,
  `horario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_e` int(11) NOT NULL DEFAULT 0 COMMENT '1 eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `usuario_id`, `fecha`, `titulo`, `descripcion`, `fecha_evento`, `horario`, `estado_e`) VALUES
(1, 1, '2019-11-12', 'Bienvenida', 'comenzamos actividades', '2019-11-25', '18:00', 0),
(2, 3, '2019-11-01', 'Cumple', 'Festejamos el cumple de este maravilloso lugar', '2019-12-01', '20:30', 0),
(7, 11, '2019-11-13', 'ggg', 'muchas ggg', '2019-11-25', '23:30', 0),
(8, 11, '2019-11-12', 'hacer ruido', 'estamos invitados a tomar el te', '2019-12-12', '14:15', 0),
(9, 1, '2019-11-13', 'Hola de nuevo', 'recalculando', '2019-11-25', '16:00', 0),
(10, 1, '2019-11-13', 'Venta de boludeces', 'eso...', '2019-12-24', '14:15', 1),
(11, 1, '2019-11-13', 'nada', 'nadadnadnadnadnadnand', '2019-11-29', '23:30', 0),
(12, 3, '2019-11-13', 'adada', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2019-11-28', '12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `necesidad`
--

CREATE TABLE `necesidad` (
  `id` int(11) NOT NULL,
  `tipo_necesidad_id` int(11) NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `necesidad`
--

INSERT INTO `necesidad` (`id`, `tipo_necesidad_id`, `estado`, `descripcion`, `comedor_id`) VALUES
(1, 1, 'No resuelta', 'aaaa', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_n` int(11) NOT NULL DEFAULT 0 COMMENT '1 eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`id`, `fecha`, `titulo`, `descripcion`, `foto`, `estado_n`) VALUES
(1, '2019-11-13', 'SOS', 'eso.... nada', '12', 1),
(2, '2019-11-13', 'bla bla', 'aaaaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhhhh', 'bla', 1),
(3, '2019-11-13', 'borrame!', 'no te borro nada', '223', 1),
(4, '2019-11-13', 'Nuevamnete', 'escribi mal todo :o', 's', 1),
(5, '2019-11-13', 'qwe', 'qwe', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_alimentacion`
--

CREATE TABLE `registro_alimentacion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `asistentes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario_comida` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_comedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `registro_alimentacion`
--

INSERT INTO `registro_alimentacion` (`id`, `fecha`, `asistentes`, `observaciones`, `horario_comida`, `id_comedor`) VALUES
(4, '2019-11-27', '123', 'edsaa<ddasasdsasa', 'almuerzo', 2),
(8, '2019-11-17', '51', '12', 'Desayuno', 9),
(9, '2019-11-18', '12', '2121', 'Desayuno', 8),
(10, '2019-11-30', '12', '1212', 'Merienda', 7),
(11, '2019-11-20', '12', '21', 'Merienda', 9),
(12, '2019-12-28', '1212', '1221', 'Almuerzo', 8),
(13, '2019-11-14', '12', 'sda', 'Almuerzo', 8),
(14, '2019-11-28', '12', '2121', 'Almuerzo', 8),
(15, '2019-11-18', '21', 'dsa', 'Desayuno', 9),
(16, '2019-11-27', '12', '2121', 'Cena', 7),
(17, '2019-11-18', '122112', '2121', 'Desayuno', 9),
(18, '2019-11-12', '2121', '2121', 'Desayuno', 9),
(20, '2019-11-21', '1221', '122121', 'Cena', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitio`
--

CREATE TABLE `sitio` (
  `id` int(11) NOT NULL,
  `cant_paginado` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `nosotros` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sitio`
--

INSERT INTO `sitio` (`id`, `cant_paginado`, `estado`, `facebook`, `twitter`, `instagram`, `nosotros`) VALUES
(1, 10, 1, 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.instagram.com', 'dsads');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_necesidad`
--

CREATE TABLE `tipo_necesidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_necesidad`
--

INSERT INTO `tipo_necesidad` (`id`, `nombre`) VALUES
(1, 'agua'),
(2, 'plata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre_u` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_u` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_u` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_u`, `apellido`, `mail_u`, `password`, `user_name`, `descripcion`, `foto`, `telefono`, `estado_u`, `privado`, `rol`) VALUES
(1, 'admin', 'asd', 'as', 'admin', 'admin', 'asd', 'asd', 'asd', '1', '0', '3'),
(2, 'Mirta', 'asd', 'asd', 'asd', 'mirta', '1', 'C:\\xampp\\tmp\\phpC833.tmp', 'asd', '1', '0', '0'),
(3, 'Fran', 'asd', 'adsas', '12345678', 'fran', 'nhbgf', 'C:\\xampp\\tmp\\php6432.tmp', 'asd', '1', '0', '0'),
(4, 'Rodolfo', 'a', 'a@gmail.com', '1', 'rodo', 'asdas', '', '12312', '1', '0', '0'),
(5, 'Prueba', 'z', 'a@gmail.com', 'z', 'Prueba', 'das', 'listado_eventos.png', '1', '1', '0', '0'),
(6, 'Ana', 'q', '1@gmail.com', '1', 'ana', 'asd', '', '1', '1', '0', '0'),
(7, 'Candela', '1', '1@gmail.com', '1', 'cande', 'aa', '', '1', '2', '0', '0'),
(9, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '', '', '1', '', ''),
(10, 'Hola', 'as', 'asd@asdf.com', '1234', 'hola', 'as', 'none', '13123123', '1', '0', '1'),
(11, 'hola', 'hla', 'hol@hola.com', '12345678', 'com2', '', 'none', '1234', '1', '0', '1'),
(12, 'Comedor4', 'q', 'hol@hola.com', '12345678', 'com4', '', 'none', '12', '1', '0', '1'),
(13, 'Comedor5', '1', 'hol@hola.com', '12345678', 'com5', '', 'none', '1', '3', '0', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimento`
--
ALTER TABLE `alimento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alimento_xreg`
--
ALTER TABLE `alimento_xreg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_44387B3639C50FAE` (`registro_id`),
  ADD KEY `IDX_44387B36974F2E6F` (`alimento_id`);

--
-- Indices de la tabla `comedor`
--
ALTER TABLE `comedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8A4C69C718D196BD` (`comedor_id`),
  ADD KEY `IDX_8A4C69C7C485953B` (`referente_id`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_47860B05DB38439E` (`usuario_id`);

--
-- Indices de la tabla `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `necesidad`
--
ALTER TABLE `necesidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_897F961B22C09619` (`tipo_necesidad_id`),
  ADD KEY `IDX_897F961B18D196BD` (`comedor_id`);

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_alimentacion`
--
ALTER TABLE `registro_alimentacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sitio`
--
ALTER TABLE `sitio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_necesidad`
--
ALTER TABLE `tipo_necesidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimento`
--
ALTER TABLE `alimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `alimento_xreg`
--
ALTER TABLE `alimento_xreg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `comedor`
--
ALTER TABLE `comedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `necesidad`
--
ALTER TABLE `necesidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `registro_alimentacion`
--
ALTER TABLE `registro_alimentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `sitio`
--
ALTER TABLE `sitio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_necesidad`
--
ALTER TABLE `tipo_necesidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimento_xreg`
--
ALTER TABLE `alimento_xreg`
  ADD CONSTRAINT `FK_44387B3639C50FAE` FOREIGN KEY (`registro_id`) REFERENCES `registro_alimentacion` (`id`),
  ADD CONSTRAINT `FK_44387B36974F2E6F` FOREIGN KEY (`alimento_id`) REFERENCES `alimento` (`id`);

--
-- Filtros para la tabla `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  ADD CONSTRAINT `FK_8A4C69C718D196BD` FOREIGN KEY (`comedor_id`) REFERENCES `comedor` (`id`),
  ADD CONSTRAINT `FK_8A4C69C7C485953B` FOREIGN KEY (`referente_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `FK_47860B05DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `necesidad`
--
ALTER TABLE `necesidad`
  ADD CONSTRAINT `FK_897F961B18D196BD` FOREIGN KEY (`comedor_id`) REFERENCES `comedor` (`id`),
  ADD CONSTRAINT `FK_897F961B22C09619` FOREIGN KEY (`tipo_necesidad_id`) REFERENCES `tipo_necesidad` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
