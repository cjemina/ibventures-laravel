-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: ibventures
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `financial_details`
--

DROP TABLE IF EXISTS `financial_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `revenue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_of_growth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avg_ebitda_last_3_years` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avg_net_result_last_3_years` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_with_positive_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_debt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_assets` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biggest_shareholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revenue_from_biggest_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_the_company_audited` bigint NOT NULL,
  `m_and_a_in_the_last_5_years` bigint NOT NULL,
  `selling_90_percent` bigint NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_fd_id` (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_details`
--

LOCK TABLES `financial_details` WRITE;
/*!40000 ALTER TABLE `financial_details` DISABLE KEYS */;
INSERT INTO `financial_details` VALUES (1,15,'12312312','2','3123123','1231231','2','123123','123123','awdawd','adwawd',1,0,0,'2020-08-06 19:02:37'),(2,16,'123123','2','12312','123123','2','123123','123123','awdawd','adawda',0,0,1,'2020-08-06 19:07:10'),(3,17,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 07:53:00'),(4,18,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:32:19'),(5,19,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:32:43'),(6,20,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:34:02'),(7,21,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:35:18'),(8,22,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:35:45'),(9,23,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:39:16'),(10,24,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:40:23'),(11,25,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:44:43'),(12,26,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:45:30'),(13,27,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:54:41'),(14,28,'10000000','1','1000000','800000','1','1000000','30000000','70%','50%',1,0,1,'2020-08-07 08:57:45'),(15,29,'10000000','1','1000000','800000','1','1000000','30000000','70','50',1,0,1,'2020-08-07 09:12:35');
/*!40000 ALTER TABLE `financial_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ud_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'TEST','TEST','TEST','TEST','2020-08-06 18:42:00'),(2,'TEST','TEST','TEST','TEST','2020-08-06 18:42:57'),(3,'user_id','user_id','user_id','user_id','2020-08-06 18:43:17'),(4,'user_id','user_id','user_id','user_id','2020-08-06 18:44:54'),(5,'electrónico','electrónico','electrónico','electrónico','2020-08-06 18:45:23'),(6,'123','12','123','TGESt','2020-08-06 18:46:54'),(7,'electrónico','electrónico','electrónico','electrónico','2020-08-06 18:47:19'),(8,'electrónico','electrónico','electrónico','electrónico','2020-08-06 18:49:35'),(9,'Operaciones','Operaciones','Operaciones','Operaciones','2020-08-06 18:50:36'),(10,'result.user_id','result.user_id','result.user_id','result.user_id','2020-08-06 18:51:18'),(11,'financial','financial','financial','financial','2020-08-06 18:54:11'),(12,'Nombre','Nombre','Nombre','Nombre','2020-08-06 18:56:52'),(13,'awdaw','awdawd','awdawd','sdaswdwad','2020-08-06 18:58:59'),(14,'awd','dawd','awdaw','awdaw','2020-08-06 18:59:56'),(15,'awd','wdawd','dawda','adaw','2020-08-06 19:02:36'),(16,'awdawd','awda','wda','awdawd','2020-08-06 19:07:09'),(17,'TESTING','TESTING','TESTING','09123456789','2020-08-07 07:53:00'),(18,'T','E','S','T','2020-08-07 08:32:19'),(19,'T','E','S','T','2020-08-07 08:32:42'),(20,'T','E','S','T','2020-08-07 08:34:01'),(21,'T','E','S','T','2020-08-07 08:35:18'),(22,'T','E','S','T','2020-08-07 08:35:45'),(23,'TEA','ATAS','ASDWA','TA#W','2020-08-07 08:39:15'),(24,'TEA','ATAS','ASDWA','TA#W','2020-08-07 08:40:22'),(25,'TEA','ATAS','ASDWA','TA#W','2020-08-07 08:44:43'),(26,'TEA','ATAS','ASDWA','TA#W','2020-08-07 08:45:30'),(27,'RAEAWd','AWDAWD','awdAWDA','AWDAWDAW','2020-08-07 08:54:40'),(28,'ADAWDA','AWDADW','AWDAWD','AWDAWDAW','2020-08-07 08:57:45'),(29,'awdawda','adawdawd','awdawdawd','adawdawd','2020-08-07 09:12:34');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-07 17:50:32
