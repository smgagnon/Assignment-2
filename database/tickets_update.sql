CREATE DATABASE  IF NOT EXISTS `ticketing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ticketing`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: ticketing
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `details` (
  `ticket_id` int(10) unsigned NOT NULL,
  `details` text NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`user_id`,`ticket_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tickets` (
  `ticket_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `subject` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `details` mediumtext NOT NULL,
  `email` varchar(45) NOT NULL,
  `reply` mediumtext,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,2,'Resolved','Internet Connection','2019-06-24 19:40:04','2019-07-04 02:20:38','I can\'t get access to the internet on my work computer. I have tried many things but it will not work. I have turned my computer off and on but nothing will connect. Can you help?','syoung@gmail.com',''),(2,3,'Resolved','Internet Connection','2019-06-24 19:40:04','2019-07-04 02:20:38','I can\'t get access to the internet on my work computer. I have tried many things but it will not work. I have turned my computer off and on but nothing will connect. Can you help?','syoung@gmail.com',''),(3,3,'Active','Computer screen pixels missing','2019-06-24 19:40:04','2019-07-04 02:31:51','I see many missing pixels in my computer screen. Is this fixable? Can I get a new screen?','ivybrooks@hotmail.com','undefined'),(4,4,'Resolved','Keyboard broken','2019-06-24 19:40:04','2019-07-04 02:20:38','My keyboard letter Z does not work. When I click it I get nothing. Please fix.','jamesa@gmail.com',''),(5,1,'Active','Trouble with internet connection','2019-06-26 18:23:03','2019-07-04 02:20:38','No internet is connecting on my laptop. Is the router down? I need it for my work. ','djones@gmail.com',''),(6,2,'Resolved','Computer mouse not working','2019-06-29 15:33:02','2019-07-04 02:20:38','My mouse has stopped working, might need some new batteries. Can you please provide this.','syoung@gmail.com',''),(16,1,'Active','Keyboard broken','2019-07-03 21:19:22','2019-07-04 02:19:55','My keyboard letter Z does not work. When I click it I get nothing. Please fix.','smgagnon@hotmail.com',NULL),(17,2,'Resolved','Can\'t connect to the internet','2019-07-03 21:58:07','2019-07-04 02:20:38','Tried unplugging the router, restarting computer, doesnt work.','syoung@gmail.com',''),(18,2,'Resolved','Trouble with internet connection','2019-07-03 22:02:42','2019-07-04 02:20:22','No internet is connecting on my laptop. Is the router down? I need it for my work. ','undefined',NULL),(19,2,'Active','Keyboard broken','2019-07-03 22:04:17','2019-07-04 02:19:55','My keyboard letter Z does not work. When I click it I get nothing. Please fix.','syoung@gmail.com','undefined'),(20,2,'Active','Computer mouse not working','2019-07-03 22:04:44','2019-07-04 02:19:55','My mouse has stopped working, might need some new batteries. Can you please provide this.','syoung@gmail.com',NULL),(21,2,'Active','ll','2019-07-03 22:35:58','2019-07-04 02:35:58','ll','syoung@gmail.com',NULL),(22,2,'Active','new-testing','2019-07-03 22:36:50','2019-07-04 02:36:50','new-test','smgagnon@hotmail.com',NULL),(23,2,'Active','cc','2019-07-03 22:37:42','2019-07-04 02:37:42','c','smgagnon@hotmail.com',NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `user_role` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'djones@gmail.com','webdev','David','Jones','emp'),(2,'syoung@gmail.com','webdev','Sydney','Young','user'),(3,'ivybrooks@hotmail.com','webdev','Ivy','Brooks','user'),(4,'jamesa@gmail.com','webdev','James','Armstrong','emp'),(5,'sgagnon@gmail.com','webdev','Steph','Gagnon','user');
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

-- Dump completed on 2019-07-03 23:20:19
