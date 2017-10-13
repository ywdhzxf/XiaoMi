-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: myshop
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
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
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-02 20:44:16'),(2,'auth','0001_initial','2017-09-02 20:44:16'),(3,'admin','0001_initial','2017-09-02 20:44:16'),(4,'admin','0002_logentry_remove_auto_add','2017-09-02 20:44:16'),(5,'contenttypes','0002_remove_content_type_name','2017-09-02 20:44:16'),(6,'auth','0002_alter_permission_name_max_length','2017-09-02 20:44:16'),(7,'auth','0003_alter_user_email_max_length','2017-09-02 20:44:16'),(8,'auth','0004_alter_user_username_opts','2017-09-02 20:44:16'),(9,'auth','0005_alter_user_last_login_null','2017-09-02 20:44:16'),(10,'auth','0006_require_contenttypes_0002','2017-09-02 20:44:16'),(11,'auth','0007_alter_validators_add_error_messages','2017-09-02 20:44:16'),(12,'auth','0008_alter_user_username_max_length','2017-09-02 20:44:16'),(13,'sessions','0001_initial','2017-09-02 20:44:16');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('26btllguy72tkqvzin7jyxdl9m5frcda','NTA4NDM3OGVhODM1NDFjMzc2NTVmNjNjNmMzZDE1NWI2ZDYzZTExMDp7InZlcmlmeWNvZGUiOiI2ODU0IiwiYWRtaW51c2VyIjoiYWRtaW4ifQ==','2017-09-17 02:07:55'),('97hs2adouml9iuh9rgpj30ygp7r0ac7c','ZmFlOTMzMGI4ZTk0OGU0OWI5ZWFmNGIzNGVjZTM5MTAxOGI3MzE5NDp7InZlcmlmeWNvZGUiOiIxMzMzIiwiYWRtaW51c2VyIjoiYWRtaW4ifQ==','2017-09-18 03:22:47'),('69sfh82yrp6wjjb9szzty1zeubj4db93','ZjljYTQzZTZhOWY3OTFhZjY3ZjVmMzQzZmVhMjM4N2ZlZTk2MTE5Njp7InZlcmlmeWNvZGUiOiI0NTA0IiwiYWRtaW51c2VyIjoiYWRtaW4iLCJ5b25naHUiOiJcdTVjMGZcdTk4ZGUiLCJzaG9wbGlzdCI6eyIyNyI6eyJpZCI6MjcsImdvb2RzIjoiXHU4OGU0XHU1YjUwIiwicHJpY2UiOjI5OS4wLCJwaWNuYW1lIjoiMTUwNDUyMTE3NS4yMzMwODAxLmpwZyIsInN0b3JlIjoxLCJtIjo0MH0sIjMxIjp7ImlkIjozMSwiZ29vZHMiOiJcdTVjMGZcdTc2N2RcdTY0NDRcdTUwY2ZcdTU5MzQiLCJwcmljZSI6Mjk5LjAsInBpY25hbWUiOiIxNTA0NTI2MTYyLjcyNDM0NjQuanBnIiwic3RvcmUiOjQ1NDY1NSwibSI6Nn0sIjMzIjp7ImlkIjozMywiZ29vZHMiOiJcdTdlYTJcdTdjNzMgbm90ZTMiLCJwcmljZSI6MTU5OS4wLCJwaWNuYW1lIjoiMTUwNDUyNjMzNy4zMDQyOTE3LmpwZyIsInN0b3JlIjo2NDExLCJtIjoxfX19','2017-09-21 18:33:02'),('cb85xjm1dm5habalm7aiqwhfbscthfuo','OTFkMjYzNjllOTlkZWU3NTRkNjI2MWI1Yjc2OTMwY2Q3NjljYzBjNzp7InZlcmlmeWNvZGUiOiIxMTQ2Iiwic2hvcGxpc3QiOnsiMzIiOnsiaWQiOjMyLCJnb29kcyI6Ilx1OGQ4NVx1NTkyN1x1NWM0Zlx1NGUwMFx1NGY1M1x1NjczYSIsInByaWNlIjo2OTk5LjAsInBpY25hbWUiOiIxNTA0NTI2MjcyLjQyOTYwMTQuanBnIiwic3RvcmUiOjQ1MTYsIm0iOjF9LCIzMSI6eyJpZCI6MzEsImdvb2RzIjoiXHU1YzBmXHU3NjdkXHU2NDQ0XHU1MGNmXHU1OTM0IiwicHJpY2UiOjI5OS4wLCJwaWNuYW1lIjoiMTUwNDUyNjE2Mi43MjQzNDY0LmpwZyIsInN0b3JlIjo0NTQ2NTUsIm0iOjF9LCIyNyI6eyJpZCI6MjcsImdvb2RzIjoiXHU4OGU0XHU1YjUwIiwicHJpY2UiOjI5OS4wLCJwaWNuYW1lIjoiMTUwNDUyMTE3NS4yMzMwODAxLmpwZyIsInN0b3JlIjoxLCJtIjoxfSwiNDYiOnsiaWQiOjQ2LCJnb29kcyI6Ilx1NWMwZlx1N2M3M1x1NTE0NVx1NzUzNVx1NWI5ZCIsInByaWNlIjoxOTkuMCwicGljbmFtZSI6IjE1MDUxMjAyODguMjk1NTYuanBnIiwic3RvcmUiOjIxMzIxLCJtIjoxfX0sIm9yZGVybGlzdCI6eyIzOCI6eyJpZCI6MzgsImdvb2RzIjoiXHU1YzBmXHU3YzczXHU2MjRiXHU3M2FmIiwicHJpY2UiOjk5LjAsInBpY25hbWUiOiIxNTA1MTEzNjY3LjI0OTU0MDYuanBnIiwic3RvcmUiOjEyMzIsIm0iOjF9fSwidG90YWwiOjk5LjAsImFkbWludXNlciI6ImFkbWluIn0=','2017-09-25 09:43:52'),('i2z2b71tlvfa0llpshhhkpawjo5lto8x','NTdkNjlkN2NjYWJjYmFlZTIzNjJhYjc0NWMwZDAxNGM5ZWJiZTliOTp7InNob3BsaXN0Ijp7IjQ0Ijp7ImlkIjo0NCwiZ29vZHMiOiJcdThmZDBcdTUyYThcdTgwMzNcdTY3M2EiLCJwcmljZSI6Mzk5LjAsInBpY25hbWUiOiIxNTA1MTIwMTk4LjY3NDc1NTMuanBnIiwic3RvcmUiOjMyMTEsIm0iOjF9fSwidmVyaWZ5Y29kZSI6IjEwMjgiLCJ5b25naHUiOiJcdTVjMGZcdTk4ZGUiLCJhZG1pbnVzZXIiOiJhZG1pbiJ9','2017-09-25 10:11:25'),('xd0mnii612k9w7747hwska02ahgumls3','M2NmNWE2YWQ2YjA0MTg2NmUyOTNhMDE3OGNkMTNmNjk0MDcxZWUyYzp7InZlcmlmeWNvZGUiOiI3OTM3IiwiYWRtaW51c2VyIjoiYWRtaW4iLCJ5b25naHUiOiJcdTVjMGZcdTk4ZGUiLCJzaG9wbGlzdCI6eyIzNSI6eyJpZCI6MzUsImdvb2RzIjoiXHU1YzBmXHU3YzczXHU4ZDg1XHU2NzgxXHU2NzJjIiwicHJpY2UiOjY4OTkuMCwicGljbmFtZSI6IjE1MDQ3MzkyNjQuOTc0MTA3LnBuZyIsInN0b3JlIjoxMDAwLCJtIjoxfSwiMzkiOnsiaWQiOjM5LCJnb29kcyI6IjhHXHU1OTI3VVx1NzZkOCIsInByaWNlIjo5OS4wLCJwaWNuYW1lIjoiMTUwNTExMzkwMy4wMjg1MzQuanBnIiwic3RvcmUiOjQ4MzM0LCJtIjoxfX0sIm9yZGVybGlzdCI6eyIzOSI6eyJpZCI6MzksImdvb2RzIjoiOEdcdTU5MjdVXHU3NmQ4IiwicHJpY2UiOjk5LjAsInBpY25hbWUiOiIxNTA1MTEzOTAzLjAyODUzNC5qcGciLCJzdG9yZSI6NDgzMzQsIm0iOjF9LCI0NyI6eyJpZCI6NDcsImdvb2RzIjoiXHU2MjRiXHU2NzNhXHU2NTJmXHU2N2I2IiwicHJpY2UiOjIzLjAsInBpY25hbWUiOiIxNTA1MTIwMzQ1LjI0MDM4MTUuanBnIiwic3RvcmUiOjEyMzIxLCJtIjoxfSwiNDYiOnsiaWQiOjQ2LCJnb29kcyI6Ilx1NWMwZlx1N2M3M1x1NTE0NVx1NzUzNVx1NWI5ZCIsInByaWNlIjoxOTkuMCwicGljbmFtZSI6IjE1MDUxMjAyODguMjk1NTYuanBnIiwic3RvcmUiOjIxMzIxLCJtIjozfX0sInRvdGFsIjo3MTkuMH0=','2017-09-25 16:02:27'),('v51768sfayw9sbvx78x9jwfxl3xwsvq3','MzZiODA4OWZkOTI5M2UzYjZlOWFkYzQ2N2E2MjAwOWEwZjJmOWQ1MDp7InZlcmlmeWNvZGUiOiI3NzA1Iiwic2hvcGxpc3QiOnt9LCJvcmRlcmxpc3QiOnsiNDYiOnsiaWQiOjQ2LCJnb29kcyI6Ilx1NWMwZlx1N2M3M1x1NTE0NVx1NzUzNVx1NWI5ZCIsInByaWNlIjoxOTkuMCwicGljbmFtZSI6IjE1MDUxMjAyODguMjk1NTYuanBnIiwic3RvcmUiOjIxMzIxLCJtIjoxfX0sInRvdGFsIjoxOTkuMCwiYWRtaW51c2VyIjoieGlhb3NvbmciLCJ5b25naHUiOiJcdTVjMGZcdTk4ZGUifQ==','2017-09-26 10:02:51');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myweb_detail`
--

