/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - diannaoyingjian
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`diannaoyingjian` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `diannaoyingjian`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/gongchengcailiao/upload/1614999756013.jpg'),(2,'picture2','http://localhost:8080/gongchengcailiao/upload/1614999769770.jpg'),(3,'picture3','http://localhost:8080/gongchengcailiao/upload/1614999778981.jpg'),(6,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-04-01 10:22:22'),(2,'sex_types','性别',2,'女',NULL,'2021-04-01 10:22:22'),(3,'goods_types','硬件类型名称',1,'CPU',NULL,'2021-04-01 10:22:22'),(4,'goods_types','硬件类型名称',2,'主板',NULL,'2021-04-01 10:22:22'),(5,'goods_types','硬件类型名称',3,'内存',NULL,'2021-04-01 10:22:22'),(6,'goods_types','硬件类型名称',4,'电源',NULL,'2021-04-01 10:22:22'),(7,'order_types','订单类型',1,'出库',NULL,'2021-04-01 10:22:22'),(8,'order_types','订单类型',2,'入库',NULL,'2021-04-01 10:22:22'),(9,'caozuo_types','操作类型',1,'已操作',NULL,'2021-04-01 10:22:23'),(10,'caozuo_types','操作类型',2,'未操作',NULL,'2021-04-01 10:22:23'),(11,'goods_types','硬件类型名称',5,'显示器',NULL,'2021-04-01 11:26:32');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '硬件名称 Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '硬件类型  Search111 ',
  `goods_number` int(11) DEFAULT NULL COMMENT '硬件数量  Search111 ',
  `goods_photo` varchar(200) DEFAULT NULL COMMENT '硬件图片',
  `danwei` varchar(200) DEFAULT NULL COMMENT '单位',
  `danjia` decimal(10,2) DEFAULT NULL COMMENT '单价 Search111 ',
  `goods_content` varchar(200) DEFAULT NULL COMMENT '硬件详情',
  `flag` int(11) DEFAULT NULL COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='硬件';

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_name`,`goods_types`,`goods_number`,`goods_photo`,`danwei`,`danjia`,`goods_content`,`flag`,`create_time`) values (1,'黑暗骑士650DK 电脑电源',4,0,'http://localhost:8080/diannaoyingjian/file/download?fileName=1617244433065.jpg','个','159.00','物资详情1\r\n',1,'2021-04-01 10:34:38'),(2,'英特尔（Intel）i5-10400F 6核12线程 盒装CPU处理器',1,14,'http://localhost:8080/diannaoyingjian/file/download?fileName=1617244834876.jpg','个','1049.00','物资详情2\r\n',1,'2021-04-01 10:35:35'),(3,'华硕（ASUS）TUF GAMING B460M-PLUS (WI-FI)重炮手主板 支持 CPU 10500/10400（Intel B460/LGA 1200）',2,3,'http://localhost:8080/diannaoyingjian/file/download?fileName=1617245172134.jpg','个','839.00','物资详情\r\n',1,'2021-04-01 10:46:18'),(4,'光威（Gloway）8GB DDR4 3000 台式机内存条 弈Pro系列 长鑫颗粒/国产颗粒',3,2,'http://localhost:8080/diannaoyingjian/file/download?fileName=1617245217707.jpg','个','269.00','物资详情\r\n',1,'2021-04-01 10:47:12'),(5,'显示器1',5,10,'http://localhost:8080/diannaoyingjian/file/download?fileName=1617247630950.jpg','个','1000.01','物资详情\r\n',1,'2021-04-01 11:27:04');

/*Table structure for table `in_out_order` */

DROP TABLE IF EXISTS `in_out_order`;

CREATE TABLE `in_out_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_name` varchar(200) DEFAULT NULL COMMENT '订单名  Search111 ',
  `caozuo_name` varchar(200) DEFAULT NULL COMMENT '操作人姓名  Search111 ',
  `caozuo_table` varchar(200) DEFAULT NULL COMMENT '操作人所在表名',
  `order_types` int(11) DEFAULT NULL COMMENT '类型  Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '出入库时间  Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='出入库订单';

/*Data for the table `in_out_order` */

insert  into `in_out_order`(`id`,`order_name`,`caozuo_name`,`caozuo_table`,`order_types`,`insert_time`,`create_time`) values (1,'123','admin','users',2,'2021-04-01 10:42:17','2021-04-01 10:42:17'),(2,'21','admin','users',2,'2021-04-01 11:13:54','2021-04-01 11:13:54'),(3,'购买10台显示器','admin','users',2,'2021-04-01 11:27:48','2021-04-01 11:27:48'),(4,'出库5个黑暗骑士电源','admin','users',1,'2021-04-01 11:28:44','2021-04-01 11:28:44');

/*Table structure for table `in_out_order_list` */

DROP TABLE IF EXISTS `in_out_order_list`;

CREATE TABLE `in_out_order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `in_out_order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '硬件表id',
  `order_number` int(11) DEFAULT NULL COMMENT '数量  Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='出入库订单详情';

/*Data for the table `in_out_order_list` */

insert  into `in_out_order_list`(`id`,`in_out_order_id`,`goods_id`,`order_number`,`create_time`) values (1,1,2,10,'2021-04-01 10:42:17'),(2,2,1,5,'2021-04-01 11:13:54'),(3,2,2,4,'2021-04-01 11:13:54'),(4,2,3,3,'2021-04-01 11:13:54'),(5,2,4,2,'2021-04-01 11:13:54'),(6,3,5,10,'2021-04-01 11:27:48'),(7,4,1,5,'2021-04-01 11:28:44');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','p531s2074edilvdr065jstcni1i6rs8g','2021-04-01 10:26:06','2021-04-01 12:24:20'),(2,1,'111','yonghu','用户','p5kpg3imm47g64uhwczee4z8s9cequc8','2021-04-01 11:15:59','2021-04-01 12:15:59'),(3,4,'333','yonghu','用户','5qyqq06ihmbzj5b3gemyy1xzwtt0aqff','2021-04-01 11:29:21','2021-04-01 12:29:21');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-25 15:59:12');

/*Table structure for table `xitonggonggao` */

DROP TABLE IF EXISTS `xitonggonggao`;

CREATE TABLE `xitonggonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题 Search',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` longtext COMMENT '内容',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

/*Data for the table `xitonggonggao` */

insert  into `xitonggonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`riqi`) values (1,'2021-04-01 10:22:22','日常公告','日常公告','公告信息','2021-04-01 10:22:22'),(2,'2021-04-01 10:22:22','紧急公告','紧急公告','公告信息','2021-04-01 10:22:22'),(3,'2021-04-01 10:22:22','其他公告','其他公告','公告信息','2021-04-01 10:22:22');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称  Search111',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(4) DEFAULT NULL COMMENT '性别  Search111',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `id_number` varchar(255) DEFAULT NULL COMMENT '身份证',
  `role` varchar(255) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`name`,`username`,`password`,`img_photo`,`sex_types`,`phone`,`id_number`,`role`) values (1,'小金','111','111','http://localhost:8080/diannaoyingjian/file/download?fileName=1617244973709.jpg',1,'17796312333','410882200011231234','用户'),(2,'小札','222','222','http://localhost:8080/diannaoyingjian/file/download?fileName=1617244960570.jpg',2,'17754548971','410882200011274855','用户'),(4,'小张','333','123456','http://localhost:8080/diannaoyingjian/file/download?fileName=1617247504484.jpg',1,'17754543221','410882200011273255','用户');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
