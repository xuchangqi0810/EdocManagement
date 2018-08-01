/*
SQLyog v10.2 
MySQL - 5.6.24 : Database - edocmanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`edocmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `edocmanagement`;

/*Table structure for table `edoc_category` */

DROP TABLE IF EXISTS `edoc_category`;

CREATE TABLE `edoc_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `edoc_category` */

insert  into `edoc_category`(`id`,`name`) values (1,'计算机'),(2,'网络');

/*Table structure for table `edoc_entry` */

DROP TABLE IF EXISTS `edoc_entry`;

CREATE TABLE `edoc_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `uploaduser` varchar(20) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `edoc_entry_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `edoc_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `edoc_entry` */

insert  into `edoc_entry`(`id`,`categoryId`,`title`,`summary`,`uploaduser`,`createdate`) values (1,1,'java','啊啊啊啊啊','小l','2018-07-24 00:00:00'),(2,2,'运维','1111','小李','2018-07-24 14:16:49'),(5,2,'嗖嗖','嗖嗖','嗖嗖','2010-03-03 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
