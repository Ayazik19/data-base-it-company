-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: it_company
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_Client` int NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_Employees` int NOT NULL,
  PRIMARY KEY (`id_Client`),
  UNIQUE KEY `id_Employees_UNIQUE` (`id_Employees`),
  CONSTRAINT `fk_id_Client` FOREIGN KEY (`id_Client`) REFERENCES `orders` (`id_Client`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id_Employees` int NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `stag` int NOT NULL,
  `birth` date NOT NULL,
  `gender` char(1) NOT NULL,
  `date_order` date NOT NULL,
  `hometown` varchar(15) NOT NULL,
  `id_Post` int NOT NULL,
  `id_Salary` int DEFAULT NULL,
  PRIMARY KEY (`id_Employees`),
  UNIQUE KEY `id_Post_UNIQUE` (`id_Post`),
  UNIQUE KEY `id_Salary` (`id_Salary`),
  CONSTRAINT `fk_id_Employees` FOREIGN KEY (`id_Employees`) REFERENCES `clients` (`id_Employees`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_employees_orders` BEFORE DELETE ON `employees` FOR EACH ROW BEGIN 
DELETE FROM orders WHERE id_Employees = OLD.id_Employees; 
 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `info_order`
--

DROP TABLE IF EXISTS `info_order`;
/*!50001 DROP VIEW IF EXISTS `info_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_order` AS SELECT 
 1 AS `id_Order`,
 1 AS `id_Client`,
 1 AS `id_Employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_Order` int NOT NULL AUTO_INCREMENT,
  `id_Employees` int NOT NULL,
  `id_Type_payment` int NOT NULL,
  `id_Client` int NOT NULL,
  `date_order` date NOT NULL,
  PRIMARY KEY (`id_Order`),
  UNIQUE KEY `id_Order_UNIQUE` (`id_Employees`),
  UNIQUE KEY `id_Type_payment_UNIQUE` (`id_Type_payment`),
  UNIQUE KEY `id_Client_UNIQUE` (`id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id_Post` int NOT NULL AUTO_INCREMENT,
  `type_position` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Post`),
  CONSTRAINT `fk_id_Post` FOREIGN KEY (`id_Post`) REFERENCES `employees` (`id_Post`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `id_Salary` int NOT NULL AUTO_INCREMENT,
  `Salary` int NOT NULL,
  `date_salary` date NOT NULL,
  PRIMARY KEY (`id_Salary`),
  CONSTRAINT `fk_id_Salary` FOREIGN KEY (`id_Salary`) REFERENCES `employees` (`id_Salary`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_payment`
--

DROP TABLE IF EXISTS `type_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_payment` (
  `id_Type_payment` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `category` char(5) NOT NULL,
  PRIMARY KEY (`id_Type_payment`),
  CONSTRAINT `fk_id_Type_payment` FOREIGN KEY (`id_Type_payment`) REFERENCES `orders` (`id_Type_payment`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_amount` AFTER INSERT ON `type_payment` FOR EACH ROW BEGIN
SELECT COUNT(*) INTO @amount FROM Type_payment;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `info_order`
--

/*!50001 DROP VIEW IF EXISTS `info_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_order` AS select `o`.`id_Order` AS `id_Order`,`c`.`id_Client` AS `id_Client`,`e`.`id_Employees` AS `id_Employees` from ((`orders` `o` join `clients` `c` on((`o`.`id_Client` = `c`.`id_Client`))) join `employees` `e` on((`o`.`id_Order` = `e`.`id_Employees`))) */;
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

-- Dump completed on 2023-05-17 22:41:05
