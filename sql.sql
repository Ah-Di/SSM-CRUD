/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.39 : Database - ssm_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_crud` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_crud`;

/*Table structure for table `tb_department` */

DROP TABLE IF EXISTS `tb_department`;

CREATE TABLE `tb_department` (
  `dep_id` int(32) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_department` */

insert  into `tb_department`(`dep_id`,`dep_name`) values (1,'开发部'),(2,'测试部');

/*Table structure for table `tb_employees` */

DROP TABLE IF EXISTS `tb_employees`;

CREATE TABLE `tb_employees` (
  `emp_id` int(32) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `d_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `tb_employees_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `tb_department` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=utf8;

/*Data for the table `tb_employees` */

insert  into `tb_employees`(`emp_id`,`emp_name`,`gender`,`mail`,`d_id`) values (1156,'adeadea','男','12312@ada.com',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
