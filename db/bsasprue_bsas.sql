-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-04-2020 a las 17:39:28
-- Versión del servidor: 5.6.47
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bsasprue_bsas`
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
(3, 'comedor1', '123', 'Lorem ipsum dolor sit amet consectetur adipiscing elit sed velit vehicula mus aliquam porttitor, ultricies bibendum tempor egestas odio risus eleifend lectus neque cursus est.', 'ninguna', '', '2', '1234678456456456', 'facebook', '-34.92915780546703', '-57.944258586549864', 'martes 18:00'),
(7, 'com2', 'aaca', '', 'com2', 'playa.jpg', '2', '', 'viernes 18:00', '-34.92501471420279', '-57.954511500258114', 'sdad'),
(8, 'com4', '1234', '', '', '', '2', '', 'hoy 20:00', '-34.976959740168844', '-57.982151299774294', ''),
(9, 'comedor piola', 'gh', '', '', '', '2', '', 'lunes 20:00', '-34.92369521446426', '-57.954940852777625', ''),
(10, 'Rosario', '6 Nº1235', 'Somos una organización de trabajo horizontal, territorial e interdisciplinario que busca mejorar la calidad de vida de la niñez promoviendo espacios de encuentro, intercambio y propuestas para incidir en la agenda pública y política.  ', 'Foro por la Niñez provincial', '', '2', '2215428062', '', '-34.918044010654185', '-57.94316589832306', 'lunes a viernes de 9 a 16hs'),
(11, 'Asociación Unión Malvinense', 'calle 36 y 149', '', 'Foro por la Niñez', '', '1', '', '', '-34.94365134323211', '-58.00795368479924', 'todos los días'),
(12, 'Pequeños Pies', 'Calle 39 bis y 150 - San Carlos', '', 'Foro por la Niñez', '', '1', '', '', '-34.94762640418742', '-58.00497889637237', 'martes y jueves'),
(13, 'Corazones Contentos', 'Calle 153 y 525 - Barrio Santa Ana, Melchor Romero', '', 'Foro por la Niñez', '', '1', '', '', '-34.93808417510616', '-58.024599569929286', 'miercoles y viernes'),
(14, 'Nuestro Cielo', '169 y 524 , Melchor Romero', '', 'Foro por la Niñez', '', '1', '', '', '-34.95227715123413', '-58.04224706549294', 'lunes, martes, miércoles y jueves'),
(15, 'Casa de Angel', '151 bis e/523 y 524, La Granjita', '', 'Foro por la Niñez', '', '1', '', '', '-34.93465274128001', '-58.02490438903067', 'martes y jueves'),
(16, 'Carita Felices', '138 bis e/ 526 y 527, Barrio San Carlos', '', 'Foro por la Niñez', '', '1', '', '', '-34.925840352882425', '-58.007998989069215', 'miercoles y viernes'),
(17, 'Copa de Leche', 'Calle 57 nº2804 e/151 y 152, Los Hornos', '', 'Foro por la Niñez', '', '1', '', '', '-34.960412129412205', '-57.9911779516023', 'todos los días'),
(18, 'Los Pekes de Malvinas', 'Calle 34 e/154 y 155 - Barrio Malvinas', '', 'Foro por la Niñez', '', '1', '', '', '-34.947098752321715', '-58.01587277449387', 'todos los días'),
(19, 'Corazón de León', '522 bis nº 4685 e/ 141 y 142 - La Granja', '', 'Foro por la Niñez', '', '1', '', '', '-34.92526857802075', '-58.015596199462244', 'tres veces por semana'),
(20, 'Comedor Un Sol Para Los Niños', 'calle 85 nro 1051 esquina 16, Altos de San Lorenzo', '', '', '', '1', '2216401832', '', '-34.949659961950594', '-57.92327204293334', 'lunes a viernes de 15hs a 17hs'),
(21, 'Todos Por Una Sonrisa', 'calle 88 e/ 16 y 17 n 1062, Altos de San Lorenzo', 'Comida: lunes jueves y viernes. \r\nLeche y pan: martes y miércoles.\r\nAsisten a 250 personas,  un representante por familia lleva se lleva un tupper a su casa.', '', 'todos por una sontisa.jpg', '1', '2216151448', 'https://www.instagram.com/todos_porunasonrisa/', '-34.95168343891905', '-57.921522586767544', 'lunes a viernes de 08hs a 13hs'),
(22, 'Comedor Amar a los Niños', '19 n 2204 entre 77 y 78, Altos de San Lorenzo', ' Comedor y copa de leche comunitario sin afiliación política o religiosa del barrio Altos de San Lorenzo.\r\n', '', 'IMG-20200403-WA0078.jpg', '1', '2216149414', 'https://www.facebook.com/comedor.Amar.a.los.ninos/', '-34.946239936685046', '-57.93464664080982', 'Martes, jueves y sábado . A las 17hs y 19 hs viandas'),
(23, 'CONIN La Plata', '514 entre 7 y 8  Ringuelet ', 'Conin es una ONG que trabaja en la desnutrición infantil de niños y niñas de 0 a 5 años  y madres embarazadas con bajo peso o una alta vulnerabilidad social. Sus pilares son asistencia, docencia e investigación.', 'CONIN', '', '1', '2615867185', '', '-34.88608550434276', '-57.98987792808542', 'Lunes-miércoles-viernes de 13.15 a 17.15 hs'),
(24, 'Olla popular adsl', '29 80 y 81', 'Hacemos una olla popular para gente con necesidades en altos de san lorenzo. Somos la agrupacion rene favaloro y estamos dandole de comer entre 150 y 200 personas. Cualquier ayuda sera bienvenida. Muchas gracias ! ', 'Agrupacion rene favaloro', 'DB34ADCF-1F53-4122-A3D0-BF496FF4CD36.jpeg', '1', '2213189534', 'Facebook / instagram', '-34.95857400189579', '-57.941679954528816', 'Miercoles 20.00hs y domingos 20.00hs'),
(25, 'Olla popular adsl', '29 79 y 80', 'Somos una olla popular y brindamos alimentos para una cantidad de 150 / 200 personas. Cualquier ayuda sera bienvenida. Muchas gracias!', 'Agrupacion rene favaloro', '1F4B34D4-0039-478B-9154-5C31A3E89809.jpeg', '1', '2213189534', 'Facebook / instagram', '-34.95750207383647', '-57.94305860996247', 'Miercoles 20:00hs - Domingos 20:00hs'),
(26, 'Olla popular adsl', 'Calle 29 entre 79 y 80', '', 'Agrupacion rene favaloro', '', '1', '2213189534', '', '-34.95751004259204', '-57.94302105903626', 'Miercoles 20:00hs -Domingos 20:00hs'),
(27, 'comedor CAMINO AL ANDAR', '133 #1657 entre 8 y 9, BERISSO, villa Arguello.', 'Dan viandas a 147 personas, funcionan desde el año 2019, es familiar. ', 'Fundación Huella Verde', 'comedor Camino al Andar.jpg', '1', '2215924891', 'https://www.facebook.com/Comedor-Camino-al-Andar-1', '-34.901967975696266', '-57.912311930779666', 'Los días martes y jueves 13:30'),
(28, 'Comedor Juan Gabriel', '81 entre 15 y 16, Altos de San Lorenzo', 'Comedor que entrega viandas a aproximadamente 200 personas. ', 'Fundación Huella Verde', 'juan gabriel.jpg', '0', '2215113924', 'https://www.facebook.com/comedorinfantil.juangabri', '-34.945935638970276', '-57.927165792784685', 'lunes a viernes ');

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
(5, 10, 25),
(6, 11, 27),
(7, 12, 28),
(8, 13, 29),
(9, 14, 30),
(10, 15, 31),
(11, 16, 32),
(12, 17, 33),
(13, 18, 34),
(14, 19, 35),
(15, 20, 37),
(16, 21, 38),
(17, 22, 39),
(18, 23, 45),
(19, 24, 46),
(20, 25, 47),
(21, 26, 48),
(22, 27, 50),
(23, 28, 51);

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
  `links` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_e` int(11) NOT NULL DEFAULT '0' COMMENT '1 eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `usuario_id`, `fecha`, `titulo`, `descripcion`, `fecha_evento`, `horario`, `estado_e`) VALUES
