-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: musicplayerdb
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `release_date` date DEFAULT NULL,
  `artist_id` int DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Album1','2022-01-01',1),(2,'Album2','2023-02-10',2),(3,'Album3','2021-07-15',3),(4,'Album4','2020-05-20',4),(5,'Album5','2019-11-11',5);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Arijit Singh','India'),(2,'Taylor Swift','USA'),(3,'Ed Sheeran','UK'),(4,'A R Rahman','India'),(5,'Drake','Canada');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Pop'),(2,'Rock'),(3,'Hip-Hop'),(4,'Classical'),(5,'Jazz');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_history`
--

DROP TABLE IF EXISTS `play_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `play_history` (
  `play_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `track_id` int DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL,
  `seconds_played` int DEFAULT NULL,
  `played_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`play_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_track` (`track_id`),
  CONSTRAINT `play_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `play_history_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_history`
--

LOCK TABLES `play_history` WRITE;
/*!40000 ALTER TABLE `play_history` DISABLE KEYS */;
INSERT INTO `play_history` VALUES (1,1,1,'Mobile',200,'2026-03-18 05:21:25'),(2,2,2,'Laptop',180,'2026-03-18 05:21:25'),(3,3,3,'Tablet',150,'2026-03-18 05:21:25'),(4,4,4,'Mobile',220,'2026-03-18 05:21:25'),(5,5,5,'Laptop',300,'2026-03-18 05:21:25'),(6,1,83,'Mobile',321,'2026-03-18 05:22:34'),(7,1,62,'Mobile',313,'2026-03-18 05:22:34'),(8,3,12,'Mobile',330,'2026-03-18 05:22:34'),(9,2,80,'Mobile',50,'2026-03-18 05:22:34'),(10,4,18,'Mobile',336,'2026-03-18 05:22:34'),(11,2,41,'Mobile',123,'2026-03-18 05:22:34'),(12,1,41,'Mobile',327,'2026-03-18 05:22:34'),(13,3,35,'Mobile',180,'2026-03-18 05:22:34'),(14,1,43,'Mobile',259,'2026-03-18 05:22:34'),(15,2,97,'Mobile',105,'2026-03-18 05:22:34'),(16,1,61,'Mobile',334,'2026-03-18 05:22:34'),(17,5,70,'Mobile',271,'2026-03-18 05:22:34'),(18,4,87,'Mobile',188,'2026-03-18 05:22:34'),(19,4,27,'Mobile',84,'2026-03-18 05:22:34'),(20,4,60,'Mobile',232,'2026-03-18 05:22:34'),(21,2,51,'Mobile',266,'2026-03-18 05:22:34'),(22,1,32,'Mobile',134,'2026-03-18 05:22:34'),(23,3,48,'Mobile',344,'2026-03-18 05:22:34'),(24,3,47,'Mobile',308,'2026-03-18 05:22:34'),(25,5,8,'Mobile',223,'2026-03-18 05:22:34'),(26,4,62,'Mobile',62,'2026-03-18 05:22:34'),(27,2,78,'Mobile',264,'2026-03-18 05:22:34'),(28,2,18,'Mobile',71,'2026-03-18 05:22:34'),(29,5,97,'Mobile',142,'2026-03-18 05:22:34'),(30,4,33,'Mobile',250,'2026-03-18 05:22:34'),(31,2,87,'Mobile',112,'2026-03-18 05:22:34'),(32,3,58,'Mobile',217,'2026-03-18 05:22:34'),(33,1,64,'Mobile',344,'2026-03-18 05:22:34'),(34,1,10,'Mobile',186,'2026-03-18 05:22:34'),(35,5,56,'Mobile',302,'2026-03-18 05:22:34'),(36,3,14,'Mobile',70,'2026-03-18 05:22:34'),(37,5,54,'Mobile',298,'2026-03-18 05:22:34'),(38,3,18,'Mobile',128,'2026-03-18 05:22:34'),(39,4,21,'Mobile',235,'2026-03-18 05:22:34'),(40,3,61,'Mobile',207,'2026-03-18 05:22:34'),(41,5,55,'Mobile',126,'2026-03-18 05:22:34'),(42,4,41,'Mobile',82,'2026-03-18 05:22:34'),(43,2,37,'Mobile',298,'2026-03-18 05:22:34'),(44,1,68,'Mobile',133,'2026-03-18 05:22:34'),(45,2,99,'Mobile',297,'2026-03-18 05:22:34'),(46,1,39,'Mobile',178,'2026-03-18 05:22:34'),(47,5,57,'Mobile',326,'2026-03-18 05:22:34'),(48,5,78,'Mobile',100,'2026-03-18 05:22:34'),(49,3,1,'Mobile',200,'2026-03-18 05:22:34'),(50,3,5,'Mobile',262,'2026-03-18 05:22:34'),(51,2,85,'Mobile',59,'2026-03-18 05:22:34'),(52,4,5,'Mobile',157,'2026-03-18 05:22:34'),(53,4,14,'Mobile',270,'2026-03-18 05:22:34'),(54,2,18,'Mobile',63,'2026-03-18 05:22:34'),(55,4,38,'Mobile',279,'2026-03-18 05:22:34'),(56,4,20,'Mobile',312,'2026-03-18 05:22:34'),(57,5,38,'Mobile',190,'2026-03-18 05:22:34'),(58,2,69,'Mobile',285,'2026-03-18 05:22:34'),(59,5,96,'Mobile',105,'2026-03-18 05:22:34'),(60,1,78,'Mobile',251,'2026-03-18 05:22:34'),(61,1,18,'Mobile',278,'2026-03-18 05:22:34'),(62,2,11,'Mobile',257,'2026-03-18 05:22:34'),(63,1,64,'Mobile',273,'2026-03-18 05:22:34'),(64,5,86,'Mobile',296,'2026-03-18 05:22:34'),(65,3,25,'Mobile',230,'2026-03-18 05:22:34'),(66,2,54,'Mobile',306,'2026-03-18 05:22:34'),(67,4,85,'Mobile',100,'2026-03-18 05:22:34'),(68,2,10,'Mobile',199,'2026-03-18 05:22:34'),(69,2,59,'Mobile',131,'2026-03-18 05:22:34'),(70,4,23,'Mobile',136,'2026-03-18 05:22:34'),(71,4,2,'Mobile',279,'2026-03-18 05:22:34'),(72,4,52,'Mobile',131,'2026-03-18 05:22:34'),(73,5,34,'Mobile',109,'2026-03-18 05:22:34'),(74,5,27,'Mobile',167,'2026-03-18 05:22:34'),(75,1,72,'Mobile',59,'2026-03-18 05:22:34'),(76,1,3,'Mobile',61,'2026-03-18 05:22:34'),(77,1,54,'Mobile',131,'2026-03-18 05:22:34'),(78,4,2,'Mobile',288,'2026-03-18 05:22:34'),(79,5,18,'Mobile',87,'2026-03-18 05:22:34'),(80,1,16,'Mobile',193,'2026-03-18 05:22:34'),(81,5,11,'Mobile',291,'2026-03-18 05:22:34'),(82,4,15,'Mobile',231,'2026-03-18 05:22:34'),(83,3,6,'Mobile',211,'2026-03-18 05:22:34'),(84,3,5,'Mobile',244,'2026-03-18 05:22:34'),(85,1,56,'Mobile',190,'2026-03-18 05:22:34'),(86,4,98,'Mobile',307,'2026-03-18 05:22:34'),(87,2,25,'Mobile',93,'2026-03-18 05:22:34'),(88,5,48,'Mobile',177,'2026-03-18 05:22:34'),(89,4,26,'Mobile',93,'2026-03-18 05:22:34'),(90,5,42,'Mobile',96,'2026-03-18 05:22:34'),(91,3,24,'Mobile',220,'2026-03-18 05:22:34'),(92,1,95,'Mobile',148,'2026-03-18 05:22:34'),(93,5,9,'Mobile',50,'2026-03-18 05:22:34'),(94,4,69,'Mobile',110,'2026-03-18 05:22:34'),(95,5,18,'Mobile',346,'2026-03-18 05:22:34'),(96,3,20,'Mobile',258,'2026-03-18 05:22:34'),(97,5,33,'Mobile',341,'2026-03-18 05:22:34'),(98,5,52,'Mobile',324,'2026-03-18 05:22:34'),(99,1,42,'Mobile',346,'2026-03-18 05:22:34'),(100,4,50,'Mobile',171,'2026-03-18 05:22:34'),(101,3,45,'Mobile',235,'2026-03-18 05:22:34'),(102,4,98,'Mobile',225,'2026-03-18 05:22:34'),(103,5,23,'Mobile',94,'2026-03-18 05:22:34'),(104,1,87,'Mobile',94,'2026-03-18 05:22:34'),(105,1,23,'Mobile',263,'2026-03-18 05:22:34'),(106,1,2,'Mobile',200,'2026-03-22 18:35:12');
/*!40000 ALTER TABLE `play_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_play_log` AFTER INSERT ON `play_history` FOR EACH ROW INSERT INTO PLAY_LOG(user_id, track_id, action_time, action_type)
VALUES (NEW.user_id, NEW.track_id, NOW(), 'PLAYED') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_log` AFTER INSERT ON `play_history` FOR EACH ROW INSERT INTO PLAY_LOG(user_id, track_id)
VALUES (NEW.user_id, NEW.track_id) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `play_log`
--

DROP TABLE IF EXISTS `play_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `play_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `track_id` int DEFAULT NULL,
  `action_time` datetime DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_log`
--

LOCK TABLES `play_log` WRITE;
/*!40000 ALTER TABLE `play_log` DISABLE KEYS */;
INSERT INTO `play_log` VALUES (1,1,2,'2026-03-23 00:05:12','PLAYED');
/*!40000 ALTER TABLE `play_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Favorites','2026-03-18 05:21:06',1),(2,'Workout','2026-03-18 05:21:06',2),(3,'Chill','2026-03-18 05:21:06',3),(4,'Travel','2026-03-18 05:21:06',4),(5,'Party','2026-03-18 05:21:06',5);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_track`
--

DROP TABLE IF EXISTS `playlist_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_track` (
  `playlist_id` int NOT NULL,
  `track_id` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`,`track_id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `playlist_track_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`),
  CONSTRAINT `playlist_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_track`
--

LOCK TABLES `playlist_track` WRITE;
/*!40000 ALTER TABLE `playlist_track` DISABLE KEYS */;
INSERT INTO `playlist_track` VALUES (1,1,'2026-03-18 05:21:16'),(1,2,'2026-03-18 05:21:16'),(2,3,'2026-03-18 05:21:16'),(2,4,'2026-03-18 05:21:16'),(3,5,'2026-03-18 05:21:16'),(3,6,'2026-03-18 05:21:16'),(4,7,'2026-03-18 05:21:16'),(4,8,'2026-03-18 05:21:16'),(5,9,'2026-03-18 05:21:16'),(5,10,'2026-03-18 05:21:16');
/*!40000 ALTER TABLE `playlist_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track` (
  `track_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `duration` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  PRIMARY KEY (`track_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `track_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `check_duration` CHECK ((`duration` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,'Updated Song',210,1),(2,'Song2',200,1),(3,'Song3',180,2),(4,'Song4',240,2),(5,'Song5',300,3),(6,'Song6',150,3),(7,'Song7',220,4),(8,'Song8',260,4),(9,'Song9',230,5),(10,'Song10',190,5),(11,'Song11',183,3),(12,'Song12',228,3),(13,'Song13',187,4),(14,'Song14',214,3),(15,'Song15',282,5),(16,'Song16',129,5),(17,'Song17',217,3),(18,'Song18',274,4),(19,'Song19',163,2),(20,'Song20',136,2),(21,'Song21',216,2),(22,'Song22',185,3),(23,'Song23',281,2),(24,'Song24',180,2),(25,'Song25',201,3),(26,'Song26',102,3),(27,'Song27',229,4),(28,'Song28',134,1),(29,'Song29',200,3),(30,'Song30',294,2),(31,'Song31',288,4),(32,'Song32',134,1),(33,'Song33',261,5),(34,'Song34',255,2),(35,'Song35',205,3),(36,'Song36',299,3),(37,'Song37',140,4),(38,'Song38',272,2),(39,'Song39',214,1),(40,'Song40',124,1),(41,'Song41',134,3),(42,'Song42',133,2),(43,'Song43',218,2),(44,'Song44',248,4),(45,'Song45',253,3),(46,'Song46',286,2),(47,'Song47',263,1),(48,'Song48',127,2),(49,'Song49',149,2),(50,'Song50',196,4),(51,'Song51',294,4),(52,'Song52',115,1),(53,'Song53',253,5),(54,'Song54',266,4),(55,'Song55',287,4),(56,'Song56',166,4),(57,'Song57',281,1),(58,'Song58',143,3),(59,'Song59',100,3),(60,'Song60',110,1),(61,'Song61',101,5),(62,'Song62',226,2),(63,'Song63',283,3),(64,'Song64',252,2),(65,'Song65',154,3),(66,'Song66',153,1),(67,'Song67',221,4),(68,'Song68',134,3),(69,'Song69',255,3),(70,'Song70',155,5),(71,'Song71',142,4),(72,'Song72',210,5),(73,'Song73',213,2),(74,'Song74',255,5),(75,'Song75',232,2),(76,'Song76',228,2),(77,'Song77',137,2),(78,'Song78',251,1),(79,'Song79',248,4),(80,'Song80',153,2),(81,'Song81',179,2),(82,'Song82',125,5),(83,'Song83',271,4),(84,'Song84',121,2),(85,'Song85',169,4),(86,'Song86',231,1),(87,'Song87',161,2),(88,'Song88',288,3),(89,'Song89',131,1),(90,'Song90',205,4),(91,'Song91',222,1),(92,'Song92',271,5),(93,'Song93',250,1),(94,'Song94',213,2),(95,'Song95',298,5),(96,'Song96',249,5),(97,'Song97',153,4),(98,'Song98',172,5),(99,'Song99',193,3),(100,'Song100',218,1),(400,'Test Song',200,1);
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_track_timestamp` BEFORE INSERT ON `track` FOR EACH ROW BEGIN
    SET NEW.duration = ABS(NEW.duration);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `track_album_view`
--

DROP TABLE IF EXISTS `track_album_view`;
/*!50001 DROP VIEW IF EXISTS `track_album_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `track_album_view` AS SELECT 
 1 AS `track_id`,
 1 AS `track_name`,
 1 AS `album_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `track_genre`
--

DROP TABLE IF EXISTS `track_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_genre` (
  `track_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `track_genre_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`),
  CONSTRAINT `track_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_genre`
--

LOCK TABLES `track_genre` WRITE;
/*!40000 ALTER TABLE `track_genre` DISABLE KEYS */;
INSERT INTO `track_genre` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5);
/*!40000 ALTER TABLE `track_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `track_view`
--

DROP TABLE IF EXISTS `track_view`;
/*!50001 DROP VIEW IF EXISTS `track_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `track_view` AS SELECT 
 1 AS `track_id`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','user1@gmail.com','pass1','2026-03-18 05:19:44'),(2,'user2','user2@gmail.com','pass2','2026-03-18 05:19:44'),(3,'user3','user3@gmail.com','pass3','2026-03-18 05:19:44'),(4,'user4','user4@gmail.com','pass4','2026-03-18 05:19:44'),(5,'user5','user5@gmail.com','pass5','2026-03-18 05:19:44');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `track_album_view`
--

/*!50001 DROP VIEW IF EXISTS `track_album_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `track_album_view` AS select `t`.`track_id` AS `track_id`,`t`.`title` AS `track_name`,`a`.`title` AS `album_name` from (`track` `t` join `album` `a` on((`t`.`album_id` = `a`.`album_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `track_view`
--

/*!50001 DROP VIEW IF EXISTS `track_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `track_view` AS select `track`.`track_id` AS `track_id`,`track`.`title` AS `title` from `track` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15 22:25:09
