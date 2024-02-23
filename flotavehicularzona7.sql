-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2024 a las 16:25:52
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flotavehicularzona7`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_armaperpol`
--

CREATE TABLE `appflotavehicular_armaperpol` (
  `id` bigint(20) NOT NULL,
  `fecharegistro` date NOT NULL,
  `horaregistro` time(6) NOT NULL,
  `policia_id` varchar(10) DEFAULT NULL,
  `pertrecho_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_armaperpol`
--

INSERT INTO `appflotavehicular_armaperpol` (`id`, `fecharegistro`, `horaregistro`, `policia_id`, `pertrecho_id`) VALUES
(1, '2024-02-23', '09:59:00.000000', '1704998846', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_circuito`
--

CREATE TABLE `appflotavehicular_circuito` (
  `id` bigint(20) NOT NULL,
  `cod_circuito` varchar(20) NOT NULL,
  `nombre_circuito` varchar(100) NOT NULL,
  `numero_circuito` varchar(100) NOT NULL,
  `id_subcircuito_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_circuito`
--

INSERT INTO `appflotavehicular_circuito` (`id`, `cod_circuito`, `nombre_circuito`, `numero_circuito`, `id_subcircuito_id`) VALUES
(2, '11D01C01', 'VILCABAMBA', '22', '11D01C01S01'),
(7, '11D01C04', 'TAQUIL', '22', '11D01C04S01'),
(8, '11D01C04', 'TAQUIL', '22', '11D01C04S02'),
(9, '11D01C02', 'YANGANA', '22', '11D01C02S01'),
(10, '11D01C03', 'MALACATOS', '22', '11D01C03S01'),
(11, '11D02C01', 'EL TAMBO', '9', '11D02C01S01'),
(12, '11D02C02', 'CATAMAYO NORTE', '9', '11D02C02S01'),
(13, '11D02C02', 'CATAMAYO NORTE', '9', '11D02C02S02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_combustible`
--

CREATE TABLE `appflotavehicular_combustible` (
  `id` bigint(20) NOT NULL,
  `cantidad_galones` decimal(20,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `km_actual` varchar(20) NOT NULL,
  `nombre_servpolicial` varchar(100) NOT NULL,
  `nombre_gasolinera` varchar(100) NOT NULL,
  `dependencia_id` bigint(20) NOT NULL,
  `persona_id` varchar(10) NOT NULL,
  `vehiculo_id` varchar(8) NOT NULL,
  `fecha_actual` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_combustible`
--

INSERT INTO `appflotavehicular_combustible` (`id`, `cantidad_galones`, `fecha`, `hora`, `km_actual`, `nombre_servpolicial`, `nombre_gasolinera`, `dependencia_id`, `persona_id`, `vehiculo_id`, `fecha_actual`) VALUES
(4, 6.00, '2024-02-15', '16:16:00.000000', '10005', 'Alirio Campo', 'Texaco', 2, '1719880195', 'pcy9980', '2024-02-17'),
(6, 4.00, '2024-02-22', '15:55:00.000000', '15000', 'Alirio Campo', 'La Bonita', 2, '0100967652', 'trp9980', '2024-02-21'),
(7, 6.00, '2024-02-21', '07:23:00.000000', '7000', 'MArco GArcia', 'La Bonita', 3, '1704998846', 'pvb8639', '2024-02-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_denuncia`
--

CREATE TABLE `appflotavehicular_denuncia` (
  `id` bigint(20) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `id_circuito_id` bigint(20) NOT NULL,
  `id_subcircuito_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_denuncia`
--

INSERT INTO `appflotavehicular_denuncia` (`id`, `fecha_ingreso`, `tipo`, `detalle`, `contacto`, `nombres`, `apellidos`, `id_circuito_id`, `id_subcircuito_id`) VALUES
(1, '2024-02-15', 'reclamos', 'El aceite colocado en mi vehículo no corresponde', '0992641514', 'Juan ', 'Lema', 2, '11D01C01S01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_dependencia`
--

CREATE TABLE `appflotavehicular_dependencia` (
  `id` bigint(20) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `parroquia` varchar(50) NOT NULL,
  `id_distrito_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_dependencia`
--

INSERT INTO `appflotavehicular_dependencia` (`id`, `provincia`, `parroquia`, `id_distrito_id`) VALUES
(2, 'LOJA', 'VILCABAMBA (VICTORIA )', 2),
(3, 'LOJA', 'CHUQUIRIBAMBA', 7),
(4, 'LOJA', 'QUINARA', 5),
(5, 'LOJA', 'MALACATOS (VALLADOLID)', 9),
(6, 'LOJA', 'TAQUIL (MIGUEL RIOFRIO)', 8),
(7, 'LOJA', 'EL TAMBO', 6),
(9, 'LOJA', 'CATAMAYO 1 (LA TOMA)', 10),
(10, 'LOJA', 'CATAMAYO 2 (LA TOMA)', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_distrito`
--

CREATE TABLE `appflotavehicular_distrito` (
  `id` bigint(20) NOT NULL,
  `cod_distrito` varchar(20) NOT NULL,
  `nombre_distrito` varchar(100) NOT NULL,
  `numero_distrito` varchar(100) NOT NULL,
  `id_circuito_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_distrito`
--

INSERT INTO `appflotavehicular_distrito` (`id`, `cod_distrito`, `nombre_distrito`, `numero_distrito`, `id_circuito_id`) VALUES
(2, '11D01', 'LOJA', '9', 2),
(5, '11D01', 'LOJA', '9', 9),
(6, '11D02', 'CATAMAYO', '9', 11),
(7, '11D01', 'LOJA', '9', 7),
(8, '11D01', 'LOJA', '9', 8),
(9, '11D01', 'LOJA', '9', 10),
(10, '11D02', 'CATAMAYO', '9', 12),
(11, '11D02', 'CATAMAYO', '9', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_entradamtto`
--

CREATE TABLE `appflotavehicular_entradamtto` (
  `id` bigint(20) NOT NULL,
  `docentrada` varchar(100) NOT NULL,
  `mantenimiento_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_entradamtto`
--

INSERT INTO `appflotavehicular_entradamtto` (`id`, `docentrada`, `mantenimiento_id`) VALUES
(1, 'docentradamancar/EntradaMantenimiento_pcy9980.pdf', 1),
(2, 'docentradamancar/EntradaMantenimiento_pvb8639.pdf', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_entradaorden`
--

CREATE TABLE `appflotavehicular_entradaorden` (
  `id` bigint(20) NOT NULL,
  `docentradaorden` varchar(100) NOT NULL,
  `entrada_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_entradaorden`
--

INSERT INTO `appflotavehicular_entradaorden` (`id`, `docentradaorden`, `entrada_id`) VALUES
(1, 'docentradaorden/EntradaOrden_pcy9980.pdf', 1),
(2, 'docentradaorden/EntradaOrden_pcy9980_CfmS81D.pdf', 1),
(3, 'docentradaorden/EntradaOrden_pcy9980_WbNYXO9.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_mantenimiento`
--

CREATE TABLE `appflotavehicular_mantenimiento` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `fechaentrada` date DEFAULT NULL,
  `km` decimal(15,2) NOT NULL,
  `observaciones` longtext DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `persona_id` varchar(10) DEFAULT NULL,
  `tipodemantenimiento_id` bigint(20) NOT NULL,
  `vehiculo_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_mantenimiento`
--

INSERT INTO `appflotavehicular_mantenimiento` (`id`, `fecha`, `fechaentrada`, `km`, `observaciones`, `costo`, `estado`, `persona_id`, `tipodemantenimiento_id`, `vehiculo_id`) VALUES
(1, '2024-02-15', '2024-02-20', 105000.00, NULL, 67.20, 1, '0100967652', 2, 'pcy9980'),
(2, '2024-02-19', '2024-02-21', 19000.00, NULL, 48.82, 1, '1704998846', 1, 'pvb8639'),
(3, '2024-02-19', '2024-02-19', 24000.00, NULL, 186.60, 0, '1714818299', 3, 'trp9980');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_ordendetrabajo`
--

CREATE TABLE `appflotavehicular_ordendetrabajo` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `fechaentrada` date DEFAULT NULL,
  `ruta` varchar(1000) NOT NULL,
  `km` decimal(8,2) NOT NULL,
  `observaciones` longtext NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `dependencia_id` bigint(20) NOT NULL,
  `agente1_id` varchar(10) DEFAULT NULL,
  `agente2_id` varchar(10) DEFAULT NULL,
  `agente3_id` varchar(10) DEFAULT NULL,
  `responsable_id` varchar(10) NOT NULL,
  `vehiculo_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_ordendetrabajo`
--

INSERT INTO `appflotavehicular_ordendetrabajo` (`id`, `fecha`, `fechaentrada`, `ruta`, `km`, `observaciones`, `estado`, `dependencia_id`, `agente1_id`, `agente2_id`, `agente3_id`, `responsable_id`, `vehiculo_id`) VALUES
(1, '2024-02-19', '2024-02-23', 'malacatos  vilcabamba', 100.00, 'El vehiculo se traslada de malacatos a vilcabamba', 1, 2, '0100967652', '1704997012', '1704997012', '1719880195', 'pcy9980');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_persona`
--

CREATE TABLE `appflotavehicular_persona` (
  `identificacion` varchar(10) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo_sangre` varchar(10) NOT NULL,
  `ciudad_nacimiento` varchar(25) NOT NULL,
  `numero_celular` varchar(10) NOT NULL,
  `codigoempleado_id` int(11) NOT NULL,
  `dependencia_id` bigint(20) NOT NULL,
  `id_rango_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_persona`
--

INSERT INTO `appflotavehicular_persona` (`identificacion`, `nombres`, `apellidos`, `direccion`, `fecha_nacimiento`, `tipo_sangre`, `ciudad_nacimiento`, `numero_celular`, `codigoempleado_id`, `dependencia_id`, `id_rango_id`) VALUES
('0100967652', 'Estalin Andres', 'Revelo Salazar', 'Miraflores', '1988-09-01', 'O+', 'Tulcan', '0987234564', 7, 2, 5),
('0401898762', 'Pepe', 'Agilar', 'Loja Vilcabamba', '2006-01-01', 'B+', 'Loja', '0969584561', 9, 2, 5),
('1704997012', 'Monica Francisca', 'Ronbon Pala', 'las gradas y espejo', '1990-12-03', 'O+', 'Loja', '0980345728', 6, 2, 2),
('1704998846', 'Juan ', 'Duche Vasquez', '10 de agosto y pichincha', '1980-02-01', 'O+', 'Quito', '0992345677', 4, 2, 1),
('1714818299', 'Pedro Alberto', 'Acosta Toro', 'Sucre y 9 de Octubre', '1984-08-19', 'A+', 'Loja', '0992341235', 5, 2, 3),
('1715241424', 'Carlos Alejandro', 'Tenorio Correa', 'Rafael Arellano y Sucre', '1992-09-19', 'O+', 'Ibarra', '0991342458', 8, 2, 1),
('1719880195', 'CESAR ', 'REVELO S', 'tulcan', '1984-04-04', 'O+', 'Tulcan', '0992641514', 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_pertrechos`
--

CREATE TABLE `appflotavehicular_pertrechos` (
  `id` bigint(20) NOT NULL,
  `tipoarma` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `dependencia_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_pertrechos`
--

INSERT INTO `appflotavehicular_pertrechos` (`id`, `tipoarma`, `nombre`, `descripcion`, `codigo`, `dependencia_id`) VALUES
(1, 'Corta', 'Pistola', 'Glock 19', 'PG_001', 2),
(2, 'Larga', 'Pistola', 'Taser', 'PT_001', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_rango`
--

CREATE TABLE `appflotavehicular_rango` (
  `id` bigint(20) NOT NULL,
  `rangopersona` varchar(100) NOT NULL,
  `detalle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_rango`
--

INSERT INTO `appflotavehicular_rango` (`id`, `rangopersona`, `detalle`) VALUES
(1, 'Capitan', 'Personal de alto rango'),
(2, 'Teniente', 'Policia Nacional'),
(3, 'Sargento Primero', 'Policia Nacional'),
(4, 'Sargento Segundo', 'Policia Nacional'),
(5, 'Cabo Primero', 'Policia Nacional'),
(7, 'Cabo Segundo|', 'Policia Nacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_salidamtto`
--

CREATE TABLE `appflotavehicular_salidamtto` (
  `id` bigint(20) NOT NULL,
  `docsalida` varchar(100) NOT NULL,
  `mantenimiento_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_salidamtto`
--

INSERT INTO `appflotavehicular_salidamtto` (`id`, `docsalida`, `mantenimiento_id`) VALUES
(1, 'docsalidamancar/SalidaMantenimiento_pcy9980.pdf', 1),
(2, 'docsalidamancar/SalidaMantenimiento_pvb8639.pdf', 2),
(3, 'docsalidamancar/SalidaMantenimiento_trp9980.pdf', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_salidaorden`
--

CREATE TABLE `appflotavehicular_salidaorden` (
  `id` bigint(20) NOT NULL,
  `docsalidaorden` varchar(100) NOT NULL,
  `salida_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_salidaorden`
--

INSERT INTO `appflotavehicular_salidaorden` (`id`, `docsalidaorden`, `salida_id`) VALUES
(1, 'docsalidaorden/SalidaOrden_pcy9980.pdf', 1),
(2, 'docsalidaorden/SalidaOrden_pcy9980_HH27jZs.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_subcircuito`
--

CREATE TABLE `appflotavehicular_subcircuito` (
  `cod_subcircuito` varchar(20) NOT NULL,
  `nombre_subcircuito` varchar(100) NOT NULL,
  `numero_subcircuito` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_subcircuito`
--

INSERT INTO `appflotavehicular_subcircuito` (`cod_subcircuito`, `nombre_subcircuito`, `numero_subcircuito`) VALUES
('11D01C01S01', 'VILCABAMBA 1', '1'),
('11D01C02S01', 'YANGANA 1', '1'),
('11D01C03S01', 'MALACATOS 1', '1'),
('11D01C04S01', 'TAQUIL1', '2'),
('11D01C04S02', 'TAQUIL2', '2'),
('11D02C01S01', 'EL TAMBO 1', '1'),
('11D02C02S01', 'CATAMAYO NORTE 1', '2'),
('11D02C02S02', 'CATAMAYO NORTE 2', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_tipomantenimiento`
--

CREATE TABLE `appflotavehicular_tipomantenimiento` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_tipomantenimiento`
--

INSERT INTO `appflotavehicular_tipomantenimiento` (`id`, `tipo`, `descripcion`, `subtotal`, `iva`, `total`) VALUES
(1, 'Mantenimiento 1', 'cambio de aceite\r\nrevisión general\r\ncambio de pastillas\r\ncambio de líquido de frenos\r\ncambio filtro de combustible', 43.59, 5.23, 48.82),
(2, 'Mantenimiento 2', 'Mantenimiento 1 +\r\nCambio filtro de aire \r\ncambio de líquido refrigerante\r\ncambio de luces delanteras y posteriores', 60.00, 7.20, 67.20),
(3, 'Mantenimiento 3', 'Cambio de batería\r\nAjuste del sistema eléctrico', 180.00, 21.60, 201.60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_tipovehiculo`
--

CREATE TABLE `appflotavehicular_tipovehiculo` (
  `id` bigint(20) NOT NULL,
  `tipovehiculo` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_tipovehiculo`
--

INSERT INTO `appflotavehicular_tipovehiculo` (`id`, `tipovehiculo`, `descripcion`) VALUES
(1, 'Automovil', 'Deportivo 4 puertas'),
(2, 'Motocicleta', 'Todo Terreno'),
(3, 'Camioneta', '4x4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_vehiculo`
--

CREATE TABLE `appflotavehicular_vehiculo` (
  `placa` varchar(8) NOT NULL,
  `chasis` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(40) NOT NULL,
  `color` varchar(20) NOT NULL,
  `motor` varchar(100) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `cilindraje` double NOT NULL,
  `capacidad_carga` double NOT NULL,
  `capacidad_pasajeros` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `dependencia_id` bigint(20) NOT NULL,
  `tipovehiculo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_vehiculo`
--

INSERT INTO `appflotavehicular_vehiculo` (`placa`, `chasis`, `marca`, `modelo`, `color`, `motor`, `kilometraje`, `cilindraje`, `capacidad_carga`, `capacidad_pasajeros`, `estado`, `dependencia_id`, `tipovehiculo_id`) VALUES
('pcy9980', 'pd6732423', 'Toyota', 'Hilux 4x4', 'Blanco', 'ch9820332', 105000, 2000, 3, 4, 1, 2, 3),
('pvb8639', 'ph32890139', 'Nisscan', 'Tiida 2013', 'Plateado', 'ch9820334', 19000, 1600, 5, 4, 1, 2, 1),
('trp9980', 'ch3821931312', 'Dajhatsu', 'Andromeda', 'Azul', 'chg9384241', 20000, 250, 1, 1, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administrador'),
(3, 'Auxiliar'),
(2, 'Encargado Logistica'),
(4, 'Gerente'),
(5, 'Personal Policial'),
(6, 'Tecnico 1'),
(7, 'Tecnico 2'),
(8, 'Tecnico 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Circuito', 7, 'add_circuito'),
(26, 'Can change Circuito', 7, 'change_circuito'),
(27, 'Can delete Circuito', 7, 'delete_circuito'),
(28, 'Can view Circuito', 7, 'view_circuito'),
(29, 'Can add Mantenimiento', 8, 'add_mantenimiento'),
(30, 'Can change Mantenimiento', 8, 'change_mantenimiento'),
(31, 'Can delete Mantenimiento', 8, 'delete_mantenimiento'),
(32, 'Can view Mantenimiento', 8, 'view_mantenimiento'),
(33, 'Can add Rango', 9, 'add_rango'),
(34, 'Can change Rango', 9, 'change_rango'),
(35, 'Can delete Rango', 9, 'delete_rango'),
(36, 'Can view Rango', 9, 'view_rango'),
(37, 'Can add Subcircuito', 10, 'add_subcircuito'),
(38, 'Can change Subcircuito', 10, 'change_subcircuito'),
(39, 'Can delete Subcircuito', 10, 'delete_subcircuito'),
(40, 'Can view Subcircuito', 10, 'view_subcircuito'),
(41, 'Can add Tipo mantenimiento', 11, 'add_tipomantenimiento'),
(42, 'Can change Tipo mantenimiento', 11, 'change_tipomantenimiento'),
(43, 'Can delete Tipo mantenimiento', 11, 'delete_tipomantenimiento'),
(44, 'Can view Tipo mantenimiento', 11, 'view_tipomantenimiento'),
(45, 'Can add Tipo Vehículo', 12, 'add_tipovehiculo'),
(46, 'Can change Tipo Vehículo', 12, 'change_tipovehiculo'),
(47, 'Can delete Tipo Vehículo', 12, 'delete_tipovehiculo'),
(48, 'Can view Tipo Vehículo', 12, 'view_tipovehiculo'),
(49, 'Can add Distrito', 13, 'add_distrito'),
(50, 'Can change Distrito', 13, 'change_distrito'),
(51, 'Can delete Distrito', 13, 'delete_distrito'),
(52, 'Can view Distrito', 13, 'view_distrito'),
(53, 'Can add Dependencia', 14, 'add_dependencia'),
(54, 'Can change Dependencia', 14, 'change_dependencia'),
(55, 'Can delete Dependencia', 14, 'delete_dependencia'),
(56, 'Can view Dependencia', 14, 'view_dependencia'),
(57, 'Can add Entrada mantenimiento', 15, 'add_entradamtto'),
(58, 'Can change Entrada mantenimiento', 15, 'change_entradamtto'),
(59, 'Can delete Entrada mantenimiento', 15, 'delete_entradamtto'),
(60, 'Can view Entrada mantenimiento', 15, 'view_entradamtto'),
(61, 'Can add Orden de Trabajo', 16, 'add_ordendetrabajo'),
(62, 'Can change Orden de Trabajo', 16, 'change_ordendetrabajo'),
(63, 'Can delete Orden de Trabajo', 16, 'delete_ordendetrabajo'),
(64, 'Can view Orden de Trabajo', 16, 'view_ordendetrabajo'),
(65, 'Can add Entrada Orden', 17, 'add_entradaorden'),
(66, 'Can change Entrada Orden', 17, 'change_entradaorden'),
(67, 'Can delete Entrada Orden', 17, 'delete_entradaorden'),
(68, 'Can view Entrada Orden', 17, 'view_entradaorden'),
(69, 'Can add Persona', 18, 'add_persona'),
(70, 'Can change Persona', 18, 'change_persona'),
(71, 'Can delete Persona', 18, 'delete_persona'),
(72, 'Can view Persona', 18, 'view_persona'),
(73, 'Can add Salida mantenimiento', 19, 'add_salidamtto'),
(74, 'Can change Salida mantenimiento', 19, 'change_salidamtto'),
(75, 'Can delete Salida mantenimiento', 19, 'delete_salidamtto'),
(76, 'Can view Salida mantenimiento', 19, 'view_salidamtto'),
(77, 'Can add Salida Orden', 20, 'add_salidaorden'),
(78, 'Can change Salida Orden', 20, 'change_salidaorden'),
(79, 'Can delete Salida Orden', 20, 'delete_salidaorden'),
(80, 'Can view Salida Orden', 20, 'view_salidaorden'),
(81, 'Can add Denuncia', 21, 'add_denuncia'),
(82, 'Can change Denuncia', 21, 'change_denuncia'),
(83, 'Can delete Denuncia', 21, 'delete_denuncia'),
(84, 'Can view Denuncia', 21, 'view_denuncia'),
(85, 'Can add Vehículo', 22, 'add_vehiculo'),
(86, 'Can change Vehículo', 22, 'change_vehiculo'),
(87, 'Can delete Vehículo', 22, 'delete_vehiculo'),
(88, 'Can view Vehículo', 22, 'view_vehiculo'),
(89, 'Can add Combustible', 23, 'add_combustible'),
(90, 'Can change Combustible', 23, 'change_combustible'),
(91, 'Can delete Combustible', 23, 'delete_combustible'),
(92, 'Can view Combustible', 23, 'view_combustible'),
(93, 'Can add Asignación de arma a policía', 24, 'add_armaperpol'),
(94, 'Can change Asignación de arma a policía', 24, 'change_armaperpol'),
(95, 'Can delete Asignación de arma a policía', 24, 'delete_armaperpol'),
(96, 'Can view Asignación de arma a policía', 24, 'view_armaperpol'),
(97, 'Can add Pertrechos', 25, 'add_pertrechos'),
(98, 'Can change Pertrechos', 25, 'change_pertrechos'),
(99, 'Can delete Pertrechos', 25, 'delete_pertrechos'),
(100, 'Can view Pertrechos', 25, 'view_pertrechos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$7CpC3GBS23fLse3VGwuqt7$1p7VuhXRvCBgKZO4+YFMLxUH5M7qSEHqh98ioXqB+6I=', '2024-02-23 15:23:16.452380', 1, 'Cesar07', '', '', 'cesar@gmail.com', 1, 1, '2023-12-17 01:59:06.078861'),
(2, 'pbkdf2_sha256$720000$VKeS8EKezhFlMCMTRZeSX3$t2Yce5zGiXsq05Ftd6BBSkWtPGOlxu/dHWmx87+5LMQ=', '2024-01-13 18:42:29.000000', 0, 'Juan14', '', '', 'juan@gmail.com', 0, 1, '2023-12-23 23:04:39.000000'),
(4, 'pbkdf2_sha256$600000$zNhvms40QLBYic9qKJAWEX$BonXQwzg45QOcExLWLuY43TVjN2kPQyRlCVcOtfJmGA=', '2024-02-20 03:45:03.321226', 0, 'Juan1', '', '', 'juan1@gmail.com', 0, 1, '2024-02-19 22:29:49.811369'),
(5, 'pbkdf2_sha256$600000$V6rCJVDgDb7eiKI9xl2Zyi$3BCwUlw+ScKYQloJYuf/NXY5pxKHdl30SkYOwhh8Va0=', '2024-02-20 02:04:03.240034', 0, 'Pedro2', '', '', 'pedro2@gmail.com', 0, 1, '2024-02-19 22:31:13.406818'),
(6, 'pbkdf2_sha256$600000$TmEkE3PPBPchJskDeuVlNV$xozr3dvycpjHlVGM2wjcZJI7XPDop7Ms3n95CokiZ4c=', '2024-02-22 02:11:37.175122', 0, 'Monica3', '', '', 'monica3@gmail.com', 0, 1, '2024-02-19 22:33:10.110631'),
(7, 'pbkdf2_sha256$600000$ijrb3ty9nSJ2crX12p0vjU$2748CQPuE6xXR39zeP13KZN0z94xd5+3HkVhjtFL7vM=', '2024-02-20 03:42:22.723743', 0, 'estalin4', '', '', 'estalin4@gmail.com', 0, 1, '2024-02-19 22:33:37.194026'),
(8, 'pbkdf2_sha256$600000$4cNa6NdJSY7VQw4H84hx81$kARihqeoukgxi9NJ8nXTRZRvWEvdXKyS9R6Y3aVPrfw=', '2024-02-20 01:56:28.985130', 0, 'carlos5', '', '', 'carlos5@gmail.com', 0, 1, '2024-02-19 22:34:24.119813'),
(9, 'pbkdf2_sha256$720000$ceAMwwkBcfAOZUebRAopBP$h2EXnSX6x9LcIKVYx1OMNuJ3UEtBGArSieHGwsEUzHY=', '2024-02-23 15:25:11.501837', 0, 'pepito21', '', '', 'pepito21', 0, 1, '2024-02-23 15:23:07.274287');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 4),
(5, 5, 2),
(4, 6, 6),
(6, 7, 6),
(7, 8, 7),
(8, 9, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-01-26 01:19:28.322049', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(24, 'appflotavehicular', 'armaperpol'),
(7, 'appflotavehicular', 'circuito'),
(23, 'appflotavehicular', 'combustible'),
(21, 'appflotavehicular', 'denuncia'),
(14, 'appflotavehicular', 'dependencia'),
(13, 'appflotavehicular', 'distrito'),
(15, 'appflotavehicular', 'entradamtto'),
(17, 'appflotavehicular', 'entradaorden'),
(8, 'appflotavehicular', 'mantenimiento'),
(16, 'appflotavehicular', 'ordendetrabajo'),
(18, 'appflotavehicular', 'persona'),
(25, 'appflotavehicular', 'pertrechos'),
(9, 'appflotavehicular', 'rango'),
(19, 'appflotavehicular', 'salidamtto'),
(20, 'appflotavehicular', 'salidaorden'),
(10, 'appflotavehicular', 'subcircuito'),
(11, 'appflotavehicular', 'tipomantenimiento'),
(12, 'appflotavehicular', 'tipovehiculo'),
(22, 'appflotavehicular', 'vehiculo'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-26 01:15:31.931737'),
(2, 'auth', '0001_initial', '2024-01-26 01:15:32.420856'),
(3, 'admin', '0001_initial', '2024-01-26 01:15:32.538298'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-26 01:15:32.550294'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-26 01:15:32.559288'),
(6, 'appflotavehicular', '0001_initial', '2024-01-26 01:15:34.293369'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-01-26 01:15:34.384485'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-01-26 01:15:34.510565'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-01-26 01:15:34.527557'),
(10, 'auth', '0004_alter_user_username_opts', '2024-01-26 01:15:34.544549'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-01-26 01:15:34.603278'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-01-26 01:15:34.607277'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-01-26 01:15:34.619269'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-01-26 01:15:34.640277'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-01-26 01:15:34.661710'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-01-26 01:15:34.694080'),
(17, 'auth', '0011_update_proxy_permissions', '2024-01-26 01:15:34.721623'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-01-26 01:15:34.740485'),
(19, 'sessions', '0001_initial', '2024-01-26 01:15:34.770383'),
(20, 'appflotavehicular', '0002_combustible', '2024-02-06 02:05:59.338289'),
(21, 'appflotavehicular', '0003_combustible_fecha_actual', '2024-02-18 02:08:29.075505'),
(22, 'appflotavehicular', '0004_pertrechos_armaperpol', '2024-02-23 13:04:04.966224');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('04xktfkpsojphueagxuq2u9z93zmekbs', '.eJxVjEEOwiAQRe_C2hCZoR1w6b5nIAwMUjVtUtqV8e7apAvd_vfef6kQt7WGrckSxqwuyqjT78YxPWTaQb7H6TbrNE_rMrLeFX3Qpoc5y_N6uH8HNbb6rZ13FG0HbM7ikbBYEU9gKHFJuQcCQizge0mUgZ0j7DI4wc5YJO7V-wPH2TcE:1rdWqP:ayetxpHBIXlyhpITB53rq8PJGNlA8T7PFHUK5j1L1Ec', '2024-03-08 14:48:09.255701'),
('2wld0h91f2lol4ba2psjlju8t9h1iket', '.eJxVjEEOwiAQRe_C2hApjIBL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzMurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL98awBkPkHISNJZOwYMjRzlGG83AYMhitAEC2ECJQmZ3FB6iFxAK3qv3B8-sN5Y:1rTAs3:HvRKLHcBFCg1lnhWm74pGCI9QQYYVyloP8js89AqZBQ', '2024-02-09 01:19:03.299549'),
('7ao3mxzywphhp7z14sdxljbddmnjwkw1', '.eJxVjEEOwiAQRe_C2hAYOsC4dO8ZmhlKpWpoUtqV8e7apAvd_vfef6met7X0W8tLPw3qrEidfjfh9Mh1B8Od623Waa7rMoneFX3Qpq_zkJ-Xw_07KNzKtxafIoMP0CEQyhg6cMGkRNZnMGTAIaOPPnQchd1IZIVwBOtiNmhFvT-35jaQ:1rdXQF:mr-7JyWXBfrx1c8jMJ5hamrUyisddPESfdG_Ak7f83U', '2024-03-08 15:25:11.503875'),
('a9esghke6ojl4nwifivl99gnoif3snu8', '.eJxVjEEOwiAURO_C2hCggMSle89A-J-pVA0kpV0Z726bdKHLmfdm3iKmdSlx7ZjjlMVFaHH67SjxE3UH-ZHqvUludZknkrsiD9rlrWW8rof7d1BSL9vajZR9MBS0P2dDg2IMOtDAwWc4jMSADQGAsdoaaEdbMGwUwKSV-HwBAXk46Q:1rcydj:CrbBpruvuLWubfvGxLrviEx6-ZDxzJL_hYmHPZ1Kgfw', '2024-03-07 02:16:47.793039'),
('kj98nyrkeu9wdzcc0uuac648p0zabgs7', '.eJxVjEEOwiAQRe_C2hCZoR1w6b5nIAwMUjVtUtqV8e7apAvd_vfef6kQt7WGrckSxqwuyqjT78YxPWTaQb7H6TbrNE_rMrLeFX3Qpoc5y_N6uH8HNbb6rZ13FG0HbM7ikbBYEU9gKHFJuQcCQizge0mUgZ0j7DI4wc5YJO7V-wPH2TcE:1rdUrz:qdAlyn8Gmlu-8HBwG5k17SPYz4-wUXYAHteacavwnjI', '2024-03-08 12:41:39.990558'),
('n7zougj7j508x5140ylfzqna2oa3lsvv', '.eJxVjEEOwiAURO_C2hCggMSle89A-J-pVA0kpV0Z726bdKHLmfdm3iKmdSlx7ZjjlMVFaHH67SjxE3UH-ZHqvUludZknkrsiD9rlrWW8rof7d1BSL9vajZR9MBS0P2dDg2IMOtDAwWc4jMSADQGAsdoaaEdbMGwUwKSV-HwBAXk46Q:1rUVOv:l-pAHuVRXDNXri-3YbJ34GRA1jDwAqLPAI7LEvxypUo', '2024-02-12 17:26:29.088191'),
('w9kecyc740p0fduc1mi76jn1smyt3qqy', '.eJxVjEEOwiAURO_C2hCggMSle89A-J-pVA0kpV0Z726bdKHLmfdm3iKmdSlx7ZjjlMVFaHH67SjxE3UH-ZHqvUludZknkrsiD9rlrWW8rof7d1BSL9vajZR9MBS0P2dDg2IMOtDAwWc4jMSADQGAsdoaaEdbMGwUwKSV-HwBAXk46Q:1rUVHB:KcgRbcCIMtJpa04Z3KXmuEdG11y_2ITHHr_XAuoWFtY', '2024-02-12 17:18:29.279556');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appflotavehicular_armaperpol`
--
ALTER TABLE `appflotavehicular_armaperpol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_ar_policia_id_9b154ad1_fk_appflotav` (`policia_id`),
  ADD KEY `appflotavehicular_ar_pertrecho_id_e54bdc46_fk_appflotav` (`pertrecho_id`);

--
-- Indices de la tabla `appflotavehicular_circuito`
--
ALTER TABLE `appflotavehicular_circuito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_ci_id_subcircuito_id_0a48af39_fk_appflotav` (`id_subcircuito_id`);

--
-- Indices de la tabla `appflotavehicular_combustible`
--
ALTER TABLE `appflotavehicular_combustible`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_co_dependencia_id_3408dc55_fk_appflotav` (`dependencia_id`),
  ADD KEY `appflotavehicular_co_persona_id_4c9edd03_fk_appflotav` (`persona_id`),
  ADD KEY `appflotavehicular_co_vehiculo_id_e315f178_fk_appflotav` (`vehiculo_id`);

--
-- Indices de la tabla `appflotavehicular_denuncia`
--
ALTER TABLE `appflotavehicular_denuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_de_id_circuito_id_65d002ab_fk_appflotav` (`id_circuito_id`),
  ADD KEY `appflotavehicular_de_id_subcircuito_id_90613ba1_fk_appflotav` (`id_subcircuito_id`);

--
-- Indices de la tabla `appflotavehicular_dependencia`
--
ALTER TABLE `appflotavehicular_dependencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_de_id_distrito_id_bacdfef5_fk_appflotav` (`id_distrito_id`);

--
-- Indices de la tabla `appflotavehicular_distrito`
--
ALTER TABLE `appflotavehicular_distrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_di_id_circuito_id_c42f53fc_fk_appflotav` (`id_circuito_id`);

--
-- Indices de la tabla `appflotavehicular_entradamtto`
--
ALTER TABLE `appflotavehicular_entradamtto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_en_mantenimiento_id_b655c651_fk_appflotav` (`mantenimiento_id`);

--
-- Indices de la tabla `appflotavehicular_entradaorden`
--
ALTER TABLE `appflotavehicular_entradaorden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_en_entrada_id_178f579c_fk_appflotav` (`entrada_id`);

--
-- Indices de la tabla `appflotavehicular_mantenimiento`
--
ALTER TABLE `appflotavehicular_mantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_ma_persona_id_52bed09b_fk_appflotav` (`persona_id`),
  ADD KEY `appflotavehicular_ma_tipodemantenimiento__0168ec4f_fk_appflotav` (`tipodemantenimiento_id`),
  ADD KEY `appflotavehicular_ma_vehiculo_id_1b8d6ea1_fk_appflotav` (`vehiculo_id`);

--
-- Indices de la tabla `appflotavehicular_ordendetrabajo`
--
ALTER TABLE `appflotavehicular_ordendetrabajo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_or_agente1_id_dfd6307e_fk_appflotav` (`agente1_id`),
  ADD KEY `appflotavehicular_or_agente2_id_e223f61a_fk_appflotav` (`agente2_id`),
  ADD KEY `appflotavehicular_or_agente3_id_76fe48c8_fk_appflotav` (`agente3_id`),
  ADD KEY `appflotavehicular_or_responsable_id_4f23611d_fk_appflotav` (`responsable_id`),
  ADD KEY `appflotavehicular_or_vehiculo_id_fad79634_fk_appflotav` (`vehiculo_id`),
  ADD KEY `appflotavehicular_or_dependencia_id_46b34a06_fk_appflotav` (`dependencia_id`);

--
-- Indices de la tabla `appflotavehicular_persona`
--
ALTER TABLE `appflotavehicular_persona`
  ADD PRIMARY KEY (`identificacion`),
  ADD KEY `appflotavehicular_pe_codigoempleado_id_58669d4f_fk_auth_user` (`codigoempleado_id`),
  ADD KEY `appflotavehicular_pe_dependencia_id_808c153b_fk_appflotav` (`dependencia_id`),
  ADD KEY `appflotavehicular_pe_id_rango_id_a7a9779e_fk_appflotav` (`id_rango_id`);

--
-- Indices de la tabla `appflotavehicular_pertrechos`
--
ALTER TABLE `appflotavehicular_pertrechos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `appflotavehicular_pe_dependencia_id_3086b0f3_fk_appflotav` (`dependencia_id`);

--
-- Indices de la tabla `appflotavehicular_rango`
--
ALTER TABLE `appflotavehicular_rango`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appflotavehicular_salidamtto`
--
ALTER TABLE `appflotavehicular_salidamtto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_sa_mantenimiento_id_4dcb27a0_fk_appflotav` (`mantenimiento_id`);

--
-- Indices de la tabla `appflotavehicular_salidaorden`
--
ALTER TABLE `appflotavehicular_salidaorden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_sa_salida_id_c0e7f4e3_fk_appflotav` (`salida_id`);

--
-- Indices de la tabla `appflotavehicular_subcircuito`
--
ALTER TABLE `appflotavehicular_subcircuito`
  ADD PRIMARY KEY (`cod_subcircuito`);

--
-- Indices de la tabla `appflotavehicular_tipomantenimiento`
--
ALTER TABLE `appflotavehicular_tipomantenimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appflotavehicular_tipovehiculo`
--
ALTER TABLE `appflotavehicular_tipovehiculo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appflotavehicular_vehiculo`
--
ALTER TABLE `appflotavehicular_vehiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `appflotavehicular_ve_dependencia_id_934ae348_fk_appflotav` (`dependencia_id`),
  ADD KEY `appflotavehicular_ve_tipovehiculo_id_66add380_fk_appflotav` (`tipovehiculo_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_armaperpol`
--
ALTER TABLE `appflotavehicular_armaperpol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_circuito`
--
ALTER TABLE `appflotavehicular_circuito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_combustible`
--
ALTER TABLE `appflotavehicular_combustible`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_denuncia`
--
ALTER TABLE `appflotavehicular_denuncia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_dependencia`
--
ALTER TABLE `appflotavehicular_dependencia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_distrito`
--
ALTER TABLE `appflotavehicular_distrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_entradamtto`
--
ALTER TABLE `appflotavehicular_entradamtto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_entradaorden`
--
ALTER TABLE `appflotavehicular_entradaorden`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_mantenimiento`
--
ALTER TABLE `appflotavehicular_mantenimiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_ordendetrabajo`
--
ALTER TABLE `appflotavehicular_ordendetrabajo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_pertrechos`
--
ALTER TABLE `appflotavehicular_pertrechos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_rango`
--
ALTER TABLE `appflotavehicular_rango`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_salidamtto`
--
ALTER TABLE `appflotavehicular_salidamtto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_salidaorden`
--
ALTER TABLE `appflotavehicular_salidaorden`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_tipomantenimiento`
--
ALTER TABLE `appflotavehicular_tipomantenimiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_tipovehiculo`
--
ALTER TABLE `appflotavehicular_tipovehiculo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appflotavehicular_armaperpol`
--
ALTER TABLE `appflotavehicular_armaperpol`
  ADD CONSTRAINT `appflotavehicular_ar_pertrecho_id_e54bdc46_fk_appflotav` FOREIGN KEY (`pertrecho_id`) REFERENCES `appflotavehicular_pertrechos` (`id`),
  ADD CONSTRAINT `appflotavehicular_ar_policia_id_9b154ad1_fk_appflotav` FOREIGN KEY (`policia_id`) REFERENCES `appflotavehicular_persona` (`identificacion`);

--
-- Filtros para la tabla `appflotavehicular_circuito`
--
ALTER TABLE `appflotavehicular_circuito`
  ADD CONSTRAINT `appflotavehicular_ci_id_subcircuito_id_0a48af39_fk_appflotav` FOREIGN KEY (`id_subcircuito_id`) REFERENCES `appflotavehicular_subcircuito` (`cod_subcircuito`);

--
-- Filtros para la tabla `appflotavehicular_combustible`
--
ALTER TABLE `appflotavehicular_combustible`
  ADD CONSTRAINT `appflotavehicular_co_dependencia_id_3408dc55_fk_appflotav` FOREIGN KEY (`dependencia_id`) REFERENCES `appflotavehicular_dependencia` (`id`),
  ADD CONSTRAINT `appflotavehicular_co_persona_id_4c9edd03_fk_appflotav` FOREIGN KEY (`persona_id`) REFERENCES `appflotavehicular_persona` (`identificacion`),
  ADD CONSTRAINT `appflotavehicular_co_vehiculo_id_e315f178_fk_appflotav` FOREIGN KEY (`vehiculo_id`) REFERENCES `appflotavehicular_vehiculo` (`placa`);

--
-- Filtros para la tabla `appflotavehicular_denuncia`
--
ALTER TABLE `appflotavehicular_denuncia`
  ADD CONSTRAINT `appflotavehicular_de_id_circuito_id_65d002ab_fk_appflotav` FOREIGN KEY (`id_circuito_id`) REFERENCES `appflotavehicular_circuito` (`id`),
  ADD CONSTRAINT `appflotavehicular_de_id_subcircuito_id_90613ba1_fk_appflotav` FOREIGN KEY (`id_subcircuito_id`) REFERENCES `appflotavehicular_subcircuito` (`cod_subcircuito`);

--
-- Filtros para la tabla `appflotavehicular_dependencia`
--
ALTER TABLE `appflotavehicular_dependencia`
  ADD CONSTRAINT `appflotavehicular_de_id_distrito_id_bacdfef5_fk_appflotav` FOREIGN KEY (`id_distrito_id`) REFERENCES `appflotavehicular_distrito` (`id`);

--
-- Filtros para la tabla `appflotavehicular_distrito`
--
ALTER TABLE `appflotavehicular_distrito`
  ADD CONSTRAINT `appflotavehicular_di_id_circuito_id_c42f53fc_fk_appflotav` FOREIGN KEY (`id_circuito_id`) REFERENCES `appflotavehicular_circuito` (`id`);

--
-- Filtros para la tabla `appflotavehicular_entradamtto`
--
ALTER TABLE `appflotavehicular_entradamtto`
  ADD CONSTRAINT `appflotavehicular_en_mantenimiento_id_b655c651_fk_appflotav` FOREIGN KEY (`mantenimiento_id`) REFERENCES `appflotavehicular_mantenimiento` (`id`);

--
-- Filtros para la tabla `appflotavehicular_entradaorden`
--
ALTER TABLE `appflotavehicular_entradaorden`
  ADD CONSTRAINT `appflotavehicular_en_entrada_id_178f579c_fk_appflotav` FOREIGN KEY (`entrada_id`) REFERENCES `appflotavehicular_ordendetrabajo` (`id`);

--
-- Filtros para la tabla `appflotavehicular_mantenimiento`
--
ALTER TABLE `appflotavehicular_mantenimiento`
  ADD CONSTRAINT `appflotavehicular_ma_persona_id_52bed09b_fk_appflotav` FOREIGN KEY (`persona_id`) REFERENCES `appflotavehicular_persona` (`identificacion`),
  ADD CONSTRAINT `appflotavehicular_ma_tipodemantenimiento__0168ec4f_fk_appflotav` FOREIGN KEY (`tipodemantenimiento_id`) REFERENCES `appflotavehicular_tipomantenimiento` (`id`),
  ADD CONSTRAINT `appflotavehicular_ma_vehiculo_id_1b8d6ea1_fk_appflotav` FOREIGN KEY (`vehiculo_id`) REFERENCES `appflotavehicular_vehiculo` (`placa`);

--
-- Filtros para la tabla `appflotavehicular_ordendetrabajo`
--
ALTER TABLE `appflotavehicular_ordendetrabajo`
  ADD CONSTRAINT `appflotavehicular_or_agente1_id_dfd6307e_fk_appflotav` FOREIGN KEY (`agente1_id`) REFERENCES `appflotavehicular_persona` (`identificacion`),
  ADD CONSTRAINT `appflotavehicular_or_agente2_id_e223f61a_fk_appflotav` FOREIGN KEY (`agente2_id`) REFERENCES `appflotavehicular_persona` (`identificacion`),
  ADD CONSTRAINT `appflotavehicular_or_agente3_id_76fe48c8_fk_appflotav` FOREIGN KEY (`agente3_id`) REFERENCES `appflotavehicular_persona` (`identificacion`),
  ADD CONSTRAINT `appflotavehicular_or_dependencia_id_46b34a06_fk_appflotav` FOREIGN KEY (`dependencia_id`) REFERENCES `appflotavehicular_dependencia` (`id`),
  ADD CONSTRAINT `appflotavehicular_or_responsable_id_4f23611d_fk_appflotav` FOREIGN KEY (`responsable_id`) REFERENCES `appflotavehicular_persona` (`identificacion`),
  ADD CONSTRAINT `appflotavehicular_or_vehiculo_id_fad79634_fk_appflotav` FOREIGN KEY (`vehiculo_id`) REFERENCES `appflotavehicular_vehiculo` (`placa`);

--
-- Filtros para la tabla `appflotavehicular_persona`
--
ALTER TABLE `appflotavehicular_persona`
  ADD CONSTRAINT `appflotavehicular_pe_codigoempleado_id_58669d4f_fk_auth_user` FOREIGN KEY (`codigoempleado_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `appflotavehicular_pe_dependencia_id_808c153b_fk_appflotav` FOREIGN KEY (`dependencia_id`) REFERENCES `appflotavehicular_dependencia` (`id`),
  ADD CONSTRAINT `appflotavehicular_pe_id_rango_id_a7a9779e_fk_appflotav` FOREIGN KEY (`id_rango_id`) REFERENCES `appflotavehicular_rango` (`id`);

--
-- Filtros para la tabla `appflotavehicular_pertrechos`
--
ALTER TABLE `appflotavehicular_pertrechos`
  ADD CONSTRAINT `appflotavehicular_pe_dependencia_id_3086b0f3_fk_appflotav` FOREIGN KEY (`dependencia_id`) REFERENCES `appflotavehicular_dependencia` (`id`);

--
-- Filtros para la tabla `appflotavehicular_salidamtto`
--
ALTER TABLE `appflotavehicular_salidamtto`
  ADD CONSTRAINT `appflotavehicular_sa_mantenimiento_id_4dcb27a0_fk_appflotav` FOREIGN KEY (`mantenimiento_id`) REFERENCES `appflotavehicular_mantenimiento` (`id`);

--
-- Filtros para la tabla `appflotavehicular_salidaorden`
--
ALTER TABLE `appflotavehicular_salidaorden`
  ADD CONSTRAINT `appflotavehicular_sa_salida_id_c0e7f4e3_fk_appflotav` FOREIGN KEY (`salida_id`) REFERENCES `appflotavehicular_ordendetrabajo` (`id`);

--
-- Filtros para la tabla `appflotavehicular_vehiculo`
--
ALTER TABLE `appflotavehicular_vehiculo`
  ADD CONSTRAINT `appflotavehicular_ve_dependencia_id_934ae348_fk_appflotav` FOREIGN KEY (`dependencia_id`) REFERENCES `appflotavehicular_dependencia` (`id`),
  ADD CONSTRAINT `appflotavehicular_ve_tipovehiculo_id_66add380_fk_appflotav` FOREIGN KEY (`tipovehiculo_id`) REFERENCES `appflotavehicular_tipovehiculo` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
