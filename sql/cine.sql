-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2021 a las 02:52:14
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
-- Estructura de tabla para la tabla `actor_reparto`
--

CREATE TABLE `actor_reparto` (
  `id_reparto` int(11) NOT NULL,
  `actor` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actor_reparto`
--

INSERT INTO `actor_reparto` (`id_reparto`, `actor`) VALUES
(1, 'leidis martinez'),
(2, 'lenith martinez'),
(3, 'liliana marcela'),
(4, 'leiner david');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `id_clasificacion` int(11) NOT NULL,
  `clasificacion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id_clasificacion`, `clasificacion`) VALUES
(1, 'Todo publico\r\n'),
(2, '+12'),
(3, '+14'),
(4, '+18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `id_director` int(11) NOT NULL,
  `director` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`id_director`, `director`) VALUES
(1, 'Harold Murillo'),
(2, 'Juan Manuel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `id_idioma` int(11) NOT NULL,
  `idioma` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`id_idioma`, `idioma`) VALUES
(1, 'Español'),
(2, 'Ingles');

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
(2, 'Capitán América', '122', '/sin/trailer', 'url/portada', 'La tetralogía de Capitán América, basada en el personaje ficticio Capitán América de Marvel Comics', 0, 1, 1, 1, 1),
(10, 'Iron Man 2', '140', 'https://youtu.be/v1EkoQV4g5c', 'sasdadasfsafsd', 'Con el mundo ahora consciente de que él es Iron Man, el millonario inventor Tony Stark debe forjar nuevas alianzas y enfrentarse a un nuevo y poderoso enemigo.', 1, 1, 2, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `contrasena` varchar(150) NOT NULL,
  `token` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `contrasena`, `token`) VALUES
(1, 'user.user', '$2y$10$C3WzrP1Jd6kIRMH1pKDQpuq2Xvlt6/JNrVF6SC42b4vfy6Q5UdQ1G', 'ZO0sf7bnREArCWouv149cmnxDFeE2UXsEBONl3OwkFlcin2l5o3MJHPOZNAWSzoOysTKVxnRcL4Jxa20Dorz9AM45sjUKYUqNwAq1FPS3AL8hEHIo9tr7B7mImPFbyEG0snFz6km6RFKivKbQDlbbL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor_reparto`
--
ALTER TABLE `actor_reparto`
  ADD UNIQUE KEY `id_reparto` (`id_reparto`);

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD UNIQUE KEY `id_clasificacion` (`id_clasificacion`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD UNIQUE KEY `id_director` (`id_director`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD UNIQUE KEY `id_idioma` (`id_idioma`);

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
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor_reparto`
--
ALTER TABLE `actor_reparto`
  MODIFY `id_reparto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `id_director` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `id_idioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