(1, 1, '2019-11-12', 'Bienvenida', 'comenzamos actividades', '2019-11-25', '18:00', 1),
(2, 3, '2019-11-01', 'Cumple', 'Festejamos el cumple de este maravilloso lugar', '2019-12-01', '20:30', 1),
(7, 11, '2019-11-13', 'ggg', 'muchas ggg', '2019-11-25', '23:30', 1),
(8, 11, '2019-11-12', 'hacer ruido', 'estamos invitados a tomar el te', '2019-12-12', '14:15', 1),
(9, 1, '2019-11-13', 'Hola de nuevo', 'recalculando', '2019-11-25', '16:00', 1),
(10, 1, '2019-11-13', 'Venta de boludeces', 'eso...', '2019-12-24', '14:15', 1),
(11, 1, '2019-11-13', 'nada', 'nadadnadnadnadnadnand', '2019-11-29', '23:30', 1),
(12, 3, '2019-11-13', 'adada', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2019-11-28', '12', 1);



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes_normativas`
--

CREATE TABLE `informes_normativas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `cuerpo` mediumtext NOT NULL,
  `links` text NOT NULL,
  `estado_n` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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
  `comedor_id` int(11) NOT NULL,
  `subtipo` int(2) NOT NULL DEFAULT 0 COMMENT '0=alimentos\r\n1=insumos\r\n2=talleres'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `links` text COLLATE utf8mb4_unicode_ci NOT NULL,  
  `estado_n` int(11) NOT NULL DEFAULT '0' COMMENT '1 eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`id`, `fecha`, `titulo`, `descripcion`, `foto`, `estado_n`) VALUES
(1, '2019-11-13', 'SOS', 'eso.... nada', '12', 1),
(2, '2019-11-13', 'bla bla', 'aaaaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhhhh', 'bla', 1),
(3, '2019-11-13', 'borrame!', 'no te borro nada', '223', 1),
(4, '2019-11-13', 'Nuevamnete', 'escribi mal todo :o', 's', 1),
(5, '2019-12-18', 'Se presentó la Red ', 'En el Edificio Karacachoff de la UNLP se presentó la Red de Acción Alimentaria en La Plata\r\nhttp://xn--foroporlaniez-skb.org.ar/2019/12/el-foro-por-los-derechos-de-la-ninez-presento-la-red-de-accion-alimentaria-en-la-plata/', 'WhatsApp-Image-2019-12-19-at-5.21.09-PM-735x400.jpeg', 0),
(6, '2020-03-28', 'COVID19 y Alimentación', 'Comunicado: Políticas públicas alimentarias y Coronavirus\r\n\r\nhttp://xn--foroporlaniez-skb.org.ar/2020/03/comunicado-politicas-publicas-alimentarias-y-coronavirus/', 'foto.png', 0),
(7, '2020-04-11', 'Crean mapa interactivo', 'Crean una herramienta virtual para comedores en medio de la emergencia sanitaria\r\n\r\nDesde el espacio \"Acción Alimentaria\", una Red de trabajo en alimentacion saludable, soberana y desarrollo sostenible, invitamos a geo-referenciar los distintos establec', '20200411_134420.png', 0);

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
(4, '2019-11-27', '123', 'edsaa<ddasasdsasa', 'almuerzo', 2);

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
(1, 20, 1, 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.instagram.com', 'En el marco de la promoción del derecho a una soberanía alimentaria, alimentación saludable y a un desarrollo sostenible,  distintos actores de la sociedad civil, académicos, colegios de profesionales y organizaciones sociales que trabajamos en nuestro territorio comprometidos con nuestra comunidad, conformamos una Red de trabajo de gestión colaborativa y coordinada, de constitución interdisciplinaria e intersectorial, desde la perspectiva del interés superior del niño/a, con el fin de promover la salud integral de los niños, niñas y adolescentes. \r\n\r\n\r\n\r\nLa Red propone un trabajo de articulación local de investigación para la acción colectiva, entre los diversos actores que conforman el capital social de la ciudad de La Plata, para promover la de-construcción de las practicas alimentarias hegemónicas y proactivamente propongan alternativas comunitarias innovadoras y sustentables, que revaloricen las potencialidades y recursos existentes, requiriendo la “utilización imaginativa, racional, equilibrada y dinámica de todas las formas de capital y bienes patrimoniales ya sean estos monetarios, humanos, naturales, culturales, sociales o territoriales”. \r\n\r\nCreemos que debemos definir y construir colectivamente nuevos paradigmas que nos permitan elegir nuestros alimentos, nuestro sistema productivo y potencien nuestro desarrollo como seres humanos en una relación respetuosa con el ambiente en el que vivimos. \r\n\r\n');

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
(4, 'FRUTAS Y VERDURAS'),
(5, 'AGUA SEGURA'),
(6, 'LEGUMBRES'),
(7, 'LACTEOS'),
(8, 'ACEITE'),
(9, 'PRODUCTOS ENLATADOS'),
(10, 'CACAO Y AZÚCAR'),
(11, 'ALIMENTOS PARA MERIENDA'),
(12, 'ALIMENTOS SIN TACC'),
(13, 'TAZAS Y VASOS'),
(14, 'CUBIERTOS Y PLATOS'),
(15, 'FUENTES Y CACEROLAS'),
(16, 'HELADERA'),
(17, 'TALLER HUERTACOMUNITARIA'),
(18, 'TALLER COCINA SALUDABLE'),
(20, 'T. GESTIÓN INT. RESIDUOS'),
(21, 'T.  ENERGIAS RENOVABLES');

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
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `red_social` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_u`, `apellido`, `mail_u`, `password`, `user_name`, `descripcion`, `foto`, `telefono`, `estado_u`, `privado`, `rol`) VALUES
(1, 'Foro por la Niñez', 'La Plata', 'foroninezlaplata@gmail.com', 'susderechos', 'Foro por la Niñez', '', 'logo Foro por la Niñez.png', '', '1', '0', '3'),
(2, 'Mirta', 'asd', 'franaledelrojo@gmail.com', 'asd', 'mirta', '1', 'playa.jpg', '', '2', '0', '0'),
(3, 'Fran', 'asd', 'franaledelrojo@gmail.com', '12345678', 'fran', 'nhbgf', 'playa.jpg', '', '2', '0', '0'),
(4, 'Rodolfo', 'a', 'a@gmail.com', '1', 'rodo', 'asdas', '', '12312', '2', '0', '0'),
(5, 'Prueba', 'z', 'a@gmail.com', 'z', 'Prueba', 'das', 'listado_eventos.png', '1', '2', '0', '0'),
(6, 'Ana', 'q', '1@gmail.com', '1', 'ana', 'asd', '', '1', '2', '0', '0'),
(7, 'Candela', '1', '1@gmail.com', '1', 'cande', 'aa', '', '1', '2', '0', '0'),
(9, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '', '', '2', '', ''),
(10, 'Hola', 'as', 'asd@asdf.com', '1234', 'hola', 'as', 'none', '13123123', '2', '0', '1'),
(11, 'hola', 'hla', 'hol@hola.com', '12345678', 'com2', '', 'none', '1234', '2', '0', '1'),
(12, 'Comedor4', 'q', 'hol@hola.com', '12345678', 'com4', '', 'none', '12', '2', '0', '1'),
(13, 'Comedor5', '1', 'hol@hola.com', '12345678', 'com5', '', 'none', '1', '2', '0', '1'),
(14, 'pedro', 'quoora', 'toto.bocaa@gmail.com', 'http://198.199.8', 'pedroq', 'http://198.199.88.137/', '', '', '2', '0', '0'),
(15, 'pedro21', 'quoora', 'toto.bocaa@gmail.com', 'srvk213.allytech', 'pedroq12', 'http://198.199.88.137/', '', '', '2', '0', '0'),
(16, 'pedro21', 'quoora', 'toto.bocaa@gmail.com', 'pedroq12111', 'pedroq12111', 'http://198.199.88.137/', '', '', '2', '0', '0'),
(17, 'pedro21', 'quoora', 'toto.bocaa@gmail.com', 'asadaasada', 'asadaasada', 'http://198.199.88.137/', '', '', '2', '0', '0'),
(18, 'dasdasda', 'dasdasda', 'toto.bocaa@gmail.com', 'dasdasdadasdasda', 'dasdasdadasdasda', 'dasdasda', '', '', '2', '0', '0'),
(19, 'dasdasda', 'dasdasda', 'toto.bocaa@gmail.com', 'dasaddasad', 'dasad', 'dasdasda', '', '', '2', '0', '0'),
(20, 'dasdasda', 'dasdasda', 'toto.bocaa@gmail.com', 'dasaddasad', 'dasaddasaddasad', 'dasdasda', '', '', '2', '0', '0'),
(21, 'carlosca', 'carlosca', 'toto.bocaa@gmail.com', 'carloscacarlosca', 'carloscacarlosca', 'carloscacarlosca', '', '', '2', '0', '0'),
(22, 'carlosca', 'carlosca', 'toto.bocaa@gmail.com', 'pedroaaaa', 'pedroaaaa', 'carloscacarlosca', '', '', '2', '0', '0'),
(23, 'https://www.nativespace.', 'https://www.nativespace.', 'toto.bocaa@gmail.com', 'https://www.nati', 'https://www.nativespace.', 'https://www.nativespace.com/mynative/knowledgebase/61/Error-535---Incorrect-authentication-data.html', '', '', '2', '0', '0'),
(24, 'carloscaa', 'carloscaa', 'toto.bocaa@gmail.com', 'carloscaa', 'carloscaaaa', 'carloscaa', '', '', '2', '0', '0'),
(25, 'Rosario', 'Hasperue', 'rhasperue@yahoo.com.ar', 'salvador2014', 'charohas', 'Somos una organización de trabajo horizontal, territorial e interdisciplinario que busca mejorar la calidad de vida de la niñez promoviendo espacios de encuentro, intercambio y propuestas para incidir en la agenda pública y política.  ', 'none', '2214670735', '2', '0', '1'),
(26, 'Foro por la Niñez', 'La Plata', 'foroninezlaplata@gmail.com', 'susderechos', 'Foro_niñez', 'El Foro por la Niñez es una iniciativa de organizaciones políticas, sindicales,\r\nsociales, de derechos humanos y ONGs que se funda en el año 2004 en la ciudad\r\nde La Plata, provincia de Buenos Aires, con el lema “Por otra Relación del Estado\r\ncon la Niñez', 'logo Foro por la Niñez.png', '', '1', '0', '0'),
(27, 'Mariel', 'Chaira', 'foroninezlaplata@gmail.com', 'barriomalvinas', 'UniónMalvinense', '', 'none', '2215609510', '1', '0', '1'),
(28, 'Cecilia', 'Arriondo', 'foroninezlaplata@gmail.com', 'pequepies', 'pequeñospies', '', 'none', '2216073020', '1', '0', '1'),
(29, 'Rocío', 'Roman', 'foroninezlaplata@gmail.com', 'corazones', 'corazonescontentos', '', 'none', '2214543809', '1', '0', '1'),
(30, 'Juliana', 'Varela', 'foroninezlaplata@gmail.com', 'nuestrocielo', 'nuestrocielo', '', 'none', '2216715584', '1', '0', '1'),
(31, 'Miranda', 'Ríos Espíndola', 'foroninezlaplata@gmail.com', 'caradeangel', 'caradeangel', '', 'none', '2215661425', '1', '0', '1'),
(32, 'Paola', 'Rodríguez', 'foroninezlaplata@gmail.com', 'caritasfelices', 'caritasfelices', '', 'none', '2214203677', '1', '0', '1'),
(33, 'Cristina', 'Copa de Leche', 'foroninezlaplata@gmail.com', 'copadeleche', 'Cristina', '', 'none', '2216021125', '1', '0', '1'),
(34, 'Marina Laura', 'Marino', 'foroninezlaplata@gmail.com', 'malvinas', 'lospekes', '', 'none', '2213199148', '1', '0', '1'),
(35, 'Graciela', 'Ponce', 'foroninezlaplata@gmail.com', 'corazondeleon', 'corazondeleon', '', 'none', '2213141129', '1', '0', '1'),
(36, 'Observatorio Socioec.', 'UCALP', 'doritacolomar@yahoo.com.ar', 'UCALPobse', 'ObservatorioUCALP', 'Servir como centro de difusión, información y referencia de datos. Buscamos y elaboramos información para la acción', '', '5491140614400', '1', '0', '0'),
(37, 'Malakias', 'malakias', 'Keniasport@hotmail.com', 'malakias', 'Unsolparalosniños', '', 'none', '2216401823', '1', '0', '1'),
(38, 'María', 'María', 'comedortodosporunasonrisa@gmail.com', 'sonrisamaria', 'todosporunasonrisa', 'Comida: lunes jueves y viernes. \r\nLeche y pan: martes y miércoles.\r\nAsisten a 250 personas,  un representante por familia lleva se lleva un tupper a su casa.', 'none', '2216151448', '1', '0', '1'),
(39, 'Marta', 'Marta', 'foroninezlaplata@gmail.com', 'amaralosniños', 'Marta', 'Comedor y copa de leche comunitario sin afiliación política o religiosa del barrio Altos de San Lorenzo.\r\n', 'none', '2216149414', '1', '0', '1'),
(40, 'Marco Nicolas', 'Pereyra', 'culturaalimentarialp@live.com.ar', 'aorganizar', 'Cultura-Alimentaria', 'La razón de ser de Cultura Alimentaria reside en tres grandes ejes: la comercialización de alimentos saludables a precios justos; la consolidación de alianzas estratégicas con organizaciones que comparten valores similares y la concientización a la comuni', '11062121_838663292848252_9184275861439367134_n-2.jpg', '2214186471', '1', '0', '0'),
(41, 'Lorena', 'Sciarrotta', 'loresciarrotta@yahoo.com.ar', 'equipotecnico', 'CTAI', 'El CTAI (centro de Tratamiento Ambulatorio integral) es un programa provincial, con modalidad de centro de día terapéutico. Este dispositivo fue diseñado para abordar problemáticas de niños, niñas y adolescentes de 6 a 18 años de edad,  cuyos derechos han', '', '4837358', '1', '0', '0'),
(42, 'ivanna', 'reist', 'ivannareist@gmail.com', 'Perro2019.', 'ivanna', 'Soy Ivanna, trabajo desde hace mucho tiempo en la salud publica. Comparto este espacio, porque estoy convencida de que organizadxs podremos accionar mucho mas que individualmente.', '', '2215898074', '1', '0', '0'),
(43, 'Matias Ernesto', 'Benavidez', 'bonafide_66@hotmail.com', '1234mati$', 'MatiB', 'Mi nombre es Matias y junto a Jerónimo haremos acciones destinadas a la horticultura urbana en el marco del \"Buen Vivir\".', 'FB_IMG_15863624848847520.jpg', '', '1', '0', '0'),
(44, 'Celeste', 'Furlotti', 'celefurlotti@hotmail.com', 'Amparo12345', 'CONINLaPlata', 'CONIN es una ONG cuyo objetivo es la prevención de la desnutrición infantil en todo el país y el mundo. Nuestros beneficiarios directos son de niños de 0 a 5 años con desnutrición o una alta vulnerabilidad social y embarazadas con bajo peso siendo nuestro', '', '2615867185', '1', '0', '0'),
(45, 'Celeste', 'Furlotti', 'celefurlotti@hotmail.com', 'Amparo1234', 'CONIN', 'Conin es una ONG que trabaja en la desnutrición infantil de niños y niñas de 0 a 5 años  y madres embarazadas con bajo peso o una alta vulnerabilidad social. Sus pilares son asistencia, docencia e investigación.', 'none', '2615867185', '1', '0', '1'),
(46, 'Julian ernesto', 'Gargiulo', 'julianernestogargiulo@gmail.com', 'favaloro2020', 'Renefavaloro', 'Hacemos una olla popular para gente con necesidades en altos de san lorenzo. Somos la agrupacion rene favaloro y estamos dandole de comer entre 150 y 200 personas. Cualquier ayuda sera bienvenida. Muchas gracias ! ', 'none', '2213189534', '1', '0', '1'),
(47, 'Julian ernesto ', 'Gargiulo', 'julianernestogargiulo@gmail.com', 'renefavaloro', 'Agrup.favaloro', 'Somos una olla popular y brindamos alimentos para una cantidad de 150 / 200 personas. Cualquier ayuda sera bienvenida. Muchas gracias!', 'none', '2213189534', '1', '0', '1'),
(48, 'Julian ernesto', 'Gargiulo', 'julianernestogargiulo@gmail.com', '123456789', 'Agrupacion.rene.favaloro', '', 'none', '2213189534', '1', '0', '1'),
(49, 'Virginia', 'Vetere', 'virvetere@gmail.com', 'Solovir71', 'Virginia', 'Taller de Aguas-Facultad de Ciencias Exactas-UNLP\r\nDesde nuestro proyecto trabajamos en pos de defender el acceso a agua segura, como un derecho humano fundamental, para personas o grupos en situación de vulnerabilidad. Nuestro trabajo consiste en encuent', '', '', '1', '0', '0'),
(50, 'Judith', 'Judith', 'Judithgracielamoreno@gmail.com', 'caminoalandar', 'judith', 'Dan viandas a 147 personas, funcionan desde el año 2019, es familiar. ', 'none', '2215924891', '1', '0', '1'),
(51, 'Haydee', 'haydee', 'foroninezlaplata@gmail.com', 'juangabriel', 'haydee', 'Comedor que entrega viandas a aproximadamente 200 personas. ', 'none', '2215113924', '0', '0', '1');

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
-- Indices de la tabla `informes_normativas`
--
ALTER TABLE `informes_normativas`
  ADD PRIMARY KEY (`id`);


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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comedor`
--
ALTER TABLE `comedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `informes_normativas`
--
ALTER TABLE `informes_normativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `necesidad`
--
ALTER TABLE `necesidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `registro_alimentacion`
--
ALTER TABLE `registro_alimentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sitio`
--
ALTER TABLE `sitio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_necesidad`
--
ALTER TABLE `tipo_necesidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
