-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: web_site
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.22-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `web_site`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `web_site` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `web_site`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add group',7,'add_group'),(26,'Can change group',7,'change_group'),(27,'Can delete group',7,'delete_group'),(28,'Can view group',7,'view_group'),(29,'Can add test',8,'add_test'),(30,'Can change test',8,'change_test'),(31,'Can delete test',8,'delete_test'),(32,'Can view test',8,'view_test'),(33,'Can add rule',9,'add_rule'),(34,'Can change rule',9,'change_rule'),(35,'Can delete rule',9,'delete_rule'),(36,'Can view rule',9,'view_rule'),(37,'Can add auth token',10,'add_authtoken'),(38,'Can change auth token',10,'change_authtoken'),(39,'Can delete auth token',10,'delete_authtoken'),(40,'Can view auth token',10,'view_authtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$mVZKnL3yPjkW$vPsQXTjH6JVrMWrc9oaRkNuSpV5HfCdx+rpcrkdk3/g=',NULL,0,'a1','','','a1@gmail.com',0,1,'2020-01-26 05:14:18.563703'),(2,'pbkdf2_sha256$180000$8JLZA48EwIbn$7FoOMqAGcyz5UFlITEQKUg1qH6/JCMNjfQhShKtU1Ro=',NULL,0,'ф2','','','a1@gmail.com',0,1,'2020-01-26 05:23:58.452140'),(3,'pbkdf2_sha256$180000$e01nj4l5sGja$NoYrHIZyCm7Dsab6Ce0VtrvTZEpArzuVeH+qaq+2wq8=',NULL,0,'comdcomp','','','dim@comdcomp.ru',0,1,'2020-01-31 20:02:12.820227'),(4,'pbkdf2_sha256$180000$Zbcf4gVbUbBD$T5pO3gFO+jShFywxe5HoNNjwRg3keA4CGphtl1iH7h0=','2020-02-29 01:57:37.820477',1,'admin','','','comdcomp@yandex.ru',1,1,'2020-02-12 18:11:27.914621'),(5,'pbkdf2_sha256$180000$EiJOhoUKdL1z$MbNCJwvgP5gi3kUGrOcPWWFP7Dg+bSaGek/E3Qz+Hco=',NULL,0,'teacher','','','',1,1,'2020-02-12 18:13:08.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,5,1),(2,5,2),(3,5,3),(4,5,4),(5,5,5),(6,5,6),(7,5,7),(8,5,8),(9,5,9),(10,5,10),(11,5,11),(12,5,12),(13,5,13),(14,5,14),(15,5,15),(16,5,16),(17,5,17),(18,5,18),(19,5,19),(20,5,20),(21,5,21),(22,5,22),(23,5,23),(24,5,24),(25,5,25),(26,5,26),(27,5,27),(28,5,28),(29,5,29),(30,5,30),(31,5,31),(32,5,32),(33,5,33),(34,5,34),(35,5,35),(36,5,36),(37,5,37),(38,5,38),(39,5,39),(40,5,40);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-02-12 18:13:08.245952','5','teacher',1,'[{\"added\": {}}]',4,4),(2,'2020-02-12 18:13:17.202360','5','teacher',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,4),(3,'2020-02-13 01:17:41.423022','68','123',1,'[{\"added\": {}}]',7,4);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'finder_rules','group'),(9,'finder_rules','rule'),(8,'finder_rules','test'),(10,'knox','authtoken'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-01-26 05:11:56.822926'),(2,'auth','0001_initial','2020-01-26 05:11:59.071182'),(3,'admin','0001_initial','2020-01-26 05:12:06.745448'),(4,'admin','0002_logentry_remove_auto_add','2020-01-26 05:12:08.481370'),(5,'admin','0003_logentry_add_action_flag_choices','2020-01-26 05:12:08.537951'),(6,'contenttypes','0002_remove_content_type_name','2020-01-26 05:12:09.807548'),(7,'auth','0002_alter_permission_name_max_length','2020-01-26 05:12:10.697333'),(8,'auth','0003_alter_user_email_max_length','2020-01-26 05:12:10.788173'),(9,'auth','0004_alter_user_username_opts','2020-01-26 05:12:10.860506'),(10,'auth','0005_alter_user_last_login_null','2020-01-26 05:12:11.512198'),(11,'auth','0006_require_contenttypes_0002','2020-01-26 05:12:11.570025'),(12,'auth','0007_alter_validators_add_error_messages','2020-01-26 05:12:11.623066'),(13,'auth','0008_alter_user_username_max_length','2020-01-26 05:12:12.752315'),(14,'auth','0009_alter_user_last_name_max_length','2020-01-26 05:12:13.900721'),(15,'auth','0010_alter_group_name_max_length','2020-01-26 05:12:14.008906'),(16,'auth','0011_update_proxy_permissions','2020-01-26 05:12:14.099087'),(17,'finder_rules','0001_initial','2020-01-26 05:12:14.168568'),(18,'finder_rules','0002_group_rule_test','2020-01-26 05:12:15.030410'),(19,'knox','0001_initial','2020-01-26 05:12:20.715058'),(20,'knox','0002_auto_20150916_1425','2020-01-26 05:12:22.183976'),(21,'knox','0003_auto_20150916_1526','2020-01-26 05:12:23.280049'),(22,'knox','0004_authtoken_expires','2020-01-26 05:12:23.420771'),(23,'knox','0005_authtoken_token_key','2020-01-26 05:12:23.531848'),(24,'knox','0006_auto_20160818_0932','2020-01-26 05:12:24.566384'),(25,'knox','0007_auto_20190111_0542','2020-01-26 05:12:24.682777'),(26,'sessions','0001_initial','2020-01-26 05:12:25.013323');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ekb2u0w1bohqsgcquzdr10vshn1pvth6','ODY5OWRmZWRhMjUxMjBhMjY0ZmMyNDEzMmYwMjNkNzVhOTM2OWZiYTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NjI4ODhhYWEzMmFjZTQ4ZTE4ZjM1N2Y2N2ZiZTczODVmYTQ4OTgwIn0=','2020-03-14 01:57:37.871066'),('m8lmwxqir7hx31cl0gprunuqofnt1q54','ODY5OWRmZWRhMjUxMjBhMjY0ZmMyNDEzMmYwMjNkNzVhOTM2OWZiYTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NjI4ODhhYWEzMmFjZTQ4ZTE4ZjM1N2Y2N2ZiZTczODVmYTQ4OTgwIn0=','2020-02-26 18:11:52.986504'),('zne1rjhnd10gpua3crci7nj5r6768mal','ODY5OWRmZWRhMjUxMjBhMjY0ZmMyNDEzMmYwMjNkNzVhOTM2OWZiYTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NjI4ODhhYWEzMmFjZTQ4ZTE4ZjM1N2Y2N2ZiZTczODVmYTQ4OTgwIn0=','2020-02-27 01:08:50.082305');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_rules_group`
--

DROP TABLE IF EXISTS `finder_rules_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_rules_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finder_rules_group_owner_id_bda3ee02_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `finder_rules_group_owner_id_bda3ee02_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_rules_group`
--

LOCK TABLES `finder_rules_group` WRITE;
/*!40000 ALTER TABLE `finder_rules_group` DISABLE KEYS */;
INSERT INTO `finder_rules_group` VALUES (1,'Группа 1',1),(2,'Группа N',1),(3,'Группа N',1),(4,'Группа N',1),(5,'Группа N',1),(6,'Группа N',1),(7,'Группа N',1),(8,'Группа N',1),(9,'Группа N',1),(10,'Группа N',1),(11,'Группа N',1),(12,'Группа N',1),(13,'Группа N',1),(14,'Группа N',1),(15,'Группа N',1),(16,'Группа N',1),(17,'Группа N',1),(18,'Группа N',1),(19,'Группа N',1),(20,'Группа N',1),(21,'Группа N',1),(22,'Группа N',1),(23,'Группа N',1),(24,'Группа N',1),(25,'Группа N',1),(26,'Группа N',1),(27,'Группа N',1),(28,'Группа N',1),(29,'Группа N',1),(30,'Группа N',1),(31,'Группа N',1),(32,'Группа N',1),(33,'Группа N',1),(34,'Группа N',1),(35,'Группа N',1),(36,'Группа N',1),(37,'Группа N',1),(38,'Группа N',1),(39,'Группа N',1),(40,'Группа N',1),(41,'Группа N',1),(42,'Группа N',1),(43,'Группа N',1),(44,'Группа N',1),(45,'Группа N',1),(46,'Группа N',1),(47,'Группа N',1),(48,'Группа N',1),(49,'Группа N',1),(50,'Группа N',1),(51,'Группа N',1),(52,'Группа N',1),(53,'Группа N',1),(54,'Группа N',1),(55,'Группа N',1),(56,'Группа N',1),(57,'Группа N',1),(58,'Группа N',1),(59,'Группа N',1),(60,'Группа N',1),(61,'Группа N',1),(62,'Группа N',1),(63,'Группа N',1),(64,'Группа N',1),(65,'3.2.2 Инженерный вид калькулятора',3),(66,'Группа N',1),(67,'group 1',4),(68,'123',4);
/*!40000 ALTER TABLE `finder_rules_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_rules_rule`
--

DROP TABLE IF EXISTS `finder_rules_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_rules_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `search_text` longtext NOT NULL,
  `file_types` longtext NOT NULL,
  `recommendation` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finder_rules_rule_group_id_a246ac4f_fk_finder_rules_group_id` (`group_id`),
  KEY `finder_rules_rule_owner_id_1879d1ee_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `finder_rules_rule_group_id_a246ac4f_fk_finder_rules_group_id` FOREIGN KEY (`group_id`) REFERENCES `finder_rules_group` (`id`),
  CONSTRAINT `finder_rules_rule_owner_id_1879d1ee_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_rules_rule`
--

LOCK TABLES `finder_rules_rule` WRITE;
/*!40000 ALTER TABLE `finder_rules_rule` DISABLE KEYS */;
INSERT INTO `finder_rules_rule` VALUES (1,'Правило 1','framelayout','md','',1,1),(2,'Правило 2','framelayout','xml','',1,1),(5,'rule3','ыва','ыва','апцкауцваскцу',2,1),(6,'Проверка FrameLayout','FrameLayout','xml','Пожалуйста, оберните код в FrameLayout',65,3),(7,'Проверка начальной настройки видимости','visibility','xml','Надо задать начальную видимость в файле разметки для панели цифр инженерного калькулятора',65,3),(8,'Тест','fgthr','xml','Нужно проверить корректность разметки',65,3);
/*!40000 ALTER TABLE `finder_rules_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_rules_test`
--

DROP TABLE IF EXISTS `finder_rules_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_rules_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dir_name` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `group_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finder_rules_test_group_id_f428c039_fk_finder_rules_group_id` (`group_id`),
  KEY `finder_rules_test_owner_id_964e0cc3_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `finder_rules_test_group_id_f428c039_fk_finder_rules_group_id` FOREIGN KEY (`group_id`) REFERENCES `finder_rules_group` (`id`),
  CONSTRAINT `finder_rules_test_owner_id_964e0cc3_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_rules_test`
--

LOCK TABLES `finder_rules_test` WRITE;
/*!40000 ALTER TABLE `finder_rules_test` DISABLE KEYS */;
INSERT INTO `finder_rules_test` VALUES (1,'Проверка 1','https://github.com/netology-code/and-homeworks.git','Группа 1 https://github.com/netology-code/and-homeworks.git 2020-01-26 05:21:29.356848\nПравило 1 passed\nПравило 2 NOT passed\n',1,NULL),(2,'Проверка 1','https://github.com/netology-code/and-homeworks.git','Группа 1 https://github.com/netology-code/and-homeworks.git 2020-01-26 05:22:25.989366\nПравило 1 passed\nПравило 2 NOT passed\n',1,NULL),(3,'Проверка FrameLayout','https://github.com/netology-code/and-homeworks.git','Группа 1 https://github.com/netology-code/and-homeworks.git 2020-01-26 05:51:05.129165\nПравило 1 passed\nПравило 2 NOT passed\n',1,1),(4,'Проверка студент Качалов','https://github.com/netology-code/and-homeworks/tree/master/3.2.OtherLayouts/3.2.2','',1,3),(5,'Дополнительная проверка','https://github.com/netology-code/and-homeworks/tree/master/3.2.OtherLayouts/3.2.2','',1,3),(6,'Студент','https://github.com/sterlikoff/AndroidHomework.git','Группа 1 https://github.com/sterlikoff/AndroidHomework.git 2020-01-31 21:17:33.429262\nПравило 1 NOT passed\nПравило 2 passed\nПроверка FrameLayout passed\nПроверка атрибута видимости элементов visibility passed\n',1,3),(7,'test4','https://github.com/netology-code/and-homeworks.git','Группа N https://github.com/netology-code/and-homeworks.git 2020-01-31 21:28:14.473048\nrule3 NOT passed Recommendation: апцкауцваскцу\n',2,1),(8,'Проверка 123','https://github.com/sterlikoff/AndroidHomework.git','3.2.2 Инженерный вид калькулятора https://github.com/sterlikoff/AndroidHomework.git 2020-01-31 22:33:47.215151\nПроверка FrameLayout passed\n',65,3),(9,'Студент 100500','https://github.com/sterlikoff/AndroidHomework.git','3.2.2 Инженерный вид калькулятора https://github.com/sterlikoff/AndroidHomework.git 2020-01-31 22:41:21.287936\nПроверка FrameLayout passed\nПроверка начальной настройки видимости passed\nТест NOT passed Recommendation: Нужно проверить корректность разметки\n',65,3),(10,'test 1','https://repl.it/@ekaterina2011/52','group 1 https://repl.it/@ekaterina2011/52 2020-02-12 21:46:03.247491\n',67,4),(11,'test 2','https://repl.it/@ekaterina2011/52','group 1 https://repl.it/@ekaterina2011/52 2020-02-12 22:01:38.174891\nCompile:\nCompletedProcess(args=[\'javac\', \'/root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Main.java\'], returncode=1)',67,4),(12,'test 3','https://repl.it/@ekaterina2011/52','group 1 https://repl.it/@ekaterina2011/52 2020-02-12 22:12:04.153260\nCompile:\nb\'\'\nRun program:\nb\'\'',67,4),(13,'test 4','https://repl.it/@ekaterina2011/52','',67,4),(14,'test 5','https://repl.it/@ekaterina2011/52','group 1 https://repl.it/@ekaterina2011/52 2020-02-12 23:28:16.640961\nCompile:\n\nRun program:\nАвтор книги: Tolstoi Lev ,название книги: War and peace ,количество страниц: 1000 ,год выпуска: 1900\n',67,4),(15,'Test out','https://repl.it/@ekaterina2011/52','Группа N https://repl.it/@ekaterina2011/52 2020-02-19 21:19:48.269697\nCheck style:\nStarting audit...\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:9:85: WhitespaceAround: \'{\' is not preceded with whitespace. [WhitespaceAround]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:17: \'METHOD_DEF\' should be separated from previous statement. [EmptyLineSeparator]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:17: \'method def modifier\' has incorrect indentation level 0, expected level should be 2. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:17:1: Missing a Javadoc comment. [MissingJavadocMethod]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:17:24: WhitespaceAround: \'{\' is not preceded with whitespace. [WhitespaceAround]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:18: \'method def\' child has incorrect indentation level 2, expected level should be 4. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:19: \'method def\' child has incorrect indentation level 2, expected level should be 4. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:20: \'method def\' child has incorrect indentation level 2, expected level should be 4. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:21: \'method def\' child has incorrect indentation level 2, expected level should be 4. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:22: \'method def\' child has incorrect indentation level 2, expected level should be 4. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:23: \'method def\' child has incorrect indentation level 2, expected level should be 4. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Book.java:26: \'method def rcurly\' has incorrect indentation level 0, expected level should be 2. [Indentation]\n[WARN] /root/Documents/projects/finder_rules_web/projects/@ekaterina2011/52/Main.java:6: \'method def rcurly\' has incorrect indentation level 4, expected level should be 2. [Indentation]\nAudit done.\nCompile:\n\nOut program:\nАвтор книги: Tolstoi Lev ,название книги: War and peace ,количество страниц: 1000 ,год выпуска: 1900\n',3,1);
/*!40000 ALTER TABLE `finder_rules_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knox_authtoken`
--

DROP TABLE IF EXISTS `knox_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knox_authtoken` (
  `digest` varchar(128) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expiry` datetime(6) DEFAULT NULL,
  `token_key` varchar(8) NOT NULL,
  PRIMARY KEY (`digest`),
  UNIQUE KEY `salt` (`salt`),
  KEY `knox_authtoken_user_id_e5a5d899_fk_auth_user_id` (`user_id`),
  KEY `knox_authtoken_token_key_8f4f7d47` (`token_key`),
  CONSTRAINT `knox_authtoken_user_id_e5a5d899_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knox_authtoken`
--

LOCK TABLES `knox_authtoken` WRITE;
/*!40000 ALTER TABLE `knox_authtoken` DISABLE KEYS */;
INSERT INTO `knox_authtoken` VALUES ('b1c7c94437de6f389fe5c9a9c7d227fb3dc53ff97312973b7fc63ae75e95c05897e2e78508e3cc18a0473d0ef7fb90ffdb48e1a93d324361444868d8c7db70ce','3ddc5158fd90ffea','2020-02-29 00:06:24.426890',1,'2020-02-29 10:06:24.426109','7ab2611e'),('d511b0f642418a98e3bd7bc393938d3416e277bcad4b67a6ee6fc7703ca1e57ad03c124e67051ca63f09bf55d79b84a564ff7d99f3f75afdcb3dc581a124cfa6','ff7946bf3fe033aa','2020-02-10 17:25:37.358919',3,'2020-02-11 03:25:37.358636','6b1cf8b1');
/*!40000 ALTER TABLE `knox_authtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-29  0:54:07
