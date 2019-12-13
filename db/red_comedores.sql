-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2019 at 06:11 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `red_comedores`
--

-- --------------------------------------------------------

--
-- Table structure for table `alimento`
--

CREATE TABLE `alimento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alimento_xreg`
--

CREATE TABLE `alimento_xreg` (
  `id` int(11) NOT NULL,
  `registro_id` int(11) NOT NULL,
  `alimento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comedor`
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

-- --------------------------------------------------------

--
-- Table structure for table `comedor_usuario`
--

CREATE TABLE `comedor_usuario` (
  `id` int(11) NOT NULL,
  `comedor_id` int(11) NOT NULL,
  `referente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evento`
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

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `necesidad`
--

CREATE TABLE `necesidad` (
  `id` int(11) NOT NULL,
  `tipo_necesidad_id` int(11) NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_n` int(11) NOT NULL DEFAULT 0 COMMENT '1 eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registro_alimentacion`
--

CREATE TABLE `registro_alimentacion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `asistentes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario_comida` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_comedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitio`
--

CREATE TABLE `sitio` (
  `id` int(11) NOT NULL,
  `cant_paginado` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `facebook` text NOT NULL,
  `twitter` text NOT NULL,
  `instagram` text NOT NULL,
  `nosotros` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sitio`
--

INSERT INTO `sitio` (`id`, `cant_paginado`, `estado`, `facebook`, `twitter`, `instagram`, `nosotros`) VALUES
(1, 12, 1, '#', '#', '#', 'Lorem ipsum dolor sit amet consectetur adipiscing elit dapibus imperdiet erat quis malesuada platea in, torquent iaculis egestas rhoncus varius proin porta lectus sodales posuere fames placerat. Egestas potenti sapien feugiat at fusce dis volutpat morbi dictum habitant ad nullam, faucibus orci platea imperdiet maecenas porta ultrices nulla turpis conubia sociosqu eleifend, rutrum nunc augue est mattis neque nisi varius ligula tellus libero. Curae orci erat per praesent congue lacus urna malesuada natoque, nostra tempor suscipit imperdiet est accumsan maecenas habitasse augue laoreet, at lobortis in pharetra magna dapibus feugiat interdum. aa\r\n\r\nAuctor tempus a commodo dictum metus nascetur potenti etiam consequat ridiculus montes vulputate fames sagittis curabitur at, suscipit natoque placerat justo convallis dui litora eget habitant aptent varius neque ac mi. Massa lacus convallis tortor suscipit leo condimentum urna venenatis felis, ornare enim pretium placerat natoque nullam justo rhoncus, ullamcorper neque nunc quisque gravida vehicula hendrerit imperdiet. ');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_necesidad`
--

CREATE TABLE `tipo_necesidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
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
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_u`, `apellido`, `mail_u`, `password`, `user_name`, `descripcion`, `foto`, `telefono`, `estado_u`, `privado`, `rol`) VALUES
(1, 'admin', 'admin', 'franaledelrojo@gmail.com', 'admin', 'admin', 'El administrador', 'pe.jpg', '', '1', '0', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alimento`
--
ALTER TABLE `alimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alimento_xreg`
--
ALTER TABLE `alimento_xreg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_44387B3639C50FAE` (`registro_id`),
  ADD KEY `IDX_44387B36974F2E6F` (`alimento_id`);

--
-- Indexes for table `comedor`
--
ALTER TABLE `comedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8A4C69C718D196BD` (`comedor_id`),
  ADD KEY `IDX_8A4C69C7C485953B` (`referente_id`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_47860B05DB38439E` (`usuario_id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `necesidad`
--
ALTER TABLE `necesidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_897F961B22C09619` (`tipo_necesidad_id`),
  ADD KEY `IDX_897F961B18D196BD` (`comedor_id`);

--
-- Indexes for table `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registro_alimentacion`
--
ALTER TABLE `registro_alimentacion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitio`
--
ALTER TABLE `sitio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_necesidad`
--
ALTER TABLE `tipo_necesidad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alimento`
--
ALTER TABLE `alimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `alimento_xreg`
--
ALTER TABLE `alimento_xreg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `comedor`
--
ALTER TABLE `comedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `necesidad`
--
ALTER TABLE `necesidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `registro_alimentacion`
--
ALTER TABLE `registro_alimentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sitio`
--
ALTER TABLE `sitio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipo_necesidad`
--
ALTER TABLE `tipo_necesidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  ADD CONSTRAINT `FK_8A4C69C718D196BD` FOREIGN KEY (`comedor_id`) REFERENCES `comedor` (`id`),
  ADD CONSTRAINT `FK_8A4C69C7C485953B` FOREIGN KEY (`referente_id`) REFERENCES `usuario` (`id`);

--
-- Constraints for table `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `FK_47860B05DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Constraints for table `necesidad`
--
ALTER TABLE `necesidad`
  ADD CONSTRAINT `FK_897F961B18D196BD` FOREIGN KEY (`comedor_id`) REFERENCES `comedor` (`id`),
  ADD CONSTRAINT `FK_897F961B22C09619` FOREIGN KEY (`tipo_necesidad_id`) REFERENCES `tipo_necesidad` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
