-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2020 a las 19:10:43
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(11, 'Asociación Unión Malvinense', 'calle 36 y 149', 'Lorem ipsum', 'Foro por la Niñez', '', '1', '', '', '-34.94365134323211', '-58.00795368479924', 'todos los días'),
(12, 'Pequeños Pies', 'Calle 39 bis y 150 - San Carlos', '', 'Foro por la Niñez', '', '1', '', '', '-34.94762640418742', '-58.00497889637237', 'martes y jueves'),
(13, 'Corazones Contentos', 'Calle 153 y 525 - Barrio Santa Ana, Melchor Romero', '', 'Foro por la Niñez', '', '1', '', '', '-34.93808417510616', '-58.024599569929286', 'miercoles y viernes'),
(14, 'Nuestro Cielo', '169 y 524 , Melchor Romero', '', 'Foro por la Niñez', '', '1', '', '', '-34.95227715123413', '-58.04224706549294', 'lunes, martes, miércoles y jueves'),
(15, 'Casa de Angel', '151 bis e/523 y 524, La Granjita', '', 'Foro por la Niñez', '', '1', '', '', '-34.93465274128001', '-58.02490438903067', 'martes y jueves'),
(16, 'Carita Felices', '138 bis e/ 526 y 527, Barrio San Carlos', '', 'Foro por la Niñez', '', '1', '', '', '-34.925840352882425', '-58.007998989069215', 'miercoles y viernes'),
(17, 'Copa de Leche', 'Calle 57 nº2804 e/151 y 152, Los Hornos', '', 'Foro por la Niñez', '', '0', '', '', '-34.960412129412205', '-57.9911779516023', 'todos los días'),
(18, 'Los Pekes de Malvinas', 'Calle 34 e/154 y 155 - Barrio Malvinas', '', 'Foro por la Niñez', '', '0', '', '', '-34.947098752321715', '-58.01587277449387', 'todos los días'),
(19, 'Corazón de León', '522 bis nº 4685 e/ 141 y 142 - La Granja', '', 'Foro por la Niñez', '', '0', '', '', '-34.92526857802075', '-58.015596199462244', 'tres veces por semana'),
(20, 'el segundo comedor', 'av peron 1973', 'dsaasdsasdsadasddsasda', 'Segudo', '', '1', '2122313123', 'no teno', '-34.901075690747724', '-57.9843144009175', '231231321123'),
(21, 'el tercero papa', 'asdpsad', 'saddsaadsdsasaddsaadsdsasaddsaad sdsasaddsaad sdsasaddsaadsdsasaddsaadsdsasaddsaadsd sasaddsaadsdsasaddsaadsdsasaddsaadsds asaddsaadsdsasaddsaadsdsasa ddsaadsdsasaddsaadsdsasaddsaadsdsasaddsaadsdsa', 'ninguna', '', '0', '12312312', 'xd@xd', '-34.93302802018505', '-57.91474547111254', 'saddsaadsdsa'),
(22, 'el cuarto autorizado', 'dsa', 'dsadsadasdsa sad ssdsd ada adssd ad', 'dsa', 'playa-tropical_74190-188.jpg', '1', '1231231', 'das', '-34.89079762911019', '-58.014718599869305', 'con fotoide'),
(23, 'el cuarto autorizado', 'dsa', 'dsadsadasdsa sad ssdsd ada adssd ad', 'dsa', 'playa-tropical_74190-188.jpg', '1', '1231231', 'das', '0', '0', 'con fotoide'),
(24, 'el cuarto autorizado', 'sdasaddas', 'sdasadasd sda adssdas das  sasd ', 'dsaasdsd', '', '1', '212112', 'dsasadsda', '-34.94980416888503', '-57.944040326901515', 'dsasdasdasddassadds');

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
(15, 20, 27),
(16, 21, 27),
(17, 22, 27),
(18, 23, 27),
(19, 24, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_evento` date NOT NULL,
  `horario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `links` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_e` int(11) NOT NULL DEFAULT 0 COMMENT '1 eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `usuario_id`, `fecha`, `titulo`, `descripcion`, `fecha_evento`, `horario`, `links`, `estado_e`) VALUES
(1, 1, '2019-11-12', 'Bienvenida', 'comenzamos actividades', '2019-11-25', '18:00', '', 0),
(2, 3, '2019-11-01', 'Cumple', 'Festejamos el cumple de este maravilloso lugar', '2019-12-01', '20:30', '', 0),
(7, 11, '2019-11-13', 'ggg', 'muchas ggg', '2019-11-25', '23:30', '', 0),
(8, 11, '2019-11-12', 'hacer ruido', 'estamos invitados a tomar el te', '2019-12-12', '14:15', '', 0),
(9, 1, '2019-11-13', 'Hola de nuevo', 'recalculando', '2019-11-25', '16:00', '', 0),
(10, 1, '2019-11-13', 'Venta de boludeces', 'eso...', '2019-12-24', '14:15', '', 1),
(11, 1, '2019-11-13', 'nada', 'nadadnadnadnadnadnand', '2019-11-29', '23:30', '', 0),
(12, 3, '2019-11-13', 'adada', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2019-11-28', '12', '', 1),
(13, 1, '2020-04-19', 'asdfghj', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lacus vel facilisis volutpat est velit egestas dui. Nunc faucibus a pellentesque sit. Neque volutpat ac tincidunt vitae semper. Diam maecenas ultricies mi eget mauris pharetra. Amet consectetur adipiscing elit duis. Orci nulla pellentesque dignissim enim sit amet venenatis. Et netus et malesuada fames ac turpis. Eu feugiat pretium nibh ipsum consequat nisl vel. Magna eget est lorem ipsum dolor. Elit ullamcorper dignissim cras tincidunt lobortis. Egestas sed tempus urna et. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Pulvinar pellentesque habitant morbi tristique senectus et netus et. Netus et malesuada fames ac turpis egestas integer eget. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Sagittis orci a scelerisque purus semper.\r\n\r\nPellentesque sit amet porttitor eget dolor morbi non. Ultrices neque ornare aenean euismod elementum nisi. Viverra justo nec ultrices dui sapien eget mi proin sed. Tempor orci eu lobortis elementum nibh tellus molestie. Condimentum lacinia quis vel eros. Pulvinar sapien et ligula ullamcorper. Nulla facilisi morbi tempus iaculis. Scelerisque varius morbi enim nunc faucibus a. Neque volutpat ac tincidunt vitae semper quis lectus nulla. Purus non enim praesent elementum facilisis leo vel fringilla. Aliquet eget sit amet tellus. Enim ut tellus elementum sagittis vitae et. Orci sagittis eu volutpat odio facilisis mauris sit amet. Laoreet sit amet cursus sit amet dictum sit. Duis ut diam quam nulla porttitor massa. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Vitae semper quis lectus nulla at volutpat diam ut venenatis. Risus quis varius quam quisque id diam vel quam.\r\n\r\nEgestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Pulvinar elementum integer enim neque volutpat. Libero id faucibus nisl tincidunt eget nullam non nisi est. Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor. Mauris ultrices eros in cursus. Lacus vestibulum sed arcu non odio euismod lacinia. Volutpat est velit egestas dui id ornare arcu odio. Ullamcorper eget nulla facilisi etiam dignissim diam. Tincidunt nunc pulvinar sapien et ligula. Ante in nibh mauris cursus mattis molestie a. Donec et odio pellentesque diam volutpat.\r\n\r\nSit amet venenatis urna cursus. Lorem donec massa sapien faucibus et molestie. Sit amet facilisis magna etiam tempor orci eu lobortis. Nisl purus in mollis nunc sed. Convallis a cras semper auctor neque. Convallis tellus id interdum velit laoreet id. Justo donec enim diam vulputate ut pharetra sit amet aliquam. Et pharetra pharetra massa massa ultricies mi quis hendrerit. At elementum eu facilisis sed odio morbi quis commodo. Egestas quis ipsum suspendisse ultrices. Porta non pulvinar neque laoreet suspendisse interdum consectetur.\r\n\r\nAc tortor dignissim convallis aenean et tortor at risus. Volutpat lacus laoreet non curabitur gravida arcu ac. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Elementum integer enim neque volutpat ac. In tellus integer feugiat scelerisque varius morbi enim nunc. Rhoncus dolor purus non enim praesent elementum facilisis leo. Id porta nibh venenatis cras sed. Ut tortor pretium viverra suspendisse potenti. Proin gravida hendrerit lectus a. Aliquet eget sit amet tellus cras adipiscing enim. Faucibus interdum posuere lorem ipsum dolor. Purus non enim praesent elementum facilisis leo. Odio pellentesque diam volutpat commodo sed. Quis lectus nulla at volutpat diam. Tellus molestie nunc non blandit massa enim. Amet est placerat in egestas erat imperdiet sed euismod nisi. Sodales neque sodales ut etiam sit amet nisl purus.', '2020-04-22', '12:30', '', 0),
(14, 1, '2020-04-22', 'La prueba', 'Lorem ipsum dolor sit amet consectetur adipiscing elit morbi, molestie et convallis quis viverra venenatis facilisis ac sociis, taciti magnis nascetur vitae aenean aliquet mollis. Diam etiam ad lacinia platea primis habitant, penatibus tristique egestas faucibus aenean curae mollis, massa interdum dignissim facilisis donec. Nec blandit facilisi aptent scelerisque nunc sociis augue commodo sociosqu curae, aliquet malesuada diam mauris maecenas ac bibendum quam.\r\n\r\nSodales tincidunt felis pulvinar quam fusce, lectus molestie phasellus volutpat, penatibus ultrices massa laoreet. Vitae ut dapibus nulla sagittis ultrices pharetra taciti tincidunt maecenas nunc metus pulvinar, lobortis facilisis fringilla suspendisse velit cras turpis tristique lectus molestie class. Nisi litora placerat dapibus diam nisl vitae, auctor sapien facilisis donec vehicula porttitor faucibus, at enim aliquet dictumst semper.', '2020-04-23', '12:30', 'SDAADS: https://getlorem.com/es/\r\nAS\r\nhttps://getlorem.com/es/\r\nhttps://getlorem.com/es/\r\nAS', 0),
(15, 1, '2020-04-22', 'La prueba2dsa', 'Lorem ipsum dolor sit amet consectetur adipiscing elit morbi, molestie et convallis quis viverra venenatis facilisis ac sociis, taciti magnis nascetur vitae aenean aliquet mollis. Diam etiam ad lacinia platea primis habitant, penatibus tristique egestas faucibus aenean curae mollis, massa interdum dignissim facilisis donec. Nec blandit facilisi aptent scelerisque nunc sociis augue commodo sociosqu curae, aliquet malesuada diam mauris maecenas ac bibendum quam.\r\n\r\nSodales tincidunt felis pulvinar quam fusce, lectus molestie phasellus volutpat, penatibus ultrices massa laoreet. Vitae ut dapibus nulla sagittis ultrices pharetra taciti tincidunt maecenas nunc metus pulvinar, lobortis facilisis fringilla suspendisse velit cras turpis tristique lectus molestie class. Nisi litora placerat dapibus diam nisl vitae, auctor sapien facilisis donec vehicula porttitor faucibus, at enim aliquet dictumst semper.', '2020-04-22', '12:30', 'va\r\nhttps://getlorem.com/es/\r\nas', 0);

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

--
-- Volcado de datos para la tabla `informes_normativas`
--

INSERT INTO `informes_normativas` (`id`, `fecha`, `titulo`, `cuerpo`, `links`, `estado_n`) VALUES
(1, '2020-04-12', 'Eejemplosoadoas', 'Eejemplosoadoas ', '', 0),
(2, '2020-04-12', 'ejemplo22222', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Odio morbi quis commodo odio aenean sed adipiscing diam donec. Montes nascetur ridiculus mus mauris vitae. A scelerisque purus semper eget duis at tellus at. Orci phasellus egestas tellus rutrum. Ipsum nunc aliquet bibendum enim facilisis. Amet massa vitae tortor condimentum lacinia quis. Non arcu risus quis varius quam quisque id diam vel. Nulla pellentesque dignissim enim sit amet venenatis urna. Sem viverra aliquet eget sit amet tellus cras adipiscing. Urna duis convallis convallis tellus id interdum velit laoreet. Nec dui nunc mattis enim ut tellus elementum sagittis. Facilisi cras fermentum odio eu. Blandit libero volutpat sed cras. Nibh nisl condimentum id venenatis a condimentum. Urna cursus eget nunc scelerisque viverra mauris. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus. Donec et odio pellentesque diam volutpat. Eget nunc scelerisque viverra mauris in aliquam sem fringilla ut. Eu turpis egestas pretium aenean.\r\n\r\nSed tempus urna et pharetra pharetra massa massa. Amet mattis vulputate enim nulla aliquet porttitor. Et netus et malesuada fames ac turpis egestas integer eget. Sollicitudin ac orci phasellus egestas tellus rutrum. Velit ut tortor pretium viverra. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Venenatis cras sed felis eget velit. Aliquam etiam erat velit scelerisque in dictum non consectetur a. Egestas dui id ornare arcu odio. Ac turpis egestas sed tempus urna et pharetra pharetra massa. Vitae tortor condimentum lacinia quis vel. Ac tincidunt vitae semper quis lectus nulla at. Odio morbi quis commodo odio aenean. Ut consequat semper viverra nam libero justo laoreet. Fringilla urna porttitor rhoncus dolor purus.\r\n\r\nAmet nisl purus in mollis nunc sed id. Feugiat sed lectus vestibulum mattis ullamcorper velit sed. Cras pulvinar mattis nunc sed blandit libero volutpat. Ullamcorper morbi tincidunt ornare massa eget egestas purus. Aliquam sem et tortor consequat id porta nibh venenatis cras. Maecenas accumsan lacus vel facilisis volutpat est velit. Turpis massa tincidunt dui ut ornare lectus sit amet est. Porta nibh venenatis cras sed felis eget velit aliquet. Suspendisse potenti nullam ac tortor. Lorem ipsum dolor sit amet. Neque convallis a cras semper. Quam nulla porttitor massa id neque aliquam vestibulum morbi. Elementum pulvinar etiam non quam lacus suspendisse faucibus interdum. Diam sit amet nisl suscipit.\r\n\r\nPretium vulputate sapien nec sagittis aliquam malesuada. Libero justo laoreet sit amet cursus sit amet dictum sit. Leo urna molestie at elementum eu facilisis sed. Feugiat in fermentum posuere urna nec tincidunt praesent semper. Suscipit tellus mauris a diam maecenas. Diam donec adipiscing tristique risus. Quis eleifend quam adipiscing vitae proin sagittis. Eget duis at tellus at. At quis risus sed vulputate odio ut. Proin sagittis nisl rhoncus mattis. Lorem donec massa sapien faucibus et molestie ac. Sagittis aliquam malesuada bibendum arcu. Leo urna molestie at elementum eu facilisis sed odio. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit. Vel pretium lectus quam id leo. Et pharetra pharetra massa massa ultricies. Elit pellentesque habitant morbi tristique senectus et netus et.\r\n\r\nTortor at risus viverra adipiscing. Sociis natoque penatibus et magnis dis. Dignissim diam quis enim lobortis scelerisque. Purus in mollis nunc sed id semper risus in. Sagittis eu volutpat odio facilisis mauris sit amet massa. Et malesuada fames ac turpis egestas. Euismod quis viverra nibh cras pulvinar. Vulputate enim nulla aliquet porttitor lacus luctus accumsan. Ac tortor vitae purus faucibus ornare suspendisse. Rutrum tellus pellentesque eu tincidunt tortor aliquam nulla. Enim ut tellus elementum sagittis vitae et leo duis ut. Ligula ullamcorper malesuada proin libero nunc. Bibendum neque egestas congue quisque egestas.\r\n\r\nUltricies tristique nulla aliquet enim. Pellentesque massa placerat duis ultricies lacus. Sit amet nisl suscipit adipiscing. Sagittis purus sit amet volutpat consequat mauris nunc. Tincidunt tortor aliquam nulla facilisi cras fermentum odio eu. Varius duis at consectetur lorem donec massa sapien. Fringilla est ullamcorper eget nulla. Accumsan lacus vel facilisis volutpat est velit egestas dui id. Sit amet dictum sit amet justo. Facilisis sed odio morbi quis commodo. Pulvinar sapien et ligula ullamcorper malesuada. Interdum posuere lorem ipsum dolor. Gravida arcu ac tortor dignissim. Diam donec adipiscing tristique risus nec feugiat. Id leo in vitae turpis massa sed elementum. Commodo nulla facilisi nullam vehicula. Purus gravida quis blandit turpis cursus in hac.\r\n\r\nVolutpat diam ut venenatis tellus in. Donec enim diam vulputate ut pharetra. Condimentum id venenatis a condimentum vitae. Dolor magna eget est lorem ipsum dolor sit amet consectetur. Ullamcorper sit amet risus nullam eget felis eget nunc. Viverra adipiscing at in tellus integer feugiat scelerisque. Congue quisque egestas diam in arcu. Nisi porta lorem mollis aliquam. Non nisi est sit amet facilisis magna. Adipiscing tristique risus nec feugiat in fermentum posuere urna nec. Accumsan lacus vel facilisis volutpat est velit. Nunc consequat interdum varius sit amet mattis vulputate. Diam phasellus vestibulum lorem sed risus. Senectus et netus et malesuada fames ac turpis egestas maecenas. Eu ultrices vitae auctor eu augue ut lectus arcu bibendum.\r\n\r\nFeugiat in ante metus dictum at tempor. Pulvinar etiam non quam lacus suspendisse. Sit amet porttitor eget dolor morbi. Nibh tellus molestie nunc non blandit massa enim. Consequat mauris nunc congue nisi vitae suscipit tellus. At augue eget arcu dictum varius duis at consectetur. Eu volutpat odio facilisis mauris sit amet massa vitae. Ornare arcu odio ut sem nulla pharetra. Blandit turpis cursus in hac habitasse. Id venenatis a condimentum vitae sapien pellentesque. Condimentum mattis pellentesque id nibh tortor id aliquet. Dolor purus non enim praesent elementum facilisis leo vel.\r\n\r\nTincidunt id aliquet risus feugiat in ante metus. Dignissim convallis aenean et tortor. Dui id ornare arcu odio ut sem. Et netus et malesuada fames ac turpis egestas. Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam. Convallis aenean et tortor at risus viverra. Morbi quis commodo odio aenean sed adipiscing diam. Viverra nam libero justo laoreet. Feugiat vivamus at augue eget arcu dictum. Orci dapibus ultrices in iaculis nunc sed augue lacus viverra. Sed elementum tempus egestas sed sed risus pretium. Mus mauris vitae ultricies leo integer malesuada. Nunc non blandit massa enim nec dui. Aliquet nibh praesent tristique magna sit amet.\r\n\r\nFeugiat scelerisque varius morbi enim nunc faucibus a pellentesque. Amet tellus cras adipiscing enim eu. Elit ut aliquam purus sit amet luctus venenatis lectus magna. Non consectetur a erat nam. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac. Pellentesque sit amet porttitor eget. Malesuada fames ac turpis egestas integer eget aliquet. Amet est placerat in egestas erat imperdiet sed euismod. Sed enim ut sem viverra aliquet eget sit. Ut morbi tincidunt augue interdum. Nunc id cursus metus aliquam eleifend. Ac turpis egestas maecenas pharetra convallis posuere. Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo. Dignissim diam quis enim lobortis. Sed viverra tellus in hac habitasse platea dictumst. Ultrices in iaculis nunc sed augue lacus viverra vitae.', '', 1),
(3, '2020-04-12', ':OAAA', 'sadoad\r\n', '', 0),
(4, '2020-04-12', 'pruebaaa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi hendrerit dui eget consequat tincidunt. Cras a nisl justo. Nunc maximus arcu sem, ac tincidunt risus convallis non. Vestibulum pharetra consequat imperdiet. Cras maximus neque sed magna tristique lacinia. Morbi eu pretium augue. Fusce sit amet est a ligula volutpat vehicula sit amet suscipit eros. Ut maximus et dui eget hendrerit. Etiam posuere velit nec mauris vehicula, eget pharetra nibh dapibus. Duis leo orci, euismod id aliquam id, vulputate id sapien. Vestibulum hendrerit placerat lacus sit amet pellentesque. In vestibulum, lectus sed posuere dignissim, mauris massa maximus nibh, sed facilisis justo mi in nisl. Ut vel diam commodo, dignissim justo eget, vehicula est.\r\n\r\nUt leo nibh, tristique et quam sed, elementum convallis nulla. Vestibulum vel tempus lectus. Nulla dui arcu, sodales non nisi id, molestie hendrerit nulla. Nullam a enim nisi. Nam in lectus purus. Praesent in consectetur eros. Mauris id dignissim ligula, a ullamcorper dui. Morbi sodales leo in leo pulvinar cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin et venenatis turpis. Vivamus varius vel ante sit amet iaculis. Nam dictum nulla ut viverra pretium. Nunc feugiat ex vel tempor ultrices. Suspendisse potenti. Cras quis mi ligula. Phasellus dignissim ornare eros at efficitur.\r\n\r\nNullam non dignissim velit. Etiam cursus sem egestas risus porta, placerat sagittis dui hendrerit. Aenean cursus nisl tincidunt dui facilisis, id sollicitudin nisl hendrerit. Fusce risus quam, sollicitudin id mattis eu, ornare in mauris. Integer at dictum lacus. Proin at massa nibh. Praesent sed enim nec elit faucibus interdum sed et neque. Aenean sed suscipit ipsum, nec aliquet nibh. Nunc rhoncus convallis nunc, ac vulputate augue aliquet placerat. Aenean fringilla ullamcorper sapien, at porttitor nibh aliquet quis. Integer ullamcorper convallis ultricies. Duis eget rutrum enim, in porttitor risus. Nullam vitae nunc in lacus tristique hendrerit a sed tortor. Quisque non euismod nulla, in aliquet libero. Aliquam varius quis elit a viverra.\r\n\r\nDuis maximus tellus vitae magna interdum pharetra. Pellentesque bibendum sit amet odio eget cursus. Quisque dui massa, pharetra et tincidunt ut, porta commodo nisi. Integer rutrum quis sapien a convallis. Ut finibus felis ac turpis elementum, sit amet varius massa ornare. Phasellus mattis diam est, non congue sem porta sit amet. Donec varius sagittis quam, sit amet iaculis eros ultricies eu. Praesent ante ipsum, auctor a iaculis et, placerat et ex. Etiam mollis, ipsum nec rhoncus feugiat, purus nibh porta diam, sit amet congue tortor lorem eget lorem. Cras euismod purus sit amet diam fringilla varius. Sed erat risus, tincidunt ut lacinia vel, cursus non libero. Nunc vel mauris eget nulla laoreet posuere. Proin tincidunt finibus ex, pulvinar congue ligula semper at. Etiam luctus turpis eget enim condimentum blandit. Sed ut gravida orci.\r\n\r\nDuis ac dapibus turpis, quis sodales est. Morbi neque turpis, vestibulum vestibulum nisl eget, vulputate ornare enim. Etiam tristique est at nunc vulputate, ac luctus orci malesuada. Nunc porttitor sem ac dui elementum tempus. Nam et pellentesque eros. Proin eu placerat ligula. In ornare eget sem vitae venenatis. Phasellus pellentesque, erat at laoreet congue, ligula purus gravida lorem, eget imperdiet nulla ante ac ante. Nulla sit amet ornare est. Nam tempor odio diam, quis facilisis sem viverra malesuada. Pellentesque in pretium magna. Fusce vitae iaculis justo, ac pharetra augue.', '', 0),
(5, '2020-04-20', 'La prueba', 'Lorem ipsum dolor sit amet consectetur adipiscing elit magnis pellentesque, torquent elementum lacus mauris fusce eget nam morbi, nascetur pretium dictumst nibh inceptos sociis eu tellus. Scelerisque sociis pulvinar luctus dignissim nulla sociosqu libero suspendisse parturient primis, vestibulum velit est fringilla duis eleifend cubilia tincidunt. Eleifend primis eget nec orci aptent luctus conubia congue non penatibus sociosqu, convallis iaculis magna porta tempus accumsan ornare proin nullam dictumst.\r\n\r\nVenenatis lacinia tristique vitae duis tempor mus interdum penatibus, sociosqu vulputate taciti cum nisi facilisis phasellus justo, molestie nunc vivamus risus sodales habitasse non. Justo praesent a facilisi interdum commodo duis iaculis nulla malesuada viverra luctus sed taciti ullamcorper class rhoncus, accumsan sapien lacinia fusce auctor id morbi egestas eget ad ante magna gravida porta platea. Proin praesent fermentum platea porttitor diam felis, sociis phasellus feugiat penatibus magnis senectus risus, parturient habitant ridiculus ut mus.', 'hola soy texto\r\nhttps://www.google.com/\r\ngsad\r\nhttps://www.google.com/\r\nsi pones mal el http queda todo como el culo\r\nhttps://www.google.com/\r\nhttps://www.google.com/\r\nhttps://www.google.com/', 0),
(6, '2020-04-20', 'getlroemdassad', 'Lorem ipsum dolor sit amet consectetur adipiscing elit magnis pellentesque, torquent elementum lacus mauris fusce eget nam morbi, nascetur pretium dictumst nibh inceptos sociis eu tellus. Scelerisque sociis pulvinar luctus dignissim nulla sociosqu libero suspendisse parturient primis, vestibulum velit est fringilla duis eleifend cubilia tincidunt. Eleifend primis eget nec orci aptent luctus conubia congue non penatibus sociosqu, convallis iaculis magna porta tempus accumsan ornare proin nullam dictumst.\r\n\r\nVenenatis lacinia tristique vitae duis tempor mus interdum penatibus, sociosqu vulputate taciti cum nisi facilisis phasellus justo, molestie nunc vivamus risus sodales habitasse non. Justo praesent a facilisi interdum commodo duis iaculis nulla malesuada viverra luctus sed taciti ullamcorper class rhoncus, accumsan sapien lacinia fusce auctor id morbi egestas eget ad ante magna gravida porta platea. Proin praesent fermentum platea porttitor diam felis, sociis phasellus feugiat penatibus magnis senectus risus, parturient habitant ridiculus ut mus.', 'holasd adasdsadsads rvtgbuhfvgbh\r\nhttps://getlorem.com/es/ \r\nxddd asdsad a\r\nhttps://getlorem.com/es/ \r\nhttps://getlorem.com/es/ \r\nhttps://getlorem.com/es/', 0);

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

--
-- Volcado de datos para la tabla `necesidad`
--

INSERT INTO `necesidad` (`id`, `tipo_necesidad_id`, `estado`, `descripcion`, `comedor_id`, `subtipo`) VALUES
(1, 1, '0', 'agua\r\n', 24, 1),
(2, 3, '0', 'insumos faltantes', 24, 1),
(3, 4, '0', 'el taller de exdf', 11, 2),
(4, 2, '0', 'exrdctfvygbuh', 13, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `links` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_n` int(11) NOT NULL DEFAULT 0 COMMENT '1 eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`id`, `fecha`, `titulo`, `descripcion`, `foto`, `links`, `estado_n`) VALUES
(1, '2019-11-13', 'SOS', 'eso.... nada', '12', '', 1),
(2, '2019-11-13', 'bla bla', 'aaaaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhhhh', 'bla', '', 1),
(3, '2019-11-13', 'borrame!', 'no te borro nada', '223', '', 1),
(4, '2019-11-13', 'Nuevamnete', 'escribi mal todo :o', 's', '', 1),
(5, '2019-11-13', 'Una noticia', 'Lorem ipsum dolor sit amet consectetur adipiscing elit rhoncus, natoque purus augue cras netus nunc vitae interdum torquent, bibendum ridiculus rutrum conubia mus dapibus cum. Imperdiet magnis blandit suspendisse iaculis suscipit orci posuere venenatis, eros commodo neque nisi dapibus placerat netus, ullamcorper cubilia lobortis nec himenaeos habitant hendrerit. Metus suspendisse tempor scelerisque maecenas elementum enim porttitor sed sodales, at litora libero velit sapien vitae dictumst. Per ac enim sociis aliquam elementum congue rutrum dictum, egestas litora ullamcorper montes sed vitae quis tincidunt, cum dui nam quisque metus dapibus interdum.\r\n\r\nNisl ultricies magna orci felis ligula volutpat lacinia feugiat aliquam, facilisi donec sem mattis semper id tortor tempor erat, cubilia ornare lectus interdum himenaeos curae torquent est. Id tincidunt a dictum eget praesent curabitur condimentum proin, tortor in vestibulum porta at fringilla justo laoreet nibh, metus placerat suspendisse nisl lacinia non donec. Consequat quam aptent dapibus netus imperdiet urna aliquam fringilla fusce, feugiat pharetra commodo velit posuere cum augue aliquet nostra, vel per nullam nulla ac sem lobortis hac. Donec praesent laoreet erat malesuada suscipit consequat accumsan fringilla, nam dui molestie himenaeos habitant turpis ridiculus ornare litora, conubia mattis arcu est per dictum tincidunt.\r\n\r\nPretium a sapien nisi vel ante facilisi in vivamus fusce urna quam, magna laoreet mi lobortis metus augue dis torquent iaculis praesent fermentum nam, dapibus leo taciti interdum turpis eu convallis suspendisse euismod fringilla. Aenean praesent maecenas conubia taciti class interdum cubilia lacus dignissim mauris quisque, potenti nam rutrum platea nec dictumst sociis nunc semper ac. Natoque habitant pulvinar ad vulputate dui placerat dignissim sed, phasellus quisque ut mattis mauris potenti platea velit, fringilla accumsan risus dapibus torquent metus nisl.\r\n\r\nPlatea molestie facilisis viverra egestas magna nunc eros placerat cum commodo, est mollis cras tristique ridiculus justo id laoreet class inceptos pharetra, dui tempor posuere volutpat litora erat mattis fermentum rhoncus. Etiam facilisi fames laoreet quam tristique porta, auctor non placerat purus. Montes sollicitudin bibendum ante molestie ultrices facilisis congue sed netus, in ullamcorper integer gravida sociosqu tincidunt euismod luctus, mauris consequat venenatis nibh id vel lobortis vitae. Ut dapibus justo vel velit felis torquent, sem mus massa molestie urna, consequat aliquam penatibus bibendum tincidunt.\r\n\r\nBlandit proin ultricies ac mattis diam sapien facilisi, purus dictumst interdum enim et montes, tempus nunc non primis litora ad. Litora fermentum inceptos nulla vestibulum fames curae morbi neque diam, est massa interdum at vel maecenas platea lacus mus, mauris pulvinar orci mattis semper metus feugiat suscipit. Dignissim habitant augue risus suscipit sem interdum vehicula, dis vestibulum magna ridiculus ac in, elementum volutpat pulvinar dictumst mauris lacinia.', '', 'https://www.facebook.com/\r\nassad\r\nhttps://www.facebook.com/\r\nhttps://www.facebook.com/', 0),
(6, '2020-04-19', 'das', '                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n                <th class=\"th-sm\">Modificar</th>\r\n', 'playa-tropical_74190-188.jpg', '', 0),
(7, '2020-04-23', 'dasdsa', 'sadsadasdsda\r\nsda\r\ndsa\r\nsad dasda d sasddsa ', '', 'https://stackoverflow.com/questions/1410311/regular-expression-for-url-validation-in-javascript/1411800#1411800\r\nmdasads\r\nhttps://catedras.info.unlp.edu.ar/login/index.php', 0);

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
(1, 10, 1, 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.instagram.com', 'El Foro por los Derechos de la Niñez de la ciudad de La Plata en el marco de la promoción del derecho a una soberanía alimentaria, alimentación saludable y a un desarrollo sostenible, convocó a distintos actores de la sociedad civil, académicos, colegios de profesionales y organizaciones sociales que se encuentran trabajando en nuestro territorio para conformar una Red de trabajo de gestión colaborativa y coordinada, de constitución interdisciplinaria e intersectorial, desde la perspectiva del interés superior del niño/a, con el fin de promover la salud integral de los niños, niñas y adolescentes. \r\n\r\nLa Red propone un trabajo de articulación local de investigación para la acción colectiva, entre los diversos actores que conforman el capital social de la ciudad de La Plata, para promover la de-construcción de las practicas alimentarias hegemónicas y proactivamente propongan alternativas comunitarias innovadoras y sustentables, que revaloricen las potencialidades y recursos existentes, requiriendo la “utilización imaginativa, racional, equilibrada y dinámica de todas las formas de capital y bienes patrimoniales ya sean estos monetarios, humanos, naturales, culturales, sociales o territoriales”. \r\n\r\nCreemos que debemos definir y construir colectivamente nuevos paradigmas que nos permitan elegir nuestros alimentos, nuestro sistema productivo y potencien nuestro desarrollo como seres humanos en una relación respetuosa con el ambiente en el que vivimos. \r\n\r\n');

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
(2, 'CARNE'),
(3, 'LAPIZ'),
(4, 'TALLER DE ALGO'),
(5, 'HOJAS A4');

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

INSERT INTO `usuario` (`id`, `nombre_u`, `apellido`, `mail_u`, `password`, `user_name`, `descripcion`, `foto`, `telefono`, `estado_u`, `privado`, `rol`, `red_social`) VALUES
(1, 'Foro por la Niñez', 'La Plata', 'foroninezlaplata@gmail.com', 'admin', 'admin', '', 'logo Foro por la Niñez.png', '', '1', '0', '3', 'https://www.facebook.com'),
(2, 'Mirta', 'asd', 'franaledelrojo@gmail.com', 'asd', 'mirta', '1', 'playa.jpg', '', '2', '0', '0', ''),
(3, 'Fran', 'asd', 'franaledelrojo@gmail.com', '12345678', 'fran', 'nhbgf', 'playa.jpg', '', '2', '0', '0', ''),
(4, 'Rodolfo', 'a', 'a@gmail.com', '1', 'rodo', 'asdas', '', '12312', '2', '0', '0', ''),
(5, 'Prueba', 'z', 'a@gmail.com', 'z', 'Prueba', 'das', 'listado_eventos.png', '1', '2', '0', '0', ''),
(6, 'Ana', 'q', '1@gmail.com', '1', 'ana', 'asd', '', '1', '2', '0', '0', ''),
(7, 'Candela', '1', '1@gmail.com', '1', 'cande', 'aa', '', '1', '2', '0', '0', ''),
(9, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '', '', '2', '', '', ''),
(10, 'Hola', 'as', 'asd@asdf.com', '1234', 'hola', 'as', 'none', '13123123', '2', '0', '1', ''),
(11, 'hola', 'hla', 'hol@hola.com', '12345678', 'com2', '', 'none', '1234', '2', '0', '1', ''),
(12, 'Comedor4', 'q', 'hol@hola.com', '12345678', 'com4', '', 'none', '12', '2', '0', '1', ''),
(13, 'Comedor5', '1', 'hol@hola.com', '12345678', 'com5', '', 'none', '1', '2', '0', '1', ''),
(14, 'pedro', 'quoora', 'toto.bocaa@gmail.com', 'http://198.199.8', 'pedroq', 'http://198.199.88.137/', '', '', '2', '0', '0', ''),
(15, 'pedro21', 'quoora', 'toto.bocaa@gmail.com', 'srvk213.allytech', 'pedroq12', 'http://198.199.88.137/', '', '', '2', '0', '0', ''),
(16, 'pedro21', 'quoora', 'toto.bocaa@gmail.com', 'pedroq12111', 'pedroq12111', 'http://198.199.88.137/', '', '', '2', '0', '0', ''),
(17, 'pedro21', 'quoora', 'toto.bocaa@gmail.com', 'asadaasada', 'asadaasada', 'http://198.199.88.137/', '', '', '2', '0', '0', ''),
(18, 'dasdasda', 'dasdasda', 'toto.bocaa@gmail.com', 'dasdasdadasdasda', 'dasdasdadasdasda', 'dasdasda', '', '', '2', '0', '0', ''),
(19, 'dasdasda', 'dasdasda', 'toto.bocaa@gmail.com', 'dasaddasad', 'dasad', 'dasdasda', '', '', '2', '0', '0', ''),
(20, 'dasdasda', 'dasdasda', 'toto.bocaa@gmail.com', 'dasaddasad', 'dasaddasaddasad', 'dasdasda', '', '', '2', '0', '0', ''),
(21, 'carlosca', 'carlosca', 'toto.bocaa@gmail.com', 'carloscacarlosca', 'carloscacarlosca', 'carloscacarlosca', '', '', '2', '0', '0', ''),
(22, 'carlosca', 'carlosca', 'toto.bocaa@gmail.com', 'pedroaaaa', 'pedroaaaa', 'carloscacarlosca', '', '', '2', '0', '0', ''),
(23, 'https://www.nativespace.', 'https://www.nativespace.', 'toto.bocaa@gmail.com', 'https://www.nati', 'https://www.nativespace.', 'https://www.nativespace.com/mynative/knowledgebase/61/Error-535---Incorrect-authentication-data.html', '', '', '2', '0', '0', ''),
(24, 'carloscaa', 'carloscaa', 'toto.bocaa@gmail.com', 'carloscaa', 'carloscaaaa', 'carloscaa', '', '', '2', '0', '0', ''),
(25, 'Rosario', 'Hasperue', 'rhasperue@yahoo.com.ar', 'salvador2014', 'charohas', 'Somos una organización de trabajo horizontal, territorial e interdisciplinario que busca mejorar la calidad de vida de la niñez promoviendo espacios de encuentro, intercambio y propuestas para incidir en la agenda pública y política.  ', 'none', '2214670735', '2', '0', '1', ''),
(26, 'Foro por la Niñez', 'La Plata', 'foroninezlaplata@gmail.com', 'susderechos', 'Foro_niñez', 'El Foro por la Niñez es una iniciativa de organizaciones políticas, sindicales,\r\nsociales, de derechos humanos y ONGs que se funda en el año 2004 en la ciudad\r\nde La Plata, provincia de Buenos Aires, con el lema “Por otra Relación del Estado\r\ncon la Niñez', 'logo Foro por la Niñez.png', '', '0', '0', '0', ''),
(27, 'Mariel', 'Chaira', 'foroninezlaplata@gmail.com', 'comedor', 'comedor', '', 'none', '2215609510', '1', '0', '1', ''),
(28, 'Cecilia', 'Arriondo', 'foroninezlaplata@gmail.com', 'pequepies', 'pequeñospies', '', 'none', '2216073020', '1', '0', '1', ''),
(29, 'Rocío', 'Roman', 'foroninezlaplata@gmail.com', 'corazones', 'corazonescontentos', '', 'none', '2214543809', '1', '0', '1', ''),
(30, 'Juliana', 'Varela', 'foroninezlaplata@gmail.com', 'nuestrocielo', 'nuestrocielo', '', 'none', '2216715584', '1', '0', '1', ''),
(31, 'Miranda', 'Ríos Espíndola', 'foroninezlaplata@gmail.com', 'caradeangel', 'caradeangel', '', 'none', '2215661425', '1', '0', '1', ''),
(32, 'Paola', 'Rodríguez', 'foroninezlaplata@gmail.com', 'caritasfelices', 'caritasfelices', '', 'none', '2214203677', '1', '0', '1', ''),
(33, 'Cristina', 'Copa de Leche', 'foroninezlaplata@gmail.com', 'copadeleche', 'Cristina', '', 'none', '2216021125', '0', '0', '1', ''),
(34, 'Marina Laura', 'Marino', 'foroninezlaplata@gmail.com', 'malvinas', 'lospekes', '', 'none', '2213199148', '0', '0', '1', ''),
(35, 'Graciela', 'Ponce', 'foroninezlaplata@gmail.com', 'corazondeleon', 'corazondeleon', '', 'none', '2213141129', '0', '0', '1', ''),
(36, 'Tomas', 'Delgadino', 'maildeejemplo@gmail.com', 'usuario1', 'usuario', 'nose nada', '', '221231231', '2', '0', '0', ''),
(37, 'ejemplo2', 'ejemplo2', 'ejemplo2@ejemplo.com', 'ejemplo2', 'ejemplo2', 'dasdsdasadsddsadssadsdasd', '', '22122131', '1', '0', '0', 'https://www.facebook.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `comedor_usuario`
--
ALTER TABLE `comedor_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `informes_normativas`
--
ALTER TABLE `informes_normativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `necesidad`
--
ALTER TABLE `necesidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
