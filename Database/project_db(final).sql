CREATE DATABASE  IF NOT EXISTS `project_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: project_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `login_id` int DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `fka_login_id` (`login_id`),
  CONSTRAINT `fka_login_id` FOREIGN KEY (`login_id`) REFERENCES `logins` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (6,'akshay','surse',44);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `login_id` int DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fkc_login_id` (`login_id`),
  CONSTRAINT `fkc_login_id` FOREIGN KEY (`login_id`) REFERENCES `logins` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (13,'Avishkar','Patil',45),(15,'Chinmay','Sambrekar',53),(16,'anita','pawar',57),(17,'samir','chaughule',58);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logins` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `address` varchar(250) NOT NULL,
  `role_id` int NOT NULL,
  `status` tinyint DEFAULT (0),
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FKt7f0gr2o4iphv61wwgcwuem2e` (`role_id`),
  CONSTRAINT `FKt7f0gr2o4iphv61wwgcwuem2e` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (22,'Clean@123','clean@gmail.com','1111111111','a/p satara , maharshtra',1,1),(36,'LUL8eEpRejd9wDFJV4uM7dRfHsD1i3fS7+AZUNAJXbA=','surseabs@gmail.com','1244212456','A/p kille machindra gad tal : walawa Dist: sangli',1,0),(37,'5+174BPjFHIBioK+8qo4mD94DbcAn39sG+jPuK106Og=','','1','A/p Shere , Tal : Karad , Dist : Satara.',1,0),(39,'huXZ2kZ5RvYm9m28rKQkK6svHJ8O3zFqT1vnglvhFDw=','avishkarpatil11@gmail.com','1111111112','A/p Shere , Tal : Karad , Dist : Satara.',1,0),(43,'GopgyiLk8kh9WtbHspxCn+axA9jH0agBvsH6bdfrP7c=','chetan@gmail.com','9890390411','pune',2,1),(44,'5Tlap+rPdzwdfaK6xWtVWsC+lurBCBJSsuTJCEGshtc=','akshay@gmail.com','7779274791','pune',3,1),(45,'QfmvqUuCFjC/KZMlnehgEgamtW394vFze8aXmwrSv6k=','avishkar@gmail.com','7028857987','A/p Shere , Tal : Karad , Dist : Satara.',1,1),(46,'feOss1cNPFnkFULt6jXDmYjlXnpiDIqGleD75q/34FE=','prajwal@gmail.com','7796428498','pune',2,1),(47,'wE6w/wui4/2AEvVYPwgfsq3mZxRyKT8WwvByLEpIm10=','omkar@gmail.com','9309143125','pune',2,1),(48,'wd7MvN2F7RpE7NsNXRZrDG6u7aq5kBjH9dYrXbmUJe8=','rohit@gmail.com','9850576618','pune',2,1),(49,'0T9beWX4capRhGcXmY0SOAY04dRlukrQdAbU7RPlAbI=','shyam@gmail.com','9975425346','pune',2,1),(50,'+kHcPAPMEaTPkL402CzQFpUcWyx9xvX1rVBBLL0Nlto=','patil@gmail.com','8668614500','pune',2,1),(51,'WWxr/CHCQoRBsMEkIC1pfXUTONmHNitoWSMvig+/Wyo=','suraj@gmail.com','9975425348','pune',2,1),(53,'soG9eEOYJcRhF+p63mk9tCLZJMjeQj/SPr8jFIjaLdI=','schinmay1@gmail.com','9876543210','A/P 5/27 Mahapurush Complex, Bazarpeth, Near Mahapurush Mandir',1,1),(54,'gkEJ11qbELYhmeLu35PiuRIspGg/A3jQDwMMtUVRmU0=','h@gmail.com','1234567890','A/P 5/27 Mahapurush Complex, Bazarpeth, Near Mahapurush Mandir',2,1),(55,'p1qvxnU3S/vV/mHYd6ztySFrOCSZpKmy82Zu/foWHII=','anil@gmail.com','7896589658','pune, 411000',2,1),(56,'lnwTuQ4qpsuxa/pt4DbXdeiaw6lrAXYPlYbqZwH5dYg=','ajit@gmail.com','5698745698','mumbai, 424242',2,0),(57,'QvEdGJH2N9SRPTZwLMMVR2z/7pzkSFwQj4mVGjDvQBM=','anita@gmail.com','8978987654','lahor, pakistan',1,1),(58,'ivOKwSneWU+PvmYIEOAJsN4FcbCYcEFQRxNaaPYv/Pc=','samir@gmail.com','4569871234','sadashiv peth, pune 411030',1,1),(59,'vOHaSjxF2wFTyaBB0w62IoRJjwtA8/mSFlMYnNRaBPM=','tushar@gmail.com','1234567888','101, Chitralekha Apartment, Lane no 2, Rajeshreee Colony',2,1);
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `oi_id` int NOT NULL AUTO_INCREMENT,
  `o_id` int NOT NULL,
  `s_id` int NOT NULL,
  `status_id` int DEFAULT NULL,
  UNIQUE KEY `oi_id_UNIQUE` (`oi_id`),
  KEY `s_id_idx` (`s_id`),
  KEY `fk_o_id_idx` (`o_id`),
  KEY `FK3nekhvqtalt0en1gw5ssexxgu` (`status_id`),
  KEY `FKge9h1jqcq9un4gtagbuf5oa1s_idx` (`o_id`,`s_id`),
  CONSTRAINT `FK3nekhvqtalt0en1gw5ssexxgu` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  CONSTRAINT `fk_o_id` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`),
  CONSTRAINT `fk_s_id` FOREIGN KEY (`s_id`) REFERENCES `services` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (59,72,1072,1),(60,73,1003,1),(61,74,1002,1),(62,75,1001,1),(63,76,1009,1),(64,77,1002,1),(65,78,1004,1),(66,78,1016,1),(67,79,1075,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `order_date` date NOT NULL,
  `sp_id` int DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `FKk6sa3x7ky8nhgl8mwummxo2la` (`c_id`),
  KEY `FK5drg2npwgrro1yf7fpf9ydlw` (`sp_id`),
  CONSTRAINT `FK5drg2npwgrro1yf7fpf9ydlw` FOREIGN KEY (`sp_id`) REFERENCES `service_providers` (`sp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKk6sa3x7ky8nhgl8mwummxo2la` FOREIGN KEY (`c_id`) REFERENCES `customers` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (72,13,'2023-03-12',25,'2023-03-14'),(73,15,'2023-03-13',4,'2023-03-16'),(74,15,'2023-03-13',2,'2023-03-15'),(75,13,'2023-03-13',1,'2023-03-14'),(76,13,'2023-03-13',3,'2023-03-14'),(77,13,'2023-03-13',2,'2023-03-16'),(78,17,'2023-03-13',1,'2023-03-18'),(79,13,'2023-03-13',29,'2023-03-15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `o_id` int NOT NULL,
  `c_id` int NOT NULL,
  `sp_id` int DEFAULT NULL,
  `charges` decimal(9,2) DEFAULT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `FK8d37bcwwq1d4m1pkew5744125` (`o_id`),
  KEY `FKki1vmwd80l2q12x6lwilunsx0` (`c_id`),
  KEY `FKgk7wkhrssuhxnsbderjb8keyq` (`sp_id`),
  CONSTRAINT `FK8d37bcwwq1d4m1pkew5744125` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`),
  CONSTRAINT `FKgk7wkhrssuhxnsbderjb8keyq` FOREIGN KEY (`sp_id`) REFERENCES `service_providers` (`sp_id`),
  CONSTRAINT `FKki1vmwd80l2q12x6lwilunsx0` FOREIGN KEY (`c_id`) REFERENCES `customers` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (38,72,13,25,34.00,0.00,1),(39,73,15,4,1799.00,0.00,0),(40,74,15,2,489.00,0.00,1),(41,75,13,1,399.00,0.00,0),(42,76,13,3,2499.00,0.00,1),(43,77,13,2,489.00,0.00,0),(44,78,17,1,1688.00,0.00,0),(45,79,13,29,4599.00,0.00,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'customer'),(2,'service_provider'),(3,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_providers`
--

DROP TABLE IF EXISTS `service_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_providers` (
  `sp_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `login_id` int DEFAULT NULL,
  PRIMARY KEY (`sp_id`),
  KEY `fks_login_id` (`login_id`),
  CONSTRAINT `fks_login_id` FOREIGN KEY (`login_id`) REFERENCES `logins` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_providers`
--

LOCK TABLES `service_providers` WRITE;
/*!40000 ALTER TABLE `service_providers` DISABLE KEYS */;
INSERT INTO `service_providers` VALUES (1,'cleaningPros',22),(2,'cleaners',43),(3,'cleanVision',46),(4,'patel cleaning services',47),(22,'Clean Master',48),(23,'shyam',49),(24,'patil',50),(25,'suraj',51),(26,'hrishi',54),(27,'anil',55),(28,'ajit',56),(29,'Tushar',59);
/*!40000 ALTER TABLE `service_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_name` varchar(45) NOT NULL,
  `description` varchar(350) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `cost` decimal(9,2) NOT NULL,
  `sp_id` int DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FKihgchasiuu1msqmxdst3534uw` (`sp_id`),
  CONSTRAINT `FKihgchasiuu1msqmxdst3534uw` FOREIGN KEY (`sp_id`) REFERENCES `service_providers` (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1076 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1001,'Bathroom cleaning','Black spots and dirt stain removal of the complete bathroom','00:00:01',399.00,1),(1002,'kitchen cleaning','Deep Cleaning Of Kitchen, cleaning of Kitchen tiles and floor. ','00:00:01',489.00,2),(1003,'Home cleaning','Machine scrubbing of the walls and floor.','00:00:03',1799.00,4),(1004,'Kitchen Tops & Tiles cleaning','kitchen deep cleaning, Wiping and mopping of complete floor area.','00:00:01',989.00,1),(1005,'Office cleaning','Furniture and appliances dusting and wet wiping, also Machine cleaning of floors, doors and windows.','00:00:04',4999.00,3),(1006,'Home cleaning','Bathroom and kitchen deep cleaning, Wiping and mopping of complete floor area, Cobweb removal and wall dry dusting.','00:00:04',4599.00,3),(1007,'Washroom cleaning','Black spots and dirt stain removal of the complete bathroom,Deep Cleaning Of Bathroom, cleaning of Bathroom tiles and floor.  ','00:00:01',699.00,2),(1008,'Office cleaning','Furniture and appliances dusting and wet wiping, also Machine cleaning of floors, doors and windows.','00:00:03',5499.00,4),(1009,'Floor Cleaning','Machine scrubbing of the floor,Wiping and mopping of complete floor area.','00:00:02',2499.00,3),(1011,'kitchen cleaning','Deep Cleaning Of Kitchen, cleaning of Kitchen tiles and floor. ','00:00:01',489.00,3),(1012,'Home cleaning','Machine scrubbing of the walls and floor.','00:00:03',1799.00,2),(1013,'Kitchen Tops & Tiles cleaning','kitchen deep cleaning, Wiping and mopping of complete floor area.','00:00:01',989.00,4),(1014,'Office cleaning','Furniture and appliances dusting and wet wiping, also Machine cleaning of floors, doors and windows.','00:00:04',4999.00,2),(1015,'Home cleaning(deep)','Bathroom and kitchen deep cleaning, Wiping and mopping of complete floor area, Cobweb removal and wall dry dusting.','00:00:04',4599.00,4),(1016,'Washroom cleaning','Black spots and dirt stain removal of the complete bathroom,Deep Cleaning Of Bathroom, cleaning of Bathroom tiles and floor.','00:00:01',699.00,1),(1017,'Bathroom cleaning','Black spots and dirt stain removal of the complete bathroom','00:00:01',399.00,3),(1018,'Home cleaning','Machine scrubbing of the walls and floor.','00:00:03',1799.00,1),(1020,'Office cleaning','Furniture and appliances dusting and wet wiping, also Machine cleaning of floors, doors and windows.','00:00:04',4999.00,1),(1072,'Kitchen Tops & Tiles cleaning','bathroom cleaning','3:03',499.00,25),(1073,'Batharoom cleaning','fully clean.','01:00',1999.00,2),(1074,'Kitchen Tops & Tiles cleaning','tiles and kichen cleaning','02:00',2599.00,2),(1075,'Office cleaning','cleanin of the office','00:30:00',4599.00,29);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'booked'),(2,'completed');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 12:34:45
