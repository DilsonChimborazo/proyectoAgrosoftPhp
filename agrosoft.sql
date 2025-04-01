-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-03-2025 a las 21:31:53
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agrosof`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int NOT NULL,
  `nombre_actividad` varchar(50) DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `nombre_actividad`, `descripcion`) VALUES
(1, 'Maiiiiiiiiiiiiiiiiiiis', 'Plantación de maíz en el lote principal'),
(2, 'Riego de cultivos', 'Riego programado para mejorar la producción'),
(3, 'Aplicación de fertilizante', 'Uso de fertilizantes para mejorar el crecimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_actividad`
--

CREATE TABLE `asignacion_actividad` (
  `id_asignacion_actividad` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `fk_id_actividad` int DEFAULT NULL,
  `fk_identificacion` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `asignacion_actividad`
--

INSERT INTO `asignacion_actividad` (`id_asignacion_actividad`, `fecha`, `fk_id_actividad`, `fk_identificacion`) VALUES
(1, '2024-02-10', 1, 1001),
(2, '2024-02-15', 2, 1002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario_lunar`
--

CREATE TABLE `calendario_lunar` (
  `id_calendario_lunar` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion_evento` text,
  `evento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `calendario_lunar`
--

INSERT INTO `calendario_lunar` (`id_calendario_lunar`, `fecha`, `descripcion_evento`, `evento`) VALUES
(1, '2024-02-15', 'Maiiiiiiiiiiiiiiiiiiis', 'Siembra'),
(2, '2024-02-28', 'Luna menguante', 'Poda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_fitosanitario`
--

CREATE TABLE `control_fitosanitario` (
  `id_control_fitosanitario` int NOT NULL,
  `fecha_control` date DEFAULT NULL,
  `descripcion` text,
  `fk_id_desarrollan` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `control_fitosanitario`
--

INSERT INTO `control_fitosanitario` (`id_control_fitosanitario`, `fecha_control`, `descripcion`, `fk_id_desarrollan`) VALUES
(1, '2024-07-15', 'Aplicación de fungicida', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_usa_insumo`
--

CREATE TABLE `control_usa_insumo` (
  `id_control_usa_insumo` int NOT NULL,
  `fk_id_insumo` int DEFAULT NULL,
  `fk_id_control_fitosanitario` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `control_usa_insumo`
--

INSERT INTO `control_usa_insumo` (`id_control_usa_insumo`, `fk_id_insumo`, `fk_id_control_fitosanitario`, `cantidad`) VALUES
(1, 3, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cultivo`
--

CREATE TABLE `cultivo` (
  `id_cultivo` int NOT NULL,
  `fecha_plantacion` date NOT NULL,
  `nombre_cultivo` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `fk_id_especie` int DEFAULT NULL,
  `fk_id_semillero` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cultivo`
--

INSERT INTO `cultivo` (`id_cultivo`, `fecha_plantacion`, `nombre_cultivo`, `descripcion`, `fk_id_especie`, `fk_id_semillero`) VALUES
(1, '2024-02-10', 'Cultivo de maíz', 'Maíz amarillo', 1, 1),
(2, '2025-03-19', 'dsf', 'sdfd', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrollan`
--

CREATE TABLE `desarrollan` (
  `id_desarrollan` int NOT NULL,
  `fk_id_cultivo` int DEFAULT NULL,
  `fk_id_pea` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `desarrollan`
--

INSERT INTO `desarrollan` (`id_desarrollan`, `fk_id_cultivo`, `fk_id_pea`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eras`
--

CREATE TABLE `eras` (
  `id_eras` int NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `fk_id_lote` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `eras`
--

INSERT INTO `eras` (`id_eras`, `descripcion`, `fk_id_lote`) VALUES
(1, 'Era 1', 1),
(2, 'Era 2', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `id_especie` int NOT NULL,
  `nombre_comun` varchar(50) DEFAULT NULL,
  `nombre_cientifico` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `fk_id_tipo_cultivo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`id_especie`, `nombre_comun`, `nombre_cientifico`, `descripcion`, `fk_id_tipo_cultivo`) VALUES
(1, 'Maíz', 'Zea mays', 'Cultivo de maíz', 1),
(2, 'Tomate', 'Solanum lycopersicum', 'Cultivo de tomate', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genera`
--

CREATE TABLE `genera` (
  `id_genera` int NOT NULL,
  `fk_id_cultivo` int DEFAULT NULL,
  `fk_id_produccion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `genera`
--

INSERT INTO `genera` (`id_genera`, `fk_id_cultivo`, `fk_id_produccion`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `id_herramienta` int NOT NULL,
  `nombre_h` varchar(50) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`id_herramienta`, `nombre_h`, `fecha_prestamo`, `estado`) VALUES
(1, 'Azadoncito', '2024-02-01', 'Disponible'),
(2, 'Pala', '2024-02-02', 'Prestado'),
(3, 'Rastrillo', '2024-02-03', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id_insumo` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `precio_unidad` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id_insumo`, `nombre`, `tipo`, `precio_unidad`, `cantidad`, `unidad_medida`) VALUES
(1, 'Fertilizante', 'Químico', 5000, 100, 'Kg'),
(2, 'Maiiiiiiiiiiiiiiiiiiis', 'Biológico', 3000, 50, 'Bolsa'),
(3, 'Insecticida', 'Químico', 7000, 30, 'Litro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_lote` int NOT NULL,
  `dimension` int DEFAULT NULL,
  `nombre_lote` varchar(50) DEFAULT NULL,
  `fk_id_ubicacion` int DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id_lote`, `dimension`, `nombre_lote`, `fk_id_ubicacion`, `estado`) VALUES
(1, 200, 'Lote A', 1, 'Disponible'),
(2, 150, 'Lote B', 2, 'Ocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mide`
--

CREATE TABLE `mide` (
  `id_mide` int NOT NULL,
  `fk_id_sensor` int DEFAULT NULL,
  `fk_id_era` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mide`
--

INSERT INTO `mide` (`id_mide`, `fk_id_sensor`, `fk_id_era`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `mensaje` varchar(50) DEFAULT NULL,
  `fk_id_programacion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`id_notificacion`, `titulo`, `mensaje`, `fk_id_programacion`) VALUES
(1, 'Recordatorio', 'Revisión de cultivos hoy', 1),
(2, 'Aviso', 'Poda programada para mañana', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pea`
--

CREATE TABLE `pea` (
  `id_pea` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pea`
--

INSERT INTO `pea` (`id_pea`, `nombre`, `descripcion`) VALUES
(1, 'PEA 1', 'Programa de educación agrícola'),
(2, 'PEA 2', 'Formación en cultivos sustentables');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantacion`
--

CREATE TABLE `plantacion` (
  `id_plantacion` int NOT NULL,
  `fk_id_cultivo` int DEFAULT NULL,
  `fk_id_era` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `plantacion`
--

INSERT INTO `plantacion` (`id_plantacion`, `fk_id_cultivo`, `fk_id_era`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id_produccion` int NOT NULL,
  `fk_id_cultivo` int DEFAULT NULL,
  `cantidad_producida` int NOT NULL,
  `fecha_produccion` date NOT NULL,
  `fk_id_lote` int DEFAULT NULL,
  `descripcion_produccion` text,
  `estado` enum('En proceso','Finalizado','Cancelado') DEFAULT NULL,
  `fecha_cosecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id_produccion`, `fk_id_cultivo`, `cantidad_producida`, `fecha_produccion`, `fk_id_lote`, `descripcion_produccion`, `estado`, `fecha_cosecha`) VALUES
(1, 1, 500, '2024-06-15', 1, 'Buena producción', 'Finalizado', '2024-06-20'),
(2, 1, 21, '2025-03-11', 2, 'dsxcdsdd', 'En proceso', '2025-03-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacion`
--

CREATE TABLE `programacion` (
  `id_programacion` int NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha_programada` date DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `fk_id_asignacion_actividad` int DEFAULT NULL,
  `fk_id_calendario_lunar` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `programacion`
--

INSERT INTO `programacion` (`id_programacion`, `estado`, `fecha_programada`, `duracion`, `fk_id_asignacion_actividad`, `fk_id_calendario_lunar`) VALUES
(1, 'Pendiente', '2024-02-20', 3, 1, 1),
(2, 'Completado', '2024-02-25', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `id_realiza` int NOT NULL,
  `fk_id_cultivo` int DEFAULT NULL,
  `fk_id_actividad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `realiza`
--

INSERT INTO `realiza` (`id_realiza`, `fk_id_cultivo`, `fk_id_actividad`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requiere`
--

CREATE TABLE `requiere` (
  `id_requiere` int NOT NULL,
  `fk_id_herramienta` int DEFAULT NULL,
  `fk_id_asignacion_actividad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `requiere`
--

INSERT INTO `requiere` (`id_requiere`, `fk_id_herramienta`, `fk_id_asignacion_actividad`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `residuos`
--

CREATE TABLE `residuos` (
  `id_residuo` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` text,
  `fk_id_tipo_residuo` int DEFAULT NULL,
  `fk_id_cultivo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `residuos`
--

INSERT INTO `residuos` (`id_residuo`, `nombre`, `fecha`, `descripcion`, `fk_id_tipo_residuo`, `fk_id_cultivo`) VALUES
(1, 'Restos de cultivos', '2024-07-10', 'Hojas y tallos secos', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int NOT NULL,
  `nombre_rol` varchar(50) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `fecha_creacion`) VALUES
(1, 'lucylinda', '2024-01-01'),
(2, 'pasante', '2024-01-02'),
(3, 'instructor', '2024-01-03'),
(4, 'aprendiz', '2024-01-01'),
(5, 'pasante', '2024-01-02'),
(6, 'instructor', '2024-01-03'),
(7, 'pasante', '2024-01-02'),
(9, 'guapo', '2024-01-01'),
(10, 'ahora si', '2025-03-24'),
(11, 'ahora si', '2025-03-24'),
(12, 'ahora si', '2025-03-24'),
(13, 'ahora si', '2025-03-24'),
(14, 'ahora si', '2025-03-24'),
(15, 'ahora si', '2025-03-24'),
(16, 'ahora si', '2025-03-24'),
(17, 'loco', '2025-03-24'),
(18, 'la mas pro', '2025-03-24'),
(19, 'la mas pro', '2025-03-24'),
(20, 'siiiiiiiiiiiii', '2025-03-24'),
(21, 'lucyyyyyyyy', '2025-03-24'),
(22, 'epa', '2025-03-24'),
(23, 'el mejor', '2025-03-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semilleros`
--

CREATE TABLE `semilleros` (
  `id_semillero` int NOT NULL,
  `nombre_semilla` varchar(50) DEFAULT NULL,
  `fecha_siembra` date DEFAULT NULL,
  `fecha_estimada` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `semilleros`
--

INSERT INTO `semilleros` (`id_semillero`, `nombre_semilla`, `fecha_siembra`, `fecha_estimada`, `cantidad`) VALUES
(1, 'Semillas de maíz', '2024-02-05', '2024-05-10', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensores`
--

CREATE TABLE `sensores` (
  `id_sensor` int NOT NULL,
  `nombre_sensor` varchar(50) DEFAULT NULL,
  `tipo_sensor` varchar(50) DEFAULT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `medida_minima` float DEFAULT NULL,
  `medida_maxima` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sensores`
--

INSERT INTO `sensores` (`id_sensor`, `nombre_sensor`, `tipo_sensor`, `unidad_medida`, `descripcion`, `medida_minima`, `medida_maxima`) VALUES
(1, 'Sensor de humedad', 'Humedad', '%', 'Mide la humedad del suelo', 20, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cultivo`
--

CREATE TABLE `tipo_cultivo` (
  `id_tipo_cultivo` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_cultivo`
--

INSERT INTO `tipo_cultivo` (`id_tipo_cultivo`, `nombre`, `descripcion`) VALUES
(1, 'Cereales', 'Cultivos de cereales'),
(2, 'Hortaliza', 'Cultivo de hortalizas'),
(3, 'Granos', 'muchos granos'),
(4, 'Granitos', 'tiernos'),
(5, 'Granotes', 'Robustos'),
(6, 'Enredados', 'Rapuncel'),
(7, 'Hamburguesa', 'tomate grade'),
(8, 'Gatitos', 'Gatitos guapos'),
(9, 'Perritos lindos', 'tomate grade'),
(10, 'juguetes', 'jmmmmmmm rico cebolla'),
(11, 'ohola', 'jmmmmmmm rico cebolla'),
(12, 'ss', 'ewdsds'),
(13, 'sssssssss', 'ewdsds'),
(14, 'y muy tarde comprendi', 'que no te debia amar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_residuos`
--

CREATE TABLE `tipo_residuos` (
  `id_tipo_residuo` int NOT NULL,
  `nombre_residuo` varchar(50) DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_residuos`
--

INSERT INTO `tipo_residuos` (`id_tipo_residuo`, `nombre_residuo`, `descripcion`) VALUES
(1, 'Orgánico', 'Residuos biodegradables');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int NOT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `latitud`, `longitud`) VALUES
(1, 5.123456, -72.987654),
(2, 4.567890, -73.543210);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `identificacion` bigint NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fk_id_rol` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`identificacion`, `nombre`, `contrasena`, `email`, `fk_id_rol`) VALUES
(1, 'Sol', '$2y$10$m1uKfxw6Qg3tRTWg0/lFAOa3cAUANfkuP0u5ZdxXL9UoIZxsMZ2y2', 'solecitolindo@example.com', 1),
(2, 'Marisol', '$2y$10$O2k9RE4S2S5iXYhPJoJUDOH1NSeUwDHtJTKzB.Axrb..3842n2Vdq', 'm@example.com', 1),
(231, 'Marisol', '$2y$10$5J2VJp/OTmY611TXeMOxLuE2xnLiHWh.XLBVbxgD03TZfoBRoXwQy', 'solecitolindo@example.com', 1),
(777, 'Lucy', '$2y$10$wS4r1Begqb15I/9sG3c3Lejrjn/iNnH8mziZ8vFTxqFdA3oTXilMC', 'lucy48fernada@gmail.com', 5),
(1001, 'Juan Perez', '123456', 'juan@example.com', 1),
(1002, 'Maria Lopez', 'abcdef', 'maria@example.com', 2),
(1003, 'Carlos Diaz', 'qwerty', 'carlos@example.com', 3),
(1004, 'Pedro Pablo', '$2y$10$fKjdMjdr79.NMXmNBgbtJ.nacWJIfQYtnc61KVpBntMeAXhnyuPZ6', 'pedro@example.com', 2),
(1234, 'lucy', '1234', 'lucy@gmail.com', 6),
(12345, 'fernanda', '12345', 'fer@gmail.com', 5),
(20100, 'Marisol', '$2y$10$/dr2FhsvvJybHfCS4PTSbO1GOnUeW6FOKaMtVebpe.03H.jQ6Q16W', 'solecitolindo@example.com', 1),
(100441, 'Fer', '$2y$10$oZJW9AgliLjZ1OqaK8BZLuORiUlmhMdOzYQdcQLGFrBXt3ncHx7W', 'm@example.com', 1),
(5505050, 'Hamburguesa', '$2y$10$0o5aht4BtrZpITPkFKhss.XSCT3f/kHitOlNvxIk0r.GYkpXLJLjO', 'hamburguesa@dsk', 1),
(12169320, 'carlos', '1234', 'carlos@gmail.com', 6),
(12345678, 'Marisol', '$2y$10$4n0Uq04Ckn8p7YglAe0CiODkE1161E3K2tmaeSE7FQbl0z0Vdai62', 'm@example.com', 1),
(14343443, 'Marisol', '$2y$10$/OfIn/H55VkI4y2FoRGxbOnmnvVUYO5Oae56sL7th89X/rZ2GAYBq', 'm@example.com', 1),
(22222222, 'Marisol', '$2y$10$sEO3uIXTVLhMV/1gZcqWieEP4pyW8k9UfXzdVxRInt61g0CMnvvK2', 'm@example.com', 4),
(36114200, 'Marisol', '1234', 'maarisol@gmail.com', 7),
(222222222, 'ss', '$2y$10$XTj6oz.EivaBE4hc4/FUL.B3RbLc6JQfLmNGnRoLuFaafbxgGJM5y', 'panitarabitt@gmail.com', 17),
(1004418401, 'Lucy', '$2y$10$5UqGYYfOKg2h7ZbjSpcm8ecTC0C81p5gE.4YLwUc52cEV0ZWY.3Z.', 'lucy0408fer@gmail.com', 1),
(3333333333, 'Hamburguesa', '$2y$10$rjvTCTm.lTAUU9I8haF7VOYzJgG74CmPPrPe/Q/HtJXmd/yLiBywW', 'maiber@gmail.com', 6),
(55555555555, 'lucy', '$2y$10$C/XXj7/3Pv4e9KipQhrluOLBE8Lc4oPFRUeJEJe0UaJcyzt8WnYc2', 'panitarabitt@gmail.com', 6),
(4444444444444, 'Lucy', '$2y$10$nSRDRQswj72FQCE31sUR5.mHOluyhwYfmLGgfcVQEF4q70QUnCfOa', 'maiber@gmail.com', 7),
(12300000000000, 'jahn', '$2y$10$Imzv9yWHVRVOtMwIhtSlHeVaTRsNnVkm5UGsG/6tyt1YIX//fdQc.', 'jahn@ae', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utiliza`
--

CREATE TABLE `utiliza` (
  `id_utiliza` int NOT NULL,
  `fk_id_insumo` int DEFAULT NULL,
  `fk_id_asignacion_actividad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `utiliza`
--

INSERT INTO `utiliza` (`id_utiliza`, `fk_id_insumo`, `fk_id_asignacion_actividad`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `fk_id_produccion` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` int NOT NULL,
  `total_venta` int DEFAULT NULL,
  `fecha_venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fk_id_produccion`, `cantidad`, `precio_unitario`, `total_venta`, `fecha_venta`) VALUES
(1, 1, 500, 1000, 500000, '2024-07-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `asignacion_actividad`
--
ALTER TABLE `asignacion_actividad`
  ADD PRIMARY KEY (`id_asignacion_actividad`),
  ADD KEY `fk_id_actividad` (`fk_id_actividad`),
  ADD KEY `fk_identificacion` (`fk_identificacion`);

--
-- Indices de la tabla `calendario_lunar`
--
ALTER TABLE `calendario_lunar`
  ADD PRIMARY KEY (`id_calendario_lunar`);

--
-- Indices de la tabla `control_fitosanitario`
--
ALTER TABLE `control_fitosanitario`
  ADD PRIMARY KEY (`id_control_fitosanitario`),
  ADD KEY `desarrollan_control_fitosanitario` (`fk_id_desarrollan`);

--
-- Indices de la tabla `control_usa_insumo`
--
ALTER TABLE `control_usa_insumo`
  ADD PRIMARY KEY (`id_control_usa_insumo`),
  ADD KEY `fk_id_insumo` (`fk_id_insumo`),
  ADD KEY `control_fitosanitario_usa_insumo` (`fk_id_control_fitosanitario`);

--
-- Indices de la tabla `cultivo`
--
ALTER TABLE `cultivo`
  ADD PRIMARY KEY (`id_cultivo`),
  ADD KEY `especie_cultivo` (`fk_id_especie`),
  ADD KEY `semillero_cultivo` (`fk_id_semillero`);

--
-- Indices de la tabla `desarrollan`
--
ALTER TABLE `desarrollan`
  ADD PRIMARY KEY (`id_desarrollan`),
  ADD KEY `fk_id_cultivo` (`fk_id_cultivo`),
  ADD KEY `pea_desarrollan` (`fk_id_pea`);

--
-- Indices de la tabla `eras`
--
ALTER TABLE `eras`
  ADD PRIMARY KEY (`id_eras`),
  ADD KEY `lote_era` (`fk_id_lote`);

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`id_especie`),
  ADD KEY `tipo_especie` (`fk_id_tipo_cultivo`);

--
-- Indices de la tabla `genera`
--
ALTER TABLE `genera`
  ADD PRIMARY KEY (`id_genera`),
  ADD KEY `cultivo_gen` (`fk_id_cultivo`),
  ADD KEY `produ_gen` (`fk_id_produccion`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`id_herramienta`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_lote`),
  ADD KEY `ubicacion_lote` (`fk_id_ubicacion`);

--
-- Indices de la tabla `mide`
--
ALTER TABLE `mide`
  ADD PRIMARY KEY (`id_mide`),
  ADD KEY `fk_id_sensor` (`fk_id_sensor`),
  ADD KEY `era_mide` (`fk_id_era`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `fk_id_programacion` (`fk_id_programacion`);

--
-- Indices de la tabla `pea`
--
ALTER TABLE `pea`
  ADD PRIMARY KEY (`id_pea`);

--
-- Indices de la tabla `plantacion`
--
ALTER TABLE `plantacion`
  ADD PRIMARY KEY (`id_plantacion`),
  ADD KEY `fk_id_cultivo` (`fk_id_cultivo`),
  ADD KEY `era_plantacion` (`fk_id_era`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id_produccion`),
  ADD KEY `fk_cultivo_prod` (`fk_id_cultivo`),
  ADD KEY `fk_lote_prod` (`fk_id_lote`);

--
-- Indices de la tabla `programacion`
--
ALTER TABLE `programacion`
  ADD PRIMARY KEY (`id_programacion`),
  ADD KEY `fk_id_asignacion_actividad` (`fk_id_asignacion_actividad`),
  ADD KEY `fk_id_calendario_lunar` (`fk_id_calendario_lunar`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD PRIMARY KEY (`id_realiza`),
  ADD KEY `fk_id_cultivo` (`fk_id_cultivo`),
  ADD KEY `actividad_realiza` (`fk_id_actividad`);

--
-- Indices de la tabla `requiere`
--
ALTER TABLE `requiere`
  ADD PRIMARY KEY (`id_requiere`),
  ADD KEY `fk_id_herramienta` (`fk_id_herramienta`),
  ADD KEY `fk_id_asignacion_actividad` (`fk_id_asignacion_actividad`);

--
-- Indices de la tabla `residuos`
--
ALTER TABLE `residuos`
  ADD PRIMARY KEY (`id_residuo`),
  ADD KEY `tipo_residuo_residuo` (`fk_id_tipo_residuo`),
  ADD KEY `cultivo_residuo` (`fk_id_cultivo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `semilleros`
--
ALTER TABLE `semilleros`
  ADD PRIMARY KEY (`id_semillero`);

--
-- Indices de la tabla `sensores`
--
ALTER TABLE `sensores`
  ADD PRIMARY KEY (`id_sensor`);

--
-- Indices de la tabla `tipo_cultivo`
--
ALTER TABLE `tipo_cultivo`
  ADD PRIMARY KEY (`id_tipo_cultivo`);

--
-- Indices de la tabla `tipo_residuos`
--
ALTER TABLE `tipo_residuos`
  ADD PRIMARY KEY (`id_tipo_residuo`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`identificacion`),
  ADD KEY `fk_id_rol` (`fk_id_rol`);

--
-- Indices de la tabla `utiliza`
--
ALTER TABLE `utiliza`
  ADD PRIMARY KEY (`id_utiliza`),
  ADD KEY `fk_id_insumo` (`fk_id_insumo`),
  ADD KEY `fk_id_asignacion_actividad` (`fk_id_asignacion_actividad`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_produccion_venta` (`fk_id_produccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `asignacion_actividad`
--
ALTER TABLE `asignacion_actividad`
  MODIFY `id_asignacion_actividad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `calendario_lunar`
--
ALTER TABLE `calendario_lunar`
  MODIFY `id_calendario_lunar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `control_fitosanitario`
--
ALTER TABLE `control_fitosanitario`
  MODIFY `id_control_fitosanitario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `control_usa_insumo`
--
ALTER TABLE `control_usa_insumo`
  MODIFY `id_control_usa_insumo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cultivo`
--
ALTER TABLE `cultivo`
  MODIFY `id_cultivo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `desarrollan`
--
ALTER TABLE `desarrollan`
  MODIFY `id_desarrollan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `eras`
--
ALTER TABLE `eras`
  MODIFY `id_eras` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `id_especie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `genera`
--
ALTER TABLE `genera`
  MODIFY `id_genera` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  MODIFY `id_herramienta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id_insumo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id_lote` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mide`
--
ALTER TABLE `mide`
  MODIFY `id_mide` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notificacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pea`
--
ALTER TABLE `pea`
  MODIFY `id_pea` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `plantacion`
--
ALTER TABLE `plantacion`
  MODIFY `id_plantacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id_produccion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `programacion`
--
ALTER TABLE `programacion`
  MODIFY `id_programacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `realiza`
--
ALTER TABLE `realiza`
  MODIFY `id_realiza` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `requiere`
--
ALTER TABLE `requiere`
  MODIFY `id_requiere` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `residuos`
--
ALTER TABLE `residuos`
  MODIFY `id_residuo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `semilleros`
--
ALTER TABLE `semilleros`
  MODIFY `id_semillero` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sensores`
--
ALTER TABLE `sensores`
  MODIFY `id_sensor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_cultivo`
--
ALTER TABLE `tipo_cultivo`
  MODIFY `id_tipo_cultivo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tipo_residuos`
--
ALTER TABLE `tipo_residuos`
  MODIFY `id_tipo_residuo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utiliza`
--
ALTER TABLE `utiliza`
  MODIFY `id_utiliza` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_actividad`
--
ALTER TABLE `asignacion_actividad`
  ADD CONSTRAINT `asignacion_actividad_ibfk_1` FOREIGN KEY (`fk_id_actividad`) REFERENCES `actividad` (`id_actividad`),
  ADD CONSTRAINT `asignacion_actividad_ibfk_2` FOREIGN KEY (`fk_identificacion`) REFERENCES `usuarios` (`identificacion`);

--
-- Filtros para la tabla `control_fitosanitario`
--
ALTER TABLE `control_fitosanitario`
  ADD CONSTRAINT `desarrollan_control_fitosanitario` FOREIGN KEY (`fk_id_desarrollan`) REFERENCES `desarrollan` (`id_desarrollan`);

--
-- Filtros para la tabla `control_usa_insumo`
--
ALTER TABLE `control_usa_insumo`
  ADD CONSTRAINT `control_fitosanitario_usa_insumo` FOREIGN KEY (`fk_id_control_fitosanitario`) REFERENCES `control_fitosanitario` (`id_control_fitosanitario`),
  ADD CONSTRAINT `control_usa_insumo_ibfk_1` FOREIGN KEY (`fk_id_insumo`) REFERENCES `insumos` (`id_insumo`);

--
-- Filtros para la tabla `cultivo`
--
ALTER TABLE `cultivo`
  ADD CONSTRAINT `especie_cultivo` FOREIGN KEY (`fk_id_especie`) REFERENCES `especie` (`id_especie`),
  ADD CONSTRAINT `semillero_cultivo` FOREIGN KEY (`fk_id_semillero`) REFERENCES `semilleros` (`id_semillero`);

--
-- Filtros para la tabla `desarrollan`
--
ALTER TABLE `desarrollan`
  ADD CONSTRAINT `desarrollan_ibfk_1` FOREIGN KEY (`fk_id_cultivo`) REFERENCES `cultivo` (`id_cultivo`),
  ADD CONSTRAINT `pea_desarrollan` FOREIGN KEY (`fk_id_pea`) REFERENCES `pea` (`id_pea`);

--
-- Filtros para la tabla `eras`
--
ALTER TABLE `eras`
  ADD CONSTRAINT `lote_era` FOREIGN KEY (`fk_id_lote`) REFERENCES `lote` (`id_lote`);

--
-- Filtros para la tabla `especie`
--
ALTER TABLE `especie`
  ADD CONSTRAINT `tipo_especie` FOREIGN KEY (`fk_id_tipo_cultivo`) REFERENCES `tipo_cultivo` (`id_tipo_cultivo`);

--
-- Filtros para la tabla `genera`
--
ALTER TABLE `genera`
  ADD CONSTRAINT `cultivo_gen` FOREIGN KEY (`fk_id_cultivo`) REFERENCES `cultivo` (`id_cultivo`),
  ADD CONSTRAINT `produ_gen` FOREIGN KEY (`fk_id_produccion`) REFERENCES `produccion` (`id_produccion`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `ubicacion_lote` FOREIGN KEY (`fk_id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`);

--
-- Filtros para la tabla `mide`
--
ALTER TABLE `mide`
  ADD CONSTRAINT `era_mide` FOREIGN KEY (`fk_id_era`) REFERENCES `eras` (`id_eras`),
  ADD CONSTRAINT `mide_ibfk_1` FOREIGN KEY (`fk_id_sensor`) REFERENCES `sensores` (`id_sensor`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`fk_id_programacion`) REFERENCES `programacion` (`id_programacion`);

--
-- Filtros para la tabla `plantacion`
--
ALTER TABLE `plantacion`
  ADD CONSTRAINT `era_plantacion` FOREIGN KEY (`fk_id_era`) REFERENCES `eras` (`id_eras`),
  ADD CONSTRAINT `plantacion_ibfk_1` FOREIGN KEY (`fk_id_cultivo`) REFERENCES `cultivo` (`id_cultivo`);

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `fk_cultivo_prod` FOREIGN KEY (`fk_id_cultivo`) REFERENCES `cultivo` (`id_cultivo`),
  ADD CONSTRAINT `fk_lote_prod` FOREIGN KEY (`fk_id_lote`) REFERENCES `lote` (`id_lote`);

--
-- Filtros para la tabla `programacion`
--
ALTER TABLE `programacion`
  ADD CONSTRAINT `programacion_ibfk_1` FOREIGN KEY (`fk_id_asignacion_actividad`) REFERENCES `asignacion_actividad` (`id_asignacion_actividad`),
  ADD CONSTRAINT `programacion_ibfk_2` FOREIGN KEY (`fk_id_calendario_lunar`) REFERENCES `calendario_lunar` (`id_calendario_lunar`);

--
-- Filtros para la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD CONSTRAINT `actividad_realiza` FOREIGN KEY (`fk_id_actividad`) REFERENCES `actividad` (`id_actividad`),
  ADD CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`fk_id_cultivo`) REFERENCES `cultivo` (`id_cultivo`);

--
-- Filtros para la tabla `requiere`
--
ALTER TABLE `requiere`
  ADD CONSTRAINT `requiere_ibfk_1` FOREIGN KEY (`fk_id_herramienta`) REFERENCES `herramientas` (`id_herramienta`),
  ADD CONSTRAINT `requiere_ibfk_2` FOREIGN KEY (`fk_id_asignacion_actividad`) REFERENCES `asignacion_actividad` (`id_asignacion_actividad`);

--
-- Filtros para la tabla `residuos`
--
ALTER TABLE `residuos`
  ADD CONSTRAINT `cultivo_residuo` FOREIGN KEY (`fk_id_cultivo`) REFERENCES `cultivo` (`id_cultivo`),
  ADD CONSTRAINT `tipo_residuo_residuo` FOREIGN KEY (`fk_id_tipo_residuo`) REFERENCES `tipo_residuos` (`id_tipo_residuo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`fk_id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `utiliza`
--
ALTER TABLE `utiliza`
  ADD CONSTRAINT `utiliza_ibfk_1` FOREIGN KEY (`fk_id_insumo`) REFERENCES `insumos` (`id_insumo`),
  ADD CONSTRAINT `utiliza_ibfk_2` FOREIGN KEY (`fk_id_asignacion_actividad`) REFERENCES `asignacion_actividad` (`id_asignacion_actividad`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_produccion_venta` FOREIGN KEY (`fk_id_produccion`) REFERENCES `produccion` (`id_produccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
