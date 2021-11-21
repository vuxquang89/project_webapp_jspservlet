-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingdb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `user_mail` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `account_role` int NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('admin','123',1,'admin','admin','1233'),('duongdt@fpt.com.vn','123',1,'Đinh Tùng Dương','Đại học FPT','0765870407'),('duydt@fpt.com.vn','123',1,'Dao Trong Duy','Đại học FPT','1234567'),('vux.quang89@gmail.com','1234',2,'quang vu123','abc','123444');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `user_mail` varchar(100) DEFAULT NULL,
  `order_id` int NOT NULL,
  `order_status` int DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_discount_code` varchar(8) DEFAULT NULL,
  `order_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('vux.quang89@gmail.com',-2146144935,2,'2021-10-14 18:33:14','','abc',NULL),('vux.quang89@gmail.com',1634236677,2,'2021-10-14 18:37:57','','abc',NULL),('vux.quang89@gmail.com',1634236727,2,'2021-10-14 18:38:47','','abc',NULL),('vux.quang89@gmail.com',1634453570,2,'2021-10-17 06:52:50','','abc',NULL),('vux.quang89@gmail.com',1634490806,2,'2021-10-17 17:13:26','','abc',NULL),('vux.quang89@gmail.com',1634492364,2,'2021-10-17 17:39:24','','abc',NULL),('vux.quang89@gmail.com',1634493231,2,'2021-10-17 17:53:51','','abc',NULL),('vux.quang89@gmail.com',1634493404,2,'2021-10-17 17:56:44','','abc','nhớ gọi cho tôi'),('duydt@fpt.com.vn',1634499662,2,'2021-10-17 19:41:02','','Đại học FPT',''),('vux.quang89@gmail.com',1634636840,2,'2021-10-19 09:47:20','','abc','');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount_product` int DEFAULT NULL,
  `price_product` double DEFAULT NULL,
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES (-2146144935,3,1,32.9900016784668),(1634236677,2,1,37.9900016784668),(1634236727,4,1,27.989999771118164),(1634236727,6,2,17.989999771118164),(1634453570,6,2,15490000),(1634490806,3,2,16000000),(1634490806,2,2,17500000),(1634492364,10,1,7250000),(1634493231,8,1,9560000),(1634493404,4,1,13600000),(1634499662,3,3,16000000),(1634636840,8,1,9560000);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_img_source` varchar(255) DEFAULT NULL,
  `product_type` varchar(100) DEFAULT NULL,
  `product_brand` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 11 Pro Max 512GB','Màn hình: 6.5\", Super Retina XDR\r;HĐH: iOS 13\r;CPU: Apple A13 Bionic 6 nhân;RAM: 4 GB;ROM: 512 GB;Camera: 3 camera 12 MP;Selfie: 12 MP',18940000,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg','cellphone','apple'),(2,'iPhone 11 Pro Max 256GB','Màn hình: 6.5\", Super Retina XDR;HĐH: iOS 13\r;CPU: Apple A13 Bionic 6 nhân; RAM: 4 GB;ROM: 512 GB;Camera: 3 camera 12 MP;Selfie: 12 MP',17500000,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg','cellphone','apple'),(3,'iPhone Xs Max 256GB','Màn hình: 6.5\", Super Retina\r;HĐH: iOS 12;CPU: Apple A12 Bionic 6 nhân\r;RAM: 4 GB;ROM: 256 GB\r;Camera: Chính 12 MP & Phụ 12 MP;Selfie: 7 MP',16000000,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg','cellphone','apple'),(4,'iPhone X 256GB','Màn hình: 5.8\", Super Retina;HĐH: iOS 12\r;CPU: Apple A11 Bionic 6 nhân;RAM: 3 GB; ROM: 256 GB; Camera: Chính 12 MP & Phụ 12 MP;Selfie: 7 MP',13600000,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg','cellphone','apple'),(5,'iPhone Xs 64GB','Màn hình: 5.8\", Super Retina;HĐH: iOS 12;CPU: Apple A12 Bionic 6 nhân;RAM: 4 GB;ROM: 64 GB\r;Camera: Chính 12 MP & Phụ 12 MP;Selfie: 7 MP',12450000,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg','cellphone','apple'),(6,'iPhone Xr 128GB','Màn hình: 6.1\", Liquid Retina\r;HĐH: iOS 12\r;CPU: Apple A12 Bionic 6 nhân;RAM: 3 GB;ROM: 128 GB;Camera: 12 MP;Selfie: 7 MP',15490000,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone','apple'),(7,'iPhone Xr 128GB','Màn hình: 6.1\", Liquid Retina;HĐH: iOS 12;CPU: Apple A12 Bionic 6 nhân;RAM: 3 GB;ROM: 128 GB\r;Camera: 12 MP;Selfie: 7 MP',15490000,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone','apple'),(8,'iPhone 8 Plus 64GB','Màn hình: 5.5\", Retina HD;HĐH: iOS 12;CPU: Apple A11 Bionic 6 nhân;RAM: 3 GB;ROM: 64 GB;Camera: Chính 12 MP & Phụ 12 MP;Selfie: 7 MP',9560000,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg','cellphone','apple'),(9,'iPhone 7 Plus 32GB','Màn hình: 5.5\", Retina HD;HĐH: iOS 12;\rCPU: Apple A10 Fusion 4 nhân 64-bit;RAM: 3 GB;ROM: 32 GB\r;Camera: Chính 12 MP & Phụ 12 MP;Selfie: 7 MP',8540000,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg','cellphone','apple'),(10,'iPhone 7 32GB','Màn hình: 4.7\", Retina HD;HĐH: iOS 12\r;CPU: Apple A10 Fusion 4 nhân 64-bit;RAM: 2 GB;ROM: 32 GB\r;Camera: 12 MP;Selfie: 7 MP',7250000,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg','cellphone','apple');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 17:07:07
