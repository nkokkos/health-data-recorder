-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: eltabplatformdb
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `chronic_diseases`
--

DROP TABLE IF EXISTS `chronic_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chronic_diseases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chronic_diseases`
--

LOCK TABLES `chronic_diseases` WRITE;
/*!40000 ALTER TABLE `chronic_diseases` DISABLE KEYS */;
INSERT INTO `chronic_diseases` VALUES (1,'Asthma','2015-04-03 09:07:23','2015-04-03 09:07:23'),(2,'Diabetes','2015-05-11 11:42:16','2015-05-11 11:42:16'),(3,'Obesity','2015-05-20 10:21:54','2015-05-20 10:21:54'),(4,'Cancer','2015-05-20 10:22:05','2015-05-20 10:22:05'),(5,'Epilespy','2015-05-20 10:22:10','2015-05-20 10:22:10'),(6,'Glaucoma','2015-05-20 10:22:31','2015-05-20 10:22:31'),(7,'Heart Problems','2015-05-20 10:22:40','2015-05-20 10:22:40'),(8,'Alzheimer\'s disease','2015-05-20 10:24:26','2015-05-20 10:24:26');
/*!40000 ALTER TABLE `chronic_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chronic_diseases_users`
--

DROP TABLE IF EXISTS `chronic_diseases_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chronic_diseases_users` (
  `user_id` int(11) NOT NULL,
  `chronic_disease_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chronic_diseases_users`
--

LOCK TABLES `chronic_diseases_users` WRITE;
/*!40000 ALTER TABLE `chronic_diseases_users` DISABLE KEYS */;
INSERT INTO `chronic_diseases_users` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `chronic_diseases_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (26,'EOximeter@1496001815562','2015-04-08 10:01:27','2015-04-08 10:01:27'),(27,'EWeightScale@1096821815562','2015-04-14 07:24:42','2015-04-14 07:24:42');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_levels`
--

DROP TABLE IF EXISTS `education_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_levels`
--

