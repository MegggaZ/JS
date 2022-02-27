-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `craeted_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'asperiores','2011-06-15','1998-11-26'),(2,'est','1977-06-27','1972-10-23'),(3,'laborum','2008-09-12','2002-11-12'),(4,'commodi','2004-08-04','2009-10-25'),(5,'voluptatum','1996-05-22','1998-02-09'),(6,'soluta','1978-06-30','1978-07-05'),(7,'est','1995-12-18','1976-07-07'),(8,'aperiam','1974-06-29','1996-11-15'),(9,'consequatur','1971-12-04','2008-03-25'),(10,'qui','2000-03-15','2003-11-30'),(11,'sit','1989-11-18','1986-11-21'),(12,'fugiat','1977-09-10','1987-01-24'),(13,'quos','2000-12-21','2021-01-03'),(14,'qui','1998-12-11','2000-07-25'),(15,'et','2013-11-15','2017-03-05'),(16,'natus','1996-12-11','2008-08-16'),(17,'aliquid','1980-06-22','2019-01-12'),(18,'dolores','1987-01-17','1977-06-28'),(19,'quia','2014-10-07','1989-06-30'),(20,'delectus','2018-03-31','1998-10-29'),(21,'corporis','2015-05-25','1994-04-04'),(22,'distinctio','1974-08-08','1983-05-01'),(23,'ex','2006-12-31','1981-01-17'),(24,'repudiandae','2007-01-15','1983-02-24'),(25,'aliquam','1998-02-21','2018-09-10'),(26,'quibusdam','1979-10-09','1985-08-15'),(27,'exercitationem','2021-10-31','1973-10-22'),(28,'harum','1984-04-18','1979-04-06'),(29,'molestias','1977-12-16','2005-09-23'),(30,'qui','2007-12-07','1980-10-13'),(31,'voluptas','2006-10-28','2020-10-27'),(32,'inventore','1997-05-20','2014-09-03'),(33,'amet','2014-08-14','2001-01-16'),(34,'dolores','2004-11-27','2018-10-07'),(35,'incidunt','2009-05-06','2018-12-27'),(36,'autem','1989-12-14','2002-10-12'),(37,'nostrum','1995-05-20','1997-01-29'),(38,'ex','1970-07-02','2009-02-12'),(39,'odio','2000-10-30','1991-08-17'),(40,'et','1997-03-14','1988-10-28'),(41,'officia','2006-03-04','2020-03-14'),(42,'nisi','1981-08-02','1988-03-24'),(43,'et','2001-02-01','2017-10-25'),(44,'voluptas','2019-10-03','2003-12-01'),(45,'nam','1991-11-30','1991-12-20'),(46,'fuga','2003-07-25','2003-03-04'),(47,'vitae','2016-04-28','1997-02-25'),(48,'voluptate','1987-05-10','1998-07-08'),(49,'soluta','1996-11-07','1996-12-23'),(50,'saepe','2000-03-24','2007-05-24'),(51,'velit','1982-11-14','2008-12-11'),(52,'quos','1978-03-25','1977-11-03'),(53,'assumenda','2015-03-15','1995-09-25'),(54,'dolor','1975-08-29','2005-09-17'),(55,'voluptates','1995-06-30','1980-04-30'),(56,'eaque','1982-02-24','1973-09-20'),(57,'voluptatem','1995-09-09','1986-10-10'),(58,'quia','2001-12-12','2011-03-26'),(59,'tempore','2019-07-05','1989-04-17'),(60,'expedita','1975-09-28','2001-09-08'),(61,'magni','1993-01-27','1979-06-03'),(62,'omnis','1987-09-01','1999-11-20'),(63,'explicabo','2006-07-28','2000-01-28'),(64,'ab','2001-03-18','1997-06-09'),(65,'quos','2004-11-13','1983-02-21'),(66,'ut','1996-05-15','2001-02-28'),(67,'consectetur','2003-12-07','1991-02-15'),(68,'nam','1989-01-30','2000-09-20'),(69,'quisquam','1985-08-20','1984-02-14'),(70,'deleniti','1983-10-03','2004-11-01'),(71,'repudiandae','1998-08-09','1971-01-13'),(72,'autem','1970-10-28','2015-08-22'),(73,'ut','1999-06-23','2021-06-27'),(74,'perferendis','1997-11-23','2011-06-09'),(75,'debitis','2021-04-13','2020-03-14'),(76,'eaque','1995-09-23','1999-01-30'),(77,'excepturi','1996-03-28','1977-05-22'),(78,'atque','2013-05-09','2018-11-27'),(79,'consequatur','1988-06-30','1973-01-11'),(80,'voluptatem','2018-08-05','2004-01-20'),(81,'aut','1974-06-15','2002-11-28'),(82,'incidunt','2019-06-18','1977-11-14'),(83,'aperiam','1977-06-28','1985-12-16'),(84,'dolores','1996-12-04','2018-08-29'),(85,'ut','1978-03-13','2013-04-23'),(86,'vitae','2007-09-26','1973-11-09'),(87,'vel','2014-09-28','2008-06-26'),(88,'incidunt','2005-01-31','2011-01-13'),(89,'adipisci','1990-06-18','1988-10-14'),(90,'quia','1980-02-09','2021-06-19'),(91,'delectus','2001-01-02','1987-05-30'),(92,'quo','1992-05-29','1975-01-09'),(93,'esse','1971-06-06','1973-06-12'),(94,'sapiente','2010-09-28','2007-08-05'),(95,'voluptas','1983-04-05','2018-09-21'),(96,'aut','1994-01-23','1979-08-20'),(97,'placeat','1989-07-16','2005-04-21'),(98,'illum','1986-04-27','1986-10-03'),(99,'accusamus','1981-08-03','1971-05-19'),(100,'officia','1984-12-21','2011-09-02');
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

-- Dump completed on 2021-11-23 15:23:31