DROP TABLE IF EXISTS `myweb_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myweb_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL COMMENT '订单id号,订单外键',
  `goodsid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `price` double(6,2) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `picname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myweb_detail`
--

LOCK TABLES `myweb_detail` WRITE;
/*!40000 ALTER TABLE `myweb_detail` DISABLE KEYS */;
INSERT INTO `myweb_detail` VALUES (22,21,33,'红米 note3',1599.00,1,NULL),(3,3,31,'小白摄像头',299.00,2,NULL),(4,4,31,'小白摄像头',299.00,2,NULL),(5,5,30,'小米卫衣',120.00,1,NULL),(6,6,32,'超大屏一体机',6999.00,1,NULL),(7,7,33,'红米 note3',1599.00,1,NULL),(8,8,32,'超大屏一体机',6999.00,1,NULL),(9,9,31,'小白摄像头',299.00,2,NULL),(10,10,31,'小白摄像头',299.00,2,NULL),(11,11,23,'裤子',299.00,1,NULL),(12,12,23,'裤子',299.00,1,NULL),(13,13,32,'超大屏一体机',6999.00,1,NULL),(14,14,35,'小米超极本',6899.00,1,NULL),(15,15,35,'小米超极本',6899.00,1,NULL),(16,16,34,'小米 mix 2',2699.00,1,NULL),(17,17,32,'超大屏一体机',6999.00,1,NULL),(18,18,31,'小白摄像头',299.00,1,NULL),(19,19,31,'小白摄像头',299.00,1,NULL),(20,20,31,'小白摄像头',299.00,1,NULL),(21,20,32,'超大屏一体机',6999.00,1,NULL),(23,21,31,'小白摄像头',299.00,1,NULL),(24,22,31,'小白摄像头',299.00,3,NULL),(25,22,33,'红米 note3',1599.00,1,NULL),(26,23,33,'红米 note3',1599.00,1,NULL),(27,24,46,'小米充电宝',199.00,1,NULL),(28,25,38,'小米手环',99.00,1,NULL),(29,26,39,'8G大U盘',99.00,1,NULL),(30,26,47,'手机支架',23.00,1,NULL),(31,26,46,'小米充电宝',199.00,3,NULL),(32,27,41,'U型枕',24.00,18,NULL),(33,27,46,'小米充电宝',199.00,1,NULL),(34,28,37,'萌娃',55.00,1,NULL),(35,29,45,'小米 note2',2312.00,1,NULL),(36,30,46,'小米充电宝',199.00,1,NULL),(37,31,46,'小米充电宝',199.00,1,NULL);
/*!40000 ALTER TABLE `myweb_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myweb_goods`
--

DROP TABLE IF EXISTS `myweb_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myweb_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT NULL COMMENT 'type表的ID外键',
  `goods` varchar(32) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `descr` text COMMENT '简介',
  `price` double(6,2) DEFAULT NULL,
  `picname` varchar(255) DEFAULT NULL COMMENT '图片名',
  `state` tinyint(1) DEFAULT '1' COMMENT '1：新添加、2：在售、3：下架',
  `store` int(11) DEFAULT '0' COMMENT '库存量',
  `num` int(11) DEFAULT '0' COMMENT '被购买的数量',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myweb_goods`
--

LOCK TABLES `myweb_goods` WRITE;
/*!40000 ALTER TABLE `myweb_goods` DISABLE KEYS */;
INSERT INTO `myweb_goods` VALUES (44,28,'耳机','小飞中国造','为运动而生',399.00,'1505120198.6747553.jpg',2,3211,321,2136,1505120198),(45,28,'小米 note2','小米','为发烧而生',2312.00,'1505120251.4894023.jpg',1,21312,1212,1242,1505120251),(46,29,'小米充电宝','小米','为发烧而生',199.00,'1505120288.29556.jpg',2,21321,1231,12331,1505120288),(47,26,'手机支架','小米','为发烧而生',23.00,'1505120345.2403815.jpg',2,12321,12321,125,1505120345),(39,29,'8G大U盘','琪琪数码店','大内存.超好用',99.00,'1505113903.028534.jpg',1,48334,2344,23425,1505113903),(41,26,'U型枕','小飞中国造','出行必备',24.00,'1505119896.460755.jpg',1,2131,21,124,1505119896),(42,29,'小白摄像头','小米','专业',399.00,'1505119937.0817518.jpg',2,3123,2132,2135,1505119937),(36,26,'巨无霸','变形公司','变形金刚',1999.00,'1505113463.7779257.jpg',1,1000,120,1225,1505113463),(43,28,'小米 mix3','小米','高端大气',4999.00,'1505120108.5583875.jpg',1,3213,123,321,1505120108),(37,26,'萌娃','齐跃娃娃店','萌萌的娃娃',55.00,'1505113534.249562.jpg',1,10000,3213,3126,1505113534),(38,29,'小米手环','小米','神奇啊',99.00,'1505113667.2495406.jpg',1,1232,222,446,1505113667),(48,7,'索米相机','小飞中国造','你想不到的像素',3999.00,'1505138263.5705876.jpg',2,3112,122,321,1505138263),(40,29,'欧美电子表','小飞中国造','功能强大的电子表',3999.00,'1505113967.0020106.jpg',1,2321,111,232,1505113967),(49,7,'小米相机','小米','为发烧而生',3999.00,'1505138576.5887582.jpg',2,23213,2132,21312,1505138576),(35,6,'小米超极本','小米','超极本',6899.00,'1504739264.974107.png',2,1000,112,18,1504739265),(50,26,'精致闹钟','小飞中国造','为您的生活',199.00,'1505156767.8480983.jpg',2,25323,2323,4325,1505156767),(51,31,'小军人','小飞中国造','帅气',55.00,'1505160706.9531784.jpg',2,35232,1313,5461,1505160706),(52,31,'小红人','小飞中国造','小红人',66.00,'1505160743.4719412.jpg',2,6465,6442,9527,1505160743),(53,28,'小白','小飞中国造','小白',99.00,'1505160837.074481.jpg',2,9445,9426,2354,1505160837),(54,26,'扫地机器人','小飞中国造','为乱而生',2999.00,'1505160922.8213365.jpg',2,6545,3666,84646,1505160922),(55,28,'111','111','111',111.00,'1505193610.7105935.jpg',3,110,99,110,1505193610);
/*!40000 ALTER TABLE `myweb_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myweb_orders`
--

DROP TABLE IF EXISTS `myweb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myweb_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '联系人',
  `uid` int(11) DEFAULT NULL COMMENT '会员ID',
  `linkman` varchar(32) DEFAULT NULL COMMENT '联系人',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `code` char(6) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL COMMENT '购买时间',
  `total` double(8,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '状态0:新订单；1：已发货；2：已收货，3 无效订单。',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myweb_orders`
--

LOCK TABLES `myweb_orders` WRITE;
/*!40000 ALTER TABLE `myweb_orders` DISABLE KEYS */;
INSERT INTO `myweb_orders` VALUES (23,15,'小飞','鬼知道','220077','114',1505210305,1599.00,2),(2,1,'齐跃','爽歪歪怡红楼','123123','21312312',1504441054,120.00,1),(22,15,'小飞','鬼知道','220077','114',1504865279,2496.00,2),(21,15,'小飞','鬼知道','220077','114',1504862731,1898.00,2),(7,15,'小飞','鬼知道','220077','114',1505181848,1599.00,2),(8,14,'长达','国务院','220077','110',1504840568,6999.00,0),(9,15,'小飞','鬼知道','220077','114',1504842753,598.00,2),(10,15,'小飞','鬼知道','220077','114',1504842759,598.00,2),(11,15,'小飞','鬼知道','220077','114',1504844910,299.00,0),(12,15,'小飞','鬼知道','220077','114',1504844917,299.00,0),(13,15,'小飞','鬼知道','220077','114',1504845141,6999.00,0),(14,15,'小飞','鬼知道','220077','114',1504845597,6899.00,0),(15,15,'小飞','鬼知道','220077','114',1504845647,6899.00,0),(16,15,'小飞','鬼知道','220077','114',1504846169,2699.00,0),(17,15,'小飞','鬼知道','220077','114',1504846222,6999.00,0),(18,15,'小飞','鬼知道a','220077','114',1504846268,299.00,0),(19,15,'小飞','鬼知道','220077','114',1504850161,299.00,0),(20,15,'小飞','鬼知道','220077','114',1504855834,7298.00,0),(24,15,'小飞','鬼知道','220077','114',1505125688,199.00,0),(25,15,'小飞','鬼知道','220077','114',1505140622,99.00,0),(26,15,'小飞','鬼知道','220077','114',1505141812,719.00,0),(27,16,'xiaosong','dasd','220077','54545',1505193930,631.00,2),(28,15,'小飞','鬼知道','220077','114',1505195125,55.00,0),(29,15,'小飞','鬼知道','220077','114',1505195696,2312.00,0),(30,15,'xiao','鬼知道','220077','114',1505196197,199.00,0),(31,15,'xiaofei','鬼知道','220077','114',1505210611,199.00,1);
/*!40000 ALTER TABLE `myweb_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myweb_type`
--

DROP TABLE IF EXISTS `myweb_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myweb_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT '0' COMMENT '分类id',
  `path` varchar(255) DEFAULT NULL COMMENT '分类路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myweb_type`
--

LOCK TABLES `myweb_type` WRITE;
/*!40000 ALTER TABLE `myweb_type` DISABLE KEYS */;
INSERT INTO `myweb_type` VALUES (6,'电脑',2,'0,2,'),(7,'相机',2,'0,2,'),(31,'脑残片',24,'0,24,'),(2,'数码',0,'0,'),(28,'手机',2,'0,2,'),(29,'数码产品',2,'0,2,'),(24,'杂物',0,'0,'),(26,'乱',24,'0,24,');
/*!40000 ALTER TABLE `myweb_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myweb_users`
--

DROP TABLE IF EXISTS `myweb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myweb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `passwd` char(32) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `code` char(6) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `state` tinyint(1) DEFAULT NULL COMMENT '状态',
  `addtime` int(11) DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myweb_users`
--

LOCK TABLES `myweb_users` WRITE;
/*!40000 ALTER TABLE `myweb_users` DISABLE KEYS */;
INSERT INTO `myweb_users` VALUES (1,'社会王','撇条','123',0,'aafafas','1087','132455','111@qq.com',2,1504356059),(10,'rqwrwqrq','qwqrwq','d32932e3ac792034f37fb704b5886212',1,'wqrwq','123','15125112','qqweqw',1,1504363760),(4,'qq','八戒','22222',1,'高老庄','2222','222222222220','21313',0,12321311),(5,'猴子','悟空','6666',1,'花果山','666','66666666','1234566',1,2147483647),(6,'沙和尚','悟净','1234567',1,'流沙河','1122','11223344','1312',1,2147483647),(7,'沙和尚','悟净','1234567',1,'流沙河','1122','11223344','1312',1,2147483647),(8,'沙和尚','悟净','1234567',1,'流沙河','1122','11223344','1312',1,2147483647),(11,'admin','admin','21232f297a57a5a743894a0e4a801fc3',1,'浏阳河','2007','191919191','qq@qq.com',0,1504388105),(12,'fwqf','wqrwq','7dc1c7653ac42a05642a667959c12239',1,'中关村','220077','312312','14214@qq.com',1,1504568326),(13,'qiyue','齐跃','71cfd9c298d36d34a1aa6dbc00d0712e',1,'天宫','220077','21321412','11111@qq.com',1,1504568450),(14,'changda','长达','18eb290cc090836f9ac8ec8c0389425d',0,'国务院','220077','110','110@qq.com',1,1504571444),(15,'xiaofei','小飞','6893ea02fd55c76ec4bc2ff8136f39f4',1,'鬼知道','220077','111','114@qq.com',1,1505211106),(16,'xiaosong','xiaosong','1e63bbb9760f7e977e7f3041f960ef06',1,'dasd','220077','54545','565@qq.com',0,1505193453);
/*!40000 ALTER TABLE `myweb_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-12 18:29:05
