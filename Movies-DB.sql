-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-04-2021 a las 21:27:43
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
-- Base de datos: `films`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gender`
--

INSERT INTO `gender` (`gender_id`, `name`) VALUES
(1, 'Acción'),
(2, 'Aventura'),
(3, 'Comedia'),
(4, 'Terror'),
(5, 'Animado'),
(6, 'Suspenso'),
(7, 'Infantil'),
(8, 'Familiar'),
(9, 'Romance');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `create_at` datetime NOT NULL,
  `release_date` date DEFAULT NULL,
  `actors` varchar(500) DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movie`
--

INSERT INTO `movie` (`movie_id`, `name`, `description`, `image`, `create_at`, `release_date`, `actors`, `gender_id`, `rating`) VALUES
(1, 'La Liga de la Justicia de Zack Snyder', 'Decidido a garantizar que el último sacrificio de Superman no fuera en vano, Bruce Wayne alinea fuerzas con Diana Prince con planes de reclutar un equipo de metahumanos para proteger al mundo de una amenaza inminente de proporciones catastróficas. La tarea resulta más difícil de lo que Bruce imaginaba, ya que cada uno de los reclutas debe enfrentarse a los demonios de su propio pasado para trascender lo que los ha frenado, permitiéndoles unirse y finalmente formar una liga de héroes sin precedentes. Ahora unidos, Batman, Wonder Woman, Aquaman, Cyborg y The Flash pueden ser demasiado tarde para salvar al planeta de Steppenwolf, DeSaad y Darkseid y sus terribles intenciones.', 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/pI25ennflmJ1R9q7ZTI681f0WBb.jpg', '2021-04-16 18:51:28', '2021-03-15', 'Amber Heard, Amy Adams, Ann Ogbomo, Ben Affleck, Billy Crudup, Brooke Ence, Ciarán Hinds, Clem So, Connie Nielsen, David Thewlis, Diane Lane, Doutzen Kroes, Ezra Miller, Francis Magee', 1, 10),
(3, 'Godzilla vs. Kong', 'Godzilla y Kong, dos de las fuerzas más poderosas de un planeta habitado por todo tipo de aterradoras criaturas, se enfrentan en un espectacular combate que sacude los cimientos de la humanidad. Monarch (Kyle Chandler) se embarca en una misión de alto riesgo y pone rumbo hacia territorios inexplorados para descubrir los orígenes de estos dos titanes, en un último esfuerzo por tratar de salvar a dos bestias que parecen tener las horas contadas sobre la faz de la Tierra.', 'https://image.tmdb.org/t/p/w185_and_h278_bestv2/bnuC6hu7AB5dYW26A3o6NNLlIlE.jpg', '2021-04-16 14:18:32', '2021-03-25', 'Alexander Skarsgård, Benjamin Rigby, Brad McMurray, Bradd Buckley, Brian Tyree Henry, Chris Chalk, Conlan Casal, Daniel Nelson, David Castillo, Demián Bichir, Drew Walton, Eiza González, Erol Brandis, Hakeem Kae-Kazim', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`profile_id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `create_at` datetime NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `create_at`, `profile_id`) VALUES
(1, 'Juan Atehortua', 'juan.atehortua@est.iudigital.edu.co', 'DEMO1234', '2021-04-15 23:45:29', 1),
(2, 'Esteban Sanchez', 'juanesmedcol@gmail.com', 'EJEMPLO', '2021-04-15 23:45:29', 2),
(4, 'Juanes AtSa', 'juanes_medcol@hotmail.com', '123456789', '2021-04-16 14:17:41', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indices de la tabla `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `profile_id` (`profile_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
