-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 21, 2023 at 06:34 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `missing_persons`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_cases`
--

DROP TABLE IF EXISTS `add_cases`;
CREATE TABLE IF NOT EXISTS `add_cases` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `Child` varchar(50) NOT NULL,
  `father` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `eyecolor` varchar(50) NOT NULL,
  `haricolor` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_cases`
--

INSERT INTO `add_cases` (`add_id`, `Child`, `father`, `address`, `email`, `phone`, `photo`, `eyecolor`, `haricolor`, `gender`, `dob`, `status`) VALUES
(1, 'Nani', 'Shiva kumar', 'Vijayawada', 'shivakumar@email.com', '7845587445', 'images/nani_match.jpg', 'Black', 'Black', 'male', '1996-01-20', 'Found');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
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
(25, 'Can add addcasemodel', 7, 'add_addcasemodel'),
(26, 'Can change addcasemodel', 7, 'change_addcasemodel'),
(27, 'Can delete addcasemodel', 7, 'delete_addcasemodel'),
(28, 'Can view addcasemodel', 7, 'view_addcasemodel'),
(29, 'Can add usermodel', 8, 'add_usermodel'),
(30, 'Can change usermodel', 8, 'change_usermodel'),
(31, 'Can delete usermodel', 8, 'delete_usermodel'),
(32, 'Can view usermodel', 8, 'view_usermodel'),
(33, 'Can add registercasemodel', 9, 'add_registercasemodel'),
(34, 'Can change registercasemodel', 9, 'change_registercasemodel'),
(35, 'Can delete registercasemodel', 9, 'delete_registercasemodel'),
(36, 'Can view registercasemodel', 9, 'view_registercasemodel'),
(37, 'Can add userfeedback', 10, 'add_userfeedback'),
(38, 'Can change userfeedback', 10, 'change_userfeedback'),
(39, 'Can delete userfeedback', 10, 'delete_userfeedback'),
(40, 'Can view userfeedback', 10, 'view_userfeedback');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'adminapp', 'addcasemodel'),
(8, 'userapp', 'usermodel'),
(9, 'userapp', 'registercasemodel'),
(10, 'userapp', 'userfeedback');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-01-21 06:23:00.442225'),
(2, 'auth', '0001_initial', '2023-01-21 06:23:00.967461'),
(3, 'admin', '0001_initial', '2023-01-21 06:23:01.145349'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-21 06:23:01.159340'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-21 06:23:01.176330'),
(6, 'adminapp', '0001_initial', '2023-01-21 06:23:01.208312'),
(7, 'adminapp', '0002_addcasemodel_status', '2023-01-21 06:23:01.305251'),
(8, 'contenttypes', '0002_remove_content_type_name', '2023-01-21 06:23:01.388200'),
(9, 'auth', '0002_alter_permission_name_max_length', '2023-01-21 06:23:01.444165'),
(10, 'auth', '0003_alter_user_email_max_length', '2023-01-21 06:23:01.494133'),
(11, 'auth', '0004_alter_user_username_opts', '2023-01-21 06:23:01.513121'),
(12, 'auth', '0005_alter_user_last_login_null', '2023-01-21 06:23:01.785952'),
(13, 'auth', '0006_require_contenttypes_0002', '2023-01-21 06:23:01.788950'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2023-01-21 06:23:01.802943'),
(15, 'auth', '0008_alter_user_username_max_length', '2023-01-21 06:23:01.886890'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2023-01-21 06:23:01.936860'),
(17, 'auth', '0010_alter_group_name_max_length', '2023-01-21 06:23:01.988826'),
(18, 'auth', '0011_update_proxy_permissions', '2023-01-21 06:23:02.005817'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2023-01-21 06:23:02.062779'),
(20, 'sessions', '0001_initial', '2023-01-21 06:23:02.181707'),
(21, 'userapp', '0001_initial', '2023-01-21 06:23:02.204693'),
(22, 'userapp', '0002_registercasemodel', '2023-01-21 06:23:02.221683'),
(23, 'userapp', '0003_alter_registercasemodel_email', '2023-01-21 06:23:02.276162'),
(24, 'userapp', '0004_userfeedback', '2023-01-21 06:23:02.396087'),
(25, 'userapp', '0005_registercasemodel_user', '2023-01-21 06:23:02.468044'),
(26, 'userapp', '0006_rename_user_registercasemodel_user_case', '2023-01-21 06:23:12.007007'),
(27, 'userapp', '0007_registercasemodel_status', '2023-01-21 06:23:12.088956');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('czlsltar2rv4iqnmey8t7xaqozlkuft1', 'eyJ1c2VyX2lkIjoxfQ:1pJ7J0:z_-nahP0qRr2YB8EaPbgB8RIMtmhC_S8YbP_AOnBZX4', '2023-02-04 06:24:46.287083');

-- --------------------------------------------------------

--
-- Table structure for table `register_case`
--

DROP TABLE IF EXISTS `register_case`;
CREATE TABLE IF NOT EXISTS `register_case` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `user_case_id` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`case_id`),
  KEY `register_case_user_id_1223acd2` (`user_case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register_case`
--

INSERT INTO `register_case` (`case_id`, `name`, `mobile`, `email`, `description`, `photo`, `user_case_id`, `status`) VALUES
(1, 'Nani', '8686238308', 'tanmay@email.com', 'Found This person', 'nani.jpg', 1, 'Found');

-- --------------------------------------------------------

--
-- Table structure for table `userfeedback_details`
--

DROP TABLE IF EXISTS `userfeedback_details`;
CREATE TABLE IF NOT EXISTS `userfeedback_details` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `overall` int(11) DEFAULT NULL,
  `caseregister` int(11) DEFAULT NULL,
  `suggestion` varchar(400) DEFAULT NULL,
  `sentiment` varchar(50) DEFAULT NULL,
  `feedback2_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `userfeedback_details_feedback2_id_cae6560e` (`feedback2_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_registrations`
--

DROP TABLE IF EXISTS `user_registrations`;
CREATE TABLE IF NOT EXISTS `user_registrations` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `father` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_registrations`
--

INSERT INTO `user_registrations` (`user_id`, `name`, `father`, `email`, `phone`, `gender`, `dob`, `city`, `password`, `photo`) VALUES
(1, 'tanmay', 'Damrudhar', 'tanmay@email.com', '8686238308', 'male', '1996-01-19', 'Hyderabad', '12', 'images/gallery-04.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