LOCK TABLES `education_levels` WRITE;
/*!40000 ALTER TABLE `education_levels` DISABLE KEYS */;
INSERT INTO `education_levels` VALUES (1,'2015-05-19 11:05:20','2015-05-19 11:05:20','No schooling'),(2,'2015-05-19 11:05:32','2015-05-19 11:05:32','Primary Education'),(3,'2015-05-19 11:05:41','2015-05-19 11:05:41','Secondary Education'),(4,'2015-05-19 11:05:55','2015-05-19 11:05:55','Vocational Training'),(5,'2015-05-19 11:06:06','2015-05-19 11:06:06','University Degree'),(6,'2015-05-19 11:06:13','2015-05-19 11:06:13','Master\'s Degree'),(7,'2015-05-19 11:06:18','2015-05-19 11:06:18','Phd'),(8,'2015-05-19 11:06:24','2015-05-19 11:06:24','Post Doc');
/*!40000 ALTER TABLE `education_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_statuses`
--

DROP TABLE IF EXISTS `employment_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employment_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_statuses`
--

LOCK TABLES `employment_statuses` WRITE;
/*!40000 ALTER TABLE `employment_statuses` DISABLE KEYS */;
INSERT INTO `employment_statuses` VALUES (1,'Employed','2015-04-03 09:05:13','2015-04-03 09:05:13'),(2,'Unemployed','2015-04-03 09:05:22','2015-04-03 09:05:22'),(3,'Part Time Employment','2015-04-03 09:05:34','2015-04-03 09:05:34');
/*!40000 ALTER TABLE `employment_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_activities`
--

DROP TABLE IF EXISTS `exercise_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_activities`
--

LOCK TABLES `exercise_activities` WRITE;
/*!40000 ALTER TABLE `exercise_activities` DISABLE KEYS */;
INSERT INTO `exercise_activities` VALUES (1,'Once / week','2015-04-03 09:05:47','2015-04-03 09:05:47'),(3,'Twice / week','2015-04-03 09:05:55','2015-04-03 09:05:55'),(4,'3 times / week','2015-04-03 09:06:04','2015-04-03 20:30:09');
/*!40000 ALTER TABLE `exercise_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_statuses`
--

DROP TABLE IF EXISTS `family_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_statuses`
--

LOCK TABLES `family_statuses` WRITE;
/*!40000 ALTER TABLE `family_statuses` DISABLE KEYS */;
INSERT INTO `family_statuses` VALUES (1,'Single','2015-04-03 09:06:15','2015-04-03 09:06:15'),(2,'Married','2015-04-03 09:06:24','2015-04-03 09:06:24'),(5,'Divorced with children','2015-04-03 09:07:13','2015-04-03 09:07:13');
/*!40000 ALTER TABLE `family_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement_blocks`
--

DROP TABLE IF EXISTS `measurement_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_tag` time DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_measurement_blocks_on_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `fk_rails_1ad4f08c98` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement_blocks`
--

LOCK TABLES `measurement_blocks` WRITE;
/*!40000 ALTER TABLE `measurement_blocks` DISABLE KEYS */;
INSERT INTO `measurement_blocks` VALUES (52,'08:39:06',1,'2015-04-08 08:38:48','2015-04-08 08:38:48'),(53,'08:39:31',1,'2015-04-08 08:39:13','2015-04-08 08:39:13'),(54,'08:39:54',1,'2015-04-08 08:39:36','2015-04-08 08:39:36'),(55,'08:40:10',1,'2015-04-08 08:39:52','2015-04-08 08:39:52'),(56,'08:40:38',1,'2015-04-08 08:40:20','2015-04-08 08:40:20'),(57,'10:01:37',2,'2015-04-08 10:01:16','2015-04-08 10:01:16'),(59,'07:23:56',2,'2015-04-14 07:23:25','2015-04-14 07:23:25'),(60,'07:39:17',2,'2015-04-14 07:38:46','2015-04-14 07:38:46'),(61,'07:44:17',2,'2015-04-14 07:43:46','2015-04-14 07:43:46'),(67,'08:13:43',2,'2015-04-14 08:13:12','2015-04-14 08:13:12'),(68,'08:26:36',2,'2015-04-14 08:26:05','2015-04-14 08:26:05'),(69,'08:31:24',2,'2015-04-14 08:30:53','2015-04-14 08:30:53'),(70,'10:33:51',2,'2015-04-14 10:33:20','2015-04-14 10:33:20'),(74,'10:40:02',2,'2015-04-14 10:39:31','2015-04-14 10:39:31'),(76,'10:50:07',2,'2015-04-14 10:49:36','2015-04-14 10:49:36'),(77,'10:50:57',2,'2015-04-14 10:50:26','2015-04-14 10:50:26'),(78,'11:52:05',2,'2015-04-14 11:51:34','2015-04-14 11:51:34'),(79,'11:50:00',1,'2015-04-15 08:49:01','2015-04-15 08:49:01'),(80,'08:21:21',1,'2015-04-16 08:20:52','2015-04-16 08:20:52'),(81,'08:21:46',1,'2015-04-16 08:21:17','2015-04-16 08:21:17'),(82,'08:21:53',1,'2015-04-16 08:21:24','2015-04-16 08:21:24'),(83,'11:44:24',2,'2015-04-16 11:43:50','2015-04-16 11:43:50'),(84,'11:45:50',2,'2015-04-16 11:45:16','2015-04-16 11:45:16'),(85,'11:47:01',2,'2015-04-16 11:46:27','2015-04-16 11:46:27'),(86,NULL,1,'2015-05-18 13:17:01','2015-05-18 13:17:01'),(87,'12:21:34',2,'2015-05-19 12:21:13','2015-05-19 12:21:13'),(88,'13:26:37',1,'2015-05-19 13:26:17','2015-05-19 13:26:17'),(89,'05:22:17',1,'2015-05-20 05:21:55','2015-05-20 05:21:55'),(90,'05:24:00',1,'2015-05-20 05:23:37','2015-05-20 05:23:37'),(91,'05:24:23',1,'2015-05-20 05:24:00','2015-05-20 05:24:00'),(92,'05:30:28',1,'2015-05-20 05:30:05','2015-05-20 05:30:05');
/*!40000 ALTER TABLE `measurement_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurements`
--

DROP TABLE IF EXISTS `measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measure_value` float DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `measure_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `measurement_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_measurements_on_device_id` (`device_id`) USING BTREE,
  KEY `index_measurements_on_measure_id` (`measure_id`) USING BTREE,
  KEY `fk_rails_e2e59b8122` (`measurement_block_id`) USING BTREE,
  CONSTRAINT `fk_rails_e2e59b8122` FOREIGN KEY (`measurement_block_id`) REFERENCES `measurement_blocks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurements`
--

LOCK TABLES `measurements` WRITE;
/*!40000 ALTER TABLE `measurements` DISABLE KEYS */;
INSERT INTO `measurements` VALUES (38,99,26,28,'2015-04-08 10:01:27','2015-04-08 10:01:27',57),(39,69,26,29,'2015-04-08 10:01:27','2015-04-08 10:01:27',57),(40,99,26,28,'2015-04-14 07:24:09','2015-04-14 07:24:09',59),(41,58,26,29,'2015-04-14 07:24:09','2015-04-14 07:24:09',59),(42,85.5,27,30,'2015-04-14 07:24:42','2015-04-14 07:24:42',59),(43,98,26,28,'2015-04-14 07:39:29','2015-04-14 07:39:29',60),(44,64,26,29,'2015-04-14 07:39:29','2015-04-14 07:39:29',60),(45,98,26,28,'2015-04-14 07:39:39','2015-04-14 07:39:39',60),(46,64,26,29,'2015-04-14 07:40:44','2015-04-14 07:40:44',60),(47,85.5,27,30,'2015-04-14 07:40:48','2015-04-14 07:40:48',60),(48,7.1,27,30,'2015-04-14 07:40:48','2015-04-14 07:40:48',60),(49,85.5,27,30,'2015-04-14 07:40:49','2015-04-14 07:40:49',60),(50,85.5,27,30,'2015-04-14 07:40:50','2015-04-14 07:40:50',60),(51,85.5,27,30,'2015-04-14 07:40:50','2015-04-14 07:40:50',60),(52,16.5,27,30,'2015-04-14 07:41:44','2015-04-14 07:41:44',60),(53,16.5,27,30,'2015-04-14 07:41:50','2015-04-14 07:41:50',60),(54,16.5,27,30,'2015-04-14 07:41:58','2015-04-14 07:41:58',60),(55,16.5,27,30,'2015-04-14 07:42:05','2015-04-14 07:42:05',60),(56,98,26,28,'2015-04-14 07:44:09','2015-04-14 07:44:09',61),(57,60,26,29,'2015-04-14 07:44:09','2015-04-14 07:44:09',61),(58,98,26,28,'2015-04-14 07:44:19','2015-04-14 07:44:19',61),(59,98,26,28,'2015-04-14 08:13:16','2015-04-14 08:13:16',67),(60,72,26,29,'2015-04-14 08:13:16','2015-04-14 08:13:16',67),(61,98,26,28,'2015-04-14 08:13:26','2015-04-14 08:13:26',67),(62,99,26,28,'2015-04-14 08:26:13','2015-04-14 08:26:13',68),(63,65,26,29,'2015-04-14 08:26:13','2015-04-14 08:26:13',68),(64,99,26,28,'2015-04-14 08:26:23','2015-04-14 08:26:23',68),(65,98,26,28,'2015-04-14 08:31:08','2015-04-14 08:31:08',69),(66,65,26,29,'2015-04-14 08:31:08','2015-04-14 08:31:08',69),(67,98,26,28,'2015-04-14 08:31:18','2015-04-14 08:31:18',69),(68,99,26,28,'2015-04-14 10:33:28','2015-04-14 10:33:28',70),(69,73,26,29,'2015-04-14 10:33:28','2015-04-14 10:33:28',70),(70,85.9,27,30,'2015-04-14 10:33:45','2015-04-14 10:33:45',70),(71,98,26,28,'2015-04-14 10:39:49','2015-04-14 10:39:49',74),(72,73,26,29,'2015-04-14 10:39:49','2015-04-14 10:39:49',74),(73,86.1,27,30,'2015-04-14 10:40:04','2015-04-14 10:40:04',74),(74,98,26,28,'2015-04-14 10:49:49','2015-04-14 10:49:49',76),(75,68,26,29,'2015-04-14 10:49:49','2015-04-14 10:49:49',76),(76,85.5,27,30,'2015-04-14 10:49:59','2015-04-14 10:49:59',76),(77,98,26,28,'2015-04-14 10:50:50','2015-04-14 10:50:50',77),(78,66,26,29,'2015-04-14 10:50:50','2015-04-14 10:50:50',77),(79,86,27,30,'2015-04-14 10:51:02','2015-04-14 10:51:02',77),(80,98,26,28,'2015-04-14 11:51:51','2015-04-14 11:51:51',78),(81,75,26,29,'2015-04-14 11:51:52','2015-04-14 11:51:52',78),(85,90,26,28,'2015-04-15 13:01:08','2015-04-15 13:01:08',79),(86,80,26,29,'2015-04-15 13:01:26','2015-04-15 13:01:26',79),(90,98,26,28,'2015-04-16 11:44:06','2015-04-16 11:44:06',83),(91,76,26,29,'2015-04-16 11:44:06','2015-04-16 11:44:06',83),(92,98,26,28,'2015-04-16 11:46:34','2015-04-16 11:46:34',85),(93,74,26,29,'2015-04-16 11:46:34','2015-04-16 11:46:34',85),(94,84.9,27,30,'2015-04-16 11:47:01','2015-04-16 11:47:01',85),(96,97,26,28,'2015-05-19 12:21:29','2015-05-19 12:21:29',87),(97,68,26,29,'2015-05-19 12:21:34','2015-05-19 12:21:34',87),(98,84.1,27,30,'2015-05-19 12:21:58','2015-05-19 12:21:58',87),(99,96,26,28,'2015-05-19 13:26:59','2015-05-19 13:26:59',88),(100,69,26,29,'2015-05-19 13:26:59','2015-05-19 13:26:59',88),(101,84.6,27,30,'2015-05-19 13:27:22','2015-05-19 13:27:22',88),(102,97,26,28,'2015-05-20 05:30:20','2015-05-20 05:30:20',92),(103,72,26,29,'2015-05-20 05:30:20','2015-05-20 05:30:20',92),(104,84.7,27,30,'2015-05-20 05:30:46','2015-05-20 05:30:46',92);
/*!40000 ALTER TABLE `measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_measures_on_device_id` (`device_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measures`
--

LOCK TABLES `measures` WRITE;
/*!40000 ALTER TABLE `measures` DISABLE KEYS */;
INSERT INTO `measures` VALUES (28,'blood_o2_saturation',26,'2015-04-08 10:01:27','2015-04-08 10:01:27'),(29,'heart_rate',26,'2015-04-08 10:01:27','2015-04-08 10:01:27'),(30,'WeightValue',27,'2015-04-14 07:24:42','2015-04-14 07:24:42');
/*!40000 ALTER TABLE `measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_relationships`
--

DROP TABLE IF EXISTS `patient_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_relationships`
--

LOCK TABLES `patient_relationships` WRITE;
/*!40000 ALTER TABLE `patient_relationships` DISABLE KEYS */;
INSERT INTO `patient_relationships` VALUES (36,3,1,'2015-05-19 11:10:25','2015-05-19 11:10:25'),(37,3,2,'2015-05-19 11:10:30','2015-05-19 11:10:30'),(38,3,3,'2015-05-19 11:10:34','2015-05-19 11:10:34');
/*!40000 ALTER TABLE `patient_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140919101910'),('20140919102624'),('20140919111325'),('20140919111416'),('20140919122138'),('20140919122236'),('20140919122328'),('20140919122426'),('20140919122518'),('20140919122651'),('20140919122746'),('20140919122825'),('20140919123027'),('20140919123153'),('20140919123658'),('20140919124246'),('20140922090335'),('20140922095222'),('20140922100329'),('20140922100754'),('20140922101322'),('20140922102704'),('20140922103155'),('20140922112054'),('20140922113051'),('20141015082618'),('20141015082733'),('20141015084020'),('20141015085712'),('20141015090757'),('20150227083529'),('20150227101317'),('20150311131831'),('20150324115740'),('20150327124503'),('20150327125937'),('20150330060311'),('20150330060355'),('20150401070217'),('20150401070228'),('20150407120005'),('20150407120016'),('20150408072054'),('20150514132802'),('20150515123858'),('20150515124423');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexes`
--

DROP TABLE IF EXISTS `sexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexes`
--

LOCK TABLES `sexes` WRITE;
/*!40000 ALTER TABLE `sexes` DISABLE KEYS */;
INSERT INTO `sexes` VALUES (1,'Male','2015-05-19 11:04:22','2015-05-19 11:04:22'),(2,'Female','2015-05-19 11:04:29','2015-05-19 11:04:29');
/*!40000 ALTER TABLE `sexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smoking_frequencies`
--

DROP TABLE IF EXISTS `smoking_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smoking_frequencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smoking_frequencies`
--

LOCK TABLES `smoking_frequencies` WRITE;
/*!40000 ALTER TABLE `smoking_frequencies` DISABLE KEYS */;
INSERT INTO `smoking_frequencies` VALUES (1,'1 cig / day','2015-05-19 11:04:47','2015-05-19 11:04:47');
/*!40000 ALTER TABLE `smoking_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `rfid_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_smoker` tinyint(1) DEFAULT NULL,
  `exercises` tinyint(1) DEFAULT NULL,
  `family_status_id` int(11) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `height` int(11) DEFAULT '0',
  `education_level_id` int(11) DEFAULT NULL,
  `exercise_activity_id` int(11) DEFAULT NULL,
  `smoking_frequency_id` int(11) DEFAULT NULL,
  `employment_status_id` int(11) DEFAULT NULL,
  `additional_info` text COLLATE utf8_unicode_ci,
  `access_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nkokkos@gmail.com','$2a$10$cOcAnpwRcQ.nCtGyphfD2uqgTRpViz9ghQTyyAJFn.8VQ.tqWuG.y','53a93df77aa1f4ea7723fa95efc96f9e58e7e36370294525d16e638bc5b1bd46','2015-05-19 11:07:53',NULL,94,'2015-05-20 12:35:26','2015-05-20 10:21:28','193.108.161.68','193.108.160.152','2015-04-03 07:20:51','2015-05-20 12:35:26','John Dough Douglas III',NULL,1,1,'',NULL,NULL,NULL,'1935-04-03',176,1,3,1,NULL,'','IvxgzqO8dSQ+ZB2Yf+sUue0w5SlWjJgqdfwqlGgyKDxUPAQIDFTYGQ==',NULL),(2,'ikalemis@gmail.com','$2a$10$F9GDnqgZFtOkbAlOuCrcEuwFSKodszET9XD.L.G9wemgBJRS1niOK',NULL,NULL,'2015-04-16 09:46:43',6,'2015-04-16 11:48:24','2015-04-16 09:46:43','150.140.22.60','150.140.22.62','2015-04-07 06:59:38','2015-04-16 11:48:24','ikalemis',0,1,NULL,'',0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'','bPRzhzYqeT7AEoIhZVLTDeTe2F5+md4EaMfHLyOqEHFrkZK2u/g6iQ==',NULL),(3,'user@user.com','$2a$10$2DdnJeq0Lzj4Ueg.979XT.vmigLvlCKrB/gQ22nUJ2AJwXm8JtvfC',NULL,NULL,NULL,1,'2015-05-19 11:09:47','2015-05-19 11:09:47','193.108.160.152','193.108.160.152','2015-05-19 11:09:15','2015-05-19 11:09:47','',0,0,NULL,'',0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'','xCVNWLSKOgHYTA9ehdSr8OM+m92igfLLofdcdTu6owoQZ+de7ko8Jw==',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-20 15:52:13
