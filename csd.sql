-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2017 a las 14:20:06
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `csd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` bigint(20) NOT NULL,
  `estadio` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `presupuesto` int(11) NOT NULL,
  `fede` bigint(20) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `estadio`, `nombre`, `presupuesto`, `fede`, `imagen`) VALUES
(2, 'asdfadfadf', 'asdfasdf', 12, 2, NULL),
(3, 'asdasd', 'asdas', 14, 2, NULL),
(4, 'asdasdf', 'sdfasf', 1212, 2, NULL),
(5, 'elmejÃ³', 'elmejÃ³', 1, 3, NULL),
(6, 'Balaidos', 'Real Club Celta de Vigo', 99999, 4, NULL),
(7, 'pupupu', 'Cebolla', 1, 6, NULL),
(8, 'zz', 'zz', 1, 7, 'http://www.google.es'),
(9, 'asdfadfadf', 'asdfasdf', 12, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_jugador`
--

CREATE TABLE `equipo_jugador` (
  `Equipo_id` bigint(20) NOT NULL,
  `jugadores_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `federacion`
--

CREATE TABLE `federacion` (
  `id` bigint(20) NOT NULL,
  `Pais` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `federacion`
--

INSERT INTO `federacion` (`id`, `Pais`, `nombre`, `imagen`) VALUES
(2, 'pais inventado 1', 'juhujd23', NULL),
(3, 'kurguijistÃ?Â¡n', 'lamejÃ?Â³dd', NULL),
(4, 'EspaÃ?Â±aaa', 'Real Federacion EspaÃ?Â±ola de Futbol', NULL),
(5, 'Francia', 'Federacion Francesa de Futbol', NULL),
(6, 'Arabia Saudita', 'Federacion de Futbol de Arabia Saudita', NULL),
(7, 'Espanha', 'FEF', 'http://www.entrenadordefutbol11.com/wp-content/uploads/2015/01/federacionfutbol.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `federacion_equipo`
--

CREATE TABLE `federacion_equipo` (
  `Federacion_id` bigint(20) NOT NULL,
  `equipos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` bigint(20) NOT NULL,
  `edad` int(11) NOT NULL,
  `goles` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `equi` bigint(20) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `edad`, `goles`, `nombre`, `equi`, `imagen`) VALUES
(7, 65, 34, 'dfafasdf', 5, NULL),
(8, 65, 34, 'dfafasdf', 2, 'http://amiga.resource.cx/photos/photos/amigen.jpg'),
(9, 12, 999, 'pupupupu', 2, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5vym6qwnasg2ff5dbxcg8vod9` (`fede`);

--
-- Indices de la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD PRIMARY KEY (`Equipo_id`,`jugadores_id`),
  ADD UNIQUE KEY `UK_6sqo0xsoum7jsdn83a4i1oa4t` (`jugadores_id`);

--
-- Indices de la tabla `federacion`
--
ALTER TABLE `federacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `federacion_equipo`
--
ALTER TABLE `federacion_equipo`
  ADD PRIMARY KEY (`Federacion_id`,`equipos_id`),
  ADD UNIQUE KEY `UK_ece2s1aa008t74x3l19x1t9p0` (`equipos_id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gq6txbcbvgr8exbyyh9jneu5c` (`equi`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `federacion`
--
ALTER TABLE `federacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `FK_5vym6qwnasg2ff5dbxcg8vod9` FOREIGN KEY (`fede`) REFERENCES `federacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD CONSTRAINT `FK_6sqo0xsoum7jsdn83a4i1oa4t` FOREIGN KEY (`jugadores_id`) REFERENCES `jugador` (`id`),
  ADD CONSTRAINT `FK_asrvbh3dqn5dgc60is8rs2r3o` FOREIGN KEY (`Equipo_id`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `federacion_equipo`
--
ALTER TABLE `federacion_equipo`
  ADD CONSTRAINT `FK_ece2s1aa008t74x3l19x1t9p0` FOREIGN KEY (`equipos_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `FK_pcblterqnp09ufmj31xxbxcfa` FOREIGN KEY (`Federacion_id`) REFERENCES `federacion` (`id`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `FK_gq6txbcbvgr8exbyyh9jneu5c` FOREIGN KEY (`equi`) REFERENCES `equipo` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
