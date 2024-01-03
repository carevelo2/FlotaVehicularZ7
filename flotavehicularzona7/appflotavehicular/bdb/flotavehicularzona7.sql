-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-01-2024 a las 02:18:06
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
-- Estructura de tabla para la tabla `appflotavehicular_circuito`
--

CREATE TABLE `appflotavehicular_circuito` (
  `cod_circuito` varchar(20) NOT NULL,
  `nombre_circuito` varchar(100) NOT NULL,
  `numero_circuito` varchar(100) NOT NULL,
  `id_subcircuito_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_dependencia`
--

CREATE TABLE `appflotavehicular_dependencia` (
  `identificacion` varchar(20) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `parroquia` varchar(50) NOT NULL,
  `id_circuito_id` varchar(20) NOT NULL,
  `id_distrito_id` varchar(20) NOT NULL,
  `id_subcircuito_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_distrito`
--

CREATE TABLE `appflotavehicular_distrito` (
  `cod_distrito` varchar(20) NOT NULL,
  `nombre_distrito` varchar(100) NOT NULL,
  `numero_distrito` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'docentradamancar/EntradaMantenimiento_pba123.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_mantenimiento`
--

CREATE TABLE `appflotavehicular_mantenimiento` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `km` decimal(15,2) NOT NULL,
  `observaciones` longtext DEFAULT NULL,
  `persona_id` varchar(10) DEFAULT NULL,
  `tipodemantenimiento_id` bigint(20) NOT NULL,
  `vehiculo_id` varchar(8) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_mantenimiento`
--

INSERT INTO `appflotavehicular_mantenimiento` (`id`, `fecha`, `km`, `observaciones`, `persona_id`, `tipodemantenimiento_id`, `vehiculo_id`, `estado`) VALUES
(1, '2023-12-30', 1235000.00, 'Cabios de aceite, aceite kendal o 3.5\r\nRegulación de frenos\r\nObservación de freno de mano\r\nCambios de pastillas\r\nRegulación de aire en llantas', '0402135214', 1, 'pba123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_persona`
--

CREATE TABLE `appflotavehicular_persona` (
  `identificacion` varchar(10) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `tipo_sangre` varchar(10) NOT NULL,
  `ciudad_nacimiento` varchar(25) NOT NULL,
  `numero_celular` varchar(10) NOT NULL,
  `dependencia` varchar(150) NOT NULL,
  `codigoempleado_id` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_rango_id` bigint(20) NOT NULL,
  `contrasenia_firma` varchar(255) DEFAULT NULL,
  `firma` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_persona`
--

INSERT INTO `appflotavehicular_persona` (`identificacion`, `nombres`, `apellidos`, `direccion`, `tipo_sangre`, `ciudad_nacimiento`, `numero_celular`, `dependencia`, `codigoempleado_id`, `fecha_nacimiento`, `id_rango_id`, `contrasenia_firma`, `firma`) VALUES
('0401283741', 'Cesar', 'Gutierres', 'Tulcan', 'O+', 'Tulcan', '0000000', '2', 1, '2023-12-24', 1, '', ''),
('0402135214', 'Juan', 'Gutierrez', 'Huaca', 'O+', 'Tulcan', '00002121', '2', 2, '2023-12-30', 1, 'pbkdf2_sha256$720000$mJBkgCOxocGemzRIkImCeb$4c67j3G1dcufbA1FiEihG0qNAGO9ox3iL/20nYJQ3Dg=', 'firmasempleados\\0402135214.jpg');

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
(1, 'Capitan', 'Personal de alto rango');

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
(1, 'docsalidamancar/SalidaMantenimiento_pba123.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_subcircuito`
--

CREATE TABLE `appflotavehicular_subcircuito` (
  `cod_subcircuito` varchar(20) NOT NULL,
  `nombre_subcircuito` varchar(100) NOT NULL,
  `numero_subcircuito` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appflotavehicular_tipomantenimiento`
--

CREATE TABLE `appflotavehicular_tipomantenimiento` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_tipomantenimiento`
--

INSERT INTO `appflotavehicular_tipomantenimiento` (`id`, `tipo`, `descripcion`) VALUES
(1, 'Preventivo', 'Aplica a todos los autos'),
(2, 'Correctivo', 'Aplica a todos los autos');

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
(1, 'Automovil', 'Deportivo 4 puertas');

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
  `capacidad_carga` int(11) NOT NULL,
  `capacidad_pasajeros` int(11) NOT NULL,
  `tipovehiculo_id` bigint(20) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appflotavehicular_vehiculo`
--

INSERT INTO `appflotavehicular_vehiculo` (`placa`, `chasis`, `marca`, `modelo`, `color`, `motor`, `kilometraje`, `cilindraje`, `capacidad_carga`, `capacidad_pasajeros`, `tipovehiculo_id`, `estado`) VALUES
('pba123', '3123123', 'chevrolet', 'gt', 'rojo', '12312312', 1230000, 12, 2, 5, 1, 1);

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
(4, 'Encargado Logistica'),
(5, 'Gerente'),
(2, 'Personal Policial');

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
(25, 'Can add Persona', 7, 'add_persona'),
(26, 'Can change Persona', 7, 'change_persona'),
(27, 'Can delete Persona', 7, 'delete_persona'),
(28, 'Can view Persona', 7, 'view_persona'),
(29, 'Can add Tipo Vehículo', 8, 'add_tipovehiculo'),
(30, 'Can change Tipo Vehículo', 8, 'change_tipovehiculo'),
(31, 'Can delete Tipo Vehículo', 8, 'delete_tipovehiculo'),
(32, 'Can view Tipo Vehículo', 8, 'view_tipovehiculo'),
(33, 'Can add Vehículo', 9, 'add_vehiculo'),
(34, 'Can change Vehículo', 9, 'change_vehiculo'),
(35, 'Can delete Vehículo', 9, 'delete_vehiculo'),
(36, 'Can view Vehículo', 9, 'view_vehiculo'),
(37, 'Can add Tipo mantenimiento', 10, 'add_tipomantenimiento'),
(38, 'Can change Tipo mantenimiento', 10, 'change_tipomantenimiento'),
(39, 'Can delete Tipo mantenimiento', 10, 'delete_tipomantenimiento'),
(40, 'Can view Tipo mantenimiento', 10, 'view_tipomantenimiento'),
(41, 'Can add Mantenimiento', 11, 'add_mantenimiento'),
(42, 'Can change Mantenimiento', 11, 'change_mantenimiento'),
(43, 'Can delete Mantenimiento', 11, 'delete_mantenimiento'),
(44, 'Can view Mantenimiento', 11, 'view_mantenimiento'),
(45, 'Can add Rango', 12, 'add_rango'),
(46, 'Can change Rango', 12, 'change_rango'),
(47, 'Can delete Rango', 12, 'delete_rango'),
(48, 'Can view Rango', 12, 'view_rango'),
(49, 'Can add Circuito', 13, 'add_circuito'),
(50, 'Can change Circuito', 13, 'change_circuito'),
(51, 'Can delete Circuito', 13, 'delete_circuito'),
(52, 'Can view Circuito', 13, 'view_circuito'),
(53, 'Can add Distrito', 14, 'add_distrito'),
(54, 'Can change Distrito', 14, 'change_distrito'),
(55, 'Can delete Distrito', 14, 'delete_distrito'),
(56, 'Can view Distrito', 14, 'view_distrito'),
(57, 'Can add Subcircuito', 15, 'add_subcircuito'),
(58, 'Can change Subcircuito', 15, 'change_subcircuito'),
(59, 'Can delete Subcircuito', 15, 'delete_subcircuito'),
(60, 'Can view Subcircuito', 15, 'view_subcircuito'),
(61, 'Can add Dependencia', 16, 'add_dependencia'),
(62, 'Can change Dependencia', 16, 'change_dependencia'),
(63, 'Can delete Dependencia', 16, 'delete_dependencia'),
(64, 'Can view Dependencia', 16, 'view_dependencia'),
(65, 'Can add Salida mantenimiento', 17, 'add_salidamtto'),
(66, 'Can change Salida mantenimiento', 17, 'change_salidamtto'),
(67, 'Can delete Salida mantenimiento', 17, 'delete_salidamtto'),
(68, 'Can view Salida mantenimiento', 17, 'view_salidamtto'),
(69, 'Can add Entrada mantenimiento', 18, 'add_entradamtto'),
(70, 'Can change Entrada mantenimiento', 18, 'change_entradamtto'),
(71, 'Can delete Entrada mantenimiento', 18, 'delete_entradamtto'),
(72, 'Can view Entrada mantenimiento', 18, 'view_entradamtto');

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
(1, 'pbkdf2_sha256$720000$P1CPomvuIlVpa32iQCthS9$42irwhfD+a0mSustr7T0A8NxJLM46xN32sTE1CBpNAI=', '2023-12-30 23:03:49.309487', 1, 'Cesar07', '', '', 'cesar@gmail.com', 1, 1, '2023-12-17 01:59:06.078861'),
(2, 'pbkdf2_sha256$720000$VKeS8EKezhFlMCMTRZeSX3$t2Yce5zGiXsq05Ftd6BBSkWtPGOlxu/dHWmx87+5LMQ=', '2023-12-24 23:11:35.000000', 0, 'Juan14', '', '', 'juan@gmail.com', 0, 1, '2023-12-23 23:04:39.000000');

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
(2, 2, 5);

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
(1, '2023-12-23 23:07:24.438398', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(2, '2023-12-24 02:15:34.247686', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(3, '2023-12-24 15:07:29.512144', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(4, '2023-12-24 16:14:15.722540', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(5, '2023-12-24 16:18:44.510944', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(6, '2023-12-30 23:11:54.353177', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(7, '2023-12-30 23:41:52.677904', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(8, '2023-12-30 23:46:24.825469', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(9, '2023-12-30 23:48:49.239730', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(10, '2023-12-30 23:53:38.559768', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1);

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
(13, 'appflotavehicular', 'circuito'),
(16, 'appflotavehicular', 'dependencia'),
(14, 'appflotavehicular', 'distrito'),
(18, 'appflotavehicular', 'entradamtto'),
(11, 'appflotavehicular', 'mantenimiento'),
(7, 'appflotavehicular', 'persona'),
(12, 'appflotavehicular', 'rango'),
(17, 'appflotavehicular', 'salidamtto'),
(15, 'appflotavehicular', 'subcircuito'),
(10, 'appflotavehicular', 'tipomantenimiento'),
(8, 'appflotavehicular', 'tipovehiculo'),
(9, 'appflotavehicular', 'vehiculo'),
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
(1, 'contenttypes', '0001_initial', '2023-12-17 01:56:19.272270'),
(2, 'auth', '0001_initial', '2023-12-17 01:56:20.240949'),
(3, 'admin', '0001_initial', '2023-12-17 01:56:20.525785'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-12-17 01:56:20.541776'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-17 01:56:20.558767'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-12-17 01:56:20.633725'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-12-17 01:56:20.708680'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-12-17 01:56:20.757653'),
(9, 'auth', '0004_alter_user_username_opts', '2023-12-17 01:56:20.773643'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-12-17 01:56:20.828611'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-12-17 01:56:20.832610'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-12-17 01:56:20.842604'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-12-17 01:56:20.860593'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-12-17 01:56:20.877583'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-12-17 01:56:20.892575'),
(16, 'auth', '0011_update_proxy_permissions', '2023-12-17 01:56:20.903570'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-12-17 01:56:20.919561'),
(18, 'sessions', '0001_initial', '2023-12-17 01:56:20.949542'),
(19, 'appflotavehicular', '0001_initial', '2023-12-19 22:37:57.806233'),
(20, 'appflotavehicular', '0002_alter_tipovehiculo_descripcion', '2023-12-19 22:55:06.871713'),
(21, 'appflotavehicular', '0003_tipomantenimiento', '2023-12-23 19:58:28.234817'),
(22, 'appflotavehicular', '0004_mantenimiento', '2023-12-23 20:39:26.034765'),
(23, 'appflotavehicular', '0005_rango', '2023-12-23 21:39:35.540243'),
(24, 'appflotavehicular', '0006_persona_codigoempleado_persona_fecha_nacimiento_and_more', '2023-12-23 22:10:56.141623'),
(25, 'appflotavehicular', '0007_remove_persona_contraseña', '2023-12-23 22:12:25.940005'),
(26, 'appflotavehicular', '0008_alter_mantenimiento_fecha_alter_mantenimiento_km_and_more', '2023-12-25 02:41:57.691962'),
(27, 'appflotavehicular', '0009_mantenimiento_estado_alter_mantenimiento_fecha_and_more', '2023-12-25 02:53:44.944435'),
(28, 'appflotavehicular', '0010_circuito_distrito_subcircuito_and_more', '2023-12-27 21:37:00.436963'),
(29, 'appflotavehicular', '0011_alter_mantenimiento_fecha_and_more', '2023-12-27 21:37:14.386684'),
(30, 'appflotavehicular', '0012_alter_mantenimiento_fecha_and_more', '2023-12-28 21:31:15.442457'),
(31, 'appflotavehicular', '0013_alter_mantenimiento_fecha_and_more', '2023-12-28 21:31:22.302667'),
(32, 'appflotavehicular', '0014_vehiculo_estado_alter_mantenimiento_fecha_and_more', '2023-12-29 22:08:46.178739'),
(33, 'appflotavehicular', '0015_alter_mantenimiento_fecha_and_more', '2023-12-29 22:09:34.015217'),
(34, 'appflotavehicular', '0016_persona_contraseña_firma_persona_firma_and_more', '2023-12-30 22:42:20.490126'),
(35, 'appflotavehicular', '0017_rename_contraseña_firma_persona_contrasenia_firma_and_more', '2023-12-30 22:51:56.653357'),
(36, 'appflotavehicular', '0018_alter_mantenimiento_fecha_and_more', '2023-12-31 01:06:26.990383'),
(37, 'appflotavehicular', '0019_alter_mantenimiento_fecha_and_more', '2023-12-31 21:13:42.690221'),
(38, 'appflotavehicular', '0020_alter_mantenimiento_fecha_and_more', '2023-12-31 21:13:58.904331'),
(39, 'appflotavehicular', '0021_alter_distrito_options_alter_mantenimiento_fecha_and_more', '2024-01-02 21:33:15.682781'),
(40, 'appflotavehicular', '0022_alter_distrito_options_circuito_id_subcircuito_and_more', '2024-01-02 21:33:15.912261'),
(41, 'appflotavehicular', '0023_alter_mantenimiento_fecha_and_more', '2024-01-02 21:33:29.598512'),
(42, 'appflotavehicular', '0024_alter_circuito_cod_circuito_and_more', '2024-01-03 01:17:37.683173'),
(43, 'appflotavehicular', '0025_alter_mantenimiento_fecha_and_more', '2024-01-03 01:17:44.268225');

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
('hx2h9nxchm9ij33cfva8p36c8595zot8', '.eJxVjEEOwiAQRe_C2hApjIBL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzMurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL98awBkPkHISNJZOwYMjRzlGG83AYMhitAEC2ECJQmZ3FB6iFxAK3qv3B8-sN5Y:1rFOnW:z9RFLdV0RhHoYpDt1XQxRpzUg2Sj0Fh252XO2aXlwS8', '2024-01-02 01:21:26.622057'),
('i5frrbsugwsmrc25a4fz3s4uv2ecar16', '.eJxVjEEOwiAQRe_C2hApjIBL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzMurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL98awBkPkHISNJZOwYMjRzlGG83AYMhitAEC2ECJQmZ3FB6iFxAK3qv3B8-sN5Y:1rHXdl:FtyqDH2tW_WqoRt4c9ho9mDi_JJcXUds_VaLKWJRgbg', '2024-01-07 23:12:13.628052'),
('nm8y9bmwhd1bqx08fc3uzkd5tnizff24', '.eJxVjEEOwiAQRe_C2hApjIBL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzMurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL98awBkPkHISNJZOwYMjRzlGG83AYMhitAEC2ECJQmZ3FB6iFxAK3qv3B8-sN5Y:1rJiMv:tKLXHsEC2HFlUv40UcyOgi2r4e4jg1v5WYLCufw55CQ', '2024-01-13 23:03:49.312024'),
('y1juw3gae7y4yooa66xy12c3vjwqy4ck', '.eJxVjEEOwiAQRe_C2hAEhgGX7nsGwsBUqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xKuIitDj9bpTyg9sOyj212yzz3NZlIrkr8qBdDnPh5_Vw_w5q6vVbO4MG0FgiR54cOl0CesOjV4oJMoBijVCCxZESICVFFqwPxp6BcxDvD8QrNys:1rHXd9:UCbLeaU5YvGkgetzOCABFqB9P6e5klReWcewqPbtDXA', '2024-01-07 23:11:35.359665');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appflotavehicular_circuito`
--
ALTER TABLE `appflotavehicular_circuito`
  ADD PRIMARY KEY (`cod_circuito`),
  ADD KEY `appflotavehicular_circuito_id_subcircuito_id_0a48af39_fk` (`id_subcircuito_id`);

--
-- Indices de la tabla `appflotavehicular_dependencia`
--
ALTER TABLE `appflotavehicular_dependencia`
  ADD PRIMARY KEY (`identificacion`),
  ADD KEY `appflotavehicular_dependencia_id_circuito_id_34be0f88_fk` (`id_circuito_id`),
  ADD KEY `appflotavehicular_dependencia_id_distrito_id_bacdfef5_fk` (`id_distrito_id`),
  ADD KEY `appflotavehicular_dependencia_id_subcircuito_id_74d41419_fk` (`id_subcircuito_id`);

--
-- Indices de la tabla `appflotavehicular_distrito`
--
ALTER TABLE `appflotavehicular_distrito`
  ADD PRIMARY KEY (`cod_distrito`);

--
-- Indices de la tabla `appflotavehicular_entradamtto`
--
ALTER TABLE `appflotavehicular_entradamtto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_en_mantenimiento_id_b655c651_fk_appflotav` (`mantenimiento_id`);

--
-- Indices de la tabla `appflotavehicular_mantenimiento`
--
ALTER TABLE `appflotavehicular_mantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appflotavehicular_ma_persona_id_52bed09b_fk_appflotav` (`persona_id`),
  ADD KEY `appflotavehicular_ma_tipodemantenimiento__0168ec4f_fk_appflotav` (`tipodemantenimiento_id`),
  ADD KEY `appflotavehicular_ma_vehiculo_id_1b8d6ea1_fk_appflotav` (`vehiculo_id`);

--
-- Indices de la tabla `appflotavehicular_persona`
--
ALTER TABLE `appflotavehicular_persona`
  ADD PRIMARY KEY (`identificacion`),
  ADD KEY `appflotavehicular_pe_codigoempleado_id_58669d4f_fk_auth_user` (`codigoempleado_id`),
  ADD KEY `appflotavehicular_pe_id_rango_id_a7a9779e_fk_appflotav` (`id_rango_id`);

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
-- AUTO_INCREMENT de la tabla `appflotavehicular_entradamtto`
--
ALTER TABLE `appflotavehicular_entradamtto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_mantenimiento`
--
ALTER TABLE `appflotavehicular_mantenimiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_rango`
--
ALTER TABLE `appflotavehicular_rango`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_salidamtto`
--
ALTER TABLE `appflotavehicular_salidamtto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_tipomantenimiento`
--
ALTER TABLE `appflotavehicular_tipomantenimiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `appflotavehicular_tipovehiculo`
--
ALTER TABLE `appflotavehicular_tipovehiculo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appflotavehicular_circuito`
--
ALTER TABLE `appflotavehicular_circuito`
  ADD CONSTRAINT `appflotavehicular_circuito_id_subcircuito_id_0a48af39_fk` FOREIGN KEY (`id_subcircuito_id`) REFERENCES `appflotavehicular_subcircuito` (`cod_subcircuito`);

--
-- Filtros para la tabla `appflotavehicular_dependencia`
--
ALTER TABLE `appflotavehicular_dependencia`
  ADD CONSTRAINT `appflotavehicular_dependencia_id_circuito_id_34be0f88_fk` FOREIGN KEY (`id_circuito_id`) REFERENCES `appflotavehicular_circuito` (`cod_circuito`),
  ADD CONSTRAINT `appflotavehicular_dependencia_id_distrito_id_bacdfef5_fk` FOREIGN KEY (`id_distrito_id`) REFERENCES `appflotavehicular_distrito` (`cod_distrito`),
  ADD CONSTRAINT `appflotavehicular_dependencia_id_subcircuito_id_74d41419_fk` FOREIGN KEY (`id_subcircuito_id`) REFERENCES `appflotavehicular_subcircuito` (`cod_subcircuito`);

--
-- Filtros para la tabla `appflotavehicular_entradamtto`
--
ALTER TABLE `appflotavehicular_entradamtto`
  ADD CONSTRAINT `appflotavehicular_en_mantenimiento_id_b655c651_fk_appflotav` FOREIGN KEY (`mantenimiento_id`) REFERENCES `appflotavehicular_mantenimiento` (`id`);

--
-- Filtros para la tabla `appflotavehicular_mantenimiento`
--
ALTER TABLE `appflotavehicular_mantenimiento`
  ADD CONSTRAINT `appflotavehicular_ma_persona_id_52bed09b_fk_appflotav` FOREIGN KEY (`persona_id`) REFERENCES `appflotavehicular_persona` (`identificacion`),
  ADD CONSTRAINT `appflotavehicular_ma_tipodemantenimiento__0168ec4f_fk_appflotav` FOREIGN KEY (`tipodemantenimiento_id`) REFERENCES `appflotavehicular_tipomantenimiento` (`id`),
  ADD CONSTRAINT `appflotavehicular_ma_vehiculo_id_1b8d6ea1_fk_appflotav` FOREIGN KEY (`vehiculo_id`) REFERENCES `appflotavehicular_vehiculo` (`placa`);

--
-- Filtros para la tabla `appflotavehicular_persona`
--
ALTER TABLE `appflotavehicular_persona`
  ADD CONSTRAINT `appflotavehicular_pe_codigoempleado_id_58669d4f_fk_auth_user` FOREIGN KEY (`codigoempleado_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `appflotavehicular_pe_id_rango_id_a7a9779e_fk_appflotav` FOREIGN KEY (`id_rango_id`) REFERENCES `appflotavehicular_rango` (`id`);

--
-- Filtros para la tabla `appflotavehicular_salidamtto`
--
ALTER TABLE `appflotavehicular_salidamtto`
  ADD CONSTRAINT `appflotavehicular_sa_mantenimiento_id_4dcb27a0_fk_appflotav` FOREIGN KEY (`mantenimiento_id`) REFERENCES `appflotavehicular_mantenimiento` (`id`);

--
-- Filtros para la tabla `appflotavehicular_vehiculo`
--
ALTER TABLE `appflotavehicular_vehiculo`
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
