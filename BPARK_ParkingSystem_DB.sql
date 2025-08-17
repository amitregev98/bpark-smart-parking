-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bpark
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `parkinghistory`
--

DROP TABLE IF EXISTS `parkinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parkinghistory` (
  `HistoryID` int NOT NULL AUTO_INCREMENT,
  `subscriber` varchar(45) DEFAULT NULL,
  `SpotID` int DEFAULT NULL,
  `resID` int DEFAULT NULL,
  `EntryTime` datetime DEFAULT NULL,
  `ExitTime` datetime DEFAULT NULL,
  `Late` tinyint DEFAULT NULL,
  `totalTimeParking` bigint DEFAULT NULL,
  `Extensions` tinyint DEFAULT NULL,
  `ShowedUp` tinyint DEFAULT NULL,
  `LateEmailSent` tinyint DEFAULT '0',
  `TimeToPark` int DEFAULT NULL,
  PRIMARY KEY (`HistoryID`),
  KEY `SpotID` (`SpotID`),
  KEY `subscriber` (`subscriber`),
  CONSTRAINT `parkinghistory_ibfk_1` FOREIGN KEY (`SpotID`) REFERENCES `parkingspot` (`SpotID`),
  CONSTRAINT `parkinghistory_ibfk_2` FOREIGN KEY (`subscriber`) REFERENCES `subscriber` (`SubscriberID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkinghistory`
--

LOCK TABLES `parkinghistory` WRITE;
/*!40000 ALTER TABLE `parkinghistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `parkinghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkingreport`
--

DROP TABLE IF EXISTS `parkingreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parkingreport` (
  `DateOfReport` datetime NOT NULL,
  `Report_data` blob,
  PRIMARY KEY (`DateOfReport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkingreport`
--

LOCK TABLES `parkingreport` WRITE;
/*!40000 ALTER TABLE `parkingreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `parkingreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkingspot`
--

DROP TABLE IF EXISTS `parkingspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parkingspot` (
  `SpotID` int NOT NULL,
  `InUse` tinyint DEFAULT NULL,
  PRIMARY KEY (`SpotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkingspot`
--

LOCK TABLES `parkingspot` WRITE;
/*!40000 ALTER TABLE `parkingspot` DISABLE KEYS */;
INSERT INTO `parkingspot` VALUES (0,0),(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0),(53,0),(54,0),(55,0),(56,0),(57,0),(58,0),(59,0),(60,0),(61,0),(62,0),(63,0),(64,0),(65,0),(66,0),(67,0),(68,0),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0),(77,0),(78,0),(79,0),(80,0),(81,0),(82,0),(83,0),(84,0),(85,0),(86,0),(87,0),(88,0),(89,0),(90,0),(91,0),(92,0),(93,0),(94,0),(95,0),(96,0),(97,0),(98,0),(99,0);
/*!40000 ALTER TABLE `parkingspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` int NOT NULL,
  `SubscriberID` varchar(45) DEFAULT NULL,
  `SpotID` int DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `SpotID` (`SpotID`),
  KEY `SubscriberID` (`SubscriberID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`SpotID`) REFERENCES `parkingspot` (`SpotID`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`SubscriberID`) REFERENCES `subscriber` (`SubscriberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriber` (
  `SubscriberID` varchar(45) NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SubscriberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriberreport`
--

DROP TABLE IF EXISTS `subscriberreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriberreport` (
  `SubscriberID` varchar(45) NOT NULL,
  `DateOfReport` varchar(45) NOT NULL,
  `Report_img` blob,
  PRIMARY KEY (`DateOfReport`,`SubscriberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriberreport`
--

LOCK TABLES `subscriberreport` WRITE;
/*!40000 ALTER TABLE `subscriberreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriberreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagreader`
--

DROP TABLE IF EXISTS `tagreader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagreader` (
  `TagReaderID` int NOT NULL,
  `SubscriberID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TagReaderID`),
  KEY `SubscriberID` (`SubscriberID`),
  CONSTRAINT `tagreader_ibfk_1` FOREIGN KEY (`SubscriberID`) REFERENCES `subscriber` (`SubscriberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagreader`
--

LOCK TABLES `tagreader` WRITE;
/*!40000 ALTER TABLE `tagreader` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagreader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `WorkerID` varchar(45) NOT NULL,
  `Type` tinyint DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`WorkerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES ('0000',0,'Usher'),('1111',1,'Manager');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-07 12:36:38
