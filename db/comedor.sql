-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2019 a las 20:03:36
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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comedor`
--
ALTER TABLE `comedor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comedor`
--
ALTER TABLE `comedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
