# MySQL-Front 5.1  (Build 2.7)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: maildb
# ------------------------------------------------------
# Server version 5.1.42-community

DROP DATABASE IF EXISTS `maildb`;
CREATE DATABASE `maildb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `maildb`;

#
# Source for table goods
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(30) NOT NULL DEFAULT 'wu',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '外联商品类型表',
  `good_price` float NOT NULL DEFAULT '0',
  `good_discount` float DEFAULT '0',
  `good_desc` text,
  `supplier` varchar(30) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `ispreferred` int(11) NOT NULL DEFAULT '0' COMMENT '1：推荐商品 0:不推荐商品',
  `good_pic` varchar(50) NOT NULL DEFAULT 'wu',
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`good_id`),
  KEY `type_id` (`type_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Source for table goods_type
#

DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL DEFAULT 'wu',
  `type_desc` varchar(255) NOT NULL DEFAULT 'wu',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

#
# Source for table order_detail
#

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `good_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `good_price` float(10,2) NOT NULL DEFAULT '0.00',
  `qty` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_detail_id`),
  KEY `good_id` (`good_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

#
# Source for table orders
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(50) NOT NULL DEFAULT '',
  `contactman` varchar(20) NOT NULL DEFAULT '',
  `postcode` varchar(15) DEFAULT '',
  `orderSum` float(10,2) NOT NULL DEFAULT '0.00',
  `dealDate` varchar(20) DEFAULT '',
  `statuss` varchar(15) NOT NULL DEFAULT '未支付',
  `note` varchar(255) DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# Source for table shopcar
#

DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `good_id` int(11) NOT NULL DEFAULT '0',
  `counts` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`car_id`),
  KEY `user_id` (`user_id`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='购物车';

#
# Source for table store
#

DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(20) NOT NULL DEFAULT 'wu',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `store_desc` varchar(255) NOT NULL DEFAULT 'wu',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='店家表';

#
# Source for table userinfo
#

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(35) NOT NULL DEFAULT '',
  `email` varchar(20) NOT NULL DEFAULT '',
  `gender` varchar(3) NOT NULL DEFAULT '' COMMENT '性别：0女 1男',
  `realname` varchar(20) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `user_type` varchar(3) NOT NULL DEFAULT '0' COMMENT '用户类别：0普通用户 1卖家 2管理员',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
#  Foreign keys for table goods
#

ALTER TABLE `goods`
ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `goods_type` (`type_id`),
ADD CONSTRAINT `goods_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

#
#  Foreign keys for table order_detail
#

ALTER TABLE `order_detail`
ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`),
ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

#
#  Foreign keys for table orders
#

ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`);

#
#  Foreign keys for table shopcar
#

ALTER TABLE `shopcar`
ADD CONSTRAINT `shopcar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`),
ADD CONSTRAINT `shopcar_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`);


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
