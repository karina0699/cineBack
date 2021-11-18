-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2021 a las 05:49:44
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id_pelicula` int(11) NOT NULL,
  `nombre_pelicula` varchar(100) DEFAULT NULL,
  `duracion` varchar(100) DEFAULT NULL,
  `trailer` varchar(300) DEFAULT NULL,
  `portada` varchar(300) DEFAULT NULL,
  `sipnosis` varchar(300) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1 COMMENT '0 = inactivo 1:activo ',
  `fk_director_pelicula` int(11) DEFAULT NULL,
  `fk_actor_reparto` int(11) DEFAULT NULL,
  `fk_idioma` int(11) DEFAULT NULL,
  `fk_clasificiacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id_pelicula`, `nombre_pelicula`, `duracion`, `trailer`, `portada`, `sipnosis`, `estatus`, `fk_director_pelicula`, `fk_actor_reparto`, `fk_idioma`, `fk_clasificiacion`) VALUES
(1, 'Spider-Man', '120', '/sin/trailer', 'url/portada', 'Secuela de Spider-Man: Lejos de casa basada en los cómics de Stan Lee y Steve Ditko.', 1, 2, 2, 2, 4),
(2, 'Capitán América', '122', '/sin/trailer', 'url/portada', 'La tetralogía de Capitán América, basada en el personaje ficticio Capitán América de Marvel Comics', 1, 1, 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD UNIQUE KEY `id_pelicula` (`id_pelicula`),
  ADD KEY `fk_idioma` (`fk_idioma`),
  ADD KEY `fk_clasificiacion` (`fk_clasificiacion`),
  ADD KEY `fk_actor_reparto` (`fk_actor_reparto`),
  ADD KEY `fk_director_pelicula` (`fk_director_pelicula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`fk_idioma`) REFERENCES `idioma` (`id_idioma`),
  ADD CONSTRAINT `pelicula_ibfk_2` FOREIGN KEY (`fk_clasificiacion`) REFERENCES `clasificacion` (`id_clasificacion`),
  ADD CONSTRAINT `pelicula_ibfk_3` FOREIGN KEY (`fk_actor_reparto`) REFERENCES `actor_reparto` (`id_reparto`),
  ADD CONSTRAINT `pelicula_ibfk_4` FOREIGN KEY (`fk_director_pelicula`) REFERENCES `director` (`id_director`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
