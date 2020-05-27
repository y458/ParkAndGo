CREATE DATABASE  IF NOT EXISTS `parkbnb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `parkbnb`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: parkbnb
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `cmessage_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmessage_message` varchar(200) NOT NULL,
  `cmessage_daytime` datetime NOT NULL,
  `cmessage_fromuserid` int(11) DEFAULT NULL,
  `cmessage_touserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmessage_id`),
  KEY `cmessage_touserid_idx` (`cmessage_touserid`),
  KEY `cmessage_fromuserid_idx` (`cmessage_fromuserid`),
  CONSTRAINT `cmessage_fromuserid` FOREIGN KEY (`cmessage_fromuserid`) REFERENCES `user` (`user_id`),
  CONSTRAINT `cmessage_touserid` FOREIGN KEY (`cmessage_touserid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
INSERT INTO `chat_messages` VALUES (1,'asdasdff','2020-04-24 07:59:21',6,NULL),(2,'fasdf','2020-04-24 08:02:40',6,NULL),(3,'latest','2020-04-24 08:07:29',6,NULL),(4,'plll','2020-04-24 09:15:17',NULL,6),(5,'hei','2020-04-24 09:30:12',6,NULL),(6,'sup','2020-04-24 09:30:18',NULL,6);
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage`
--

DROP TABLE IF EXISTS `garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage` (
  `garage_id` int(11) NOT NULL AUTO_INCREMENT,
  `garage_address` varchar(200) NOT NULL,
  `garage_longtitude` varchar(45) NOT NULL,
  `garage_latitude` varchar(45) NOT NULL,
  `garage_ownercomment` varchar(200) DEFAULT NULL,
  `garage_confirmed` int(11) NOT NULL,
  `garage_userid` int(11) DEFAULT NULL,
  `garage_billimageurl` varchar(200) DEFAULT NULL,
  `garage_spotimageurl` varchar(200) DEFAULT NULL,
  `garage_entranceimageurl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`garage_id`),
  KEY `garage_userid_idx` (`garage_userid`),
  CONSTRAINT `garage_userid` FOREIGN KEY (`garage_userid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage`
--

LOCK TABLES `garage` WRITE;
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
INSERT INTO `garage` VALUES (13,'xai','38.0119445',' 23.6539907','',1,6,'C:\\Users\\dimit\\Desktop\\Park\\src\\main\\resources\\static\\assets\\garageImages\\13/bill.png',NULL,'C:\\Users\\dimit\\Desktop\\Park\\src\\main\\resources\\static\\assets\\garageImages\\13/entrance.png'),(14,'A.S.D. ΟΙΚΟΝΟΜΙΚΟΙ','38.00850199999999',' 23.694655','asd',1,6,'C:\\Users\\dimit\\Desktop\\Park\\src\\main\\resources\\static\\assets\\garageImages\\14/bill.png',NULL,'C:\\Users\\dimit\\Desktop\\Park\\src\\main\\resources\\static\\assets\\garageImages\\14/entrance.png'),(15,'A.S.D. ΟΙΚΟΝΟΜΙΚΟΙ','38.00850199999999',' 23.694655','asd',1,NULL,'C:\\Users\\dimit\\Desktop\\Park\\target\\parkbnb-0.0.1-SNAPSHOT\\garageImages\\15/bill.png',NULL,'C:\\Users\\dimit\\Desktop\\Park\\target\\parkbnb-0.0.1-SNAPSHOT\\garageImages\\15/entrance.png'),(16,'A.S.D. ΟΙΚΟΝΟΜΙΚΟΙ','38.00850199999999',' 23.694655','asd',1,NULL,'\\garageImages\\16\\bill.png',NULL,'C:\\Users\\dimit\\Desktop\\Park\\target\\parkbnb-0.0.1-SNAPSHOT\\garageImages\\16/entrance.png'),(17,'Petroupoli, Ελλάδα','38.0393662',' 23.6814412','asd',1,6,'\\garageImages\\17\\bill.png',NULL,'\\garageImages\\17\\entrance.png'),(18,'Petroupoli, Ελλάδα',' 23.6814412','38.0393662','',1,6,'\\garageImages\\18\\bill.png',NULL,'\\garageImages\\18\\entrance.png'),(19,'Peristeri, Ελλάδα',' 23.6887439','38.0109715','adf',1,6,'\\garageImages\\19\\bill.png',NULL,'\\garageImages\\19\\entrance.png'),(20,'Panepistimiou, Αθήνα, Ελλάδα',' 23.7329655','37.98028100000001','',1,13,'\\garageImages\\20\\bill.png',NULL,'\\garageImages\\20\\entrance.png');
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_review`
--

DROP TABLE IF EXISTS `garage_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_review` (
  `greview_id` int(11) NOT NULL AUTO_INCREMENT,
  `greview_rating` int(11) NOT NULL,
  `greview_comment` varchar(45) NOT NULL,
  `greview_garageid` int(11) NOT NULL,
  `greview_userid` int(11) NOT NULL,
  PRIMARY KEY (`greview_id`),
  KEY `greview_garageid_idx` (`greview_garageid`),
  KEY `greview_userid_idx` (`greview_userid`),
  CONSTRAINT `greview_garageid` FOREIGN KEY (`greview_garageid`) REFERENCES `garage` (`garage_id`),
  CONSTRAINT `greview_userid` FOREIGN KEY (`greview_userid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_review`
--

LOCK TABLES `garage_review` WRITE;
/*!40000 ALTER TABLE `garage_review` DISABLE KEYS */;
INSERT INTO `garage_review` VALUES (1,4,'malakia',18,6),(2,2,'etsi k etsi',18,6);
/*!40000 ALTER TABLE `garage_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `rental_start` datetime NOT NULL,
  `rental_end` datetime NOT NULL,
  `rental_paydone` tinyint(4) DEFAULT NULL,
  `rental_priceperhour` decimal(7,2) NOT NULL,
  `rental_garageid` int(11) NOT NULL,
  `rental_userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  KEY `rental_garageid_idx` (`rental_garageid`),
  KEY `rental_userid_idx` (`rental_userid`),
  CONSTRAINT `rental_garageid` FOREIGN KEY (`rental_garageid`) REFERENCES `garage` (`garage_id`),
  CONSTRAINT `rental_userid` FOREIGN KEY (`rental_userid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,'2020-03-25 08:00:00','2020-03-26 16:00:00',0,3.00,13,NULL),(16,'2020-04-15 16:00:00','2020-04-16 16:00:00',0,1.00,18,NULL),(17,'2020-04-14 08:00:00','2020-04-15 16:00:00',1,1.00,18,6),(22,'2020-04-21 06:00:00','2020-04-22 14:00:00',0,0.02,19,6),(23,'2020-04-21 06:00:00','2020-04-22 14:00:00',0,0.01,19,NULL),(24,'2020-04-21 06:00:00','2020-04-22 15:00:00',0,0.01,19,NULL);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_reviews`
--

DROP TABLE IF EXISTS `site_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_reviews` (
  `sreview_id` int(11) NOT NULL AUTO_INCREMENT,
  `sreview_userid` int(11) NOT NULL,
  `sreview_rating` int(11) NOT NULL,
  `sreview_comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`sreview_id`),
  KEY `sreview_userid_idx` (`sreview_userid`),
  CONSTRAINT `sreview_userid` FOREIGN KEY (`sreview_userid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_reviews`
--

LOCK TABLES `site_reviews` WRITE;
/*!40000 ALTER TABLE `site_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_active` tinyint(4) NOT NULL,
  `user_type` tinyint(4) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_surname` varchar(45) NOT NULL,
  `user_paypal` varchar(45) DEFAULT NULL,
  `user_billphoto` longblob,
  `user_reportpoints` int(11) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_username` varchar(45) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_generatedarray` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username_UNIQUE` (`user_username`),
  UNIQUE KEY `user_user_generatedarray_uindex` (`user_generatedarray`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,1,2,'dimit','dimit',NULL,NULL,0,'dimit@d.com','dimit','dimit',NULL),(3,1,2,'asdasd','asdasd',NULL,NULL,0,'asdasd@s.gr','asdasd','$2a$10$irh7fGlDiYEF/CLvrtmPcej//X1IcB/q9c2i5FSj5E268pcZQM9se',NULL),(4,1,1,'asdasdasd','sddasdas',NULL,NULL,0,'123456@s.com','123456','$2a$10$EwgOUkgj82kydX7stUoB.uKesTtT.AfrV44EbzNpLcTBduCDGGyNy',NULL),(5,1,1,'afasdgfasgas','asdgasdgasdg',NULL,NULL,0,'asdgasga@asd.com','afasdfasfdasdfads','$2a$10$DH.D.D.ltQkf793nDcB8beWbRWn/jDC1lpPD2tZ/bgP456nSt9dE.',NULL),(6,1,1,'admin','admin',NULL,NULL,0,'admin@admin.com','admin','$2a$10$L0xTGX5oaCVPglc9nWIMqOh0kbHabTWzA36CvrjsRt5uWzNYp.5am',NULL),(7,1,1,'asdasdasd','asdasdasd',NULL,NULL,0,'asdasdasd@asdasd.com','asdasdasd','$2a$10$nUZE2DceIDXxL0enebw6G.9H9xAdcEF2q3.aKhmPwy0ahljgH6Rhe',NULL),(8,1,1,'admin','admin',NULL,NULL,0,'admin2@aga.com','admin2','$2a$10$aQkVKQMQD.XqLyqLTRzBZOqF4gFyKJyLw52hLdZ4p4WbiuSfTr.Ku',NULL),(9,1,1,'admine','admine',NULL,NULL,0,'afasdf@asdas.com','admin3','$2a$10$LHDZCWJIHNw7w03T.6NLzuRjZMh0VDiCKre8CiW4HedxAR9EAfcX2',NULL),(10,1,1,'dimtry','dimtry',NULL,NULL,0,'dimitristryf@gmail.com','dimtry','$2a$10$voiy/LSNO1RvKFFiXPmqV.LPE63BWC1JyGhCYcwJYAOgXI9bSNQgW',NULL),(11,1,1,'Kostas','VLachos',NULL,NULL,0,'kostas_deck@hotmail.com','kmvkos','$2a$10$.vK9AoL1fnH9Rbt.8w/i/uZTMrjMZRsG61Es6/VdnJyFEIXnK7d4m',NULL),(12,1,1,'Kosats','Vlachos',NULL,NULL,0,'kostas_deck@hotmail.com','kmbkod12','$2a$10$E/HoYjQIogctncgGYV87.e726SxN80TeVijx/TseTtDdIimu.2tLm',NULL),(13,2,1,'dim','try',NULL,NULL,0,'j0e1992@hotmail.com','dim111','$2a$10$LO3Ar4pjeldCx.yxcCKf1O6B1AP3O7TwcQEh/MuiZgYLIdg5VYNMu','dxqZyNuFAR'),(14,2,2,'master','master',NULL,NULL,0,'master@master.com','master','$2a$10$spkrkvkrqmCGPZeSZCUdtOMxjDSqGcGum.lgdb1LlDWsfhfp7yWP.','iPyVLQOe10');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_review`
--

DROP TABLE IF EXISTS `user_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_review` (
  `ureview_id` int(11) NOT NULL AUTO_INCREMENT,
  `ureview_rating` int(11) NOT NULL,
  `ureview_comment` varchar(45) DEFAULT NULL,
  `ureview_fromuserid` int(11) NOT NULL,
  `ureview_touserid` int(11) NOT NULL,
  PRIMARY KEY (`ureview_id`),
  KEY `ureview_fromuserid_idx` (`ureview_fromuserid`),
  KEY `ureview_touserid_idx` (`ureview_touserid`),
  CONSTRAINT `ureview_fromuserid` FOREIGN KEY (`ureview_fromuserid`) REFERENCES `user` (`user_id`),
  CONSTRAINT `ureview_touserid` FOREIGN KEY (`ureview_touserid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_review`
--

LOCK TABLES `user_review` WRITE;
/*!40000 ALTER TABLE `user_review` DISABLE KEYS */;
INSERT INTO `user_review` VALUES (1,1,'123123qwaeq',6,6),(2,3,'good',6,6),(3,2,'asdas',6,6);
/*!40000 ALTER TABLE `user_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-24 12:33:53
