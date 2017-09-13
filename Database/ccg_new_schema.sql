CREATE DATABASE  IF NOT EXISTS `ccg_interactions_new` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ccg_interactions_new`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ccg_interactions_new
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `aircall_agent_user`
--

DROP TABLE IF EXISTS `aircall_agent_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircall_agent_user` (
  `agentId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  `availability_status` varchar(45) DEFAULT NULL,
  `direct_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`agentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircall_agent_user`
--

LOCK TABLES `aircall_agent_user` WRITE;
/*!40000 ALTER TABLE `aircall_agent_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircall_agent_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircall_data`
--

DROP TABLE IF EXISTS `aircall_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircall_data` (
  `interactionId` int(11) NOT NULL,
  `custNumber` varchar(45) NOT NULL,
  `agentId` int(11) NOT NULL,
  `numId` int(11) NOT NULL,
  `callType` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `missed_call_reason` varchar(45) DEFAULT NULL,
  `halfHour_ccg` time DEFAULT NULL,
  `started_at` time DEFAULT NULL,
  `answered_at` time DEFAULT NULL,
  `ended_at` time DEFAULT NULL,
  `duration(sec)` int(11) DEFAULT NULL,
  `waitTime_ccg` time DEFAULT NULL,
  `voicemail` varchar(255) DEFAULT NULL,
  `recording` varchar(255) DEFAULT NULL,
  `direct_link` varchar(200) DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  `comment` varchar(999) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `resource` varchar(50) DEFAULT NULL,
  `event` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`interactionId`),
  KEY `agentId_idx` (`agentId`),
  KEY `numId_idx` (`numId`),
  CONSTRAINT `agentId` FOREIGN KEY (`agentId`) REFERENCES `aircall_agent_user` (`agentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `numId` FOREIGN KEY (`numId`) REFERENCES `aircall_number` (`numId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircall_data`
--

LOCK TABLES `aircall_data` WRITE;
/*!40000 ALTER TABLE `aircall_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircall_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`callcenterguys`@`%`*/ /*!50003 TRIGGER `ccg_interactions_new`.`aircall_data_BEFORE_INSERT` BEFORE INSERT ON `aircall_data` FOR EACH ROW
BEGIN
	IF (NEW.callType not in ('inbound', 'outbound'))
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid callType insertion data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aircall_number`
--

DROP TABLE IF EXISTS `aircall_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircall_number` (
  `numId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tollFreeNumber` varchar(45) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  `open` tinyint(4) DEFAULT NULL,
  `availability_status` varchar(45) DEFAULT NULL,
  `direct_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircall_number`
--

LOCK TABLES `aircall_number` WRITE;
/*!40000 ALTER TABLE `aircall_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircall_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `campaignId` int(11) NOT NULL AUTO_INCREMENT,
  `campaignName` varchar(255) NOT NULL,
  `location` varchar(999) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`campaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_sale`
--

DROP TABLE IF EXISTS `campaign_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_sale` (
  `csId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `campaignId` int(11) NOT NULL,
  `offerId` int(11) NOT NULL,
  `productCode` varchar(255) NOT NULL,
  PRIMARY KEY (`csId`),
  KEY `orderId_idx` (`orderId`),
  KEY `sale_camp_id_idx` (`campaignId`),
  KEY `sale_offer_id_idx` (`offerId`),
  KEY `sale_prod_code_idx` (`productCode`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sale_camp_id` FOREIGN KEY (`campaignId`) REFERENCES `campaign` (`campaignId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sale_offer_id` FOREIGN KEY (`offerId`) REFERENCES `offer` (`offerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sale_prod_code` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_sale`
--

LOCK TABLES `campaign_sale` WRITE;
/*!40000 ALTER TABLE `campaign_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_tollfree`
--

DROP TABLE IF EXISTS `campaign_tollfree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_tollfree` (
  `tollFreeNumber` varchar(25) NOT NULL,
  `campaignId` int(11) DEFAULT NULL,
  `offerId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`tollFreeNumber`),
  KEY `campId_idx` (`campaignId`),
  KEY `offId_idx` (`offerId`),
  KEY `srcId_idx` (`sourceId`),
  CONSTRAINT `campId` FOREIGN KEY (`campaignId`) REFERENCES `campaign` (`campaignId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `offId` FOREIGN KEY (`offerId`) REFERENCES `offer` (`offerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `srcId` FOREIGN KEY (`sourceId`) REFERENCES `source` (`sourceId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_tollfree`
--

LOCK TABLES `campaign_tollfree` WRITE;
/*!40000 ALTER TABLE `campaign_tollfree` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_tollfree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `addrId` int(11) NOT NULL AUTO_INCREMENT,
  `custId` int(11) NOT NULL,
  `ccId` int(11) DEFAULT NULL,
  `street` varchar(120) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `isShipping` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`addrId`),
  KEY `custId_idx` (`custId`),
  KEY `ccId_idx` (`ccId`),
  CONSTRAINT `ccId` FOREIGN KEY (`ccId`) REFERENCES `customer_credit` (`ccId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `custId` FOREIGN KEY (`custId`) REFERENCES `customer_info` (`custId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`callcenterguys`@`%`*/ /*!50003 TRIGGER `ccg_interactions_new`.`customer_address_BEFORE_INSERT` BEFORE INSERT ON `customer_address` FOR EACH ROW
BEGIN
	IF (NEW.type not in ('residential','billing', 'shipping'))
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid cust addressType insertion data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_credit`
--

DROP TABLE IF EXISTS `customer_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_credit` (
  `ccId` int(11) NOT NULL AUTO_INCREMENT,
  `custId` int(11) NOT NULL,
  `ccName` varchar(100) DEFAULT NULL,
  `ccNumber` varchar(45) DEFAULT NULL,
  `ccvCode` varchar(10) DEFAULT NULL,
  `ccExpiry` date DEFAULT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ccId`),
  KEY `customerId_idx` (`custId`),
  CONSTRAINT `customerId` FOREIGN KEY (`custId`) REFERENCES `customer_info` (`custId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_credit`
--

LOCK TABLES `customer_credit` WRITE;
/*!40000 ALTER TABLE `customer_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info` (
  `custId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telNumber` varchar(45) DEFAULT NULL,
  `cellNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info`
--

LOCK TABLES `customer_info` WRITE;
/*!40000 ALTER TABLE `customer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `offerId` int(11) NOT NULL AUTO_INCREMENT,
  `offerName` varchar(255) NOT NULL,
  `productCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`offerId`),
  KEY `productCode_idx` (`productCode`),
  CONSTRAINT `productCode` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `orderId` int(11) NOT NULL,
  `interactionId` int(11) NOT NULL,
  `custId` int(11) NOT NULL,
  `ccId` int(11) NOT NULL,
  `billAddrId` int(11) NOT NULL,
  `shipAddrId` int(11) DEFAULT NULL,
  `transactionTime` timestamp NULL DEFAULT NULL,
  `subTotal` decimal(10,2) DEFAULT NULL,
  `grandTotal` decimal(10,2) DEFAULT NULL,
  `freeShip` tinyint(4) DEFAULT NULL,
  `regularShip` tinyint(4) DEFAULT NULL,
  `rushShip` tinyint(4) DEFAULT NULL,
  `autoShip` tinyint(4) DEFAULT NULL,
  `processStatus` varchar(45) DEFAULT NULL,
  `processTime` timestamp NULL DEFAULT NULL,
  `refId` int(11) DEFAULT NULL,
  `system` varchar(45) DEFAULT NULL,
  `comment` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `interactionId_idx` (`interactionId`),
  KEY `ord_custId_idx` (`custId`),
  KEY `ord_ccId_idx` (`ccId`),
  KEY `ord_billAddrId_idx` (`billAddrId`),
  KEY `ord_shipAddrId_idx` (`shipAddrId`),
  CONSTRAINT `interactionId` FOREIGN KEY (`interactionId`) REFERENCES `aircall_data` (`interactionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ord_billAddrId` FOREIGN KEY (`billAddrId`) REFERENCES `customer_address` (`addrId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ord_ccId` FOREIGN KEY (`ccId`) REFERENCES `customer_credit` (`ccId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ord_custId` FOREIGN KEY (`custId`) REFERENCES `customer_info` (`custId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ord_shipAddrId` FOREIGN KEY (`shipAddrId`) REFERENCES `customer_address` (`addrId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_catalog`
--

DROP TABLE IF EXISTS `price_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_catalog` (
  `pcId` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(255) NOT NULL,
  `basePrice` decimal(15,2) NOT NULL,
  `adminFee` decimal(15,2) DEFAULT NULL,
  `campaignId` int(11) DEFAULT NULL,
  `offerId` int(11) DEFAULT NULL,
  `isBundle` tinyint(4) DEFAULT NULL,
  `bundleProducts` varchar(999) DEFAULT NULL,
  `bundlePrice` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`pcId`),
  KEY `productCode_idx` (`productCode`),
  KEY `prodCode_idx` (`productCode`),
  KEY `offerId_idx` (`offerId`),
  KEY `campaignId_idx` (`campaignId`),
  CONSTRAINT `campaignId` FOREIGN KEY (`campaignId`) REFERENCES `campaign` (`campaignId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `offerId` FOREIGN KEY (`offerId`) REFERENCES `offer` (`offerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prodCode` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_catalog`
--

LOCK TABLES `price_catalog` WRITE;
/*!40000 ALTER TABLE `price_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productCode` varchar(255) NOT NULL,
  `productName` varchar(999) DEFAULT NULL,
  `availability` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`productCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_price`
--

DROP TABLE IF EXISTS `sale_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_price` (
  `spId` int(11) NOT NULL AUTO_INCREMENT,
  `csId` int(11) NOT NULL,
  `saleAmount` decimal(10,2) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT NULL,
  `priceVariation` decimal(10,2) DEFAULT NULL,
  `billSchd` int(11) DEFAULT NULL,
  `taxId` int(11) DEFAULT NULL,
  PRIMARY KEY (`spId`),
  KEY `csId_idx` (`csId`),
  KEY `taxId_idx` (`taxId`),
  CONSTRAINT `csId` FOREIGN KEY (`csId`) REFERENCES `campaign_sale` (`csId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `taxId` FOREIGN KEY (`taxId`) REFERENCES `tax` (`taxId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_price`
--

LOCK TABLES `sale_price` WRITE;
/*!40000 ALTER TABLE `sale_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `sourceId` int(11) NOT NULL AUTO_INCREMENT,
  `sourceName` varchar(255) NOT NULL,
  `location` varchar(999) NOT NULL,
  PRIMARY KEY (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `taxId` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(2) NOT NULL,
  `percentage` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`taxId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ccg_interactions_new'
--

--
-- Dumping routines for database 'ccg_interactions_new'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-12  9:26:41
