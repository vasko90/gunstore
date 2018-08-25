-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `caliber` varchar(100) DEFAULT NULL,
  `picture` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Czu P-10 ','pistolj',76,560,'9 mm','4b504a6e-195c-489d-b910-728febc8e8b0398823.jpg'),(2,'DAN 01900 Pointman Seven ','pistolj',45,1200,'.45','8dc6a38c-9c4e-4036-9894-fa12289b1b96068272.jpg'),(4,'H&K 704031lela5 Usp40 ','pistolj',97,599,'9 mm','4bb0c6ad-de26-4a43-ac84-86dba38746b0697713.jpg'),(5,'Beretta 92 Fs','pistolj',100,700,'9 mm','49cd7eb4-13e7-483c-9e7d-ca33faff2fec448523.jpg'),(6,'Beretta Apx ','pistolj',99,535,'9 mm','70051d3e-c7be-40a3-bd2b-17fb2524744d475673.jpg'),(7,'Sig P226','pistolj',100,800,'9 mm','73bdbac8-1e34-4653-a1be-4e17a6912a4f798263.jpg'),(8,'1911 Select','pistolj',99,1050,'.45','452a1ead-a81c-4a9a-b8df-bc135bc20086068272.jpg'),(9,'S&W 686pc','pistolj',100,860,'.357 magnum','4049bf13-cd93-42d6-b7e6-351cd8160e08990263.jpg'),(10,'S&W M&p M2.0 ','pistolj',100,500,'9 mm','bf786db6-a862-427f-b898-6f875bf0efc7380663.jpg'),(11,'BRN 051-851490','pistolj',100,600,'.45','bebea4d9-473a-4f71-a670-b9fd32429581076923.jpg'),(12,'BRN 051-532490','pistolj',100,400,'9 mm','990ed27c-7c62-4fda-9b3b-dce7044a7e48306923.jpg'),(13,'Walther Arms','pistolj',100,560,'9 mm','f41da98c-34b1-42ba-92ab-44c41930577730115.jpg'),(15,'Browning 051938492','pistolj',100,676,'.45','6b0cdee4-fe6e-4683-8a74-70c7bdd85462311173.jpg'),(17,'Cz 805 Bren Ps1','puska',91,1633,'5.56','318cfafb-08d8-410b-99bb-2c61c88235f6991192.jpg'),(18,'Czu 805','puska',88,1900,'5.56','aef697a6-7128-4724-8f5b-edd2482da889253633.jpg'),(19,'Barrett 82a1','puska',90,8840,'12.7','7b781ac4-aad2-42c6-82e8-b10abb78ef5110876.jpg'),(22,'Brn Blr Wgld ','puska',100,1244,'7mm-08 Remingto','b85556b2-3ff3-4f91-9ae3-126a919f7f4f219633.jpg'),(23,'S&W M&p','puska',100,382,'.22 LR','d9edf1d0-dcfd-4593-9c33-2a785facbdd5861173.jpg'),(24,'Patriot Ordnance Factory ','puska',100,2075,'7.62x35mm','a161b4e6-afe5-45dd-b012-0bd6646277cc027073.jpg'),(25,'Sig Sauer M400 SWAT','puska',100,2000,'5.56','599cd36d-7afe-4916-892d-3fd63369af0drm40016bs.jpg'),(26,'Sig Sauer SIG716','puska',100,2300,'7.62x35mm','dd704007-7030-4594-8beb-aee85cf85b1217538299.jpg'),(27,'CORE15 M4 Scout','puska',100,600,'5.56','c7acfaba-90d6-4c15-b4de-f674e22e7ad32035904_2_.jpg'),(28,'FN M249S Para','puska',100,8700,'5.56','dd8a855c-2ec9-4f17-83f2-e0df372e82b717538297.jpg'),(29,'Remington 700 ADL','puska',100,420,'.270 Win','8bbebcdb-1259-4d5b-ae66-9e2629c9a0a57362506_1.jpg'),(30,'Kel-Tec RDB','puska',100,950,'5.56','acd18505-bc0b-4177-801b-3f6ae7b4ed9d17595030912.jpg'),(31,'AK47','puska',100,650,'7.62x39','ad1a60cc-b1eb-41d4-886f-1d3dca34ab23xctmpdRsXIt.png'),(33,'H&K SP5K 9mm  H&K SP5K','puska',98,2700,'9 mm','d9ab1ba0-4975-408c-afca-59b115382231xctmpY0YD6r.png'),(34,'H&K UMP','puska',98,2300,'9 mm','8f4806ca-c866-4073-99eb-987d889cb75eUMP9_re_SG.png'),(35,'H&K MP5 A5','puska',99,600,'.22 LR','929828cc-1fba-4f0a-bd63-274e17da3f20Mp5_.22_medium.jpg'),(36,'H&K G36','puska',98,600,'.22 LR','1c0c4d29-115f-449e-9a1e-2761a0708d9bWAL_5730300_medium.jpg'),(38,'Titan Arms HDP','sacmara',95,200,'12','9ee85536-c676-4565-a694-5bd9edfc0216download (1).jpg'),(39,'Titan Arms HDP Tactical Davidsons ','sacmara',89,300,'12','ff31a321-07e0-4cf7-a5c2-9ecb5910007edownload (2).jpg'),(40,'Mossberg 500 Persuader','sacmara',90,350,'12','c38d72ba-3b11-4417-b4a1-4a6dcf0c3f34download (3).jpg'),(41,'Remington 870 Tac-14 ','sacmara',99,360,'12','43e47411-d919-4f2b-8aa3-5ad7b145f8dedownload (4).jpg'),(42,'Kel-Tec KSG-25','sacmara',100,1200,'12','cdff9988-47ba-4c66-bbbc-0d056b206b461759503117.jpg'),(43,'Stoeger 3500','sacmara',99,290,'12','afdaf919-fb1e-4828-a4ff-dbf8eeba554d17078045.jpg'),(44,'Maverick 88 Security','sacmara',100,200,'12','457d7e1b-ffca-46df-80fd-26b9bf00e18721905631_1.jpg'),(45,'Mossberg 590 Shockwave','sacmara',100,380,'12','7cc713d5-4f2a-4052-b186-7c5cd5fd289617499044.jpg'),(46,'Mossberg Maverick 88 ','sacmara',100,350,'12','6ef1576c-4d0d-4ae6-8718-a3ea992561e0174990411.jpg'),(47,'BucknBear Batman Tactical Fixed ','noz',853,100,'/','28739687-ab76-47ea-9ca3-735def4835e832331175_02.jpg'),(48,'BucknBear Tanto Combat Fighter ','noz',880,100,'/','842ca490-2124-4f58-928e-692c4182c7db32331177_02.jpg'),(49,'BucknBear Batman','noz',84,105,'/','dd6890c9-4172-4f0a-b29a-f31a7e4bd23632331174_02_1.jpg'),(50,'KA-BAR 1217','noz',100,105,'/','72d25681-7d85-4716-a4dc-00df8b1d8f5ftimthumb.jpg'),(53,' Columbia River 2910','noz',99,375,'/','4efc7d21-6dc3-49b5-a432-5cc80f8a89992910z.jpg'),(54,' Gerber LMF II Infantry Fixed','noz',100,140,'/','b1966f5c-e15f-4a28-a8f1-20c62b8d8842GB1629d.jpg'),(56,' United Cutlery Sentry','noz',99,30,'/','392faf59-4b1d-408a-b282-b53a7874598eUC0784.jpg'),(57,'Cold Steel 80NTP Chaos Double Edge','noz',99,50,'/','c967ddfd-2db9-486c-89ff-6a4e255b4248timthumb (1).jpg'),(58,'S&W Special Ops M-9','noz',99,78,'/','b5c6bb85-d5da-48db-8eae-07d0fc408b13timthumb (2).jpg'),(59,'S&W Homeland Security','noz',99,50,'/','03b99ef9-b8c7-4312-bc9e-93e7a3362a46timthumb (3).jpg'),(60,'Fallkniven F1 Pilot Survival','noz',99,142,'/','385cbc0a-73f8-4a13-be85-ff3c05de5673FK-F1Z.jpg'),(61,'Gerber 31-001063 Bear Grylls Survival','noz',93,50,'/','b4f7042a-60eb-4f4a-ac93-20108f2acb26GB31001063dd.jpg'),(62,'Famas','puska',97,560,'9 mm','4d32f45d-0588-4fde-b865-826f05120d45447.jpg'),(63,'Sig Sauer 516','puska',100,1200,'9 mm','286a354a-eea0-4678-81f8-48a2af23942a516-Patrol_detail-courtesy-sigsauer.com_.jpg'),(64,'CZ 99','pistolj',211,207,'9 mm','d0a142aa-7a95-4d82-98fb-a9e919143f12716006077_1.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products` varchar(2500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'Czu P-10 ',8,'2018-08-25 19:25:02',560),(2,'H&K 704031lela5 Usp40 ',8,'2018-08-25 19:25:03',599),(3,'Beretta Apx ',8,'2018-08-25 19:25:03',535),(4,'Titan Arms HDP Tactical Davidsons ',8,'2018-08-25 19:25:03',300),(5,'Mossberg 500 Persuader',8,'2018-08-25 19:25:03',350),(6,'Czu 805',8,'2018-08-25 19:25:03',1900),(7,'Barrett 82a1',8,'2018-08-25 19:25:03',8840),(8,'S&W Special Ops M-9',8,'2018-08-25 19:25:03',78),(9,'BucknBear Tanto Combat Fighter ',8,'2018-08-25 19:25:03',100);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin',0,2),(8,'user1','user1',86738,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-25 21:30:26
