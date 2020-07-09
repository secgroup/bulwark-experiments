CREATE DATABASE  IF NOT EXISTS `oscommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `oscommerce`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: oscommerce
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Table structure for table `action_recorder`
--

DROP TABLE IF EXISTS `action_recorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_recorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `success` char(1) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_action_recorder_module` (`module`),
  KEY `idx_action_recorder_user_id` (`user_id`),
  KEY `idx_action_recorder_identifier` (`identifier`),
  KEY `idx_action_recorder_date_added` (`date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_recorder`
--

LOCK TABLES `action_recorder` WRITE;
/*!40000 ALTER TABLE `action_recorder` DISABLE KEYS */;
INSERT INTO `action_recorder` VALUES (1,'ar_admin_login',1,'toto','127.0.0.1','1','2015-09-17 16:03:13'),(2,'ar_admin_login',0,'admin','127.0.0.1','0','2015-09-21 11:18:25'),(3,'ar_admin_login',1,'toto','127.0.0.1','1','2015-09-21 11:18:32'),(4,'ar_admin_login',0,'admin','127.0.0.1','0','2015-09-22 15:05:11'),(5,'ar_admin_login',0,'admin','127.0.0.1','0','2015-09-22 15:05:21'),(6,'ar_admin_login',0,'admin@yourstore.com','127.0.0.1','0','2015-09-22 15:05:32'),(7,'ar_admin_login',0,'admin','127.0.0.1','0','2015-09-22 15:05:39'),(8,'ar_admin_login',1,'toto','127.0.0.1','1','2015-09-22 15:13:05'),(9,'ar_admin_login',1,'toto','127.0.0.1','1','2015-09-30 12:01:15'),(10,'ar_admin_login',1,'toto','10.55.132.140','1','2015-09-30 12:13:20'),(11,'ar_admin_login',0,'tot','10.55.132.140','0','2015-10-15 11:53:02'),(12,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-15 11:53:07'),(13,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-15 14:42:59'),(14,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-20 15:28:28'),(15,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-20 16:05:53'),(16,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-20 17:11:57'),(17,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 09:49:30'),(18,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 10:17:35'),(19,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 11:01:32'),(20,'ar_admin_login',0,'toto','10.55.132.140','0','2015-10-21 11:53:37'),(21,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 11:53:40'),(22,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 12:17:24'),(23,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 14:20:04'),(24,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 14:57:03'),(25,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-21 16:31:51'),(26,'ar_admin_login',1,'toto','10.55.132.140','1','2015-10-22 10:16:32'),(27,'ar_admin_login',1,'toto','10.55.132.140','1','2015-11-03 14:54:57'),(28,'ar_admin_login',1,'toto','10.55.132.140','1','2015-11-04 14:37:39'),(29,'ar_admin_login',1,'toto','147.204.6.14','1','2015-11-09 14:56:41'),(30,'ar_admin_login',1,'toto','10.55.132.140','1','2015-11-09 15:01:12');
/*!40000 ALTER TABLE `action_recorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) DEFAULT NULL,
  `entry_company` varchar(255) DEFAULT NULL,
  `entry_firstname` varchar(255) NOT NULL,
  `entry_lastname` varchar(255) NOT NULL,
  `entry_street_address` varchar(255) NOT NULL,
  `entry_suburb` varchar(255) DEFAULT NULL,
  `entry_postcode` varchar(255) NOT NULL,
  `entry_city` varchar(255) NOT NULL,
  `entry_state` varchar(255) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (1,1,'f','','Alice','Test','Bd de Strasbourg','','75010','Paris','Paris',73,0),(2,2,'m','','Bob','Test','80 Boulevard de Strasbourg','','75010','Paris','Paris',73,0),(3,3,'f','','Alice','Victim','5 bd de Strasbourg','Paris','75010','Paris','Paris / Ill de France',73,0),(4,4,'m','','User1','One','1 Chemin de Besancon','','75001','Paris','Paris',73,0),(5,5,'m','','User2','Two','2 Boulevard de Strasbourg','Strasbourg','67000','Strasbourg','Alsace',73,0);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL,
  `address_summary` varchar(48) NOT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_format`
--

LOCK TABLES `address_format` WRITE;
/*!40000 ALTER TABLE `address_format` DISABLE KEYS */;
INSERT INTO `address_format` VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');
/*!40000 ALTER TABLE `address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'toto','$P$Dse1G6.AY02Ji3IFIoR1Amd41itVAh/');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL,
  `banners_url` varchar(255) NOT NULL,
  `banners_image` varchar(64) NOT NULL,
  `banners_group` varchar(10) NOT NULL,
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'osCommerce','http://www.oscommerce.com','banners/oscommerce.gif','468x50','',0,NULL,NULL,'2015-09-17 16:00:39',NULL,1);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_history`
--

LOCK TABLES `banners_history` WRITE;
/*!40000 ALTER TABLE `banners_history` DISABLE KEYS */;
INSERT INTO `banners_history` VALUES (1,1,25,0,'2015-09-17 16:04:11'),(2,1,7,0,'2015-09-21 11:17:18'),(3,1,3,0,'2015-09-22 14:51:04'),(4,1,1,0,'2015-09-25 15:14:38'),(5,1,1,0,'2015-09-29 15:11:53'),(6,1,14,0,'2015-09-30 11:25:43'),(7,1,1,0,'2015-10-02 16:49:10'),(8,1,3,0,'2015-10-12 17:26:03'),(9,1,1,0,'2015-10-13 17:37:09'),(10,1,15,0,'2015-10-14 09:14:41'),(11,1,540,0,'2015-10-15 10:58:13'),(12,1,8,0,'2015-10-16 15:29:42'),(13,1,97,0,'2015-10-20 15:28:16'),(14,1,185,0,'2015-10-21 09:55:34'),(15,1,35,0,'2015-10-22 09:32:29'),(16,1,2,0,'2015-10-23 08:56:07'),(17,1,1,0,'2015-10-26 10:04:11'),(18,1,1,0,'2015-11-02 11:09:15'),(19,1,65,0,'2015-11-03 14:47:12'),(20,1,2,0,'2015-11-04 14:11:57'),(21,1,1,0,'2015-11-05 09:14:15'),(22,1,88,0,'2015-11-09 14:36:36');
/*!40000 ALTER TABLE `banners_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'category_hardware.gif',0,1,'2015-09-17 16:00:39',NULL),(2,'category_software.gif',0,2,'2015-09-17 16:00:39',NULL),(3,'category_dvd_movies.gif',0,3,'2015-09-17 16:00:39',NULL),(4,'subcategory_graphic_cards.gif',1,0,'2015-09-17 16:00:39',NULL),(5,'subcategory_printers.gif',1,0,'2015-09-17 16:00:39',NULL),(6,'subcategory_monitors.gif',1,0,'2015-09-17 16:00:39',NULL),(7,'subcategory_speakers.gif',1,0,'2015-09-17 16:00:39',NULL),(8,'subcategory_keyboards.gif',1,0,'2015-09-17 16:00:39',NULL),(9,'subcategory_mice.gif',1,0,'2015-09-17 16:00:39',NULL),(10,'subcategory_action.gif',3,0,'2015-09-17 16:00:39',NULL),(11,'subcategory_science_fiction.gif',3,0,'2015-09-17 16:00:39',NULL),(12,'subcategory_comedy.gif',3,0,'2015-09-17 16:00:39',NULL),(13,'subcategory_cartoons.gif',3,0,'2015-09-17 16:00:39',NULL),(14,'subcategory_thriller.gif',3,0,'2015-09-17 16:00:39',NULL),(15,'subcategory_drama.gif',3,0,'2015-09-17 16:00:39',NULL),(16,'subcategory_memory.gif',1,0,'2015-09-17 16:00:39',NULL),(17,'subcategory_cdrom_drives.gif',1,0,'2015-09-17 16:00:39',NULL),(18,'subcategory_simulation.gif',2,0,'2015-09-17 16:00:39',NULL),(19,'subcategory_action_games.gif',2,0,'2015-09-17 16:00:39',NULL),(20,'subcategory_strategy.gif',2,0,'2015-09-17 16:00:39',NULL),(21,'category_gadgets.png',0,4,'2015-09-17 16:00:39',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_description`
--

LOCK TABLES `categories_description` WRITE;
/*!40000 ALTER TABLE `categories_description` DISABLE KEYS */;
INSERT INTO `categories_description` VALUES (10,1,'Action'),(19,1,'Action'),(13,1,'Cartoons'),(17,1,'CDROM Drives'),(12,1,'Comedy'),(15,1,'Drama'),(3,1,'DVD Movies'),(21,1,'Gadgets'),(4,1,'Graphics Cards'),(1,1,'Hardware'),(8,1,'Keyboards'),(16,1,'Memory'),(9,1,'Mice'),(6,1,'Monitors'),(5,1,'Printers'),(11,1,'Science Fiction'),(18,1,'Simulation'),(2,1,'Software'),(7,1,'Speakers'),(20,1,'Strategy'),(14,1,'Thriller');
/*!40000 ALTER TABLE `categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` varchar(255) NOT NULL,
  `configuration_key` varchar(255) NOT NULL,
  `configuration_value` text NOT NULL,
  `configuration_description` varchar(255) NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) DEFAULT NULL,
  `set_function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Store Name','STORE_NAME','Test store','The name of my store',1,1,NULL,'2015-09-17 16:00:39',NULL,NULL),(2,'Store Owner','STORE_OWNER','Bob','The name of my store owner',1,2,NULL,'2015-09-17 16:00:40',NULL,NULL),(3,'E-Mail Address','STORE_OWNER_EMAIL_ADDRESS','bob@test.tst','The e-mail address of my store owner',1,3,NULL,'2015-09-17 16:00:40',NULL,NULL),(4,'E-Mail From','EMAIL_FROM','\"Bob\" <bob@test.tst>','The e-mail address used in (sent) e-mails',1,4,NULL,'2015-09-17 16:00:40',NULL,NULL),(5,'Country','STORE_COUNTRY','223','The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>',1,6,NULL,'2015-09-17 16:00:40','tep_get_country_name','tep_cfg_pull_down_country_list('),(6,'Zone','STORE_ZONE','18','The zone my store is located in',1,7,NULL,'2015-09-17 16:00:40','tep_cfg_get_zone_name','tep_cfg_pull_down_zone_list('),(7,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'asc\', \'desc\'), '),(8,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), '),(9,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(10,'Send Extra Order Emails To','SEND_EXTRA_ORDER_EMAILS_TO','','Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',1,11,NULL,'2015-09-17 16:00:40',NULL,NULL),(11,'Use Search-Engine Safe URLs','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',1,12,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(12,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(13,'Allow Guest To Tell A Friend','ALLOW_GUEST_TO_TELL_A_FRIEND','false','Allow guests to tell a friend about a product',1,15,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(14,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'and\', \'or\'), '),(15,'Store Address and Phone','STORE_NAME_ADDRESS','Store Name\nAddress\nCountry\nPhone','This is the Store Name, Address and Phone used on printable documents and displayed online',1,18,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_textarea('),(16,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(17,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2015-09-17 16:00:40',NULL,NULL),(18,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','Display prices with tax included (true) or add the tax at the end (false)',1,21,NULL,'2015-09-17 16:00:40',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(19,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2015-09-17 16:00:40',NULL,NULL),(20,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2015-09-17 16:00:40',NULL,NULL),(21,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2015-09-17 16:00:40',NULL,NULL),(22,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2015-09-17 16:00:40',NULL,NULL),(23,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2015-09-17 16:00:40',NULL,NULL),(24,'Company','ENTRY_COMPANY_MIN_LENGTH','2','Minimum length of company name',2,6,NULL,'2015-09-17 16:00:40',NULL,NULL),(25,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2015-09-17 16:00:40',NULL,NULL),(26,'City','ENTRY_CITY_MIN_LENGTH','3','Minimum length of city',2,8,NULL,'2015-09-17 16:00:40',NULL,NULL),(27,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2015-09-17 16:00:40',NULL,NULL),(28,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone number',2,10,NULL,'2015-09-17 16:00:40',NULL,NULL),(29,'Password','ENTRY_PASSWORD_MIN_LENGTH','5','Minimum length of password',2,11,NULL,'2015-09-17 16:00:40',NULL,NULL),(30,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2015-09-17 16:00:40',NULL,NULL),(31,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2015-09-17 16:00:40',NULL,NULL),(32,'Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of review text',2,14,NULL,'2015-09-17 16:00:40',NULL,NULL),(33,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2015-09-17 16:00:40',NULL,NULL),(34,'Also Purchased','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2015-09-17 16:00:40',NULL,NULL),(35,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2015-09-17 16:00:40',NULL,NULL),(36,'Search Results','MAX_DISPLAY_SEARCH_RESULTS','20','Amount of products to list',3,2,NULL,'2015-09-17 16:00:40',NULL,NULL),(37,'Page Links','MAX_DISPLAY_PAGE_LINKS','5','Number of \'number\' links use for page-sets',3,3,NULL,'2015-09-17 16:00:40',NULL,NULL),(38,'Special Products','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Maximum number of products on special to display',3,4,NULL,'2015-09-17 16:00:41',NULL,NULL),(39,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Maximum number of new products to display in a category',3,5,NULL,'2015-09-17 16:00:41',NULL,NULL),(40,'Products Expected','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Maximum number of products expected to display',3,6,NULL,'2015-09-17 16:00:41',NULL,NULL),(41,'Manufacturers List','MAX_DISPLAY_MANUFACTURERS_IN_A_LIST','0','Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list',3,7,NULL,'2015-09-17 16:00:41',NULL,NULL),(42,'Manufacturers Select Size','MAX_MANUFACTURERS_LIST','1','Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.',3,7,NULL,'2015-09-17 16:00:41',NULL,NULL),(43,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display',3,8,NULL,'2015-09-17 16:00:41',NULL,NULL),(44,'New Reviews','MAX_DISPLAY_NEW_REVIEWS','6','Maximum number of new reviews to display',3,9,NULL,'2015-09-17 16:00:41',NULL,NULL),(45,'Selection of Random Reviews','MAX_RANDOM_SELECT_REVIEWS','10','How many records to select from to choose one random product review',3,10,NULL,'2015-09-17 16:00:41',NULL,NULL),(46,'Selection of Random New Products','MAX_RANDOM_SELECT_NEW','10','How many records to select from to choose one random new product to display',3,11,NULL,'2015-09-17 16:00:41',NULL,NULL),(47,'Selection of Products on Special','MAX_RANDOM_SELECT_SPECIALS','10','How many records to select from to choose one random product special to display',3,12,NULL,'2015-09-17 16:00:41',NULL,NULL),(48,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2015-09-17 16:00:41',NULL,NULL),(49,'New Products Listing','MAX_DISPLAY_PRODUCTS_NEW','10','Maximum number of new products to display in new products page',3,14,NULL,'2015-09-17 16:00:41',NULL,NULL),(50,'Best Sellers','MAX_DISPLAY_BESTSELLERS','10','Maximum number of best sellers to display',3,15,NULL,'2015-09-17 16:00:41',NULL,NULL),(51,'Also Purchased','MAX_DISPLAY_ALSO_PURCHASED','6','Maximum number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2015-09-17 16:00:41',NULL,NULL),(52,'Customer Order History Box','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Maximum number of products to display in the customer order history box',3,17,NULL,'2015-09-17 16:00:41',NULL,NULL),(53,'Order History','MAX_DISPLAY_ORDER_HISTORY','10','Maximum number of orders to display in the order history page',3,18,NULL,'2015-09-17 16:00:41',NULL,NULL),(54,'Product Quantities In Shopping Cart','MAX_QTY_IN_CART','99','Maximum number of product quantities that can be added to the shopping cart (0 for no limit)',3,19,NULL,'2015-09-17 16:00:41',NULL,NULL),(55,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2015-09-17 16:00:41',NULL,NULL),(56,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2015-09-17 16:00:41',NULL,NULL),(57,'Heading Image Width','HEADING_IMAGE_WIDTH','57','The pixel width of heading images',4,3,NULL,'2015-09-17 16:00:41',NULL,NULL),(58,'Heading Image Height','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images',4,4,NULL,'2015-09-17 16:00:41',NULL,NULL),(59,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2015-09-17 16:00:41',NULL,NULL),(60,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2015-09-17 16:00:41',NULL,NULL),(61,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2015-09-17 16:00:41',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(62,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2015-09-17 16:00:41',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(63,'Gender','ACCOUNT_GENDER','true','Display gender in the customers account',5,1,NULL,'2015-09-17 16:00:41',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(64,'Date of Birth','ACCOUNT_DOB','true','Display date of birth in the customers account',5,2,NULL,'2015-09-17 16:00:41',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(65,'Company','ACCOUNT_COMPANY','true','Display company in the customers account',5,3,NULL,'2015-09-17 16:00:41',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(66,'Suburb','ACCOUNT_SUBURB','true','Display suburb in the customers account',5,4,NULL,'2015-09-17 16:00:41',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(67,'State','ACCOUNT_STATE','true','Display state in the customers account',5,5,NULL,'2015-09-17 16:00:41',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(68,'Installed Modules','MODULE_PAYMENT_INSTALLED','cod.php;paypal_express.php;paypal_standard.php;pm2checkout.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cod.php;paypal_express.php)',6,0,NULL,'2015-09-17 16:00:41',NULL,NULL),(69,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,NULL,'2015-09-17 16:00:41',NULL,NULL),(70,'Installed Modules','MODULE_SHIPPING_INSTALLED','flat.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,NULL,'2015-09-17 16:00:41',NULL,NULL),(71,'Installed Modules','MODULE_ACTION_RECORDER_INSTALLED','ar_admin_login.php;ar_contact_us.php;ar_tell_a_friend.php','List of action recorder module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2015-09-17 16:00:41',NULL,NULL),(72,'Installed Modules','MODULE_SOCIAL_BOOKMARKS_INSTALLED','sb_email.php;sb_facebook.php;sb_twitter.php;sb_google_buzz.php;sb_digg.php','List of social bookmark module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2015-09-17 16:00:41',NULL,NULL),(73,'Enable Cash On Delivery Module','MODULE_PAYMENT_COD_STATUS','True','Do you want to accept Cash On Delevery payments?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(74,'Payment Zone','MODULE_PAYMENT_COD_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2015-09-17 16:00:42','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(75,'Sort order of display.','MODULE_PAYMENT_COD_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(76,'Set Order Status','MODULE_PAYMENT_COD_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2015-09-17 16:00:42','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(77,'Enable Flat Shipping','MODULE_SHIPPING_FLAT_STATUS','True','Do you want to offer flat rate shipping?',6,0,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(78,'Shipping Cost','MODULE_SHIPPING_FLAT_COST','5.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(79,'Tax Class','MODULE_SHIPPING_FLAT_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2015-09-17 16:00:42','tep_get_tax_class_title','tep_cfg_pull_down_tax_classes('),(80,'Shipping Zone','MODULE_SHIPPING_FLAT_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2015-09-17 16:00:42','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(81,'Sort Order','MODULE_SHIPPING_FLAT_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(82,'Default Currency','DEFAULT_CURRENCY','USD','Default Currency',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(83,'Default Language','DEFAULT_LANGUAGE','en','Default Language',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(84,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(85,'Display Shipping','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','Do you want to display the order shipping cost?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(86,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','2','Sort order of display.',6,2,NULL,'2015-09-17 16:00:42',NULL,NULL),(87,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','Do you want to allow free shipping?',6,3,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(88,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','Provide free shipping for orders over the set amount.',6,4,NULL,'2015-09-17 16:00:42','currencies->format',NULL),(89,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'national\', \'international\', \'both\'), '),(90,'Display Sub-Total','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','Do you want to display the order sub-total cost?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(91,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','1','Sort order of display.',6,2,NULL,'2015-09-17 16:00:42',NULL,NULL),(92,'Display Tax','MODULE_ORDER_TOTAL_TAX_STATUS','true','Do you want to display the order tax value?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(93,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','3','Sort order of display.',6,2,NULL,'2015-09-17 16:00:42',NULL,NULL),(94,'Display Total','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','Do you want to display the total order value?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(95,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','4','Sort order of display.',6,2,NULL,'2015-09-17 16:00:42',NULL,NULL),(96,'Minimum Minutes Per E-Mail','MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES','15','Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(97,'Minimum Minutes Per E-Mail','MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES','15','Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(98,'Allowed Minutes','MODULE_ACTION_RECORDER_ADMIN_LOGIN_MINUTES','5','Number of minutes to allow login attempts to occur.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(99,'Allowed Attempts','MODULE_ACTION_RECORDER_ADMIN_LOGIN_ATTEMPTS','3','Number of login attempts to allow within the specified period.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(100,'Enable E-Mail Module','MODULE_SOCIAL_BOOKMARKS_EMAIL_STATUS','True','Do you want to allow products to be shared through e-mail?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(101,'Sort Order','MODULE_SOCIAL_BOOKMARKS_EMAIL_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(102,'Enable Facebook Module','MODULE_SOCIAL_BOOKMARKS_FACEBOOK_STATUS','True','Do you want to allow products to be shared through Facebook?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(103,'Sort Order','MODULE_SOCIAL_BOOKMARKS_FACEBOOK_SORT_ORDER','20','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(104,'Enable Twitter Module','MODULE_SOCIAL_BOOKMARKS_TWITTER_STATUS','True','Do you want to allow products to be shared through Twitter?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(105,'Sort Order','MODULE_SOCIAL_BOOKMARKS_TWITTER_SORT_ORDER','30','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(106,'Enable Google Buzz Module','MODULE_SOCIAL_BOOKMARKS_GOOGLE_BUZZ_STATUS','True','Do you want to allow products to be shared through Google Buzz?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(107,'Sort Order','MODULE_SOCIAL_BOOKMARKS_GOOGLE_BUZZ_SORT_ORDER','40','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(108,'Enable Digg Module','MODULE_SOCIAL_BOOKMARKS_DIGG_STATUS','True','Do you want to allow products to be shared through Digg?',6,1,NULL,'2015-09-17 16:00:42',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(109,'Sort Order','MODULE_SOCIAL_BOOKMARKS_DIGG_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:00:42',NULL,NULL),(110,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','223','Select the country of origin to be used in shipping quotes.',7,1,NULL,'2015-09-17 16:00:43','tep_get_country_name','tep_cfg_pull_down_country_list('),(111,'Postal Code','SHIPPING_ORIGIN_ZIP','NONE','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.',7,2,NULL,'2015-09-17 16:00:43',NULL,NULL),(112,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2015-09-17 16:00:43',NULL,NULL),(113,'Package Tare weight.','SHIPPING_BOX_WEIGHT','3','What is the weight of typical packaging of small to medium packages?',7,4,NULL,'2015-09-17 16:00:43',NULL,NULL),(114,'Larger packages - percentage increase.','SHIPPING_BOX_PADDING','10','For 10% enter 10',7,5,NULL,'2015-09-17 16:00:43',NULL,NULL),(115,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2015-09-17 16:00:43',NULL,NULL),(116,'Display Product Manufaturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2015-09-17 16:00:43',NULL,NULL),(117,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2015-09-17 16:00:43',NULL,NULL),(118,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2015-09-17 16:00:43',NULL,NULL),(119,'Display Product Price','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price',8,5,NULL,'2015-09-17 16:00:43',NULL,NULL),(120,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2015-09-17 16:00:43',NULL,NULL),(121,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2015-09-17 16:00:43',NULL,NULL),(122,'Display Buy Now column','PRODUCT_LIST_BUY_NOW','4','Do you want to display the Buy Now column?',8,8,NULL,'2015-09-17 16:00:43',NULL,NULL),(123,'Display Category/Manufacturer Filter (0=disable; 1=enable)','PRODUCT_LIST_FILTER','1','Do you want to display the Category/Manufacturer Filter?',8,9,NULL,'2015-09-17 16:00:43',NULL,NULL),(124,'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','2','Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)',8,10,NULL,'2015-09-17 16:00:43',NULL,NULL),(125,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(126,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(127,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(128,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2015-09-17 16:00:43',NULL,NULL),(129,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2015-09-17 16:00:43',NULL,NULL),(130,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','Store the time it takes to parse a page',10,1,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(131,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/log/www/tep/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2015-09-17 16:00:43',NULL,NULL),(132,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2015-09-17 16:00:43',NULL,NULL),(133,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','true','Display the page parse time (store page parse time must be enabled)',10,4,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(134,'Store Database Queries','STORE_DB_TRANSACTIONS','false','Store the database queries in the page parse time log',10,5,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(135,'Use Cache','USE_CACHE','false','Use caching features',11,1,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(136,'Cache Directory','DIR_FS_CACHE','C:/xampp/htdocs/oscommerce/includes/work/','The directory where the cached files are saved',11,2,NULL,'2015-09-17 16:00:43',NULL,NULL),(137,'E-Mail Transport Method','EMAIL_TRANSPORT','sendmail','Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.',12,1,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),'),(138,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'LF\', \'CRLF\'),'),(139,'Use MIME HTML When Sending Emails','EMAIL_USE_HTML','false','Send e-mails in HTML format',12,3,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(140,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',12,4,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(141,'Send E-Mails','SEND_EMAILS','true','Send out e-mails',12,5,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(142,'Enable download','DOWNLOAD_ENABLED','false','Enable the products download functions.',13,1,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(143,'Download by redirect','DOWNLOAD_BY_REDIRECT','false','Use browser redirection for download. Disable on non-Unix systems.',13,2,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(144,'Expiry delay (days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2015-09-17 16:00:43',NULL,''),(145,'Maximum number of downloads','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2015-09-17 16:00:43',NULL,''),(146,'Enable GZip Compression','GZIP_COMPRESSION','false','Enable HTTP GZip compression.',14,1,NULL,'2015-09-17 16:00:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(147,'Compression Level','GZIP_LEVEL','5','Use this compression level 0-9 (0 = minimum, 9 = maximum).',14,2,NULL,'2015-09-17 16:00:43',NULL,NULL),(148,'Session Directory','SESSION_WRITE_DIRECTORY','C:/xampp/htdocs/oscommerce/includes/work/','If sessions are file based, store them in this directory.',15,1,NULL,'2015-09-17 16:00:43',NULL,NULL),(149,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2015-09-17 16:00:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(150,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2015-09-17 16:00:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(151,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2015-09-17 16:00:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(152,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2015-09-17 16:00:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(153,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2015-09-17 16:00:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(154,'Recreate Session','SESSION_RECREATE','True','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2015-09-17 16:00:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(155,'Last Update Check Time','LAST_UPDATE_CHECK_TIME','','Last time a check for new versions of osCommerce was run',6,0,NULL,'2015-09-17 16:00:44',NULL,NULL),(156,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','False','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2015-09-17 16:01:00',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(157,'Seller Account','MODULE_PAYMENT_PAYPAL_EXPRESS_SELLER_ACCOUNT','bob@test.tst','The email address of the seller account if no API credentials has been setup.',6,0,NULL,'2015-09-17 16:01:00',NULL,NULL),(158,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','','The username to use for the PayPal API service',6,0,NULL,'2015-09-17 16:01:00',NULL,NULL),(159,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','','The password to use for the PayPal API service',6,0,NULL,'2015-09-17 16:01:00',NULL,NULL),(160,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','','The signature to use for the PayPal API service',6,0,NULL,'2015-09-17 16:01:00',NULL,NULL),(161,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Sandbox','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2015-09-17 16:01:00',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(162,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2015-09-17 16:01:00',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(163,'PayPal Account Optional','MODULE_PAYMENT_PAYPAL_EXPRESS_ACCOUNT_OPTIONAL','False','This must also be enabled in your PayPal account, in Profile > Website Payment Preferences.',6,0,NULL,'2015-09-17 16:01:00',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(164,'PayPal Instant Update','MODULE_PAYMENT_PAYPAL_EXPRESS_INSTANT_UPDATE','True','Support PayPal shipping and tax calculations on the PayPal.com site during Express Checkout.',6,0,NULL,'2015-09-17 16:01:00',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(165,'PayPal Checkout Image','MODULE_PAYMENT_PAYPAL_EXPRESS_CHECKOUT_IMAGE','Static','Use static or dynamic Express Checkout image buttons. Dynamic images are used with PayPal campaigns.',6,0,NULL,'2015-09-17 16:01:00',NULL,'tep_cfg_select_option(array(\'Static\', \'Dynamic\'), '),(166,'Debug E-Mail Address','MODULE_PAYMENT_PAYPAL_EXPRESS_DEBUG_EMAIL','','All parameters of an invalid transaction will be sent to this email address.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(167,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2015-09-17 16:01:01','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(168,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(169,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2015-09-17 16:01:01','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(170,'PayPal Transactions Order Status Level','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTIONS_ORDER_STATUS_ID','4','Include PayPal transaction information in this order status level',6,0,NULL,'2015-09-17 16:01:01','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(171,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(172,'Installed Modules','MODULE_HEADER_TAGS_INSTALLED','ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php','List of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(173,'Enable Category Title Module','MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS','True','Do you want to allow category titles to be added to the page title?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(174,'Sort Order','MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(175,'Enable Manufacturer Title Module','MODULE_HEADER_TAGS_MANUFACTURER_TITLE_STATUS','True','Do you want to allow manufacturer titles to be added to the page title?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(176,'Sort Order','MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(177,'Enable Product Title Module','MODULE_HEADER_TAGS_PRODUCT_TITLE_STATUS','True','Do you want to allow product titles to be added to the page title?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(178,'Sort Order','MODULE_HEADER_TAGS_PRODUCT_TITLE_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(179,'Installed Modules','MODULE_ADMIN_DASHBOARD_INSTALLED','d_total_revenue.php;d_total_customers.php;d_orders.php;d_customers.php;d_admin_logins.php;d_security_checks.php;d_latest_news.php;d_latest_addons.php;d_version_check.php;d_reviews.php','List of Administration Tool Dashboard module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(180,'Enable Administrator Logins Module','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_STATUS','True','Do you want to show the latest administrator logins on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(181,'Sort Order','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_SORT_ORDER','500','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(182,'Enable Customers Module','MODULE_ADMIN_DASHBOARD_CUSTOMERS_STATUS','True','Do you want to show the newest customers on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(183,'Sort Order','MODULE_ADMIN_DASHBOARD_CUSTOMERS_SORT_ORDER','400','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(184,'Enable Latest Add-Ons Module','MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_STATUS','True','Do you want to show the latest osCommerce Add-Ons on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(185,'Sort Order','MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_SORT_ORDER','800','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(186,'Enable Latest News Module','MODULE_ADMIN_DASHBOARD_LATEST_NEWS_STATUS','True','Do you want to show the latest osCommerce News on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(187,'Sort Order','MODULE_ADMIN_DASHBOARD_LATEST_NEWS_SORT_ORDER','700','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(188,'Enable Orders Module','MODULE_ADMIN_DASHBOARD_ORDERS_STATUS','True','Do you want to show the latest orders on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(189,'Sort Order','MODULE_ADMIN_DASHBOARD_ORDERS_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(190,'Enable Security Checks Module','MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_STATUS','True','Do you want to run the security checks for this installation?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(191,'Sort Order','MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_SORT_ORDER','600','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(192,'Enable Total Customers Module','MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_STATUS','True','Do you want to show the total customers chart on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(193,'Sort Order','MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(194,'Enable Total Revenue Module','MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_STATUS','True','Do you want to show the total revenue chart on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(195,'Sort Order','MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(196,'Enable Version Check Module','MODULE_ADMIN_DASHBOARD_VERSION_CHECK_STATUS','True','Do you want to show the version check results on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(197,'Sort Order','MODULE_ADMIN_DASHBOARD_VERSION_CHECK_SORT_ORDER','900','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(198,'Enable Latest Reviews Module','MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS','True','Do you want to show the latest reviews on the dashboard?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(199,'Sort Order','MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(200,'Installed Modules','MODULE_BOXES_INSTALLED','bm_categories.php;bm_manufacturers.php;bm_search.php;bm_whats_new.php;bm_information.php;bm_shopping_cart.php;bm_manufacturer_info.php;bm_order_history.php;bm_best_sellers.php;bm_product_notifications.php;bm_product_social_bookmarks.php;bm_specials.php;bm_reviews.php;bm_languages.php;bm_currencies.php','List of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(201,'Enable Best Sellers Module','MODULE_BOXES_BEST_SELLERS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(202,'Content Placement','MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(203,'Sort Order','MODULE_BOXES_BEST_SELLERS_SORT_ORDER','5030','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:01',NULL,NULL),(204,'Enable Categories Module','MODULE_BOXES_CATEGORIES_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(205,'Content Placement','MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(206,'Sort Order','MODULE_BOXES_CATEGORIES_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(207,'Enable Currencies Module','MODULE_BOXES_CURRENCIES_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(208,'Content Placement','MODULE_BOXES_CURRENCIES_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(209,'Sort Order','MODULE_BOXES_CURRENCIES_SORT_ORDER','5090','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(210,'Enable Information Module','MODULE_BOXES_INFORMATION_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(211,'Content Placement','MODULE_BOXES_INFORMATION_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(212,'Sort Order','MODULE_BOXES_INFORMATION_SORT_ORDER','1050','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(213,'Enable Languages Module','MODULE_BOXES_LANGUAGES_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(214,'Content Placement','MODULE_BOXES_LANGUAGES_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(215,'Sort Order','MODULE_BOXES_LANGUAGES_SORT_ORDER','5080','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(216,'Enable Manufacturer Info Module','MODULE_BOXES_MANUFACTURER_INFO_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(217,'Content Placement','MODULE_BOXES_MANUFACTURER_INFO_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(218,'Sort Order','MODULE_BOXES_MANUFACTURER_INFO_SORT_ORDER','5010','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(219,'Enable Manufacturers Module','MODULE_BOXES_MANUFACTURERS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(220,'Content Placement','MODULE_BOXES_MANUFACTURERS_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(221,'Sort Order','MODULE_BOXES_MANUFACTURERS_SORT_ORDER','1020','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(222,'Enable Order History Module','MODULE_BOXES_ORDER_HISTORY_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(223,'Content Placement','MODULE_BOXES_ORDER_HISTORY_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(224,'Sort Order','MODULE_BOXES_ORDER_HISTORY_SORT_ORDER','5020','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(225,'Enable Product Notifications Module','MODULE_BOXES_PRODUCT_NOTIFICATIONS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(226,'Content Placement','MODULE_BOXES_PRODUCT_NOTIFICATIONS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(227,'Sort Order','MODULE_BOXES_PRODUCT_NOTIFICATIONS_SORT_ORDER','5040','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(228,'Enable Product Social Bookmarks Module','MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(229,'Content Placement','MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(230,'Sort Order','MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_SORT_ORDER','5050','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(231,'Enable Reviews Module','MODULE_BOXES_REVIEWS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(232,'Content Placement','MODULE_BOXES_REVIEWS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(233,'Sort Order','MODULE_BOXES_REVIEWS_SORT_ORDER','5070','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(234,'Enable Search Module','MODULE_BOXES_SEARCH_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(235,'Content Placement','MODULE_BOXES_SEARCH_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(236,'Sort Order','MODULE_BOXES_SEARCH_SORT_ORDER','1030','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(237,'Enable Shopping Cart Module','MODULE_BOXES_SHOPPING_CART_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(238,'Content Placement','MODULE_BOXES_SHOPPING_CART_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(239,'Sort Order','MODULE_BOXES_SHOPPING_CART_SORT_ORDER','5000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:02',NULL,NULL),(240,'Enable Specials Module','MODULE_BOXES_SPECIALS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(241,'Content Placement','MODULE_BOXES_SPECIALS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:02',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(242,'Sort Order','MODULE_BOXES_SPECIALS_SORT_ORDER','5060','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:03',NULL,NULL),(243,'Enable What\'s New Module','MODULE_BOXES_WHATS_NEW_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2015-09-17 16:01:03',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(244,'Content Placement','MODULE_BOXES_WHATS_NEW_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2015-09-17 16:01:03',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(245,'Sort Order','MODULE_BOXES_WHATS_NEW_SORT_ORDER','1040','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:01:03',NULL,NULL),(246,'Installed Template Block Groups','TEMPLATE_BLOCK_GROUPS','boxes;header_tags','This is automatically updated. No need to edit.',6,0,NULL,'2015-09-17 16:01:03',NULL,NULL),(247,'Enable PayPal Website Payments Standard','MODULE_PAYMENT_PAYPAL_STANDARD_STATUS','True','Do you want to accept PayPal Website Payments Standard payments?',6,3,NULL,'2015-09-17 16:03:51',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(248,'E-Mail Address','MODULE_PAYMENT_PAYPAL_STANDARD_ID','alberto.lupo@business.example.com','The PayPal seller e-mail address to accept payments for',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(249,'Sort order of display.','MODULE_PAYMENT_PAYPAL_STANDARD_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2015-09-17 16:03:51',NULL,NULL),(250,'Payment Zone','MODULE_PAYMENT_PAYPAL_STANDARD_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2015-09-17 16:03:51','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(251,'Set Preparing Order Status','MODULE_PAYMENT_PAYPAL_STANDARD_PREPARE_ORDER_STATUS_ID','5','Set the status of prepared orders made with this payment module to this value',6,0,NULL,'2015-09-17 16:03:51','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(252,'Set PayPal Acknowledged Order Status','MODULE_PAYMENT_PAYPAL_STANDARD_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2015-09-17 16:03:51','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(253,'Gateway Server','MODULE_PAYMENT_PAYPAL_STANDARD_GATEWAY_SERVER','Sandbox','Use the testing (sandbox) or live gateway server for transactions?',6,6,NULL,'2015-09-17 16:03:51',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(254,'Transaction Method','MODULE_PAYMENT_PAYPAL_STANDARD_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2015-09-17 16:03:51',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(255,'Page Style','MODULE_PAYMENT_PAYPAL_STANDARD_PAGE_STYLE','','The page style to use for the transaction procedure (defined at your PayPal Profile page)',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(256,'Debug E-Mail Address','MODULE_PAYMENT_PAYPAL_STANDARD_DEBUG_EMAIL','','All parameters of an Invalid IPN notification will be sent to this email address if one is entered.',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(257,'Enable Encrypted Web Payments','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_STATUS','False','Do you want to enable Encrypted Web Payments?',6,3,NULL,'2015-09-17 16:03:51',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(258,'Your Private Key','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PRIVATE_KEY','','The location of your Private Key to use for signing the data. (*.pem)',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(259,'Your Public Certificate','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PUBLIC_KEY','','The location of your Public Certificate to use for signing the data. (*.pem)',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(260,'PayPals Public Certificate','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PAYPAL_KEY','','The location of the PayPal Public Certificate for encrypting the data.',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(261,'Your PayPal Public Certificate ID','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_CERT_ID','','The Certificate ID to use from your PayPal Encrypted Payment Settings Profile.',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(262,'Working Directory','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_WORKING_DIRECTORY','','The working directory to use for temporary files. (trailing slash needed)',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(263,'OpenSSL Location','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_OPENSSL','','The location of the openssl binary file.',6,4,NULL,'2015-09-17 16:03:51',NULL,NULL),(273,'Enable 2CheckOut Module','MODULE_PAYMENT_2CHECKOUT_STATUS','True','Do you want to accept 2CheckOut payments?',6,1,NULL,'2015-10-21 10:19:34',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(274,'Login/Store Number','MODULE_PAYMENT_2CHECKOUT_LOGIN','901291050','Login/Store Number used for the 2CheckOut service',6,2,NULL,'2015-10-21 10:19:34',NULL,NULL),(275,'Transaction Mode','MODULE_PAYMENT_2CHECKOUT_TESTMODE','Test','Transaction mode used for the 2Checkout service',6,3,NULL,'2015-10-21 10:19:34',NULL,'tep_cfg_select_option(array(\'Test\', \'Production\'), '),(276,'Transaction Mode','MODULE_PAYMENT_2CHECKOUT_DIRECT','Standard','Use Inline or Standard Checkout',6,4,NULL,'2015-10-21 10:19:34',NULL,'tep_cfg_select_option(array(\'Inline\', \'Standard\'), '),(277,'Merchant Notifications','MODULE_PAYMENT_2CHECKOUT_EMAIL_MERCHANT','False','Should 2CheckOut e-mail a receipt to the store owner?',6,5,NULL,'2015-10-21 10:19:34',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(278,'Sort order of display.','MODULE_PAYMENT_2CHECKOUT_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,6,NULL,'2015-10-21 10:19:34',NULL,NULL),(279,'Payment Zone','MODULE_PAYMENT_2CHECKOUT_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,7,NULL,'2015-10-21 10:19:34','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(280,'Set Order Status','MODULE_PAYMENT_2CHECKOUT_ORDER_STATUS_ID','6','Set the status of orders made with this payment module to this value',6,8,NULL,'2015-10-21 10:19:34','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(281,'Check MD5 hash','MODULE_PAYMENT_2CHECKOUT_CHECK_HASH','True','Should the 2CheckOut MD5 hash facilty to be checked?',6,9,NULL,'2015-10-21 10:19:34',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(282,'Secret Word','MODULE_PAYMENT_2CHECKOUT_SECRET_WORD','Yzg3MjU0MDItNzUyOS00Z','Secret word for the 2CheckOut MD5 hash facility',6,10,NULL,'2015-10-21 10:19:34',NULL,NULL);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL,
  `configuration_group_description` varchar(255) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_group`
--

LOCK TABLES `configuration_group` WRITE;
/*!40000 ALTER TABLE `configuration_group` DISABLE KEYS */;
INSERT INTO `configuration_group` VALUES (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing    configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Cache','Caching configuration options',11,1),(12,'E-Mail Options','General setting for E-Mail transport and HTML E-Mails',12,1),(13,'Download','Downloadable products options',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1);
/*!40000 ALTER TABLE `configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES ('20150917',1096);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter_history` (
  `month` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter_history`
--

LOCK TABLES `counter_history` WRITE;
/*!40000 ALTER TABLE `counter_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(255) NOT NULL,
  `countries_iso_code_2` char(2) NOT NULL,
  `countries_iso_code_3` char(3) NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',1),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'East Timor','TP','TMP',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(74,'France, Metropolitan','FX','FXX',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libyan Arab Jamahiriya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macau','MO','MAC',1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova, Republic of','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROM',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Swaziland','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',1),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Yugoslavia','YU','YUG',1),(237,'Zaire','ZR','ZAR',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` char(3) NOT NULL,
  `symbol_left` varchar(12) DEFAULT NULL,
  `symbol_right` varchar(12) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'U.S. Dollar','USD','$','','.',',','2',1.00000000,'2015-09-17 16:00:51'),(2,'Euro','EUR','','â‚¬','.',',','2',1.00000000,'2015-09-17 16:00:51');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) DEFAULT NULL,
  `customers_firstname` varchar(255) NOT NULL,
  `customers_lastname` varchar(255) NOT NULL,
  `customers_dob` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customers_email_address` varchar(255) NOT NULL,
  `customers_default_address_id` int(11) DEFAULT NULL,
  `customers_telephone` varchar(255) NOT NULL,
  `customers_fax` varchar(255) DEFAULT NULL,
  `customers_password` varchar(60) NOT NULL,
  `customers_newsletter` char(1) DEFAULT NULL,
  PRIMARY KEY (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'f','Alice','Test','1973-09-12 00:00:00','alice@test.com',1,'0606060606','','$P$DOo79jBYaE84wXRZKCPLtbVHV/f4iB/',''),(2,'m','Bob','Test','1983-10-13 00:00:00','bob@test.com',2,'0605050505','','$P$DNgXdCeZtNGbZnEL.kv6xjscGRXmnb0',''),(3,'f','Alice','Victim','1997-10-08 00:00:00','alice@victim.com',3,'0606060606','','$P$DClSihvU35Rui6zCbjlwWwg549P22h1',''),(4,'m','User1','One','1970-03-04 00:00:00','user1@example.com',4,'0101010101','','$P$Dh19JR223HzO2fjnO3UUf8m9xDGDPw1',''),(5,'m','User2','Two','1998-10-15 00:00:00','user2@example.com',5,'0202020202','','$P$D5xa70aP.D9z7yi8dM3h3bPcCgiQ5g1','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) DEFAULT NULL,
  `customers_basket_date_added` char(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket`
--

LOCK TABLES `customers_basket` WRITE;
/*!40000 ALTER TABLE `customers_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket_attributes`
--

LOCK TABLES `customers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `customers_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_info`
--

LOCK TABLES `customers_info` WRITE;
/*!40000 ALTER TABLE `customers_info` DISABLE KEYS */;
INSERT INTO `customers_info` VALUES (1,'2015-11-09 15:18:31',90,'2015-09-17 16:19:07',NULL,0),(2,'2015-11-09 15:18:21',1,'2015-10-21 14:26:40',NULL,0),(3,'2015-11-09 15:18:04',2,'2015-10-21 14:58:21',NULL,0),(4,'2015-11-09 15:17:38',9,'2015-10-22 16:45:55','2015-10-22 16:51:07',0),(5,'2015-11-09 15:17:52',5,'2015-10-22 16:46:46','2015-10-22 16:50:50',0);
/*!40000 ALTER TABLE `customers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL,
  `geo_zone_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_zones`
--

LOCK TABLES `geo_zones` WRITE;
/*!40000 ALTER TABLE `geo_zones` DISABLE KEYS */;
INSERT INTO `geo_zones` VALUES (1,'Florida','Florida local sales tax zone',NULL,'2015-09-17 16:00:55');
/*!40000 ALTER TABLE `geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` char(2) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','icon.gif','english',1);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL,
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Matrox','manufacturer_matrox.gif','2015-09-17 16:00:51',NULL),(2,'Microsoft','manufacturer_microsoft.gif','2015-09-17 16:00:51',NULL),(3,'Warner','manufacturer_warner.gif','2015-09-17 16:00:51',NULL),(4,'Fox','manufacturer_fox.gif','2015-09-17 16:00:51',NULL),(5,'Logitech','manufacturer_logitech.gif','2015-09-17 16:00:51',NULL),(6,'Canon','manufacturer_canon.gif','2015-09-17 16:00:51',NULL),(7,'Sierra','manufacturer_sierra.gif','2015-09-17 16:00:51',NULL),(8,'GT Interactive','manufacturer_gt_interactive.gif','2015-09-17 16:00:51',NULL),(9,'Hewlett Packard','manufacturer_hewlett_packard.gif','2015-09-17 16:00:51',NULL),(10,'Samsung','manufacturer_samsung.png','2015-09-17 16:00:51',NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) NOT NULL,
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers_info`
--

LOCK TABLES `manufacturers_info` WRITE;
/*!40000 ALTER TABLE `manufacturers_info` DISABLE KEYS */;
INSERT INTO `manufacturers_info` VALUES (1,1,'http://www.matrox.com',0,NULL),(2,1,'http://www.microsoft.com',0,NULL),(3,1,'http://www.warner.com',0,NULL),(4,1,'http://www.fox.com',0,NULL),(5,1,'http://www.logitech.com',0,NULL),(6,1,'http://www.canon.com',0,NULL),(7,1,'http://www.sierra.com',0,NULL),(8,1,'http://www.infogrames.com',0,NULL),(9,1,'http://www.hewlettpackard.com',0,NULL),(10,1,'http://www.samsung.com',0,NULL);
/*!40000 ALTER TABLE `manufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `module` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(255) NOT NULL,
  `customers_company` varchar(255) DEFAULT NULL,
  `customers_street_address` varchar(255) NOT NULL,
  `customers_suburb` varchar(255) DEFAULT NULL,
  `customers_city` varchar(255) NOT NULL,
  `customers_postcode` varchar(255) NOT NULL,
  `customers_state` varchar(255) DEFAULT NULL,
  `customers_country` varchar(255) NOT NULL,
  `customers_telephone` varchar(255) NOT NULL,
  `customers_email_address` varchar(255) NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(255) NOT NULL,
  `delivery_company` varchar(255) DEFAULT NULL,
  `delivery_street_address` varchar(255) NOT NULL,
  `delivery_suburb` varchar(255) DEFAULT NULL,
  `delivery_city` varchar(255) NOT NULL,
  `delivery_postcode` varchar(255) NOT NULL,
  `delivery_state` varchar(255) DEFAULT NULL,
  `delivery_country` varchar(255) NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(255) NOT NULL,
  `billing_company` varchar(255) DEFAULT NULL,
  `billing_street_address` varchar(255) NOT NULL,
  `billing_suburb` varchar(255) DEFAULT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_postcode` varchar(255) NOT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(255) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-09-17 16:31:32','2015-09-17 16:29:18',1,NULL,'USD',1.000000),(2,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 11:42:57','2015-10-15 11:39:48',1,NULL,'USD',1.000000),(3,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 11:46:40',5,NULL,'USD',1.000000),(4,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 11:47:52',5,NULL,'USD',1.000000),(5,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 11:53:32','2015-10-15 11:51:29',1,NULL,'USD',1.000000),(6,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 13:23:49',5,NULL,'USD',1.000000),(7,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 13:24:59',5,NULL,'USD',1.000000),(8,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 13:28:10','2015-10-15 13:27:11',1,NULL,'USD',1.000000),(9,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 13:29:32','2015-10-15 13:28:36',1,NULL,'USD',1.000000),(10,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 13:30:54','2015-10-15 13:29:56',1,NULL,'USD',1.000000),(11,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 13:32:17','2015-10-15 13:31:20',1,NULL,'USD',1.000000),(12,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 14:40:43',5,NULL,'USD',1.000000),(13,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 14:43:01',5,NULL,'USD',1.000000),(14,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 14:45:15',5,NULL,'USD',1.000000),(15,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 14:48:21','2015-10-15 14:47:08',1,NULL,'USD',1.000000),(16,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 14:48:44',5,NULL,'USD',1.000000),(17,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 14:51:55','2015-10-15 14:50:42',1,NULL,'USD',1.000000),(18,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 14:53:14','2015-10-15 14:52:15',1,NULL,'USD',1.000000),(19,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 14:54:37','2015-10-15 14:53:39',1,NULL,'USD',1.000000),(20,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 14:56:01','2015-10-15 14:55:01',1,NULL,'USD',1.000000),(21,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 14:56:25',5,NULL,'USD',1.000000),(22,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 14:59:44','2015-10-15 14:58:36',1,NULL,'USD',1.000000),(23,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:00:10',5,NULL,'USD',1.000000),(24,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:02:23',5,NULL,'USD',1.000000),(25,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:04:14',5,NULL,'USD',1.000000),(26,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:06:05',5,NULL,'USD',1.000000),(27,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:08:08',5,NULL,'USD',1.000000),(28,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:09:56',5,NULL,'USD',1.000000),(29,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:11:49',5,NULL,'USD',1.000000),(30,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 15:13:41',5,NULL,'USD',1.000000),(31,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 16:40:56','2015-10-15 16:39:45',1,NULL,'USD',1.000000),(32,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 16:47:58','2015-10-15 16:47:00',1,NULL,'USD',1.000000),(33,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:01:23',5,NULL,'USD',1.000000),(34,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:03:41',5,NULL,'USD',1.000000),(35,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:05:56',5,NULL,'USD',1.000000),(36,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:08:46','2015-10-15 17:07:50',1,NULL,'USD',1.000000),(37,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:09:12',5,NULL,'USD',1.000000),(38,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:12:40','2015-10-15 17:11:42',1,NULL,'USD',1.000000),(39,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:14:11','2015-10-15 17:13:05',1,NULL,'USD',1.000000),(40,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:15:32','2015-10-15 17:14:34',1,NULL,'USD',1.000000),(41,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:16:51','2015-10-15 17:15:54',1,NULL,'USD',1.000000),(42,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:17:14',5,NULL,'USD',1.000000),(43,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:20:23','2015-10-15 17:19:26',1,NULL,'USD',1.000000),(44,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:20:46',5,NULL,'USD',1.000000),(45,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:23:53','2015-10-15 17:22:56',1,NULL,'USD',1.000000),(46,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:24:16',5,NULL,'USD',1.000000),(47,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:27:06','2015-10-15 17:26:09',1,NULL,'USD',1.000000),(48,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:28:32','2015-10-15 17:27:30',1,NULL,'USD',1.000000),(49,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:29:50','2015-10-15 17:28:56',1,NULL,'USD',1.000000),(50,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:31:14','2015-10-15 17:30:16',1,NULL,'USD',1.000000),(51,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:32:34','2015-10-15 17:31:39',1,NULL,'USD',1.000000),(52,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 17:44:32',5,NULL,'USD',1.000000),(53,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:51:28','2015-10-15 17:50:28',1,NULL,'USD',1.000000),(54,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 17:53:52','2015-10-15 17:52:57',1,NULL,'USD',1.000000),(55,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:00:34',5,NULL,'USD',1.000000),(56,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 18:06:38','2015-10-15 18:05:40',1,NULL,'USD',1.000000),(57,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:10:02',5,NULL,'USD',1.000000),(58,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-15 18:16:09','2015-10-15 18:15:10',1,NULL,'USD',1.000000),(59,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:19:25',5,NULL,'USD',1.000000),(60,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:22:30',5,NULL,'USD',1.000000),(61,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:26:47',5,NULL,'USD',1.000000),(62,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:30:15',5,NULL,'USD',1.000000),(63,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:32:01',5,NULL,'USD',1.000000),(64,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:35:33',5,NULL,'USD',1.000000),(65,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:37:18',5,NULL,'USD',1.000000),(66,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-10-15 18:40:46',5,NULL,'USD',1.000000),(67,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-10-20 15:47:33','2015-10-20 15:45:55',1,NULL,'USD',1.000000),(68,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 11:19:21',6,NULL,'USD',1.000000),(69,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 11:36:28',6,NULL,'USD',1.000000),(70,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 11:44:02',6,NULL,'USD',1.000000),(71,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 11:49:41',6,NULL,'USD',1.000000),(72,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 12:06:41',6,NULL,'USD',1.000000),(73,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 12:08:27',6,NULL,'USD',1.000000),(74,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 12:16:25',6,NULL,'USD',1.000000),(75,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 12:18:46',6,NULL,'USD',1.000000),(76,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 12:28:11',6,NULL,'USD',1.000000),(77,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 12:29:49',6,NULL,'USD',1.000000),(78,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'2Checkout','','','','',NULL,'2015-10-21 15:00:03',6,NULL,'USD',1.000000),(79,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-11-03 14:48:16','2015-11-03 14:47:19',1,NULL,'USD',1.000000),(80,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-11-03 14:49:33','2015-11-03 14:48:42',1,NULL,'USD',1.000000),(81,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-11-03 14:50:55','2015-11-03 14:50:02',1,NULL,'USD',1.000000),(82,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-11-03 14:51:22',5,NULL,'USD',1.000000),(83,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-11-03 14:53:56',5,NULL,'USD',1.000000),(84,1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France','0606060606','alice@test.com',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'Alice Test','','Bd de Strasbourg','','Paris','75010','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','',NULL,'2015-11-03 14:56:29',5,NULL,'USD',1.000000),(86,4,'User1 One','','1 Chemin de Besancon','','Paris','75001','Paris','France','0101010101','user1@example.com',1,'User1 One','','1 Chemin de Besancon','','Paris','75001','Paris','France',1,'User1 One','','1 Chemin de Besancon','','Paris','75001','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-11-09 15:03:21','2015-11-09 15:02:28',1,NULL,'USD',1.000000),(87,4,'User1 One','','1 Chemin de Besancon','','Paris','75001','Paris','France','0101010101','user1@example.com',1,'User1 One','','1 Chemin de Besancon','','Paris','75001','Paris','France',1,'User1 One','','1 Chemin de Besancon','','Paris','75001','Paris','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-11-09 15:05:20','2015-11-09 15:04:28',1,NULL,'USD',1.000000),(88,5,'User2 Two','','2 Boulevard de Strasbourg','Strasbourg','Strasbourg','67000','Alsace','France','0202020202','user2@example.com',1,'User2 Two','','2 Boulevard de Strasbourg','Strasbourg','Strasbourg','67000','Alsace','France',1,'User2 Two','','2 Boulevard de Strasbourg','Strasbourg','Strasbourg','67000','Alsace','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-11-09 15:06:47','2015-11-09 15:05:53',1,NULL,'USD',1.000000),(89,5,'User2 Two','','2 Boulevard de Strasbourg','Strasbourg','Strasbourg','67000','Alsace','France','0202020202','user2@example.com',1,'User2 Two','','2 Boulevard de Strasbourg','Strasbourg','Strasbourg','67000','Alsace','France',1,'User2 Two','','2 Boulevard de Strasbourg','Strasbourg','Strasbourg','67000','Alsace','France',1,'PayPal (including Credit and Debit Cards)','','','','','2015-11-09 15:08:27','2015-11-09 15:07:15',1,NULL,'USD',1.000000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,26,'MSIMEXP','Microsoft IntelliMouse Explorer',64.9500,64.9500,0.0000,1),(2,2,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(3,3,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(4,4,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(5,5,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,3),(6,6,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(7,7,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,2),(8,8,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(9,9,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(10,10,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(11,11,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(12,12,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(13,13,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(14,14,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(15,15,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(16,16,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(17,17,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(18,18,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(19,19,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(20,20,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(21,21,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(22,22,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(23,23,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(24,24,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(25,25,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,3),(26,26,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,4),(27,27,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,5),(28,28,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,6),(29,29,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,7),(30,30,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,8),(31,31,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,9),(32,32,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(33,33,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(34,34,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(35,35,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(36,36,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,3),(37,37,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(38,38,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(39,39,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(40,40,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(41,41,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(42,42,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(43,43,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(44,44,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(45,45,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(46,46,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(47,47,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(48,48,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(49,49,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(50,50,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(51,51,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(52,52,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(53,53,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(54,54,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(55,55,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(56,56,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(57,57,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(58,58,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(59,59,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(60,60,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(61,61,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(62,62,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,3),(63,63,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,4),(64,64,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,5),(65,65,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,6),(66,66,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,7),(67,67,21,'PC-SWAT3','SWAT 3: Close Quarters Battle',79.9900,79.9900,0.0000,1),(68,68,15,'DVD-FRAN','Frantic',35.0000,35.0000,0.0000,1),(69,69,1,'MG200MMS','Matrox G200 MMS',299.9900,299.9900,0.0000,1),(70,70,26,'MSIMEXP','Microsoft IntelliMouse Explorer',64.9500,64.9500,0.0000,1),(71,71,26,'MSIMEXP','Microsoft IntelliMouse Explorer',64.9500,64.9500,0.0000,1),(72,72,26,'MSIMEXP','Microsoft IntelliMouse Explorer',64.9500,64.9500,0.0000,1),(73,73,26,'MSIMEXP','Microsoft IntelliMouse Explorer',64.9500,64.9500,0.0000,1),(74,74,3,'MSIMPRO','Microsoft IntelliMouse Pro',39.9900,39.9900,0.0000,1),(75,75,27,'HPLJ1100XI','Hewlett Packard LaserJet 1100Xi',499.9900,499.9900,0.0000,1),(76,76,1,'MG200MMS','Matrox G200 MMS',299.9900,299.9900,0.0000,1),(77,77,25,'MSINTKB','Microsoft Internet Keyboard PS/2',69.9900,69.9900,0.0000,1),(78,78,27,'HPLJ1100XI','Hewlett Packard LaserJet 1100Xi',499.9900,499.9900,0.0000,1),(79,79,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(80,80,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(81,81,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(82,82,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(83,83,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,2),(84,84,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,3),(86,86,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,2),(87,87,16,'DVD-CUFI','Courage Under Fire',29.9900,29.9900,0.0000,1),(88,88,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1),(89,89,17,'DVD-SPEED','Speed',39.9900,39.9900,0.0000,1);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) NOT NULL,
  `products_options_values` varchar(32) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_attributes`
--

LOCK TABLES `orders_products_attributes` WRITE;
/*!40000 ALTER TABLE `orders_products_attributes` DISABLE KEYS */;
INSERT INTO `orders_products_attributes` VALUES (1,1,1,'Model','PS/2',0.0000,'+'),(2,69,69,'Memory','4 mb',0.0000,'+'),(3,69,69,'Model','Value',0.0000,'+'),(4,70,70,'Model','PS/2',0.0000,'+'),(5,71,71,'Model','PS/2',0.0000,'+'),(6,72,72,'Model','PS/2',0.0000,'+'),(7,73,73,'Model','PS/2',0.0000,'+'),(8,76,76,'Memory','4 mb',0.0000,'+'),(9,76,76,'Model','Value',0.0000,'+');
/*!40000 ALTER TABLE `orders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_download`
--

LOCK TABLES `orders_products_download` WRITE;
/*!40000 ALTER TABLE `orders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL,
  `public_flag` int(11) DEFAULT '1',
  `downloads_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status`
--

LOCK TABLES `orders_status` WRITE;
/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
INSERT INTO `orders_status` VALUES (1,1,'Pending',1,0),(2,1,'Processing',1,1),(3,1,'Delivered',1,1),(4,1,'PayPal [Transactions]',0,0),(5,1,'Preparing [PayPal Standard]',0,0),(6,1,'Preparing [2Checkout]',0,0);
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status_history`
--

LOCK TABLES `orders_status_history` WRITE;
/*!40000 ALTER TABLE `orders_status_history` DISABLE KEYS */;
INSERT INTO `orders_status_history` VALUES (1,1,5,'2015-09-17 16:31:32',0,''),(2,1,1,'2015-09-17 16:31:32',1,''),(3,2,5,'2015-10-15 11:42:57',0,''),(4,2,1,'2015-10-15 11:42:57',1,''),(5,5,5,'2015-10-15 11:53:32',0,''),(6,5,1,'2015-10-15 11:53:32',1,''),(7,8,5,'2015-10-15 13:28:10',0,''),(8,8,1,'2015-10-15 13:28:10',1,''),(9,9,5,'2015-10-15 13:29:32',0,''),(10,9,1,'2015-10-15 13:29:32',1,''),(11,10,5,'2015-10-15 13:30:54',0,''),(12,10,1,'2015-10-15 13:30:54',1,''),(13,11,5,'2015-10-15 13:32:17',0,''),(14,11,1,'2015-10-15 13:32:17',1,''),(15,15,5,'2015-10-15 14:48:21',0,''),(16,15,1,'2015-10-15 14:48:21',1,''),(17,17,5,'2015-10-15 14:51:55',0,''),(18,17,1,'2015-10-15 14:51:55',1,''),(19,18,5,'2015-10-15 14:53:14',0,''),(20,18,1,'2015-10-15 14:53:14',1,''),(21,19,5,'2015-10-15 14:54:37',0,''),(22,19,1,'2015-10-15 14:54:37',1,''),(23,20,5,'2015-10-15 14:56:01',0,''),(24,20,1,'2015-10-15 14:56:01',1,''),(25,22,5,'2015-10-15 14:59:44',0,''),(26,22,1,'2015-10-15 14:59:44',1,''),(27,31,5,'2015-10-15 16:40:56',0,''),(28,31,1,'2015-10-15 16:40:56',1,''),(29,32,5,'2015-10-15 16:47:58',0,''),(30,32,1,'2015-10-15 16:47:58',1,''),(31,36,5,'2015-10-15 17:08:46',0,''),(32,36,1,'2015-10-15 17:08:46',1,''),(33,38,5,'2015-10-15 17:12:40',0,''),(34,38,1,'2015-10-15 17:12:40',1,''),(35,39,5,'2015-10-15 17:14:11',0,''),(36,39,1,'2015-10-15 17:14:11',1,''),(37,40,5,'2015-10-15 17:15:32',0,''),(38,40,1,'2015-10-15 17:15:32',1,''),(39,41,5,'2015-10-15 17:16:51',0,''),(40,41,1,'2015-10-15 17:16:51',1,''),(41,43,5,'2015-10-15 17:20:23',0,''),(42,43,1,'2015-10-15 17:20:23',1,''),(43,45,5,'2015-10-15 17:23:53',0,''),(44,45,1,'2015-10-15 17:23:53',1,''),(45,47,5,'2015-10-15 17:27:06',0,''),(46,47,1,'2015-10-15 17:27:06',1,''),(47,48,5,'2015-10-15 17:28:32',0,''),(48,48,1,'2015-10-15 17:28:32',1,''),(49,49,5,'2015-10-15 17:29:50',0,''),(50,49,1,'2015-10-15 17:29:50',1,''),(51,50,5,'2015-10-15 17:31:14',0,''),(52,50,1,'2015-10-15 17:31:14',1,''),(53,51,5,'2015-10-15 17:32:34',0,''),(54,51,1,'2015-10-15 17:32:34',1,''),(55,53,5,'2015-10-15 17:51:28',0,''),(56,53,1,'2015-10-15 17:51:28',1,''),(57,54,5,'2015-10-15 17:53:52',0,''),(58,54,1,'2015-10-15 17:53:52',1,''),(59,56,5,'2015-10-15 18:06:38',0,''),(60,56,1,'2015-10-15 18:06:38',1,''),(61,58,5,'2015-10-15 18:16:09',0,''),(62,58,1,'2015-10-15 18:16:09',1,''),(63,67,5,'2015-10-20 15:47:33',0,''),(64,67,1,'2015-10-20 15:47:33',1,''),(65,68,6,'2015-10-21 11:19:22',1,''),(66,69,6,'2015-10-21 11:36:28',1,''),(67,70,6,'2015-10-21 11:44:02',1,''),(68,71,6,'2015-10-21 11:49:41',1,''),(69,72,6,'2015-10-21 12:06:41',1,''),(70,73,6,'2015-10-21 12:08:27',1,''),(71,74,6,'2015-10-21 12:16:25',1,''),(72,75,6,'2015-10-21 12:18:46',1,''),(73,76,6,'2015-10-21 12:28:11',1,''),(74,77,6,'2015-10-21 12:29:49',1,''),(75,78,6,'2015-10-21 15:00:03',1,''),(76,79,5,'2015-11-03 14:48:16',0,''),(77,79,1,'2015-11-03 14:48:16',1,''),(78,80,5,'2015-11-03 14:49:33',0,''),(79,80,1,'2015-11-03 14:49:33',1,''),(80,81,5,'2015-11-03 14:50:55',0,''),(81,81,1,'2015-11-03 14:50:55',1,''),(82,86,5,'2015-11-09 15:03:21',0,''),(83,86,1,'2015-11-09 15:03:21',1,''),(84,87,5,'2015-11-09 15:05:20',0,''),(85,87,1,'2015-11-09 15:05:20',1,''),(86,88,5,'2015-11-09 15:06:47',0,''),(87,88,1,'2015-11-09 15:06:47',1,''),(88,89,5,'2015-11-09 15:08:27',0,''),(89,89,1,'2015-11-09 15:08:27',1,'');
/*!40000 ALTER TABLE `orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_total`
--

LOCK TABLES `orders_total` WRITE;
/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
INSERT INTO `orders_total` VALUES (1,1,'Sub-Total:','$64.95',64.9500,'ot_subtotal',1),(2,1,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(3,1,'Total:','<strong>$69.95</strong>',69.9500,'ot_total',4),(4,2,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(5,2,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(6,2,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(7,3,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(8,3,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(9,3,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(10,4,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(11,4,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(12,4,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(13,5,'Sub-Total:','$119.97',119.9700,'ot_subtotal',1),(14,5,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(15,5,'Total:','<strong>$124.97</strong>',124.9700,'ot_total',4),(16,6,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(17,6,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(18,6,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(19,7,'Sub-Total:','$59.98',59.9800,'ot_subtotal',1),(20,7,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(21,7,'Total:','<strong>$64.98</strong>',64.9800,'ot_total',4),(22,8,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(23,8,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(24,8,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(25,9,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(26,9,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(27,9,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(28,10,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(29,10,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(30,10,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(31,11,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(32,11,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(33,11,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(34,12,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(35,12,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(36,12,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(37,13,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(38,13,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(39,13,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(40,14,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(41,14,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(42,14,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(43,15,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(44,15,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(45,15,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(46,16,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(47,16,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(48,16,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(49,17,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(50,17,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(51,17,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(52,18,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(53,18,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(54,18,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(55,19,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(56,19,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(57,19,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(58,20,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(59,20,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(60,20,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(61,21,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(62,21,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(63,21,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(64,22,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(65,22,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(66,22,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(67,23,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(68,23,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(69,23,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(70,24,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(71,24,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(72,24,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(73,25,'Sub-Total:','$119.97',119.9700,'ot_subtotal',1),(74,25,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(75,25,'Total:','<strong>$124.97</strong>',124.9700,'ot_total',4),(76,26,'Sub-Total:','$159.96',159.9600,'ot_subtotal',1),(77,26,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(78,26,'Total:','<strong>$164.96</strong>',164.9600,'ot_total',4),(79,27,'Sub-Total:','$199.95',199.9500,'ot_subtotal',1),(80,27,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(81,27,'Total:','<strong>$204.95</strong>',204.9500,'ot_total',4),(82,28,'Sub-Total:','$239.94',239.9400,'ot_subtotal',1),(83,28,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(84,28,'Total:','<strong>$244.94</strong>',244.9400,'ot_total',4),(85,29,'Sub-Total:','$279.93',279.9300,'ot_subtotal',1),(86,29,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(87,29,'Total:','<strong>$284.93</strong>',284.9300,'ot_total',4),(88,30,'Sub-Total:','$319.92',319.9200,'ot_subtotal',1),(89,30,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(90,30,'Total:','<strong>$324.92</strong>',324.9200,'ot_total',4),(91,31,'Sub-Total:','$359.91',359.9100,'ot_subtotal',1),(92,31,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(93,31,'Total:','<strong>$364.91</strong>',364.9100,'ot_total',4),(94,32,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(95,32,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(96,32,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(97,33,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(98,33,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(99,33,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(100,34,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(101,34,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(102,34,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(103,35,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(104,35,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(105,35,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(106,36,'Sub-Total:','$119.97',119.9700,'ot_subtotal',1),(107,36,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(108,36,'Total:','<strong>$124.97</strong>',124.9700,'ot_total',4),(109,37,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(110,37,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(111,37,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(112,38,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(113,38,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(114,38,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(115,39,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(116,39,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(117,39,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(118,40,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(119,40,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(120,40,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(121,41,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(122,41,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(123,41,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(124,42,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(125,42,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(126,42,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(127,43,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(128,43,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(129,43,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(130,44,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(131,44,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(132,44,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(133,45,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(134,45,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(135,45,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(136,46,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(137,46,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(138,46,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(139,47,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(140,47,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(141,47,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(142,48,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(143,48,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(144,48,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(145,49,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(146,49,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(147,49,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(148,50,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(149,50,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(150,50,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(151,51,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(152,51,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(153,51,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(154,52,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(155,52,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(156,52,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(157,53,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(158,53,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(159,53,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(160,54,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(161,54,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(162,54,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(163,55,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(164,55,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(165,55,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(166,56,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(167,56,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(168,56,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(169,57,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(170,57,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(171,57,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(172,58,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(173,58,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(174,58,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(175,59,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(176,59,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(177,59,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(178,60,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(179,60,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(180,60,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(181,61,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(182,61,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(183,61,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(184,62,'Sub-Total:','$119.97',119.9700,'ot_subtotal',1),(185,62,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(186,62,'Total:','<strong>$124.97</strong>',124.9700,'ot_total',4),(187,63,'Sub-Total:','$159.96',159.9600,'ot_subtotal',1),(188,63,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(189,63,'Total:','<strong>$164.96</strong>',164.9600,'ot_total',4),(190,64,'Sub-Total:','$199.95',199.9500,'ot_subtotal',1),(191,64,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(192,64,'Total:','<strong>$204.95</strong>',204.9500,'ot_total',4),(193,65,'Sub-Total:','$239.94',239.9400,'ot_subtotal',1),(194,65,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(195,65,'Total:','<strong>$244.94</strong>',244.9400,'ot_total',4),(196,66,'Sub-Total:','$279.93',279.9300,'ot_subtotal',1),(197,66,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(198,66,'Total:','<strong>$284.93</strong>',284.9300,'ot_total',4),(199,67,'Sub-Total:','$79.99',79.9900,'ot_subtotal',1),(200,67,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(201,67,'Total:','<strong>$84.99</strong>',84.9900,'ot_total',4),(202,68,'Sub-Total:','$35.00',35.0000,'ot_subtotal',1),(203,68,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(204,68,'Total:','<strong>$40.00</strong>',40.0000,'ot_total',4),(205,69,'Sub-Total:','$299.99',299.9900,'ot_subtotal',1),(206,69,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(207,69,'Total:','<strong>$304.99</strong>',304.9900,'ot_total',4),(208,70,'Sub-Total:','$64.95',64.9500,'ot_subtotal',1),(209,70,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(210,70,'Total:','<strong>$69.95</strong>',69.9500,'ot_total',4),(211,71,'Sub-Total:','$64.95',64.9500,'ot_subtotal',1),(212,71,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(213,71,'Total:','<strong>$69.95</strong>',69.9500,'ot_total',4),(214,72,'Sub-Total:','$64.95',64.9500,'ot_subtotal',1),(215,72,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(216,72,'Total:','<strong>$69.95</strong>',69.9500,'ot_total',4),(217,73,'Sub-Total:','$64.95',64.9500,'ot_subtotal',1),(218,73,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(219,73,'Total:','<strong>$69.95</strong>',69.9500,'ot_total',4),(220,74,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(221,74,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(222,74,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(223,75,'Sub-Total:','$499.99',499.9900,'ot_subtotal',1),(224,75,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(225,75,'Total:','<strong>$504.99</strong>',504.9900,'ot_total',4),(226,76,'Sub-Total:','$299.99',299.9900,'ot_subtotal',1),(227,76,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(228,76,'Total:','<strong>$304.99</strong>',304.9900,'ot_total',4),(229,77,'Sub-Total:','$69.99',69.9900,'ot_subtotal',1),(230,77,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(231,77,'Total:','<strong>$74.99</strong>',74.9900,'ot_total',4),(232,78,'Sub-Total:','$499.99',499.9900,'ot_subtotal',1),(233,78,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(234,78,'Total:','<strong>$504.99</strong>',504.9900,'ot_total',4),(235,79,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(236,79,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(237,79,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(238,80,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(239,80,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(240,80,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(241,81,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(242,81,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(243,81,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(244,82,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(245,82,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(246,82,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(247,83,'Sub-Total:','$79.98',79.9800,'ot_subtotal',1),(248,83,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(249,83,'Total:','<strong>$84.98</strong>',84.9800,'ot_total',4),(250,84,'Sub-Total:','$119.97',119.9700,'ot_subtotal',1),(251,84,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(252,84,'Total:','<strong>$124.97</strong>',124.9700,'ot_total',4),(256,86,'Sub-Total:','$59.98',59.9800,'ot_subtotal',1),(257,86,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(258,86,'Total:','<strong>$64.98</strong>',64.9800,'ot_total',4),(259,87,'Sub-Total:','$29.99',29.9900,'ot_subtotal',1),(260,87,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(261,87,'Total:','<strong>$34.99</strong>',34.9900,'ot_total',4),(262,88,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(263,88,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(264,88,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4),(265,89,'Sub-Total:','$39.99',39.9900,'ot_subtotal',1),(266,89,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',2),(267,89,'Total:','<strong>$44.99</strong>',44.9900,'ot_total',4);
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,30,'MG200MMS','matrox/mg200mms.gif',299.9900,'2015-09-17 16:00:51',NULL,NULL,23.00,1,1,1,2),(2,32,'MG400-32MB','matrox/mg400-32mb.gif',499.9900,'2015-09-17 16:00:51',NULL,NULL,23.00,1,1,1,0),(3,50,'MSIMPRO','microsoft/msimpro.gif',49.9900,'2015-09-17 16:00:51','2015-10-21 14:22:43',NULL,7.00,1,1,3,1),(4,13,'DVD-RPMK','dvd/replacement_killers.gif',42.0000,'2015-09-17 16:00:51',NULL,NULL,23.00,1,1,2,0),(5,17,'DVD-BLDRNDC','dvd/blade_runner.gif',35.9900,'2015-09-17 16:00:51',NULL,NULL,7.00,1,1,3,0),(6,10,'DVD-MATR','dvd/the_matrix.gif',39.9900,'2015-09-17 16:00:51',NULL,NULL,7.00,1,1,3,0),(7,10,'DVD-YGEM','dvd/youve_got_mail.gif',34.9900,'2015-09-17 16:00:51',NULL,NULL,7.00,1,1,3,0),(8,10,'DVD-ABUG','dvd/a_bugs_life.gif',35.9900,'2015-09-17 16:00:51',NULL,NULL,7.00,1,1,3,0),(9,10,'DVD-UNSG','dvd/under_siege.gif',29.9900,'2015-09-17 16:00:51',NULL,NULL,7.00,1,1,3,0),(10,10,'DVD-UNSG2','dvd/under_siege2.gif',29.9900,'2015-09-17 16:00:51',NULL,NULL,7.00,1,1,3,0),(11,10,'DVD-FDBL','dvd/fire_down_below.gif',29.9900,'2015-09-17 16:00:52',NULL,NULL,7.00,1,1,3,0),(12,10,'DVD-DHWV','dvd/die_hard_3.gif',39.9900,'2015-09-17 16:00:52',NULL,NULL,7.00,1,1,4,0),(13,10,'DVD-LTWP','dvd/lethal_weapon.gif',34.9900,'2015-09-17 16:00:52',NULL,NULL,7.00,1,1,3,0),(14,10,'DVD-REDC','dvd/red_corner.gif',32.0000,'2015-09-17 16:00:52',NULL,NULL,7.00,1,1,3,0),(15,20,'DVD-FRAN','dvd/frantic.gif',35.0000,'2015-09-17 16:00:52','2015-10-21 14:25:02',NULL,7.00,1,1,3,1),(16,45,'DVD-CUFI','dvd/courage_under_fire.gif',38.9900,'2015-09-17 16:00:52','2015-10-21 14:24:46',NULL,7.00,1,1,4,10),(17,47,'DVD-SPEED','dvd/speed.gif',39.9900,'2015-09-17 16:00:52','2015-10-21 14:24:05',NULL,7.00,1,1,4,49),(18,10,'DVD-SPEED2','dvd/speed_2.gif',42.0000,'2015-09-17 16:00:52',NULL,NULL,7.00,1,1,4,0),(19,10,'DVD-TSAB','dvd/theres_something_about_mary.gif',49.9900,'2015-09-17 16:00:52',NULL,NULL,7.00,1,1,4,0),(20,10,'DVD-BELOVED','dvd/beloved.gif',54.9900,'2015-09-17 16:00:52',NULL,NULL,7.00,1,1,3,0),(21,50,'PC-SWAT3','sierra/swat_3.gif',79.9900,'2015-09-17 16:00:52','2015-10-21 14:23:20',NULL,7.00,1,1,7,1),(22,50,'PC-UNTM','gt_interactive/unreal_tournament.gif',89.9900,'2015-09-17 16:00:52','2015-10-21 14:23:06',NULL,7.00,1,1,8,0),(23,50,'PC-TWOF','gt_interactive/wheel_of_time.gif',99.9900,'2015-09-17 16:00:52','2015-10-21 14:23:41',NULL,10.00,1,1,8,0),(24,50,'PC-DISC','gt_interactive/disciples.gif',90.0000,'2015-09-17 16:00:52','2015-10-21 14:23:33',NULL,8.00,1,1,8,0),(25,30,'MSINTKB','microsoft/intkeyboardps2.gif',69.9900,'2015-09-17 16:00:52','2015-10-21 14:22:04',NULL,8.00,1,1,2,1),(26,50,'MSIMEXP','microsoft/imexplorer.gif',64.9500,'2015-09-17 16:00:52','2015-10-21 14:22:26',NULL,8.00,1,1,2,5),(27,50,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.9900,'2015-09-17 16:00:52','2015-11-03 14:55:51',NULL,45.00,1,1,9,2),(28,100,'GT-P1000','samsung/galaxy_tab.gif',749.9900,'2015-09-17 16:00:52',NULL,NULL,1.00,1,1,10,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes` VALUES (1,1,4,1,0.0000,'+'),(2,1,4,2,50.0000,'+'),(3,1,4,3,70.0000,'+'),(4,1,3,5,0.0000,'+'),(5,1,3,6,100.0000,'+'),(6,2,4,3,10.0000,'-'),(7,2,4,4,0.0000,'+'),(8,2,3,6,0.0000,'+'),(9,2,3,7,120.0000,'+'),(10,26,3,8,0.0000,'+'),(11,26,3,9,6.0000,'+'),(26,22,5,10,0.0000,'+'),(27,22,5,13,0.0000,'+');
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes_download`
--

LOCK TABLES `products_attributes_download` WRITE;
/*!40000 ALTER TABLE `products_attributes_download` DISABLE KEYS */;
INSERT INTO `products_attributes_download` VALUES (26,'unreal.zip',7,3);
/*!40000 ALTER TABLE `products_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (1,1,'Matrox G200 MMS','Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters &amp; Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.','www.matrox.com/mga/products/g200_mms/home.cfm',2),(2,1,'Matrox G400 32MB','<strong>Dramatically Different High Performance Graphics</strong><br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br /><strong>Key features:</strong><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>','www.matrox.com/mga/products/mill_g400/home.htm',0),(3,1,'Microsoft IntelliMouse Pro','Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.','www.microsoft.com/hardware/mouse/intellimouse.asp',4),(4,1,'The Replacement Killers','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.replacement-killers.com',0),(5,1,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.bladerunner.com',0),(6,1,'The Matrix','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch.\r<br />\nAudio: Dolby Surround.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 131 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Making Of.','www.thematrix.com',0),(7,1,'You\'ve Got Mail','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch, Spanish.\r<br />\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br />\nAudio: Dolby Digital 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 115 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.youvegotmail.com',0),(8,1,'A Bug\'s Life','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 91 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0),(9,1,'Under Siege','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(10,1,'Under Siege 2 - Dark Territory','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(11,1,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 100 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(12,1,'Die Hard With A Vengeance','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 122 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(13,1,'Lethal Weapon','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 100 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(14,1,'Red Corner','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 117 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(15,1,'Frantic','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 115 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',1),(16,1,'Courage Under Fire','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',25),(17,1,'Speed','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',69),(18,1,'Speed 2: Cruise Control','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 120 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(19,1,'There\'s Something About Mary','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 114 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',1),(20,1,'Beloved','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 164 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',1),(21,1,'SWAT 3: Close Quarters Battle','<strong>Windows 95/98</strong><br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and \"When needed\" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!','www.swat3.com',1),(22,1,'Unreal Tournament','From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.','www.unrealtournament.net',0),(23,1,'The Wheel Of Time','The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.','www.wheeloftime.com',1),(24,1,'Disciples: Sacred Lands','A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.','',0),(25,1,'Microsoft Internet Keyboard PS/2','The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!','',1),(26,1,'Microsoft IntelliMouse Explorer','Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!','www.microsoft.com/hardware/mouse/explorer.asp',6),(27,1,'Hewlett Packard LaserJet 1100Xi','HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',2),(28,1,'Samsung Galaxy Tab','<p>Powered by a Cortex A8 1.0GHz application processor, the Samsung GALAXY Tab is designed to deliver high performance whenever and wherever you are. At the same time, HD video contents are supported by a wide range of multimedia formats (DivX, XviD, MPEG4, H.263, H.264 and more), which maximizes the joy of entertainment.</p><p>With 3G HSPA connectivity, 802.11n Wi-Fi, and Bluetooth 3.0, the Samsung GALAXY Tab enhances users\' mobile communication on a whole new level. Video conferencing and push email on the large 7-inch display make communication more smooth and efficient. For voice telephony, the Samsung GALAXY Tab turns out to be a perfect speakerphone on the desk, or a mobile phone on the move via Bluetooth headset.</p>','http://galaxytab.samsungmobile.com',1);
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_images`
--

DROP TABLE IF EXISTS `products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `htmlcontent` text,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_images_prodid` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_images`
--

LOCK TABLES `products_images` WRITE;
/*!40000 ALTER TABLE `products_images` DISABLE KEYS */;
INSERT INTO `products_images` VALUES (1,28,'samsung/galaxy_tab_1.jpg',NULL,1),(2,28,'samsung/galaxy_tab_2.jpg',NULL,2),(3,28,'samsung/galaxy_tab_3.jpg',NULL,3),(4,28,'samsung/galaxy_tab_4.jpg','<object type=\"application/x-shockwave-flash\" width=\"640\" height=\"385\" data=\"http://www.youtube.com/v/tAbsmHMAhrQ?fs=1&amp;autoplay=1\"><param name=\"movie\" value=\"http://www.youtube.com/v/tAbsmHMAhrQ?fs=1&amp;autoplay=1\" /><param name=\"allowFullScreen\" value=\"true\" /><param name=\"allowscriptaccess\" value=\"always\" /><param name=\"wmode\" value=\"transparent\" /></object>',4);
/*!40000 ALTER TABLE `products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_notifications`
--

LOCK TABLES `products_notifications` WRITE;
/*!40000 ALTER TABLE `products_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options`
--

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;
INSERT INTO `products_options` VALUES (1,1,'Color'),(2,1,'Size'),(3,1,'Model'),(4,1,'Memory'),(5,1,'Version');
/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_values_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values`
--

LOCK TABLES `products_options_values` WRITE;
/*!40000 ALTER TABLE `products_options_values` DISABLE KEYS */;
INSERT INTO `products_options_values` VALUES (1,1,'4 mb'),(2,1,'8 mb'),(3,1,'16 mb'),(4,1,'32 mb'),(5,1,'Value'),(6,1,'Premium'),(7,1,'Deluxe'),(8,1,'PS/2'),(9,1,'USB'),(10,1,'Download: Windows - English'),(13,1,'Box: Windows - English');
/*!40000 ALTER TABLE `products_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY (`products_options_values_to_products_options_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values_to_products_options`
--

LOCK TABLES `products_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `products_options_values_to_products_options` DISABLE KEYS */;
INSERT INTO `products_options_values_to_products_options` VALUES (1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,5,10),(13,5,13);
/*!40000 ALTER TABLE `products_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_to_categories`
--

LOCK TABLES `products_to_categories` WRITE;
/*!40000 ALTER TABLE `products_to_categories` DISABLE KEYS */;
INSERT INTO `products_to_categories` VALUES (1,4),(2,4),(3,9),(4,10),(5,11),(6,10),(7,12),(8,13),(9,10),(10,10),(11,10),(12,10),(13,10),(14,15),(15,14),(16,15),(17,10),(18,10),(19,12),(20,15),(21,18),(22,19),(23,20),(24,20),(25,8),(26,9),(27,5),(28,21);
/*!40000 ALTER TABLE `products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(255) NOT NULL,
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_status` tinyint(1) NOT NULL DEFAULT '0',
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,19,0,'John Doe',5,'2015-09-17 16:00:55',NULL,1,0);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_description`
--

LOCK TABLES `reviews_description` WRITE;
/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
INSERT INTO `reviews_description` VALUES (1,1,'This has to be one of the funniest movies released for 1999!');
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_directory_whitelist`
--

DROP TABLE IF EXISTS `sec_directory_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_directory_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_directory_whitelist`
--

LOCK TABLES `sec_directory_whitelist` WRITE;
/*!40000 ALTER TABLE `sec_directory_whitelist` DISABLE KEYS */;
INSERT INTO `sec_directory_whitelist` VALUES (1,'admin/backups'),(2,'admin/images/graphs'),(3,'images'),(4,'images/banners'),(5,'images/dvd'),(6,'images/gt_interactive'),(7,'images/hewlett_packard'),(8,'images/matrox'),(9,'images/microsoft'),(10,'images/sierra'),(11,'includes/work'),(12,'pub');
/*!40000 ALTER TABLE `sec_directory_whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sesskey` varchar(32) NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('6ven771j06ing157ajfdg31c45',1447079548,'sessiontoken|s:32:\"994af300fe482e042c5f24ef7b84e5ae\";cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:9:{i:0;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:6:\"action\";s:7:\"process\";s:6:\"osCsid\";s:26:\"6ven771j06ing157ajfdg31c45\";}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"5ba985ab1b2de4d47118dbb0df9f7f34\";s:13:\"email_address\";s:15:\"user2@example.com\";s:8:\"password\";s:9:\"user2pass\";}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:11:\"products_id\";s:2:\"17\";s:6:\"action\";s:11:\"add_product\";}s:4:\"post\";a:1:{s:11:\"products_id\";s:2:\"17\";}}i:3;a:4:{s:4:\"page\";s:17:\"shopping_cart.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:4;a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:6:\"formid\";s:32:\"994af300fe482e042c5f24ef7b84e5ae\";s:6:\"action\";s:7:\"process\";s:8:\"shipping\";s:9:\"flat_flat\";s:8:\"comments\";s:0:\"\";}}i:5;a:4:{s:4:\"page\";s:20:\"checkout_payment.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:6;a:4:{s:4:\"page\";s:25:\"checkout_confirmation.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"994af300fe482e042c5f24ef7b84e5ae\";s:7:\"payment\";s:15:\"paypal_standard\";s:8:\"comments\";s:0:\"\";}}i:7;a:4:{s:4:\"page\";s:20:\"checkout_process.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:42:{s:8:\"mc_gross\";s:5:\"44.99\";s:7:\"invoice\";s:2:\"89\";s:22:\"protection_eligibility\";s:8:\"Eligible\";s:14:\"address_status\";s:11:\"unconfirmed\";s:8:\"payer_id\";s:13:\"K3WX44HVGXJ5U\";s:3:\"tax\";s:4:\"0.00\";s:14:\"address_street\";s:25:\"2 Boulevard de Strasbourg\";s:12:\"payment_date\";s:25:\"06:07:47 Nov 09, 2015 PST\";s:14:\"payment_status\";s:9:\"Completed\";s:7:\"charset\";s:12:\"windows-1252\";s:11:\"address_zip\";s:5:\"67000\";s:10:\"first_name\";s:4:\"User\";s:6:\"mc_fee\";s:4:\"1.60\";s:20:\"address_country_code\";s:2:\"FR\";s:12:\"address_name\";s:9:\"User2 Two\";s:14:\"notify_version\";s:3:\"3.8\";s:6:\"custom\";s:1:\"5\";s:12:\"payer_status\";s:8:\"verified\";s:8:\"business\";s:21:\"merchant231@example.com\";s:15:\"address_country\";s:6:\"France\";s:12:\"address_city\";s:10:\"Strasbourg\";s:8:\"quantity\";s:1:\"1\";s:11:\"payer_email\";s:15:\"user2@example.com\";s:11:\"verify_sign\";s:56:\"Ate9q.m3Ktl6ixe2Cm-RbCb5zJNGAixr5vB3T5BsXFgv4DZFhz8lPmlp\";s:6:\"txn_id\";s:17:\"23H21964ME8129147\";s:12:\"payment_type\";s:7:\"instant\";s:9:\"last_name\";s:3:\"Two\";s:13:\"address_state\";s:6:\"Alsace\";s:14:\"receiver_email\";s:21:\"merchant231@example.com\";s:11:\"payment_fee\";s:4:\"1.60\";s:11:\"receiver_id\";s:13:\"TUVPJ9ZHS8P7J\";s:8:\"txn_type\";s:10:\"web_accept\";s:9:\"item_name\";s:10:\"Test store\";s:11:\"mc_currency\";s:3:\"USD\";s:11:\"item_number\";s:0:\"\";s:17:\"residence_country\";s:2:\"US\";s:8:\"test_ipn\";s:1:\"1\";s:15:\"handling_amount\";s:4:\"0.00\";s:19:\"transaction_subject\";s:1:\"5\";s:13:\"payment_gross\";s:5:\"44.99\";s:8:\"shipping\";s:4:\"5.00\";s:4:\"auth\";s:87:\"AQZ5PIRpkl2w.E4VrrVkoFqzQLtUsTn7bVFl.JOjlkCqcgnNsxGEL7P6acRiszvCa-sS9uE0wWPcWH3ZYJB1tLQ\";}}i:8;a:4:{s:4:\"page\";s:20:\"checkout_success.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}customer_id|s:1:\"5\";customer_default_address_id|s:1:\"5\";customer_first_name|s:5:\"User2\";customer_country_id|s:2:\"73\";customer_zone_id|s:1:\"0\";'),('c5fu8dm4ijbni7imntrtr9o912',1447079361,'sessiontoken|s:32:\"6928e658888e5d8ce381b34b8130f61a\";cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:9:{i:0;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:6:\"action\";s:7:\"process\";s:6:\"osCsid\";s:26:\"c5fu8dm4ijbni7imntrtr9o912\";}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"6f527d127f21f4fce6d7b74d80f2d290\";s:13:\"email_address\";s:15:\"user1@example.com\";s:8:\"password\";s:9:\"user1pass\";}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:11:\"products_id\";s:2:\"16\";s:6:\"action\";s:11:\"add_product\";}s:4:\"post\";a:1:{s:11:\"products_id\";s:2:\"16\";}}i:3;a:4:{s:4:\"page\";s:17:\"shopping_cart.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:4;a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:6:\"formid\";s:32:\"6928e658888e5d8ce381b34b8130f61a\";s:6:\"action\";s:7:\"process\";s:8:\"shipping\";s:9:\"flat_flat\";s:8:\"comments\";s:0:\"\";}}i:5;a:4:{s:4:\"page\";s:20:\"checkout_payment.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:6;a:4:{s:4:\"page\";s:25:\"checkout_confirmation.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"6928e658888e5d8ce381b34b8130f61a\";s:7:\"payment\";s:15:\"paypal_standard\";s:8:\"comments\";s:0:\"\";}}i:7;a:4:{s:4:\"page\";s:20:\"checkout_process.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:42:{s:8:\"mc_gross\";s:5:\"34.99\";s:7:\"invoice\";s:2:\"87\";s:22:\"protection_eligibility\";s:8:\"Eligible\";s:14:\"address_status\";s:11:\"unconfirmed\";s:8:\"payer_id\";s:13:\"QU489ETGYHMSS\";s:3:\"tax\";s:4:\"0.00\";s:14:\"address_street\";s:20:\"1 Chemin de Besancon\";s:12:\"payment_date\";s:25:\"06:05:00 Nov 09, 2015 PST\";s:14:\"payment_status\";s:9:\"Completed\";s:7:\"charset\";s:12:\"windows-1252\";s:11:\"address_zip\";s:5:\"75001\";s:10:\"first_name\";s:4:\"User\";s:6:\"mc_fee\";s:4:\"1.31\";s:20:\"address_country_code\";s:2:\"FR\";s:12:\"address_name\";s:9:\"User1 One\";s:14:\"notify_version\";s:3:\"3.8\";s:6:\"custom\";s:1:\"4\";s:12:\"payer_status\";s:8:\"verified\";s:8:\"business\";s:21:\"merchant231@example.com\";s:15:\"address_country\";s:6:\"France\";s:12:\"address_city\";s:5:\"Paris\";s:8:\"quantity\";s:1:\"1\";s:11:\"payer_email\";s:15:\"user1@example.com\";s:11:\"verify_sign\";s:56:\"A5PKi1wRG.tjvkw2XZz2u8awR0OzALSTh9mmFWa0rId.eZoso4jvsV18\";s:6:\"txn_id\";s:17:\"68663782YC3918414\";s:12:\"payment_type\";s:7:\"instant\";s:9:\"last_name\";s:3:\"One\";s:13:\"address_state\";s:5:\"Paris\";s:14:\"receiver_email\";s:21:\"merchant231@example.com\";s:11:\"payment_fee\";s:4:\"1.31\";s:11:\"receiver_id\";s:13:\"TUVPJ9ZHS8P7J\";s:8:\"txn_type\";s:10:\"web_accept\";s:9:\"item_name\";s:10:\"Test store\";s:11:\"mc_currency\";s:3:\"USD\";s:11:\"item_number\";s:0:\"\";s:17:\"residence_country\";s:2:\"US\";s:8:\"test_ipn\";s:1:\"1\";s:15:\"handling_amount\";s:4:\"0.00\";s:19:\"transaction_subject\";s:1:\"4\";s:13:\"payment_gross\";s:5:\"34.99\";s:8:\"shipping\";s:4:\"5.00\";s:4:\"auth\";s:87:\"Al363MPn.4S7Ug381KhFVVPYwTDXaqNroR-a86l.wUkghi25r-9muMwr0YguDBRwog0C0UiX7T.VhE8VVoTUGEw\";}}i:8;a:4:{s:4:\"page\";s:20:\"checkout_success.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}customer_id|s:1:\"4\";customer_default_address_id|s:1:\"4\";customer_first_name|s:5:\"User1\";customer_country_id|s:2:\"73\";customer_zone_id|s:1:\"0\";'),('dgg0tsiev95cps24161afqv3d2',1447080157,'sessiontoken|s:32:\"6da313b5f927e9575c75b161f4dbef9f\";cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:6:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:6:\"action\";s:7:\"process\";}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"2edce0ac4b78c0a4c8143c14154442c5\";s:13:\"email_address\";s:14:\"alice@test.com\";s:8:\"password\";s:9:\"alicepass\";}}i:3;a:4:{s:4:\"page\";s:11:\"account.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:4;a:4:{s:4:\"page\";s:17:\"shopping_cart.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:5;a:4:{s:4:\"page\";s:10:\"logoff.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}'),('haomuuls035lc3rub2h0k6bpu3',1447078875,'language|s:7:\"english\";languages_id|s:1:\"1\";admin|a:2:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:4:\"toto\";}'),('hkv4tkt50i00s6cc8jic3r3gk3',1447079448,'sessiontoken|s:32:\"955ba1a1282d45a71dd5fdc30d2ece86\";cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:9:{i:0;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:6:\"action\";s:7:\"process\";s:6:\"osCsid\";s:26:\"hkv4tkt50i00s6cc8jic3r3gk3\";}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"5c2a335a2895adaa971298d97d4deb2a\";s:13:\"email_address\";s:15:\"user2@example.com\";s:8:\"password\";s:9:\"user2pass\";}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:11:\"products_id\";s:2:\"17\";s:6:\"action\";s:11:\"add_product\";}s:4:\"post\";a:1:{s:11:\"products_id\";s:2:\"17\";}}i:3;a:4:{s:4:\"page\";s:17:\"shopping_cart.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:4;a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:6:\"formid\";s:32:\"955ba1a1282d45a71dd5fdc30d2ece86\";s:6:\"action\";s:7:\"process\";s:8:\"shipping\";s:9:\"flat_flat\";s:8:\"comments\";s:0:\"\";}}i:5;a:4:{s:4:\"page\";s:20:\"checkout_payment.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:6;a:4:{s:4:\"page\";s:25:\"checkout_confirmation.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"955ba1a1282d45a71dd5fdc30d2ece86\";s:7:\"payment\";s:15:\"paypal_standard\";s:8:\"comments\";s:0:\"\";}}i:7;a:4:{s:4:\"page\";s:20:\"checkout_process.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:42:{s:8:\"mc_gross\";s:5:\"44.99\";s:7:\"invoice\";s:2:\"88\";s:22:\"protection_eligibility\";s:8:\"Eligible\";s:14:\"address_status\";s:11:\"unconfirmed\";s:8:\"payer_id\";s:13:\"K3WX44HVGXJ5U\";s:3:\"tax\";s:4:\"0.00\";s:14:\"address_street\";s:25:\"2 Boulevard de Strasbourg\";s:12:\"payment_date\";s:25:\"06:06:25 Nov 09, 2015 PST\";s:14:\"payment_status\";s:9:\"Completed\";s:7:\"charset\";s:12:\"windows-1252\";s:11:\"address_zip\";s:5:\"67000\";s:10:\"first_name\";s:4:\"User\";s:6:\"mc_fee\";s:4:\"1.60\";s:20:\"address_country_code\";s:2:\"FR\";s:12:\"address_name\";s:9:\"User2 Two\";s:14:\"notify_version\";s:3:\"3.8\";s:6:\"custom\";s:1:\"5\";s:12:\"payer_status\";s:8:\"verified\";s:8:\"business\";s:21:\"merchant231@example.com\";s:15:\"address_country\";s:6:\"France\";s:12:\"address_city\";s:10:\"Strasbourg\";s:8:\"quantity\";s:1:\"1\";s:11:\"payer_email\";s:15:\"user2@example.com\";s:11:\"verify_sign\";s:56:\"AFcWxV21C7fd0v3bYYYRCpSSRl31AJk82PFKZWAU0DouY55wHX0NS-q4\";s:6:\"txn_id\";s:17:\"6KW09413LE643081H\";s:12:\"payment_type\";s:7:\"instant\";s:9:\"last_name\";s:3:\"Two\";s:13:\"address_state\";s:6:\"Alsace\";s:14:\"receiver_email\";s:21:\"merchant231@example.com\";s:11:\"payment_fee\";s:4:\"1.60\";s:11:\"receiver_id\";s:13:\"TUVPJ9ZHS8P7J\";s:8:\"txn_type\";s:10:\"web_accept\";s:9:\"item_name\";s:10:\"Test store\";s:11:\"mc_currency\";s:3:\"USD\";s:11:\"item_number\";s:0:\"\";s:17:\"residence_country\";s:2:\"US\";s:8:\"test_ipn\";s:1:\"1\";s:15:\"handling_amount\";s:4:\"0.00\";s:19:\"transaction_subject\";s:1:\"5\";s:13:\"payment_gross\";s:5:\"44.99\";s:8:\"shipping\";s:4:\"5.00\";s:4:\"auth\";s:87:\"Acmn.sTdh29eeQQKQ0RVfJHtbNfZA7QLNaAJN-ej2xtZd.fHDip3727kBDqT7d9SSZPydIruHXbga3zSf9oNcnw\";}}i:8;a:4:{s:4:\"page\";s:20:\"checkout_success.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}customer_id|s:1:\"5\";customer_default_address_id|s:1:\"5\";customer_first_name|s:5:\"User2\";customer_country_id|s:2:\"73\";customer_zone_id|s:1:\"0\";'),('s2ske7dl5i892a2etnu9k181g4',1447078831,'sessiontoken|s:32:\"58e4f6304f9d6817224b6029775f5f09\";cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:1:{i:16;a:1:{s:3:\"qty\";i:1;}}s:5:\"total\";d:29.989999999999998436805981327779591083526611328125;s:6:\"weight\";d:7;s:6:\"cartID\";s:5:\"77594\";s:12:\"content_type\";s:8:\"physical\";}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:6:{i:0;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:6:\"action\";s:7:\"process\";s:6:\"osCsid\";s:26:\"s2ske7dl5i892a2etnu9k181g4\";}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"cce3b1610d00d45c282fda5210c7405a\";s:13:\"email_address\";s:15:\"user1@example.com\";s:8:\"password\";s:9:\"user1pass\";}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:11:\"products_id\";s:2:\"16\";s:6:\"action\";s:11:\"add_product\";}s:4:\"post\";a:1:{s:11:\"products_id\";s:2:\"16\";}}i:3;a:4:{s:4:\"page\";s:17:\"shopping_cart.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:4;a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:6:\"formid\";s:32:\"58e4f6304f9d6817224b6029775f5f09\";s:6:\"action\";s:7:\"process\";s:8:\"shipping\";s:9:\"flat_flat\";s:8:\"comments\";s:0:\"\";}}i:5;a:4:{s:4:\"page\";s:20:\"checkout_payment.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}customer_id|s:1:\"4\";customer_default_address_id|s:1:\"4\";customer_first_name|s:5:\"User1\";customer_country_id|s:2:\"73\";customer_zone_id|s:1:\"0\";sendto|s:1:\"4\";cartID|R:8;comments|N;shipping|a:3:{s:2:\"id\";s:9:\"flat_flat\";s:5:\"title\";s:20:\"Flat Rate (Best Way)\";s:4:\"cost\";s:4:\"5.00\";}billto|s:1:\"4\";payment|s:15:\"paypal_standard\";'),('sk6h8oqok19d19nl1mc6qs8pb4',1447080087,'language|s:7:\"english\";languages_id|s:1:\"1\";admin|a:2:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:4:\"toto\";}'),('t5uagjt2dgnda61lcpvpambal3',1447079243,'sessiontoken|s:32:\"0afb681229c82b3194b7ac893d62dec7\";cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:9:{i:0;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:6:\"action\";s:7:\"process\";s:6:\"osCsid\";s:26:\"t5uagjt2dgnda61lcpvpambal3\";}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"c7516da57c79ec192c5b890b2f61cc33\";s:13:\"email_address\";s:15:\"user1@example.com\";s:8:\"password\";s:9:\"user1pass\";}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:11:\"products_id\";s:2:\"16\";s:6:\"action\";s:11:\"add_product\";}s:4:\"post\";a:1:{s:11:\"products_id\";s:2:\"16\";}}i:3;a:4:{s:4:\"page\";s:17:\"shopping_cart.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:4;a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:6:\"formid\";s:32:\"0afb681229c82b3194b7ac893d62dec7\";s:6:\"action\";s:7:\"process\";s:8:\"shipping\";s:9:\"flat_flat\";s:8:\"comments\";s:0:\"\";}}i:5;a:4:{s:4:\"page\";s:20:\"checkout_payment.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:6;a:4:{s:4:\"page\";s:25:\"checkout_confirmation.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:6:\"formid\";s:32:\"0afb681229c82b3194b7ac893d62dec7\";s:7:\"payment\";s:15:\"paypal_standard\";s:8:\"comments\";s:0:\"\";}}i:7;a:4:{s:4:\"page\";s:20:\"checkout_process.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:42:{s:8:\"mc_gross\";s:5:\"64.98\";s:7:\"invoice\";s:2:\"86\";s:22:\"protection_eligibility\";s:8:\"Eligible\";s:14:\"address_status\";s:11:\"unconfirmed\";s:8:\"payer_id\";s:13:\"QU489ETGYHMSS\";s:3:\"tax\";s:4:\"0.00\";s:14:\"address_street\";s:20:\"1 Chemin de Besancon\";s:12:\"payment_date\";s:25:\"06:03:02 Nov 09, 2015 PST\";s:14:\"payment_status\";s:9:\"Completed\";s:7:\"charset\";s:12:\"windows-1252\";s:11:\"address_zip\";s:5:\"75001\";s:10:\"first_name\";s:4:\"User\";s:6:\"mc_fee\";s:4:\"2.18\";s:20:\"address_country_code\";s:2:\"FR\";s:12:\"address_name\";s:9:\"User1 One\";s:14:\"notify_version\";s:3:\"3.8\";s:6:\"custom\";s:1:\"4\";s:12:\"payer_status\";s:8:\"verified\";s:8:\"business\";s:21:\"merchant231@example.com\";s:15:\"address_country\";s:6:\"France\";s:12:\"address_city\";s:5:\"Paris\";s:8:\"quantity\";s:1:\"1\";s:11:\"payer_email\";s:15:\"user1@example.com\";s:11:\"verify_sign\";s:56:\"AFcWxV21C7fd0v3bYYYRCpSSRl31ALCBQ1GM2HBm.S-aG94ZTJkmQLRL\";s:6:\"txn_id\";s:17:\"8W435266CT236312B\";s:12:\"payment_type\";s:7:\"instant\";s:9:\"last_name\";s:3:\"One\";s:13:\"address_state\";s:5:\"Paris\";s:14:\"receiver_email\";s:21:\"merchant231@example.com\";s:11:\"payment_fee\";s:4:\"2.18\";s:11:\"receiver_id\";s:13:\"TUVPJ9ZHS8P7J\";s:8:\"txn_type\";s:10:\"web_accept\";s:9:\"item_name\";s:10:\"Test store\";s:11:\"mc_currency\";s:3:\"USD\";s:11:\"item_number\";s:0:\"\";s:17:\"residence_country\";s:2:\"US\";s:8:\"test_ipn\";s:1:\"1\";s:15:\"handling_amount\";s:4:\"0.00\";s:19:\"transaction_subject\";s:1:\"4\";s:13:\"payment_gross\";s:5:\"64.98\";s:8:\"shipping\";s:4:\"5.00\";s:4:\"auth\";s:87:\"AB5zIJUVjmf-mfm9DtylgcqHS1mrfx9h92f-v0Thv0cDZzYD12YtlXAXcjHSvHYtzfRdxzwTyLoWvF.fI57alQQ\";}}i:8;a:4:{s:4:\"page\";s:20:\"checkout_success.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}customer_id|s:1:\"4\";customer_default_address_id|s:1:\"4\";customer_first_name|s:5:\"User1\";customer_country_id|s:2:\"73\";customer_zone_id|s:1:\"0\";');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
INSERT INTO `specials` VALUES (1,3,39.9900,'2015-09-17 16:00:55',NULL,NULL,NULL,1),(2,5,30.0000,'2015-09-17 16:00:55',NULL,NULL,NULL,1),(3,6,30.0000,'2015-09-17 16:00:55',NULL,NULL,NULL,1),(4,16,29.9900,'2015-09-17 16:00:55',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL,
  `tax_class_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'Taxable Goods','The following types of products are included non-food, services, etc','2015-09-17 16:00:55','2015-09-17 16:00:55');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_rates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (1,1,1,1,7.0000,'FL TAX 7.0%','2015-09-17 16:00:55','2015-09-17 16:00:55');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `time_entry` varchar(14) NOT NULL,
  `time_last_click` varchar(14) NOT NULL,
  `last_page_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whos_online`
--

LOCK TABLES `whos_online` WRITE;
/*!40000 ALTER TABLE `whos_online` DISABLE KEYS */;
INSERT INTO `whos_online` VALUES (4,'User1 One','c5fu8dm4ijbni7imntrtr9o912','147.204.6.17','1447077863','1447077921','/oscommerce/checkout_success.php'),(5,'User2 Two','hkv4tkt50i00s6cc8jic3r3gk3','147.204.6.17','1447077948','1447078008','/oscommerce/checkout_success.php'),(5,'User2 Two','6ven771j06ing157ajfdg31c45','147.204.6.17','1447078030','1447078108','/oscommerce/checkout_success.php'),(0,'Guest','iuq2ep84a3ibbh06hfnikn3tn4','10.55.132.140','1447078650','1447078658','/oscommerce/login.php?action=process'),(0,'Guest','lgl11f0ipptk5ceo1vajrkssp1','10.55.132.140','1447078658','1447078672','/oscommerce/login.php?action=process'),(0,'Guest','l5l504m39f28hrq8q5oa3e1vv7','10.55.132.140','1447078672','1447078684','/oscommerce/login.php?action=process'),(0,'Guest','4c45turn8cng8rdgseul1vq7j1','10.55.132.140','1447078684','1447078701','/oscommerce/login.php?action=process'),(0,'Guest','q5feqa4ca3t11vnk3j1did05v3','10.55.132.140','1447078701','1447078711','/oscommerce/login.php?action=process'),(1,'Alice Test','dgg0tsiev95cps24161afqv3d2','10.55.132.140','1447078711','1447078717','/oscommerce/logoff.php');
/*!40000 ALTER TABLE `whos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) NOT NULL,
  `zone_name` varchar(255) NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(6,223,'AF','Armed Forces Africa'),(7,223,'AA','Armed Forces Americas'),(8,223,'AC','Armed Forces Canada'),(9,223,'AE','Armed Forces Europe'),(10,223,'AM','Armed Forces Middle East'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,223,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NF','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-WÃ¼rttemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','ThÃ¼ringen'),(95,14,'WI','Wien'),(96,14,'NO','NiederÃ¶sterreich'),(97,14,'OO','OberÃ¶sterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','KÃ¤rnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','GraubÃ¼nden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','ZÃ¼rich'),(130,195,'A CoruÃ±a','A CoruÃ±a'),(131,195,'Alava','Alava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almeria','Almeria'),(135,195,'Asturias','Asturias'),(136,195,'Avila','Avila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Caceres','Caceres'),(142,195,'Cadiz','Cadiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellon','Castellon'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Cordoba','Cordoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipuzcoa','Guipuzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaen','Jaen'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'Leon','Leon'),(159,195,'Lleida','Lleida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Malaga','Malaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones_to_geo_zones`
--

LOCK TABLES `zones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `zones_to_geo_zones` DISABLE KEYS */;
INSERT INTO `zones_to_geo_zones` VALUES (1,223,18,1,NULL,'2015-09-17 16:00:55');
/*!40000 ALTER TABLE `zones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oscommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-09 15:20:07
