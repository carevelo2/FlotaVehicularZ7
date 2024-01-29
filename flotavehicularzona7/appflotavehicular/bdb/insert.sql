-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-01-2024 a las 02:41:23
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

--
-- Volcado de datos para la tabla `appflotavehicular_circuito`
--

INSERT INTO `appflotavehicular_circuito` (`id`, `cod_circuito`, `nombre_circuito`, `numero_circuito`, `id_subcircuito_id`) VALUES
(1, '11D0 1C01', 'VILCABAM BA', '22', '11D01C 01S01');

--
-- Volcado de datos para la tabla `appflotavehicular_dependencia`
--

INSERT INTO `appflotavehicular_dependencia` (`id`, `provincia`, `parroquia`, `id_distrito_id`) VALUES
(1, 'Loja', 'Villacamba(Victoria)', 1);

--
-- Volcado de datos para la tabla `appflotavehicular_distrito`
--

INSERT INTO `appflotavehicular_distrito` (`id`, `cod_distrito`, `nombre_distrito`, `numero_distrito`, `id_circuito_id`) VALUES
(1, '11D0 1', 'Loja', '9', 1);

--
-- Volcado de datos para la tabla `appflotavehicular_persona`
--

INSERT INTO `appflotavehicular_persona` (`identificacion`, `nombres`, `apellidos`, `direccion`, `fecha_nacimiento`, `tipo_sangre`, `ciudad_nacimiento`, `numero_celular`, `codigoempleado_id`, `dependencia_id`, `id_rango_id`) VALUES
('0401283741', 'Cesar', 'Gutierres', 'Tulcan', '2023-12-24', 'O+', 'Tulcan', '0000000', 1, 1, 1);

--
-- Volcado de datos para la tabla `appflotavehicular_rango`
--

INSERT INTO `appflotavehicular_rango` (`id`, `rangopersona`, `detalle`) VALUES
(1, 'Capitan', 'Personal de alto rango'),
(2, 'Teniente', 'Policia Nacional'),
(3, 'Sargento Primero', 'Policia Nacional'),
(4, 'Sargento Segundo', 'Policia Nacional'),
(5, 'Cabo Primero', 'Policia Nacional'),
(6, 'Cabo Segundo', 'Policia Nacional');

--
-- Volcado de datos para la tabla `appflotavehicular_subcircuito`
--

INSERT INTO `appflotavehicular_subcircuito` (`cod_subcircuito`, `nombre_subcircuito`, `numero_subcircuito`) VALUES
('11D01C 01S01', 'VILCABAM BA 1', '1');

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
(7, 'Tecnico 2');

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
(88, 'Can view Vehículo', 22, 'view_vehiculo');

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$P1CPomvuIlVpa32iQCthS9$42irwhfD+a0mSustr7T0A8NxJLM46xN32sTE1CBpNAI=', '2024-01-26 01:19:03.294546', 1, 'Cesar07', '', '', 'cesar@gmail.com', 1, 1, '2023-12-17 01:59:06.078861'),
(2, 'pbkdf2_sha256$720000$VKeS8EKezhFlMCMTRZeSX3$t2Yce5zGiXsq05Ftd6BBSkWtPGOlxu/dHWmx87+5LMQ=', '2024-01-13 18:42:29.000000', 0, 'Juan14', '', '', 'juan@gmail.com', 0, 0, '2023-12-23 23:04:39.000000');

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-01-26 01:19:28.322049', '2', 'Juan14', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1);

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'appflotavehicular', 'circuito'),
(21, 'appflotavehicular', 'denuncia'),
(14, 'appflotavehicular', 'dependencia'),
(13, 'appflotavehicular', 'distrito'),
(15, 'appflotavehicular', 'entradamtto'),
(17, 'appflotavehicular', 'entradaorden'),
(8, 'appflotavehicular', 'mantenimiento'),
(16, 'appflotavehicular', 'ordendetrabajo'),
(18, 'appflotavehicular', 'persona'),
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
(19, 'sessions', '0001_initial', '2024-01-26 01:15:34.770383');

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2wld0h91f2lol4ba2psjlju8t9h1iket', '.eJxVjEEOwiAQRe_C2hApjIBL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzMurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL98awBkPkHISNJZOwYMjRzlGG83AYMhitAEC2ECJQmZ3FB6iFxAK3qv3B8-sN5Y:1rTAs3:HvRKLHcBFCg1lnhWm74pGCI9QQYYVyloP8js89AqZBQ', '2024-02-09 01:19:03.299549');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
