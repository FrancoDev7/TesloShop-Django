-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-11-2023 a las 00:09:24
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `teslo_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25, 'Can add Producto', 7, 'add_producto'),
(26, 'Can change Producto', 7, 'change_producto'),
(27, 'Can delete Producto', 7, 'delete_producto'),
(28, 'Can view Producto', 7, 'view_producto'),
(29, 'Can add venta', 8, 'add_venta'),
(30, 'Can change venta', 8, 'change_venta'),
(31, 'Can delete venta', 8, 'delete_venta'),
(32, 'Can view venta', 8, 'view_venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$9zpDVgw1Y5UBtGLFV1PDOM$X8siy3LAPjJ26VOJzGny45QisZpUDyjyDRCzF8aawzQ=', '2023-11-27 19:33:54.626749', 1, 'marce', '', '', '', 1, 1, '2023-11-27 19:33:30.020414');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb3_spanish2_ci,
  `object_repr` varchar(200) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb3_spanish2_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'teslo_shop', 'producto'),
(8, 'teslo_shop', 'venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-24 22:55:35.053300'),
(2, 'auth', '0001_initial', '2023-11-24 22:55:35.863012'),
(3, 'admin', '0001_initial', '2023-11-24 22:55:36.047009'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-24 22:55:36.062655'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-24 22:55:36.077739'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-24 22:55:36.152226'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-24 22:55:36.206076'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-24 22:55:36.255510'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-24 22:55:36.255510'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-24 22:55:36.302539'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-24 22:55:36.302539'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-24 22:55:36.322558'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-24 22:55:36.360673'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-24 22:55:36.419702'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-24 22:55:36.459981'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-24 22:55:36.467054'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-24 22:55:36.518639'),
(18, 'sessions', '0001_initial', '2023-11-24 22:55:36.573246'),
(19, 'teslo_shop', '0001_initial', '2023-11-24 22:55:36.586944'),
(20, 'teslo_shop', '0002_producto_stock', '2023-11-25 01:09:08.222978'),
(21, 'teslo_shop', '0003_cliente', '2023-11-25 15:27:48.831047'),
(22, 'teslo_shop', '0004_delete_cliente', '2023-11-26 00:58:39.267841'),
(23, 'teslo_shop', '0005_venta', '2023-11-27 00:11:55.205312'),
(24, 'teslo_shop', '0006_venta_correo_venta_direccion_envio_venta_rut', '2023-11-27 19:27:10.825343');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('yajboh9gx3enay50f2p9n3pxmcz0tt5o', '.eJxVjMsOwiAQRf-FtSFQHgMu3fsNZIahUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSJhZnocXpdyPMj9J2wHdst1nmua3LRHJX5EG7vM5cnpfD_Tuo2Ou3RmWyQi4UyIIP1iKZnAF4iOQ96GhRQ4yglAs5jIzOaKf9oLSxNKIT7w_eMjc5:1r7hMg:dZvmrs5vx3ql1ZeWHg-TtLgzuMbKb9UfxdrE1V8ihmk', '2023-12-11 19:33:54.627751');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` int NOT NULL,
  `talla` varchar(2) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `talla`, `imagen`, `stock`) VALUES
(15, 'poleras negra', 'polera polera ffd', 5000, 'S', 'Productos/tesla-polera_IEA5CFY.jpg', 2),
(14, 'polera prueba', 'pflllslldldlf', 5000, 'L', 'Productos/polera-verder_opiV6Zj.jpg', 4),
(6, 'polera verde Tesla', 'polera verde de tesla', 3000, 'M', 'Productos/polera-verder.jpg', 1),
(13, 'tesla polera incre', 'tesla polera incretesla polera incretesla polera incre', 3000, 'M', 'Productos/polera-blanca-tes_Adc3Fa7.webp', 2),
(12, 'tesla', 'teslalalslsl', 4000, 'S', 'Productos/tesla-polera.jpg', 3),
(9, 'polera blanca', 'polera blanca polera blanca', 6000, 'M', 'Productos/polera-blanca-tes.webp', 3),
(10, 'polera roja', 'roja roja', 6000, 'XL', 'Productos/polera_tesla_roja.jpg', 4),
(16, 'polera prueba3', 'prueba prueba prueba', 4000, 'L', 'Productos/polera-azul_Xwlpdft.jpg', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teslo_shop_venta`
--

DROP TABLE IF EXISTS `teslo_shop_venta`;
CREATE TABLE IF NOT EXISTS `teslo_shop_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cantidad` int UNSIGNED NOT NULL,
  `nombre_comprador` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fecha_venta` datetime(6) NOT NULL,
  `producto_id` bigint NOT NULL,
  `correo` varchar(254) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `direccion_envio` varchar(255) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `rut` varchar(12) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `teslo_shop_venta_producto_id_1cd17118` (`producto_id`)
) ;

--
-- Volcado de datos para la tabla `teslo_shop_venta`
--

INSERT INTO `teslo_shop_venta` (`id`, `codigo`, `cantidad`, `nombre_comprador`, `fecha_venta`, `producto_id`, `correo`, `direccion_envio`, `rut`) VALUES
(1, 'SwcHAgrc', 23, 'asd', '2023-11-27 19:34:44.393326', 15, 'asdasddsa@csad.cl', 'sdadsa', '21.594.303-8'),
(2, 'xx0o9pQf', 3, 'asd', '2023-11-27 19:35:00.641228', 6, 'asdasddsa@csad.cl', 'sdads2 23', '21.594.303-8'),
(3, '9xR1OwyW', 3, 'asd', '2023-11-27 19:35:22.810484', 6, 'asdasddsa@csad.cl', 'sdads2 23', '21.594.303-8');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
