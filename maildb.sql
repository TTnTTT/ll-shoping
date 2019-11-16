# Host: localhost  (Version 5.1.42-community)
# Date: 2019-11-16 21:25:00
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "goods"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

INSERT INTO `goods` VALUES (17,'好衣服',3,998,9.9,'不褪色','广东',555,0,'9.jpg',1),(20,'英国进口猕猴桃',5,39,9.7,'垃圾手机','英国',4309,0,'8.jpg',1),(23,'iPhone 8 plus',6,2999,5,'防摔放水','美国',520,0,'5.jpg',1),(24,'VIVO X20',6,1998,8,'便宜','重庆',1022,0,'6.jpg',6),(25,'新奇士黑标晚熟脐橙',5,47.8,0.89,'生鲜进口水果，单果约160-190g','新奇士',999,0,'1.jpg',8),(26,'精品国产车厘子',5,59.9,0.99,'新鲜水果','佳沛',999,0,'8.jpg',5),(27,'华为 p30',6,3999,9,'好手机','深圳',1200,0,'7.jpg',6),(28,'潮流时尚短裤',4,99,5,'裤子好看','重庆',9000,0,'11.jpg',5),(29,'草鞋',1,88,6,'哇','重庆',888,0,'12.jpg',5),(30,'QQ',5,5445,12,'12','21',11,0,'',6);

#
# Structure for table "goods_type"
#

CREATE TABLE `goods_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL DEFAULT 'wu',
  `type_desc` varchar(255) NOT NULL DEFAULT 'wu',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

#
# Data for table "goods_type"
#

INSERT INTO `goods_type` VALUES (1,'鞋子','穿脚上'),(3,'衣服','穿身上'),(4,'裤子','穿'),(5,'水果','吃的'),(6,'手机','好玩');

#
# Structure for table "order_detail"
#

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `good_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `good_price` float(10,2) NOT NULL DEFAULT '0.00',
  `qty` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_detail_id`),
  KEY `good_id` (`good_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

#
# Data for table "order_detail"
#

INSERT INTO `order_detail` VALUES (1,1,17,0.00,1),(2,1,18,0.00,1),(15,29,17,50.00,1),(16,29,23,1999.00,1),(17,29,20,9998.00,1),(18,30,17,50.00,1),(19,30,23,1999.00,1),(20,30,20,9998.00,1),(21,31,17,50.00,1),(22,32,17,50.00,1),(23,33,17,50.00,1),(24,33,19,9999.00,1),(25,34,17,25.00,1),(26,35,17,25.00,1),(27,36,24,1998.00,1),(28,37,17,25.00,1),(29,37,19,21.00,1),(30,37,24,1998.00,1),(31,38,18,28.00,1),(32,39,19,21.00,1),(33,39,20,39.00,1),(34,39,23,2999.00,1),(35,40,17,998.00,1),(36,40,23,2999.00,1),(37,41,17,998.00,1),(38,42,17,998.00,1),(39,43,17,998.00,1),(40,43,20,39.00,1);

#
# Structure for table "orders"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (1,'2019-6-25 9:27:24','重庆市黔江区','马云','798879',54.00,'','已支付','54',4),(29,'2019-6-26 11:17:6','重庆市黔江区里水镇','马化腾','11111',12297.00,'','未支付','看我',4),(30,'2019-6-26 11:34:52','重庆','马云','11111',22295.00,'','已支付','无',4),(31,'2019-6-26 16:54:7','1','1','1',50.00,'','未支付','1',4),(32,'2019-6-26 17:48:34','1','1','1',50.00,'','未支付','1',4),(33,'2019-6-26 18:53:59','北京东城','马冬梅','11111',10099.00,'','未支付','无',2),(34,'2019-6-26 22:29:34','西藏','小明','999999',25.00,'','未支付','顺丰',11),(35,'2019-6-26 22:38:9','贵州都匀','花花','999999',25.00,'','已支付','999',11),(36,'2019-6-26 22:42:22','西藏','刘强东','11111',1998.00,'','已支付','1',2),(37,'2019-6-26 22:44:47','重庆巴南','我','123456',2094.00,'','已支付','1',2),(38,'2019-6-26 22:49:47','测','测试','12',28.00,'','已支付','1',5),(39,'2019-6-27 9:14:3','重庆工程学院','吱吱','409313',3059.00,'','已支付','一定要包装好哦！',10),(40,'2019-6-28 8:50:28','重庆','小明','1',4995.00,'','已支付','1',5),(41,'2019-6-28 9:4:30','2','2','2',998.00,'','已支付','2',5),(42,'2019-6-28 9:58:38','重庆市黔江区里水镇','HH','1',3992.00,'','已支付','1',5),(43,'2019-9-26 10:41:13','是','哈哈','12222',1037.00,'','未支付','21',11);

#
# Structure for table "shopcar"
#

CREATE TABLE `shopcar` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `good_id` int(11) NOT NULL DEFAULT '0',
  `counts` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`car_id`),
  KEY `user_id` (`user_id`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='购物车';

#
# Data for table "shopcar"
#

INSERT INTO `shopcar` VALUES (17,2,19,2),(19,4,20,1),(23,2,24,1),(25,10,19,2),(26,10,20,1),(28,5,17,2),(29,11,17,1),(30,11,20,1);

#
# Structure for table "store"
#

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(20) NOT NULL DEFAULT 'wu',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `store_desc` varchar(255) NOT NULL DEFAULT 'wu',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='店家表';

#
# Data for table "store"
#

INSERT INTO `store` VALUES (1,'小店',2,'卖衣服'),(5,'坚果',4,'哈哈'),(6,'手机专卖店',2,'卖最便宜的手机'),(7,'小米专卖店',2,'只性价比'),(8,'章鱼家',4,'专卖新鲜的水果'),(9,'我',5,'我');

#
# Structure for table "userinfo"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "userinfo"
#

INSERT INTO `userinfo` VALUES (2,'哈哈','e10adc3949ba59abbe56e057f20f883e','123456789','0','小明','1792323454','1'),(4,'嘿嘿','e10adc3949ba59abbe56e057f20f883e','123456789','1','小李','1524156464','1'),(5,'普通用户','e10adc3949ba59abbe56e057f20f883e','2632783534@qq.com','1','丽丽','1521323323','0'),(10,'普通用户2','e10adc3949ba59abbe56e057f20f883e','2632783534@qq.com','1','花花','17345565654','0'),(11,'admin','e10adc3949ba59abbe56e057f20f883e','226264565@qq.com','1','大哥','15212333333','2'),(12,'普通用户1','e10adc3949ba59abbe56e057f20f883e','1092197230@qq.com','1','吱吱','18716278888','0');
