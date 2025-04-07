-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
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
-- Table structure for table `vendorproduct`
--

DROP TABLE IF EXISTS `vendorproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorproduct` (
  `VendorProductID` int NOT NULL,
  `VendorID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Price` decimal(19,2) NOT NULL,
  `Quantity` int NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`VendorProductID`),
  KEY `FK_Vendor` (`VendorID`),
  KEY `FK_Product` (`ProductID`),
  CONSTRAINT `FK_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `FK_Vendor` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorproduct`
--

LOCK TABLES `vendorproduct` WRITE;
/*!40000 ALTER TABLE `vendorproduct` DISABLE KEYS */;
INSERT INTO `vendorproduct` VALUES (1,1,1,699.99,50,'Latest smartphone with high-end features'),(2,1,2,1199.99,30,'Powerful laptop for gaming and work'),(3,2,3,19.99,200,'Cotton T-shirt with trendy designs'),(4,2,4,39.99,150,'Comfortable jeans for all seasons'),(5,3,5,14.99,100,'Best-selling novel by a famous author'),(6,4,6,499.99,20,'Luxurious sofa for your living room'),(7,5,7,29.99,75,'High-quality basketball for outdoor play'),(8,6,8,9.99,500,'Fun action figure with movable parts'),(9,7,9,6.99,300,'Shampoo with natural ingredients for healthy hair'),(10,8,10,29.99,100,'Reliable toaster with multiple settings');
/*!40000 ALTER TABLE `vendorproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07 14:22:28
