/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.17-log : Database - db_client_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_client_manage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_client_manage`;

/*Table structure for table `t_card_bill` */

DROP TABLE IF EXISTS `t_card_bill`;

CREATE TABLE `t_card_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) DEFAULT NULL,
  `clientName` varchar(50) DEFAULT NULL,
  `carno` varchar(100) DEFAULT NULL,
  `actual` decimal(10,2) DEFAULT NULL,
  `discounts` decimal(10,0) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_card_bill` */

insert  into `t_card_bill`(`id`,`clientId`,`clientName`,`carno`,`actual`,`discounts`,`money`,`balance`,`type`,`remark`,`createDateTime`,`createUserId`) values (1,2,'小明','1001','1000.00','100','1100.00','1100.00',1,'','2018-05-06 14:19:04',3),(2,2,'小明','1001',NULL,NULL,'10.00','1090.00',2,'','2018-05-06 14:20:14',3),(3,2,'小明','1001',NULL,NULL,'52.00','1038.00',2,'做了 美容','2018-05-06 14:20:55',3),(4,2,'小明','1001',NULL,NULL,'12.00','1026.00',2,'做了美甲','2018-05-06 14:21:06',3);

/*Table structure for table `t_client` */

DROP TABLE IF EXISTS `t_client`;

CREATE TABLE `t_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carno` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `clientTypeId` int(11) DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carno_only_one` (`carno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_client` */

insert  into `t_client`(`id`,`carno`,`name`,`sex`,`phone`,`address`,`balance`,`createDateTime`,`remark`,`clientTypeId`,`createUserId`) values (2,'1001','小明',2,'18337537525','1212','1026.00','2018-05-06 14:18:38','12',3,3),(3,'10012','1',2,'','1','50.00','2018-05-06 14:28:22','',3,3);

/*Table structure for table `t_client_type` */

DROP TABLE IF EXISTS `t_client_type`;

CREATE TABLE `t_client_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_client_type` */

insert  into `t_client_type`(`id`,`order_`,`name`) values (3,1,'普通客户'),(4,2,'5折客户');

/*Table structure for table `t_config` */

DROP TABLE IF EXISTS `t_config`;

CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(100) DEFAULT NULL,
  `web_site` varchar(200) DEFAULT NULL,
  `headStr` text,
  `layuiStr` text,
  `init_money` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_config` */

insert  into `t_config`(`id`,`domain_name`,`web_site`,`headStr`,`layuiStr`,`init_money`) values (1,'客户管理系统','http://www.###.com','<!-- 强制  高速模式 渲染网页    -->\n<meta NAME=”renderer” content=”webkit”>\n<!-- 强制  高速模式 渲染网页    -->\n\n<link href=\"/static/favicon.ico\" rel=\"shortcut icon\" />\n\n<!--添加  jq  支持加载-->\n<script	src=\"/static/easy-ui/jquery.min.js\"></script>\n<!--添加  jq  支持加载-->','<!--添加 layui  支持加载-->\n<link rel=\"stylesheet\"	href=\"/static/layui-v2.2.5/layui/css/layui.css\">\n<script	src=\"/static/layui-v2.2.5/layui/layui.js\"></script>\n<!--添加 layui  支持加载-->',0);

/*Table structure for table `t_tree` */

DROP TABLE IF EXISTS `t_tree`;

CREATE TABLE `t_tree` (
  `id` int(11) DEFAULT NULL,
  `text` varchar(46) DEFAULT NULL,
  `father` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `state` varchar(46) DEFAULT NULL,
  `iconCls` varchar(46) DEFAULT NULL,
  `permissions` varchar(100) DEFAULT NULL,
  `dd_id` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_tree` */

insert  into `t_tree`(`id`,`text`,`father`,`url`,`state`,`iconCls`,`permissions`,`dd_id`) values (99,'权限设置',-1,NULL,'close',NULL,NULL,NULL),(6,'辅助功能',-1,NULL,'close',NULL,NULL,NULL),(61010,'用户管理',6,'/houtai/user/manage','opend','&#xe63c;',NULL,'clientType'),(17,'客户',-1,NULL,'close',NULL,NULL,NULL),(171005,'客户管理',17,'/houtai/client/manage','opend','&#xe612;',NULL,'client'),(171000,'客户类型',17,'/houtai/clientType/manage','opend','&#xe612;',NULL,'clienttype'),(171009,'客户储值记录',17,'/houtai/deposit/trade/manage','opend','&#xe612;',NULL,'DepositTrade'),(171011,'客户消费记录',17,'/houtai/consumption/manage','opend','&#xe612;',NULL,'consumption'),(61015,'网站配置',6,'/houtai/config/manage','opend','&#xe612;',NULL,'config');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(46) DEFAULT NULL,
  `password` varchar(46) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `menuIds` varchar(1000) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `trueName` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weiyi` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`name`,`password`,`createDateTime`,`menuIds`,`ip`,`remark`,`trueName`) values (3,'admin','57c7a3454c5abb7e8f92a20b687d638a','2017-05-10 11:25:32','6,61010,61015,17,171000,171005,171009,171011','192.168.1.55','12','陈豪');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
