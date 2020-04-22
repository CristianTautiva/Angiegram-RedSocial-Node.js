-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2020 a las 16:45:17
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `angiegram`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `follows`
--

CREATE TABLE `follows` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_seguido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id_user` int(11) DEFAULT NULL,
  `image_url` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `public_id` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_subida` timestamp NOT NULL DEFAULT current_timestamp(),
  `me_gusta` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id_user`, `image_url`, `public_id`, `fecha_subida`, `me_gusta`) VALUES
(1, 'http://res.cloudinary.com/dcris/image/upload/v1587328081/vgwungdnm0fw9shgzjpg.jpg', 'vgwungdnm0fw9shgzjpg', '2020-04-19 20:28:01', 0),
(1, 'http://res.cloudinary.com/dcris/image/upload/v1587328175/irgggcdcup02a3kkt9mv.jpg', 'irgggcdcup02a3kkt9mv', '2020-04-19 20:29:35', 0),
(1, 'http://res.cloudinary.com/dcris/image/upload/v1587471650/hhswezjilyuu8npre1s5.jpg', 'hhswezjilyuu8npre1s5', '2020-04-21 12:20:52', 0),
(8, 'http://res.cloudinary.com/dcris/image/upload/v1587499959/lkhffh3o4yac5fixr7si.jpg', 'lkhffh3o4yac5fixr7si', '2020-04-21 20:12:40', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `profile_img` varchar(160) COLLATE utf8_spanish_ci DEFAULT 'https://i.ibb.co/Fs99HVV/photo-1511367461989-f85a21fda167-pffqga.jpg',
  `public_id` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `seguidores` int(20) DEFAULT 0,
  `siguiendo` int(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombres`, `username`, `email`, `password`, `profile_img`, `public_id`, `fecha_registro`, `seguidores`, `siguiendo`) VALUES
(1, 'Cristian Tautiva', 'Dcris', 'movierecordshd@gmail.com', '$2a$10$3GsabSxmXX5j5713rKeAF.UsldIO4BEfaBtm..Bfbcp1zGml9W0e.', 'http://res.cloudinary.com/dcris/image/upload/v1587310775/izfufh262ralpkrovmha.jpg', 'izfufh262ralpkrovmha', '2020-04-19 15:10:54', 0, 0),
(2, 'Miguel Portilla', 'Paco', 'miguelportilla2020@gmail.com', '$2a$10$zT54FxihgMl.95khZhHizeWnvfckzIUhMl.iPbeaYo./rNmMN40Tu', 'http://res.cloudinary.com/dcris/image/upload/v1587314133/jjyfi0lumaoee8xjlhth.jpg', 'jjyfi0lumaoee8xjlhth', '2020-04-19 16:34:52', 0, 0),
(3, 'Jhon Hernandez', 'jhontaut22', 'jhonhernan@gmail.com', '$2a$10$c0KBa2EP/nDokRI9/D/PyuzkyqwPacwPBTAUcCzKr1Oz9Hu4gHAr2', 'http://res.cloudinary.com/dcris/image/upload/v1587314339/a6ayd8vrhy4rjmunvbhd.jpg', 'a6ayd8vrhy4rjmunvbhd', '2020-04-19 16:37:44', 0, 0),
(4, 'Eliana Jimenez', 'Eliana', 'elianajimenez2018_love@gmail.com', '$2a$10$E6NRI4raZt9Bh32Y.UxfWuFq9dc6Uybr7SzEhtfbn6S/HGKIy/dOm', 'http://res.cloudinary.com/dcris/image/upload/v1587393274/sztvnltbi6riche7ijbo.jpg', 'sztvnltbi6riche7ijbo', '2020-04-20 14:23:04', 0, 0),
(5, 'Allison Barrera', 'Ali', 'alisonbarrer08@outlook.com', '$2a$10$zPgXnhWF4tLQbBCwiZb0xOo5arIbFfYDDa2LsaCLAuHTEFlzEN942', 'http://res.cloudinary.com/dcris/image/upload/v1587393185/n3t5tkqcwxnbz5vqaqkx.jpg', 'n3t5tkqcwxnbz5vqaqkx', '2020-04-20 14:25:51', 0, 0),
(6, 'Isabel Moncada', 'Isa', 'isamoncada29@hotmail.com', '$2a$10$jbOUWcEhHuoH72U7kP/Oq.lpO3Evau/ROZLVuPOEhrdD9bewdo5CW', 'http://res.cloudinary.com/dcris/image/upload/v1587393244/ixpfatehwpvgdgyo0nrq.jpg', 'ixpfatehwpvgdgyo0nrq', '2020-04-20 14:33:54', 0, 0),
(7, 'Andres Torres', 'Oric', 'ciroandres2020@gmail.com', '$2a$10$HHPstBOHEKAAI8ZhyfzeE.Krxwwa7Wh74Wgx8NNBPxOsDrjCy5nY.', 'http://res.cloudinary.com/dcris/image/upload/v1587417403/sburnzxjf1o45di3sbfl.jpg', 'sburnzxjf1o45di3sbfl', '2020-04-20 21:16:17', 0, 0),
(8, 'Carlos Rene AS', 'Rene', 'reneas@gmail.com', '$2a$10$TndjceaRnnyEtwt31vb5qu4is/AvEa.SuWd2TcJm6s/PnFN8nr6oe', 'http://res.cloudinary.com/dcris/image/upload/v1587499881/wp3ttqgyqxmiot4fawkz.jpg', 'wp3ttqgyqxmiot4fawkz', '2020-04-21 12:23:48', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD KEY `fk_images` (`id_user`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
