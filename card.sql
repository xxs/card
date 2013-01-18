/*
Navicat MySQL Data Transfer

Source Server         : JTM
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : card

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2013-01-18 17:31:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `xx_admin`
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin`;
CREATE TABLE `xx_admin` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_account_enabled` bit(1) NOT NULL,
  `is_account_expired` bit(1) NOT NULL,
  `is_account_locked` bit(1) NOT NULL,
  `is_credentials_expired` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin
-- ----------------------------
INSERT INTO `xx_admin` VALUES ('0731dcsoft2010031200000000000017', '2011-01-01 00:00:00', '2013-01-18 17:13:30', '技术部', 'xxs@163.com', '', '', '', '', '2012-12-17 14:28:34', '2013-01-18 17:13:30', '0', '127.0.0.1', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- ----------------------------
-- Table structure for `xx_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin_role`;
CREATE TABLE `xx_admin_role` (
  `admin_set_id` varchar(32) NOT NULL,
  `role_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`admin_set_id`,`role_set_id`),
  KEY `fk_role_admin_set` (`role_set_id`),
  KEY `fk_admin_role_set` (`admin_set_id`),
  CONSTRAINT `fk_admin_role_set` FOREIGN KEY (`admin_set_id`) REFERENCES `xx_admin` (`id`),
  CONSTRAINT `fk_role_admin_set` FOREIGN KEY (`role_set_id`) REFERENCES `xx_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin_role
-- ----------------------------
INSERT INTO `xx_admin_role` VALUES ('0731dcsoft2010031200000000000017', '0731dcsoft2010031200000000000016');
INSERT INTO `xx_admin_role` VALUES ('0731dcsoft2010031200000000000017', '4028bc743ac000ea013ac00bc68c0000');

-- ----------------------------
-- Table structure for `xx_article`
-- ----------------------------
DROP TABLE IF EXISTS `xx_article`;
CREATE TABLE `xx_article` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `hits` int(11) NOT NULL,
  `html_path` varchar(255) NOT NULL,
  `is_publication` bit(1) NOT NULL,
  `is_recommend` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `page_count` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `article_category_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_article_category` (`article_category_id`),
  CONSTRAINT `fk_article_article_category` FOREIGN KEY (`article_category_id`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article
-- ----------------------------
INSERT INTO `xx_article` VALUES ('4028bc743bbb05c2013bbb2611650002', '2012-12-21 09:48:52', '2012-12-21 09:48:52', 'xxs', '新手上路', '0', '/html/201212/62ec638c2cc94115a783d57dc3e995f8.html', '', '', '', '新手上路', '新手上路', '1', '新手上路', '4028bc743bbb05c2013bbb25d49a0000');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a2d78b0011', '2013-01-11 16:03:46', '2013-01-11 16:18:33', '成功案例', '成功案例', '6', '/html/201301/03754c8fbedf44e3bbd277e0b3dfc2d1.html', '', '', '', '成功案例', '成功案例', '1', '成功案例', '4028bc743c286bdc013c289277c5000a');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a30f250013', '2013-01-11 16:04:00', '2013-01-11 16:04:00', '联系我们', '联系我们', '0', '/html/201301/8c73cc996c5240bc9e97cc40e4850266.html', '', '', '', '联系我们', '联系我们', '1', '联系我们', '4028bc743c286bdc013c28900dbb0008');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a4128c0015', '2013-01-11 16:05:06', '2013-01-11 16:05:06', '新手上路', '新手上路', '0', '/html/201301/ad975ce72b7c483b94245d4e21d0ecb4.html', '', '', '', '新手上路', '新手上路', '1', '新手上路', '4028bc743bbb05c2013bbb25d49a0000');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a44e8b0017', '2013-01-11 16:05:22', '2013-01-11 16:05:22', '收卡价格', '收卡价格', '0', '/html/201301/597c10bdbaf04f75a6c676128226ddf9.html', '', '', '', '收卡价格', '收卡价格', '1', '收卡价格', '4028bc743c286bdc013c288e82b60002');

-- ----------------------------
-- Table structure for `xx_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `xx_article_category`;
CREATE TABLE `xx_article_category` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `path` longtext NOT NULL,
  `sign` varchar(255) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`),
  KEY `fk_article_category_parent` (`parent_id`),
  CONSTRAINT `fk_article_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article_category
-- ----------------------------
INSERT INTO `xx_article_category` VALUES ('4028bc743bbb05c2013bbb25d49a0000', '2012-12-21 09:48:36', '2012-12-21 09:48:36', '0', '新手上路', '新手上路', '新手上路', '1', '4028bc743bbb05c2013bbb25d49a0000', 'xs', null);
INSERT INTO `xx_article_category` VALUES ('4028bc743c286bdc013c288e82b60002', '2013-01-11 15:41:33', '2013-01-11 15:41:33', '0', '收卡价格', '收卡价格', '收卡价格', '2', '4028bc743c286bdc013c288e82b60002', 'price', null);
INSERT INTO `xx_article_category` VALUES ('4028bc743c286bdc013c288f326e0004', '2013-01-11 15:42:18', '2013-01-11 15:42:18', '0', '名臣公益', '名臣公益', '名臣公益', '3', '4028bc743c286bdc013c288f326e0004', 'gy', null);
INSERT INTO `xx_article_category` VALUES ('4028bc743c286bdc013c288f930c0006', '2013-01-11 15:42:43', '2013-01-11 15:42:43', '0', '交易保障', '交易保障', '交易保障', '4', '4028bc743c286bdc013c288f930c0006', 'bz', null);
INSERT INTO `xx_article_category` VALUES ('4028bc743c286bdc013c28900dbb0008', '2013-01-11 15:43:14', '2013-01-11 15:43:14', '0', '关于我们', '关于我们', '关于我们', '5', '4028bc743c286bdc013c28900dbb0008', 'us', null);
INSERT INTO `xx_article_category` VALUES ('4028bc743c286bdc013c289277c5000a', '2013-01-11 15:45:53', '2013-01-11 15:45:53', '0', '成功案例', '成功案例', '成功案例', '7', '4028bc743c286bdc013c289277c5000a', 'su', null);

-- ----------------------------
-- Table structure for `xx_brand`
-- ----------------------------
DROP TABLE IF EXISTS `xx_brand`;
CREATE TABLE `xx_brand` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `introduction` longtext,
  `logo_path` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_brand
-- ----------------------------
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88a15b0f0001', '2012-10-22 21:20:06', '2013-01-16 13:17:10', '', '/upload/image/201301/8b44c616b14747eb98d07e9862edf171.gif', '骏网一卡通', '1', 'http://127.0.0.1:8080/card/cards!detail.action');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ac6eb10002', '2012-10-22 21:32:12', '2013-01-16 13:18:07', '', '/upload/image/201301/b91d11e3a7224dd28a46c26858b84e65.gif', '盛大卡', '2', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88aca0800003', '2012-10-22 21:32:25', '2012-10-31 11:50:16', null, '', '神州行', '3', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acc1ef0004', '2012-10-22 21:32:34', '2012-10-31 11:50:55', null, '', '征途卡', '4', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acef930005', '2012-10-22 21:32:45', '2012-10-22 21:32:45', null, '', 'Q币卡', '5', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad18e10006', '2012-10-22 21:32:56', '2012-10-22 21:32:56', null, '', '联通卡', '6', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad3c100007', '2012-10-22 21:33:05', '2012-10-22 21:33:05', null, '', '久游卡', '7', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad61df0008', '2012-10-22 21:33:15', '2012-10-22 21:33:15', null, '', '易宝e卡通', '8', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad845a0009', '2012-10-22 21:33:23', '2012-10-22 21:33:23', null, '', '网易卡', '9', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ada7f6000a', '2012-10-22 21:33:33', '2012-10-22 21:33:33', null, '', '完美卡', '10', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88add167000b', '2012-10-22 21:33:43', '2012-10-22 21:33:43', null, '', '搜狐卡', '11', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae0511000c', '2012-10-22 21:33:56', '2012-10-22 21:33:56', null, '', '电信卡', '12', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae29c8000d', '2012-10-22 21:34:06', '2012-10-22 21:34:06', null, '', '纵游一卡通', '13', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae4be5000e', '2012-10-22 21:34:15', '2012-10-22 21:34:15', null, '', '天下一卡通', '14', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae757d000f', '2012-10-22 21:34:25', '2012-10-22 21:34:25', null, '', '天宏一卡通', '15', '');

-- ----------------------------
-- Table structure for `xx_cards`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards`;
CREATE TABLE `xx_cards` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `cards_image_store` longtext,
  `cards_sn` varchar(255) NOT NULL,
  `html_path` varchar(255) NOT NULL,
  `introduction` longtext,
  `is_best` bit(1) NOT NULL,
  `is_hot` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `is_new` bit(1) NOT NULL,
  `is_specification_enabled` bit(1) NOT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `score` int(11) NOT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cards_sn` (`cards_sn`),
  KEY `fk_cards_brand` (`brand_id`),
  CONSTRAINT `fk_cards_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards
-- ----------------------------
INSERT INTO `xx_cards` VALUES ('4028bc743bb6fee6013bb755fd4b0001', '2012-12-20 16:02:44', '2013-01-16 20:49:41', null, 'SN_B4A01EABE4F9', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡', '', '', '', '', '', 'Q币卡', 'Q币卡', '腾讯Q币卡', '5.00000', '0', '8ae4839c3a887878013a88acef930005');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c51dac90001', '2013-01-15 11:47:42', '2013-01-16 20:37:30', null, 'SN_D0126B004D0A', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '', '', '', '', '', '', '移动充值卡', '移动充值卡', '移动充值卡', '10.00000', '0', '8ae4839c3a887878013a88aca0800003');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5692200004', '2013-01-15 11:52:52', '2013-01-16 20:35:41', null, 'SN_F42E3ABC8BA1', '/html/201301/ab78d5c8c64443b5a8784e4462d4dd35.html', '', '', '', '', '', '', '联通充值卡', '联通充值卡', '联通充值卡', '20.00000', '0', '8ae4839c3a887878013a88ad18e10006');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c56fe760007', '2013-01-15 11:53:19', '2013-01-16 20:34:47', null, 'SN_18971B95668C', '/html/201301/a880c53a0504406c827c97f6d0b8558a.html', '', '', '', '', '', '', '电信充值卡', '电信充值卡', '电信充值卡', '50.00000', '0', '8ae4839c3a887878013a88ae0511000c');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c573891000a', '2013-01-15 11:53:34', '2013-01-17 11:11:43', null, 'SN_CAFA738E7712', '/html/201301/9a846286bb924d2e949e20fc7df3fcad.html', '', '', '', '', '', '', '骏网一卡通', '骏网一卡通', '骏网一卡通', '5.00000', '0', '8ae4839c3a887878013a88a15b0f0001');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5794ea000d', '2013-01-15 11:53:58', '2013-01-16 20:32:59', null, 'SN_9CA2F3FF4FC1', '/html/201301/ee17750e915c4a23ac5b1ae6f89b9c23.html', '', '', '', '', '', '', '盛大一卡通', '盛大一卡通', '盛大一卡通', '5.00000', '0', '8ae4839c3a887878013a88ac6eb10002');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c57dd7c0010', '2013-01-15 11:54:16', '2013-01-16 20:31:24', null, 'SN_D6018790CFE4', '/html/201301/926981d5c75c48788b3898c046ab1bca.html', '', '', '', '', '', '', '巨人(征途)一卡通', '巨人(征途)一卡通', '巨人(征途)一卡通', '5.00000', '0', '8ae4839c3a887878013a88acc1ef0004');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c58d71e0015', '2013-01-15 11:55:20', '2013-01-16 20:28:03', null, 'SN_9D312A3C7C81', '/html/201301/0b9d62c35e0643ada94b738b8e5d7ce9.html', '', '', '', '', '', '', '易宝e卡通', '易宝e卡通', '易宝e卡通', '2.00000', '0', '8ae4839c3a887878013a88ad61df0008');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5902060018', '2013-01-15 11:55:31', '2013-01-16 20:24:15', null, 'SN_E3D0639EC16F', '/html/201301/dd567ea9ba4e403e88812119dafad952.html', '', '', '', '', '', '', '完美一卡通', '完美一卡通', '完美一卡通', '15.00000', '0', '8ae4839c3a887878013a88ada7f6000a');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c593eb2001b', '2013-01-15 11:55:47', '2013-01-16 20:23:13', null, 'SN_B40AECA9CBB7', '/html/201301/8e4cccc882af4937bc899c21ef29d6de.html', '', '', '', '', '', '', '搜狐一卡通', '搜狐一卡通', '搜狐一卡通', '5.00000', '0', '8ae4839c3a887878013a88add167000b');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c597801001e', '2013-01-15 11:56:01', '2013-01-16 19:29:18', null, 'SN_5403A3D0491C', '/html/201301/afecf5917b7943eb8522358dc4995238.html', '', '', '', '', '', '', '天下通一卡通', '天下通一卡通', '天下通一卡通', '5.00000', '0', '8ae4839c3a887878013a88ae4be5000e');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c59ae340021', '2013-01-15 11:56:15', '2013-01-16 19:28:05', null, 'SN_0507F5D87570', '/html/201301/776d2824cf724f4c83fd850a84eddf25.html', '', '', '', '', '', '', '纵游一卡通', '纵游一卡通', '纵游一卡通', '5.00000', '0', '8ae4839c3a887878013a88ae29c8000d');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c59df180024', '2013-01-15 11:56:28', '2013-01-16 19:26:57', null, 'SN_7D6758D39206', '/html/201301/e0b899631c414de1801af4744aa1aebf.html', '', '', '', '', '', '', '天宏一卡通', '天宏一卡通', '天宏一卡通', '5.00000', '0', '8ae4839c3a887878013a88ae757d000f');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5a1c310027', '2013-01-15 11:56:43', '2013-01-16 19:25:07', null, 'SN_402A5B739469', '/html/201301/fd8f77ae780d4887bc79ce2506fb9e42.html', '', '', '', '', '', '', '久游一卡通', '久游一卡通', '久游一卡通', '5.00000', '0', '8ae4839c3a887878013a88ad3c100007');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5a4d05002a', '2013-01-15 11:56:56', '2013-01-16 19:20:18', null, 'SN_9A06259F2474', '/html/201301/744887a269a04ca2b3ce5f234a91443c.html', '', '', '', '', '', '', '网易一卡通', '网易一卡通', '网易一卡通', '10.00000', '0', '8ae4839c3a887878013a88ad845a0009');

-- ----------------------------
-- Table structure for `xx_cards_specification`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards_specification`;
CREATE TABLE `xx_cards_specification` (
  `cards_set_id` varchar(32) NOT NULL,
  `specification_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`cards_set_id`,`specification_set_id`),
  KEY `fk_specification_cards_set` (`specification_set_id`),
  KEY `fk_specification_set` (`cards_set_id`),
  CONSTRAINT `fk_specification_cards_set` FOREIGN KEY (`specification_set_id`) REFERENCES `xx_specification` (`id`),
  CONSTRAINT `fk_specification_set` FOREIGN KEY (`cards_set_id`) REFERENCES `xx_cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_specification
-- ----------------------------
INSERT INTO `xx_cards_specification` VALUES ('4028bc743bb6fee6013bb755fd4b0001', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c51dac90001', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5692200004', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c56fe760007', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c573891000a', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5794ea000d', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c57dd7c0010', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c58d71e0015', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5902060018', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c593eb2001b', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c597801001e', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c59ae340021', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c59df180024', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5a1c310027', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5a4d05002a', '8ae4839c3a887878013a889ad43a0000');

-- ----------------------------
-- Table structure for `xx_deposit`
-- ----------------------------
DROP TABLE IF EXISTS `xx_deposit`;
CREATE TABLE `xx_deposit` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `balance` decimal(19,2) NOT NULL,
  `credit` decimal(19,2) NOT NULL,
  `debit` decimal(19,2) NOT NULL,
  `deposit_type` int(11) NOT NULL,
  `lossrate` decimal(19,2) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deposit_member` (`member_id`),
  CONSTRAINT `fk_deposit_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_deposit
-- ----------------------------
INSERT INTO `xx_deposit` VALUES ('297e62b93bd214af013bd21ef38e0003', '2012-12-25 20:52:22', '2012-12-25 20:52:22', '3000.00', '3000.00', '0.00', '2', null, null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c23b04e013c23b53a850000', '2013-01-10 17:05:45', '2013-01-10 17:05:45', '3400.00', '400.00', '0.00', '2', null, null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c3d7a21013c3d8c3b130002', '2013-01-15 17:31:05', '2013-01-15 17:31:05', '3006.00', '0.00', '44.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c3d7a21013c3d8c5d020003', '2013-01-15 17:31:14', '2013-01-15 17:31:14', '2806.00', '0.00', '200.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c3d7a21013c3d8c6dcb0004', '2013-01-15 17:31:18', '2013-01-15 17:31:18', '2706.00', '0.00', '100.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42bb3d6e0075', '2013-01-16 17:40:32', '2013-01-16 17:40:32', '2361.00', '0.00', '345.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42bb59040076', '2013-01-16 17:40:39', '2013-01-16 17:40:39', '2262.00', '0.00', '99.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42bd8a9a0077', '2013-01-16 17:43:03', '2013-01-16 17:43:03', '2163.00', '0.00', '99.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42be4afc0078', '2013-01-16 17:43:52', '2013-01-16 17:43:52', '2064.00', '0.00', '99.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c3c37f007a', '2013-01-16 17:49:51', '2013-01-16 17:49:51', '2063.00', '0.00', '1.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c48930007c', '2013-01-16 17:50:41', '2013-01-16 17:50:41', '2058.00', '0.00', '5.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c5c52b0082', '2013-01-16 17:52:02', '2013-01-16 17:52:02', '2004.00', '0.00', '54.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c7d5100083', '2013-01-16 17:54:18', '2013-01-16 17:54:18', '2000.00', '0.00', '4.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c86dd50084', '2013-01-16 17:54:57', '2013-01-16 17:54:57', '1957.00', '0.00', '43.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c8b1f20085', '2013-01-16 17:55:14', '2013-01-16 17:55:14', '1924.00', '0.00', '33.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c94f3c0086', '2013-01-16 17:55:54', '2013-01-16 17:55:54', '1922.00', '0.00', '2.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9181263c33448b013c3349d79d0002', '2013-01-13 17:42:22', '2013-01-13 17:42:22', '3230.00', '0.00', '170.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9181263c33448b013c3349f0160003', '2013-01-13 17:42:29', '2013-01-13 17:42:29', '3050.00', '0.00', '180.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');

-- ----------------------------
-- Table structure for `xx_friend_link`
-- ----------------------------
DROP TABLE IF EXISTS `xx_friend_link`;
CREATE TABLE `xx_friend_link` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_friend_link
-- ----------------------------
INSERT INTO `xx_friend_link` VALUES ('4028bc743c286bdc013c288103340000', '2013-01-11 15:26:49', '2013-01-14 20:45:01', '/upload/image/201301/3ebb3ca020924a32a23720f08ffa71da.gif', '移动神州行', '1', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('4028bc743c286bdc013c288156a40001', '2013-01-11 15:27:10', '2013-01-14 20:45:33', '/upload/image/201301/24fe754d4c0c4a72bf5e2ce3c20c7eb3.gif', '中国联通', '2', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c39186c2b0000', '2013-01-14 20:46:07', '2013-01-14 20:46:07', '/upload/image/201301/8ccf5485e6aa48a8b53c380b416cd305.gif', '中国电信', '3', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c3918ab100001', '2013-01-14 20:46:23', '2013-01-14 20:46:23', '/upload/image/201301/a475ace0a6d34428b464bc162ed3afa6.gif', '腾讯一卡通', '4', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c3918fce20002', '2013-01-14 20:46:44', '2013-01-14 20:46:44', '/upload/image/201301/d8f910c2f96e449a8ff19f55490d0c8e.gif', '骏网一卡通', '5', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391932530003', '2013-01-14 20:46:58', '2013-01-14 20:46:58', '/upload/image/201301/280aac66116141cc8401219077193117.gif', '盛大一卡通', '6', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391966480004', '2013-01-14 20:47:11', '2013-01-14 20:47:11', '/upload/image/201301/d467b8d2350f41429ed515a1bd739e68.gif', '搜狐一卡通', '8', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391998db0005', '2013-01-14 20:47:24', '2013-01-14 20:47:24', '/upload/image/201301/ebc9f05cd7cf4e29a967a82d6c0952c1.gif', '网易一卡通', '9', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c3919d7f30006', '2013-01-14 20:47:40', '2013-01-14 20:47:40', '/upload/image/201301/b26219c765a74345b8e8d393dfbe4675.gif', '巨人一卡通', '10', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391a6e070007', '2013-01-14 20:48:18', '2013-01-14 20:48:18', '/upload/image/201301/a5d3567823e2467d8f098a75b19cd0de.gif', '久游一卡通', '11', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391ac1040008', '2013-01-14 20:48:40', '2013-01-14 20:48:40', '/upload/image/201301/6ab9a41718444517bdd623ca6751629c.gif', '完美一卡通', '12', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391b227d0009', '2013-01-14 20:49:05', '2013-01-14 20:49:05', '/upload/image/201301/6e764258aea94225bf8b47ac2dfb3f79.gif', '纵游一卡通', '13', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391bfa06000a', '2013-01-14 20:50:00', '2013-01-14 20:50:00', null, '天下一卡通', '14', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391c3e3e000b', '2013-01-14 20:50:17', '2013-01-14 20:50:17', '/upload/image/201301/761b742bc27344aab9737e7a420e43da.gif', '天宏一卡通', '14', 'http://www.baidu.com');

-- ----------------------------
-- Table structure for `xx_instant_messaging`
-- ----------------------------
DROP TABLE IF EXISTS `xx_instant_messaging`;
CREATE TABLE `xx_instant_messaging` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `instant_messaging_type` int(11) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_instant_messaging
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_leave_message`
-- ----------------------------
DROP TABLE IF EXISTS `xx_leave_message`;
CREATE TABLE `xx_leave_message` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `ip` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `for_leave_message_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_leave_message_for_message` (`for_leave_message_id`),
  CONSTRAINT `fk_leave_message_for_message` FOREIGN KEY (`for_leave_message_id`) REFERENCES `xx_leave_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_leave_message
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_log`
-- ----------------------------
DROP TABLE IF EXISTS `xx_log`;
CREATE TABLE `xx_log` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `action_class` varchar(255) NOT NULL,
  `action_method` varchar(255) NOT NULL,
  `info` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_log
-- ----------------------------
INSERT INTO `xx_log` VALUES ('297e62b93bd214af013bd21a73b40001', '2012-12-25 20:47:27', '2012-12-25 20:47:27', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 112233', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('297e62b93bd214af013bd21ecb720002', '2012-12-25 20:52:11', '2012-12-25 20:52:11', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('297e62b93bd214af013bd21ef4000004', '2012-12-25 20:52:22', '2012-12-25 20:52:22', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bb257ca013bb264d4be0001', '2012-12-19 17:00:50', '2012-12-19 17:00:50', 'net.xxs.action.admin.CardsCategoryAction', 'save', '添加充值卡分类: 222', '127.0.0.1', '添加充值卡分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bb6fee6013bb75600b60004', '2012-12-20 16:02:45', '2012-12-20 16:02:45', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: Q币卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bbb05c2013bbb25d5e20001', '2012-12-21 09:48:37', '2012-12-21 09:48:37', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 新手上路', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bbb05c2013bbb2613390003', '2012-12-21 09:48:52', '2012-12-21 09:48:52', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 新手上路', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c142aaf013c14324c2c0000', '2013-01-07 16:48:26', '2013-01-07 16:48:26', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c1da22d013c1da8d2eb0002', '2013-01-09 12:54:28', '2013-01-09 12:54:28', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100049', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c2281e9013c228868250001', '2013-01-10 11:37:10', '2013-01-10 11:37:10', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100048', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c2399edb10000', '2013-01-10 16:35:55', '2013-01-10 16:35:55', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c239bf44e0001', '2013-01-10 16:38:08', '2013-01-10 16:38:08', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c239c4d6b0002', '2013-01-10 16:38:31', '2013-01-10 16:38:31', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c23a11c310003', '2013-01-10 16:43:46', '2013-01-10 16:43:46', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c23b04e013c23b53ab40001', '2013-01-10 17:05:45', '2013-01-10 17:05:45', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c23b04e013c23b6e3630002', '2013-01-10 17:07:33', '2013-01-10 17:07:33', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c23b04e013c23cd45db0003', '2013-01-10 17:32:00', '2013-01-10 17:32:00', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c288e82f40003', '2013-01-11 15:41:33', '2013-01-11 15:41:33', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 收卡价格', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c288f32fb0005', '2013-01-11 15:42:18', '2013-01-11 15:42:18', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 名臣公益', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c288f935a0007', '2013-01-11 15:42:43', '2013-01-11 15:42:43', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 交易保障', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28900df90009', '2013-01-11 15:43:14', '2013-01-11 15:43:14', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 关于我们', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28927813000b', '2013-01-11 15:45:53', '2013-01-11 15:45:53', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 成功案例', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a2d8d30012', '2013-01-11 16:03:46', '2013-01-11 16:03:46', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 成功案例', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a30ff10014', '2013-01-11 16:04:00', '2013-01-11 16:04:00', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 联系我们', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a413660016', '2013-01-11 16:05:07', '2013-01-11 16:05:07', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 新手上路', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a44f750018', '2013-01-11 16:05:22', '2013-01-11 16:05:22', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 收卡价格', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c50225b0000', '2013-01-15 11:45:50', '2013-01-15 11:45:50', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 腾讯Q币卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c51dc6f0003', '2013-01-15 11:47:43', '2013-01-15 11:47:43', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 移动充值卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5693480006', '2013-01-15 11:52:52', '2013-01-15 11:52:52', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 联通充值卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c57000c0009', '2013-01-15 11:53:20', '2013-01-15 11:53:20', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 电信充值卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5739ba000c', '2013-01-15 11:53:34', '2013-01-15 11:53:34', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 骏网一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c579603000f', '2013-01-15 11:53:58', '2013-01-15 11:53:58', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 盛大一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c57dec40012', '2013-01-15 11:54:17', '2013-01-15 11:54:17', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 巨人(征途)一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c57ff4c0013', '2013-01-15 11:54:25', '2013-01-15 11:54:25', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 巨人(征途)一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c581e4d0014', '2013-01-15 11:54:33', '2013-01-15 11:54:33', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 盛大一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c58d8370017', '2013-01-15 11:55:21', '2013-01-15 11:55:21', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 易宝e卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5903fa001a', '2013-01-15 11:55:32', '2013-01-15 11:55:32', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 完美一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c593fea001d', '2013-01-15 11:55:47', '2013-01-15 11:55:47', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 搜狐一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5979690020', '2013-01-15 11:56:02', '2013-01-15 11:56:02', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 天下通一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c59af5d0023', '2013-01-15 11:56:16', '2013-01-15 11:56:16', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 纵游一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c59e0310026', '2013-01-15 11:56:28', '2013-01-15 11:56:28', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 天宏一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5a1d690029', '2013-01-15 11:56:44', '2013-01-15 11:56:44', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 久游一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5a4e6c002c', '2013-01-15 11:56:56', '2013-01-15 11:56:56', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 网易一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c42784e013c42824ec8000a', '2013-01-16 16:38:21', '2013-01-16 16:38:21', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100080', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c46743a013c467da27a0008', '2013-01-17 11:11:44', '2013-01-17 11:11:44', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 骏网一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba9782e800002', '2012-12-17 23:25:23', '2012-12-17 23:25:23', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 123123', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba97939a00004', '2012-12-17 23:26:32', '2012-12-17 23:26:32', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431697d50005', '2013-01-16 19:20:19', '2013-01-16 19:20:19', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 网易一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431afe23000a', '2013-01-16 19:25:08', '2013-01-16 19:25:08', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 久游一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431cace90012', '2013-01-16 19:26:58', '2013-01-16 19:26:58', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 天宏一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431db6e30019', '2013-01-16 19:28:06', '2013-01-16 19:28:06', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 纵游一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431ed1d90021', '2013-01-16 19:29:18', '2013-01-16 19:29:18', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 天下通一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c43502e7c0028', '2013-01-16 20:23:13', '2013-01-16 20:23:13', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 搜狐一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435120fa002d', '2013-01-16 20:24:15', '2013-01-16 20:24:15', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 完美一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c43549c040039', '2013-01-16 20:28:03', '2013-01-16 20:28:03', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 易宝e卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c4357aeea004c', '2013-01-16 20:31:25', '2013-01-16 20:31:25', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 巨人(征途)一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c43591f4f0055', '2013-01-16 20:32:59', '2013-01-16 20:32:59', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 盛大一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435ac6340058', '2013-01-16 20:34:47', '2013-01-16 20:34:47', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 电信充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435b9980005f', '2013-01-16 20:35:42', '2013-01-16 20:35:42', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 联通充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435d43c10068', '2013-01-16 20:37:31', '2013-01-16 20:37:31', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 移动充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c43653d013c436869520006', '2013-01-16 20:49:41', '2013-01-16 20:49:41', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 腾讯Q币卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae484093bd1e9bd013bd2053e570001', '2012-12-25 20:24:17', '2012-12-25 20:24:17', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100037', '127.0.0.1', '订单完成', 'admin');

-- ----------------------------
-- Table structure for `xx_member`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member`;
CREATE TABLE `xx_member` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `deposit` decimal(15,5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `is_account_enabled` bit(1) NOT NULL,
  `is_account_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `member_attribute_value0` varchar(255) DEFAULT NULL,
  `member_attribute_value1` varchar(255) DEFAULT NULL,
  `member_attribute_value10` varchar(255) DEFAULT NULL,
  `member_attribute_value11` varchar(255) DEFAULT NULL,
  `member_attribute_value12` varchar(255) DEFAULT NULL,
  `member_attribute_value13` varchar(255) DEFAULT NULL,
  `member_attribute_value14` varchar(255) DEFAULT NULL,
  `member_attribute_value15` varchar(255) DEFAULT NULL,
  `member_attribute_value16` varchar(255) DEFAULT NULL,
  `member_attribute_value17` varchar(255) DEFAULT NULL,
  `member_attribute_value18` varchar(255) DEFAULT NULL,
  `member_attribute_value19` varchar(255) DEFAULT NULL,
  `member_attribute_value2` varchar(255) DEFAULT NULL,
  `member_attribute_value3` varchar(255) DEFAULT NULL,
  `member_attribute_value4` varchar(255) DEFAULT NULL,
  `member_attribute_value5` varchar(255) DEFAULT NULL,
  `member_attribute_value6` varchar(255) DEFAULT NULL,
  `member_attribute_value7` varchar(255) DEFAULT NULL,
  `member_attribute_value8` varchar(255) DEFAULT NULL,
  `member_attribute_value9` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password_recover_key` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `register_ip` varchar(255) NOT NULL,
  `safe_answer` varchar(255) DEFAULT NULL,
  `safe_question` varchar(255) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `member_rank_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_member_member_rank` (`member_rank_id`),
  CONSTRAINT `fk_member_member_rank` FOREIGN KEY (`member_rank_id`) REFERENCES `xx_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member
-- ----------------------------
INSERT INTO `xx_member` VALUES ('297e62b93bd214af013bd21a73550000', '2012-12-25 20:47:27', '2013-01-10 16:38:08', '123', '2012-12-27 00:00:00', '0.00000', '123456@qq.com', '0', '', '', null, '2012-12-25 20:47:27', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '123123', '123123', '4297f44b13955235245b2497399d7a93', null, '123123', '123123', '127.0.0.1', null, null, '0', '112233', '123123', '402881833054c381013054d08bed0001');
INSERT INTO `xx_member` VALUES ('8a9182fc3ba86bc8013ba9782de60001', '2012-12-17 23:25:23', '2013-01-18 08:37:12', 'www', '2012-12-20 00:00:00', '1922.00000', '123@qq.com', '0', '', '', null, '2013-01-18 08:37:12', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '123', '123', '4297f44b13955235245b2497399d7a93', null, '123', null, '127.0.0.1', 'www', 'qqq', '0', '123123', '213', '402881833054c381013054d08bed0001');

-- ----------------------------
-- Table structure for `xx_member_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_attribute`;
CREATE TABLE `xx_member_attribute` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `attribute_type` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_required` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `option_store` varchar(255) DEFAULT NULL,
  `order_list` int(11) DEFAULT NULL,
  `property_index` int(11) NOT NULL,
  `system_attribute_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_attribute
-- ----------------------------
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000001', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '姓名', '', '1', '0', '0');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000002', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '性别', '', '2', '1', '1');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000003', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '出生日期', '', '3', '2', '2');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000005', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '地址', '', '4', '3', '3');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000006', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '邮编', '', '5', '4', '4');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000007', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '电话', '', '6', '5', '5');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000008', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '手机', '', '7', '6', '6');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000009', '2011-01-01 00:00:00', '2013-01-10 16:36:05', '0', '', '', '推荐人', null, '8', '7', '7');

-- ----------------------------
-- Table structure for `xx_member_bank`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_bank`;
CREATE TABLE `xx_member_bank` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `bankcity` varchar(255) NOT NULL,
  `bankdetail` varchar(255) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `banknum` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` longtext,
  `openname` varchar(255) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banknum` (`banknum`),
  KEY `fk_member_bank_member` (`member_id`),
  CONSTRAINT `fk_member_bank_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_bank
-- ----------------------------
INSERT INTO `xx_member_bank` VALUES ('4028bc743c27703b013c27741eb80001', '2013-01-11 10:33:07', '2013-01-15 14:01:20', '1112222', '11', '11www', '111', '', null, '1122223333', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_member_bank` VALUES ('4028bc743c27703b013c2776e9be0002', '2013-01-11 10:36:10', '2013-01-11 10:42:40', '354234', '3245234', '12312', '123123', '', null, '121213', '297e62b93bd214af013bd21a73550000');
INSERT INTO `xx_member_bank` VALUES ('4028bc743c278897013c278a9ab30000', '2013-01-11 10:57:40', '2013-01-11 11:04:44', '435645', '35645', '3456345999', '6456', '', null, '34563456', '297e62b93bd214af013bd21a73550000');
INSERT INTO `xx_member_bank` VALUES ('4028bc743c27907a013c27a207a60000', '2013-01-11 11:23:15', '2013-01-15 14:01:20', '897', '8978', '7897', '888', '', null, '7878', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_member_bank` VALUES ('4028bc743c27907a013c27a241630001', '2013-01-11 11:23:30', '2013-01-15 14:01:19', 'et', 'rty', 'ety', '567', '', null, 'rty', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_member_bank` VALUES ('eeee', '2013-01-08 14:25:15', '2013-01-15 14:01:18', '郑州', '中信银行北环路', '中信银行', '1876276253753563', '', null, '123123', '8a9182fc3ba86bc8013ba9782de60001');

-- ----------------------------
-- Table structure for `xx_member_business`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_business`;
CREATE TABLE `xx_member_business` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `business_number` varchar(255) NOT NULL,
  `business_type` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `icp` varchar(255) NOT NULL,
  `link_man` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `server_tel` varchar(255) NOT NULL,
  `server_time` varchar(255) DEFAULT NULL,
  `tel` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `result_type` int(11) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_business_member` (`member_id`),
  CONSTRAINT `fk_member_business_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_business
-- ----------------------------
INSERT INTO `xx_member_business` VALUES ('4028bc743c27ad57013c27bd0f820000', '2013-01-11 11:52:47', '2013-01-11 11:57:35', '3', '4', '2345', '5234', '0', '52435', '2', '3', '3', '234', '2435', '3', '3rrrrr', '3', '245', '5', '8a9182fc3ba86bc8013ba9782de60001', '0', null);
INSERT INTO `xx_member_business` VALUES ('4028bc743c27ad57013c27be71d10001', '2013-01-11 11:54:17', '2013-01-11 11:57:48', 'ert', 'ert11111111', '2345454', '345', '0', 'wret', 'er', 'te', 'ert', '234', 'wer', 'er', 'rt', 'er', 'wtr', 'ert', '297e62b93bd214af013bd21a73550000', '0', null);
INSERT INTO `xx_member_business` VALUES ('aaa', '2013-01-08 21:45:29', '2013-01-08 21:45:35', '44556544', '上海徐汇区', '万和', '384985988774847', '1', '上海', 'g12312', '张先生', '28384783', '陈晨', '文化娱乐', '2883737', '24小时', '123233423', 'www.baidu.com', '340000', '8a9182fc3ba86bc8013ba9782de60001', '1', null);

-- ----------------------------
-- Table structure for `xx_member_rank`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_rank`;
CREATE TABLE `xx_member_rank` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `benefits` double NOT NULL,
  `is_default` bit(1) NOT NULL,
  `lossrate` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `preferential_scale` double NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_rank
-- ----------------------------
INSERT INTO `xx_member_rank` VALUES ('0731dcsoft2010031200000000000010', '2012-12-19 10:52:48', '2012-12-20 16:49:57', '0.01', '', '0.96', '普通会员', '100', '0');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d08bed0001', '2011-01-01 00:00:00', '2012-11-05 09:12:49', '0.01', '', '0.97', '一级会员', '100', '2000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d0bf800002', '2011-01-01 00:00:00', '2012-12-20 16:48:23', '0.01', '', '0.98', '二级会员', '100', '5000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d103ec0003', '2011-01-01 00:00:00', '2012-12-20 16:49:57', '0.01', '', '0.99', '三级会员', '100', '10000');

-- ----------------------------
-- Table structure for `xx_message`
-- ----------------------------
DROP TABLE IF EXISTS `xx_message`;
CREATE TABLE `xx_message` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `content` longtext NOT NULL,
  `delete_status` int(11) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `is_save_draftbox` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `from_member_id` varchar(32) DEFAULT NULL,
  `to_member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_from_member` (`from_member_id`),
  KEY `fk_message_to_member` (`to_member_id`),
  CONSTRAINT `fk_message_from_member` FOREIGN KEY (`from_member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_message_to_member` FOREIGN KEY (`to_member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_message
-- ----------------------------
INSERT INTO `xx_message` VALUES ('4028bc743c1da22d013c1da6a1c30000', '2013-01-09 12:52:05', '2013-01-09 12:52:05', '123123', '0', '', '', '112222', null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_message` VALUES ('4028bc743c28120c013c281863540000', '2013-01-11 13:32:32', '2013-01-11 13:32:32', '123123', '0', '', '', '112222', '8a9182fc3ba86bc8013ba9782de60001', null);

-- ----------------------------
-- Table structure for `xx_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `xx_navigation`;
CREATE TABLE `xx_navigation` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `is_blank_target` bit(1) NOT NULL,
  `is_visible` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `navigation_position` int(11) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_navigation
-- ----------------------------
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb0f14000d', '2012-12-18 14:37:18', '2013-01-11 16:01:51', '', '', '首页', '1', '100', '${base}/');
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb688e000e', '2012-12-18 14:37:41', '2012-12-21 09:49:06', '', '', '新手导航', '0', '1', '${base}/shop/article_list/xs.htm');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c28931dc9000c', '2013-01-11 15:46:35', '2013-01-11 15:46:35', '', '', '交易保障', '1', '3', '${base}/card/article_list/bz.htm');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c28982ed8000d', '2013-01-11 15:52:07', '2013-01-11 15:52:07', '', '', '快捷通道', '1', '4', '${base}/');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c2898de04000f', '2013-01-11 15:52:52', '2013-01-11 15:52:52', '', '', '在线留言', '0', '2', '${base}/card/leave_message.htm');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c28993e930010', '2013-01-11 15:53:17', '2013-01-11 15:53:17', '', '', '交易保障', '1', '6', '${base}/card/article_list/bz.htm');
INSERT INTO `xx_navigation` VALUES ('8a9181263c31adc7013c31c753280000', '2013-01-13 10:40:12', '2013-01-13 11:05:24', '', '', '成功案例', '1', '7', '${base}/card/deposit!successList.action');

-- ----------------------------
-- Table structure for `xx_order`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order`;
CREATE TABLE `xx_order` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `brand_id` varchar(255) NOT NULL,
  `memo` longtext,
  `order_sn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL,
  `paid_amount` decimal(15,5) NOT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `amount` decimal(15,5) NOT NULL,
  `card_num` varchar(255) NOT NULL,
  `card_pwd` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `ret_code` varchar(100) DEFAULT NULL,
  `ret_msg` varchar(100) DEFAULT NULL,
  `card_code` varchar(255) NOT NULL,
  `card_discount` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `fk_order_member` (`member_id`),
  KEY `fk_order_payment_config` (`payment_config_id`),
  KEY `fk_order_product` (`product_id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_order_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`),
  CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------
INSERT INTO `xx_order` VALUES ('4028bc743c460cde013c460e054b0000', '2013-01-17 09:09:49', '2013-01-17 09:09:50', '8ae4839c3a887878013a88ad845a0009', null, 'DD100001', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '345', '3454', '网易一卡通 [10元]', '10.00000', 'SN_F67CE9DD9AA5', '8ae4834e3c4308a2013c4316949a0000', '1', '', '', '0.00');
INSERT INTO `xx_order` VALUES ('4028bc743c460cde013c460e79620003', '2013-01-17 09:10:19', '2013-01-17 09:10:20', '8ae4839c3a887878013a88ad3c100007', null, 'DD100002', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '5.00000', '555', '555', '久游一卡通 [5元]', '5.00000', 'SN_DEACA0922E18', '8ae4834e3c4308a2013c431afcc40006', '2002', '不支持该类卡或该面值', '', '0.00');
INSERT INTO `xx_order` VALUES ('4028bc743c460cde013c460f938c0006', '2013-01-17 09:11:31', '2013-01-17 09:11:31', '8ae4839c3a887878013a88ad845a0009', null, 'DD100003', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '30.00000', '1936016520500', '326992359', '网易一卡通 [30元]', '30.00000', 'SN_7A44B45BA5B1', '8ae4834e3c4308a2013c431696290003', '2002', '不支持该类卡或该面值', '', '0.00');
INSERT INTO `xx_order` VALUES ('4028bc743c46360a013c46372abe0000', '2013-01-17 09:54:46', '2013-01-17 09:54:46', '8ae4839c3a887878013a88aca0800003', null, 'DD100004', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '5554', '4545', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2002', '不支持该类卡或该面值', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c46360a013c4637a1360003', '2013-01-17 09:55:16', '2013-01-17 09:55:16', '8ae4839c3a887878013a88aca0800003', null, 'DD100005', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '1000.00000', '34534', '3453', '移动充值卡 [1000元]', '1000.00000', 'SN_651B5837687C', '8ae4834e3c4308a2013c435d439b0067', '2002', '不支持该类卡或该面值', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c46360a013c463a523c0006', '2013-01-17 09:58:12', '2013-01-17 09:58:12', '8ae4839c3a887878013a88aca0800003', null, 'DD100006', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '200.00000', '1112', '2323', '移动充值卡 [200元]', '200.00000', 'SN_3D5A67DF17BE', '8ae4834e3c4308a2013c435d432c0064', '2002', '不支持该类卡或该面值', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c46360a013c46424c5a0009', '2013-01-17 10:06:55', '2013-01-17 10:06:55', '8ae4839c3a887878013a88aca0800003', null, 'DD100007', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '7788', '7897', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2002', '不支持该类卡或该面值', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c46360a013c46578093000c', '2013-01-17 10:30:05', '2013-01-17 10:30:05', '8ae4839c3a887878013a88aca0800003', null, 'DD100008', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4434', '3434', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c465939013c465a405f0000', '2013-01-17 10:33:05', '2013-01-17 10:33:05', '8ae4839c3a887878013a88aca0800003', null, 'DD100009', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '676767', '6767', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c465939013c465ae8180003', '2013-01-17 10:33:48', '2013-01-17 10:33:48', '8ae4839c3a887878013a88aca0800003', null, 'DD100010', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '676767', '6767', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c465939013c465b85810006', '2013-01-17 10:34:28', '2013-01-17 10:34:29', '8ae4839c3a887878013a88aca0800003', null, 'DD100011', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '676767', '6767', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c465939013c4668faf00009', '2013-01-17 10:49:10', '2013-01-17 10:49:10', '8ae4839c3a887878013a88aca0800003', null, 'DD100012', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '656', '5656', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c465939013c4669aeb0000c', '2013-01-17 10:49:56', '2013-01-17 10:49:57', '8ae4839c3a887878013a88ad845a0009', null, 'DD100013', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '30.00000', '1936016520500', '326992359', '网易一卡通 [30元]', '30.00000', 'SN_7A44B45BA5B1', '8ae4834e3c4308a2013c431696290003', '2009', '暂停收该类卡或该面值', '001001', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c46743a013c467de1d40009', '2013-01-17 11:12:00', '2013-01-17 11:12:01', '8ae4839c3a887878013a88a15b0f0001', null, 'DD100014', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '6.00000', '34', '345', '骏网一卡通 [6元]', '6.00000', 'SN_AB0FE0196582', '4028bc743c46743a013c467da1ae0002', '2010', '充值卡无效', '000501', '0.86');
INSERT INTO `xx_order` VALUES ('4028bc743c46743a013c467f8708000c', '2013-01-17 11:13:48', '2013-01-17 11:13:48', '8ae4839c3a887878013a88a15b0f0001', null, 'DD100015', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '67', '567', '骏网一卡通 [10元]', '10.00000', 'SN_396B256EFC2D', '4028bc743c46743a013c467da1be0003', '2010', '充值卡无效', '000501', '0.86');
INSERT INTO `xx_order` VALUES ('4028bc743c46743a013c46874620000f', '2013-01-17 11:22:15', '2013-01-17 11:22:16', '8ae4839c3a887878013a88a15b0f0001', null, 'DD100016', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '5.00000', '234', '3422', '骏网一卡通 [5元]', '5.00000', 'SN_50903096ECAC', '4028bc743c46743a013c467da1220001', '1', '', 'junnet-net', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c46743a013c4687a2690012', '2013-01-17 11:22:39', '2013-01-17 11:22:39', '8ae4839c3a887878013a88aca0800003', null, 'DD100017', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '234234234', '2342343', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468c96b90000', '2013-01-17 11:28:04', '2013-01-17 11:28:04', '8ae4839c3a887878013a88aca0800003', null, 'DD100018', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '456456', '345345345', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468cdba10003', '2013-01-17 11:28:21', '2013-01-17 11:28:22', '8ae4839c3a887878013a88aca0800003', null, 'DD100019', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '456456', '345345345', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468cdc7c0006', '2013-01-17 11:28:22', '2013-01-17 11:28:22', '8ae4839c3a887878013a88aca0800003', null, 'DD100020', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '456456', '345345345', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468cdd280009', '2013-01-17 11:28:22', '2013-01-17 11:28:22', '8ae4839c3a887878013a88aca0800003', null, 'DD100021', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '456456', '345345345', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468cdde4000c', '2013-01-17 11:28:22', '2013-01-17 11:28:22', '8ae4839c3a887878013a88aca0800003', null, 'DD100022', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '456456', '345345345', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468cde8f000f', '2013-01-17 11:28:22', '2013-01-17 11:28:22', '8ae4839c3a887878013a88aca0800003', null, 'DD100023', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '456456', '345345345', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3b120012', '2013-01-17 11:29:51', '2013-01-17 11:29:52', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100024', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3bae0015', '2013-01-17 11:29:52', '2013-01-17 11:29:52', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100025', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3c3b0018', '2013-01-17 11:29:52', '2013-01-17 11:29:52', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100026', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3ce7001b', '2013-01-17 11:29:52', '2013-01-17 11:29:52', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100027', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3db2001e', '2013-01-17 11:29:52', '2013-01-17 11:29:52', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100028', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3e3f0021', '2013-01-17 11:29:52', '2013-01-17 11:29:52', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100029', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3edb0024', '2013-01-17 11:29:52', '2013-01-17 11:29:53', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100030', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e3f770027', '2013-01-17 11:29:53', '2013-01-17 11:29:53', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100031', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e4033002a', '2013-01-17 11:29:53', '2013-01-17 11:29:53', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100032', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e40df002d', '2013-01-17 11:29:53', '2013-01-17 11:29:53', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100033', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c468e419a0030', '2013-01-17 11:29:53', '2013-01-17 11:29:53', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100034', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '456456', '345345345', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '8ae4834e3c4308a2013c4351209f002b', '2010', '充值卡无效', '000801', '0.85');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c46905a780033', '2013-01-17 11:32:11', '2013-01-17 11:32:11', '8ae4839c3a887878013a88ad18e10006', null, 'DD100035', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '3324', '234524', '联通充值卡 [30元]', '30.00000', 'SN_453B3C4096A6', '8ae4834e3c4308a2013c435b989e005a', '1', '', 'unicom-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c469218a20036', '2013-01-17 11:34:05', '2013-01-17 11:34:05', '8ae4839c3a887878013a88aca0800003', null, 'DD100036', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '1324123', '12341234', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '8ae4834e3c4308a2013c435d42c90061', '1', '', 'szx-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c469219ea0039', '2013-01-17 11:34:05', '2013-01-17 11:34:05', '8ae4839c3a887878013a88aca0800003', null, 'DD100037', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '1324123', '12341234', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '8ae4834e3c4308a2013c435d42c90061', '1', '', 'szx-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c46921aa6003c', '2013-01-17 11:34:05', '2013-01-17 11:34:05', '8ae4839c3a887878013a88aca0800003', null, 'DD100038', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '1324123', '12341234', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '8ae4834e3c4308a2013c435d42c90061', '1', '', 'szx-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c46921b61003f', '2013-01-17 11:34:05', '2013-01-17 11:34:06', '8ae4839c3a887878013a88aca0800003', null, 'DD100039', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '1324123', '12341234', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '8ae4834e3c4308a2013c435d42c90061', '1', '', 'szx-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c46921c3c0042', '2013-01-17 11:34:06', '2013-01-17 11:34:06', '8ae4839c3a887878013a88aca0800003', null, 'DD100040', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '1324123', '12341234', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '8ae4834e3c4308a2013c435d42c90061', null, null, 'szx-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c469ecd520045', '2013-01-17 11:47:57', '2013-01-17 11:47:57', '8ae4839c3a887878013a88aca0800003', null, 'DD100041', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '1324123', '12341234', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '8ae4834e3c4308a2013c435d42c90061', null, null, 'szx-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c469f42910048', '2013-01-17 11:48:27', '2013-01-17 11:48:27', '8ae4839c3a887878013a88aca0800003', null, 'DD100042', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '132413', '4134134', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, 'szx-net', '0.96');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c469f5a11004b', '2013-01-17 11:48:33', '2013-01-17 11:48:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100043', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '132413', '4134134', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c469f5adc004e', '2013-01-17 11:48:34', '2013-01-17 11:48:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100044', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '13423', '42341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97');
INSERT INTO `xx_order` VALUES ('4028bc743c468c12013c46a08d220051', '2013-01-17 11:49:52', '2013-01-17 11:49:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100045', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4563456', '345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97');

-- ----------------------------
-- Table structure for `xx_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_log`;
CREATE TABLE `xx_order_log` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `info` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `order_log_type` int(11) NOT NULL,
  `order_sn` varchar(255) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_log_order` (`order_id`),
  CONSTRAINT `fk_order_log_order` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_log
-- ----------------------------
INSERT INTO `xx_order_log` VALUES ('4028bc743c460cde013c460e057a0001', '2013-01-17 09:09:49', '2013-01-17 09:09:49', null, null, '0', 'DD100001', '4028bc743c460cde013c460e054b0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743c460cde013c460e79a00004', '2013-01-17 09:10:19', '2013-01-17 09:10:19', null, null, '0', 'DD100002', '4028bc743c460cde013c460e79620003');
INSERT INTO `xx_order_log` VALUES ('4028bc743c460cde013c460f93bb0007', '2013-01-17 09:11:31', '2013-01-17 09:11:31', null, null, '0', 'DD100003', '4028bc743c460cde013c460f938c0006');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46360a013c46372add0001', '2013-01-17 09:54:46', '2013-01-17 09:54:46', null, null, '0', 'DD100004', '4028bc743c46360a013c46372abe0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46360a013c4637a1550004', '2013-01-17 09:55:16', '2013-01-17 09:55:16', null, null, '0', 'DD100005', '4028bc743c46360a013c4637a1360003');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46360a013c463a525c0007', '2013-01-17 09:58:12', '2013-01-17 09:58:12', null, null, '0', 'DD100006', '4028bc743c46360a013c463a523c0006');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46360a013c46424c89000a', '2013-01-17 10:06:55', '2013-01-17 10:06:55', null, null, '0', 'DD100007', '4028bc743c46360a013c46424c5a0009');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46360a013c465780d1000d', '2013-01-17 10:30:05', '2013-01-17 10:30:05', null, null, '0', 'DD100008', '4028bc743c46360a013c46578093000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c465939013c465a409d0001', '2013-01-17 10:33:05', '2013-01-17 10:33:05', null, null, '0', 'DD100009', '4028bc743c465939013c465a405f0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743c465939013c465ae8660004', '2013-01-17 10:33:48', '2013-01-17 10:33:48', null, null, '0', 'DD100010', '4028bc743c465939013c465ae8180003');
INSERT INTO `xx_order_log` VALUES ('4028bc743c465939013c465b85cf0007', '2013-01-17 10:34:28', '2013-01-17 10:34:28', null, null, '0', 'DD100011', '4028bc743c465939013c465b85810006');
INSERT INTO `xx_order_log` VALUES ('4028bc743c465939013c4668fb2f000a', '2013-01-17 10:49:10', '2013-01-17 10:49:10', null, null, '0', 'DD100012', '4028bc743c465939013c4668faf00009');
INSERT INTO `xx_order_log` VALUES ('4028bc743c465939013c4669aefe000d', '2013-01-17 10:49:56', '2013-01-17 10:49:56', null, null, '0', 'DD100013', '4028bc743c465939013c4669aeb0000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46743a013c467de251000a', '2013-01-17 11:12:00', '2013-01-17 11:12:00', null, null, '0', 'DD100014', '4028bc743c46743a013c467de1d40009');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46743a013c467f8757000d', '2013-01-17 11:13:48', '2013-01-17 11:13:48', null, null, '0', 'DD100015', '4028bc743c46743a013c467f8708000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46743a013c4687465f0010', '2013-01-17 11:22:16', '2013-01-17 11:22:16', null, null, '0', 'DD100016', '4028bc743c46743a013c46874620000f');
INSERT INTO `xx_order_log` VALUES ('4028bc743c46743a013c4687a2a80013', '2013-01-17 11:22:39', '2013-01-17 11:22:39', null, null, '0', 'DD100017', '4028bc743c46743a013c4687a2690012');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468c96e80001', '2013-01-17 11:28:04', '2013-01-17 11:28:04', null, null, '0', 'DD100018', '4028bc743c468c12013c468c96b90000');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468cdbc10004', '2013-01-17 11:28:21', '2013-01-17 11:28:21', null, null, '0', 'DD100019', '4028bc743c468c12013c468cdba10003');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468cdc8c0007', '2013-01-17 11:28:22', '2013-01-17 11:28:22', null, null, '0', 'DD100020', '4028bc743c468c12013c468cdc7c0006');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468cdd47000a', '2013-01-17 11:28:22', '2013-01-17 11:28:22', null, null, '0', 'DD100021', '4028bc743c468c12013c468cdd280009');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468cddf3000d', '2013-01-17 11:28:22', '2013-01-17 11:28:22', null, null, '0', 'DD100022', '4028bc743c468c12013c468cdde4000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468cdeaf0010', '2013-01-17 11:28:22', '2013-01-17 11:28:22', null, null, '0', 'DD100023', '4028bc743c468c12013c468cde8f000f');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3b220013', '2013-01-17 11:29:51', '2013-01-17 11:29:51', null, null, '0', 'DD100024', '4028bc743c468c12013c468e3b120012');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3bbe0016', '2013-01-17 11:29:52', '2013-01-17 11:29:52', null, null, '0', 'DD100025', '4028bc743c468c12013c468e3bae0015');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3c5a0019', '2013-01-17 11:29:52', '2013-01-17 11:29:52', null, null, '0', 'DD100026', '4028bc743c468c12013c468e3c3b0018');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3cf7001c', '2013-01-17 11:29:52', '2013-01-17 11:29:52', null, null, '0', 'DD100027', '4028bc743c468c12013c468e3ce7001b');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3dc2001f', '2013-01-17 11:29:52', '2013-01-17 11:29:52', null, null, '0', 'DD100028', '4028bc743c468c12013c468e3db2001e');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3e5e0022', '2013-01-17 11:29:52', '2013-01-17 11:29:52', null, null, '0', 'DD100029', '4028bc743c468c12013c468e3e3f0021');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3eeb0025', '2013-01-17 11:29:52', '2013-01-17 11:29:52', null, null, '0', 'DD100030', '4028bc743c468c12013c468e3edb0024');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e3f870028', '2013-01-17 11:29:53', '2013-01-17 11:29:53', null, null, '0', 'DD100031', '4028bc743c468c12013c468e3f770027');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e4042002b', '2013-01-17 11:29:53', '2013-01-17 11:29:53', null, null, '0', 'DD100032', '4028bc743c468c12013c468e4033002a');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e40ee002e', '2013-01-17 11:29:53', '2013-01-17 11:29:53', null, null, '0', 'DD100033', '4028bc743c468c12013c468e40df002d');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c468e41aa0031', '2013-01-17 11:29:53', '2013-01-17 11:29:53', null, null, '0', 'DD100034', '4028bc743c468c12013c468e419a0030');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c46905ad50034', '2013-01-17 11:32:11', '2013-01-17 11:32:11', null, null, '0', 'DD100035', '4028bc743c468c12013c46905a780033');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c469218c20037', '2013-01-17 11:34:05', '2013-01-17 11:34:05', null, null, '0', 'DD100036', '4028bc743c468c12013c469218a20036');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c46921a0a003a', '2013-01-17 11:34:05', '2013-01-17 11:34:05', null, null, '0', 'DD100037', '4028bc743c468c12013c469219ea0039');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c46921ab6003d', '2013-01-17 11:34:05', '2013-01-17 11:34:05', null, null, '0', 'DD100038', '4028bc743c468c12013c46921aa6003c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c46921b710040', '2013-01-17 11:34:05', '2013-01-17 11:34:05', null, null, '0', 'DD100039', '4028bc743c468c12013c46921b61003f');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c46921c6b0043', '2013-01-17 11:34:06', '2013-01-17 11:34:06', null, null, '0', 'DD100040', '4028bc743c468c12013c46921c3c0042');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c469ecd710046', '2013-01-17 11:47:57', '2013-01-17 11:47:57', null, null, '0', 'DD100041', '4028bc743c468c12013c469ecd520045');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c469f42b10049', '2013-01-17 11:48:27', '2013-01-17 11:48:27', null, null, '0', 'DD100042', '4028bc743c468c12013c469f42910048');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c469f5a30004c', '2013-01-17 11:48:33', '2013-01-17 11:48:33', null, null, '0', 'DD100043', '4028bc743c468c12013c469f5a11004b');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c469f5aec004f', '2013-01-17 11:48:34', '2013-01-17 11:48:34', null, null, '0', 'DD100044', '4028bc743c468c12013c469f5adc004e');
INSERT INTO `xx_order_log` VALUES ('4028bc743c468c12013c46a08d800052', '2013-01-17 11:49:52', '2013-01-17 11:49:52', null, null, '0', 'DD100045', '4028bc743c468c12013c46a08d220051');

-- ----------------------------
-- Table structure for `xx_payment`
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment`;
CREATE TABLE `xx_payment` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `memo` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `payment_sn` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `amount` decimal(15,5) NOT NULL,
  `deposit_id` varchar(32) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_sn` (`payment_sn`),
  KEY `fk_payment_member` (`member_id`),
  KEY `fk_payment_deposit` (`deposit_id`),
  KEY `fk_payment_payment_config` (`payment_config_id`),
  KEY `fk_payment_order` (`order_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`),
  CONSTRAINT `fk_payment_deposit` FOREIGN KEY (`deposit_id`) REFERENCES `xx_deposit` (`id`),
  CONSTRAINT `fk_payment_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_payment_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment
-- ----------------------------
INSERT INTO `xx_payment` VALUES ('4028bc743c460cde013c460e058a0002', '2013-01-17 09:09:49', '2013-01-17 09:09:49', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100001', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c460cde013c460e054b0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c460cde013c460e7a5c0005', '2013-01-17 09:10:19', '2013-01-17 09:10:19', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100002', '0', '0', '5.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c460cde013c460e79620003');
INSERT INTO `xx_payment` VALUES ('4028bc743c460cde013c460f94090008', '2013-01-17 09:11:31', '2013-01-17 09:11:31', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100003', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c460cde013c460f938c0006');
INSERT INTO `xx_payment` VALUES ('4028bc743c46360a013c46372afc0002', '2013-01-17 09:54:46', '2013-01-17 09:54:46', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100004', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46360a013c46372abe0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c46360a013c4637a1740005', '2013-01-17 09:55:16', '2013-01-17 09:55:16', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100005', '0', '0', '1000.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46360a013c4637a1360003');
INSERT INTO `xx_payment` VALUES ('4028bc743c46360a013c463a527b0008', '2013-01-17 09:58:12', '2013-01-17 09:58:12', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100006', '0', '0', '200.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46360a013c463a523c0006');
INSERT INTO `xx_payment` VALUES ('4028bc743c46360a013c46424c98000b', '2013-01-17 10:06:55', '2013-01-17 10:06:55', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100007', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46360a013c46424c5a0009');
INSERT INTO `xx_payment` VALUES ('4028bc743c46360a013c465780e1000e', '2013-01-17 10:30:05', '2013-01-17 10:30:05', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100008', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46360a013c46578093000c');
INSERT INTO `xx_payment` VALUES ('4028bc743c465939013c465a40dc0002', '2013-01-17 10:33:05', '2013-01-17 10:33:05', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100009', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c465939013c465a405f0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c465939013c465ae8850005', '2013-01-17 10:33:48', '2013-01-17 10:33:48', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100010', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c465939013c465ae8180003');
INSERT INTO `xx_payment` VALUES ('4028bc743c465939013c465b85ee0008', '2013-01-17 10:34:28', '2013-01-17 10:34:28', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100011', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c465939013c465b85810006');
INSERT INTO `xx_payment` VALUES ('4028bc743c465939013c4668fb3e000b', '2013-01-17 10:49:10', '2013-01-17 10:49:10', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100012', '0', '0', '20.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c465939013c4668faf00009');
INSERT INTO `xx_payment` VALUES ('4028bc743c465939013c4669af5c000e', '2013-01-17 10:49:56', '2013-01-17 10:49:56', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100013', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c465939013c4669aeb0000c');
INSERT INTO `xx_payment` VALUES ('4028bc743c46743a013c467de29f000b', '2013-01-17 11:12:00', '2013-01-17 11:12:00', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100014', '0', '0', '6.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46743a013c467de1d40009');
INSERT INTO `xx_payment` VALUES ('4028bc743c46743a013c467f87b4000e', '2013-01-17 11:13:48', '2013-01-17 11:13:48', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100015', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46743a013c467f8708000c');
INSERT INTO `xx_payment` VALUES ('4028bc743c46743a013c4687470b0011', '2013-01-17 11:22:16', '2013-01-17 11:22:16', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100016', '0', '0', '5.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c46743a013c46874620000f');
INSERT INTO `xx_payment` VALUES ('4028bc743c46743a013c4687a2c70014', '2013-01-17 11:22:39', '2013-01-17 11:22:39', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100017', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c46743a013c4687a2690012');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468c97070002', '2013-01-17 11:28:04', '2013-01-17 11:28:04', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100018', '0', '0', '20.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468c96b90000');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468cdbd00005', '2013-01-17 11:28:21', '2013-01-17 11:28:21', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100019', '0', '0', '20.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468cdba10003');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468cdcbb0008', '2013-01-17 11:28:22', '2013-01-17 11:28:22', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100020', '0', '0', '20.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468cdc7c0006');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468cdd57000b', '2013-01-17 11:28:22', '2013-01-17 11:28:22', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100021', '0', '0', '20.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468cdd280009');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468cde03000e', '2013-01-17 11:28:22', '2013-01-17 11:28:22', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100022', '0', '0', '20.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468cdde4000c');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468cdebe0011', '2013-01-17 11:28:22', '2013-01-17 11:28:22', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100023', '0', '0', '20.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468cde8f000f');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3b310014', '2013-01-17 11:29:51', '2013-01-17 11:29:51', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100024', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3b120012');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3bdd0017', '2013-01-17 11:29:52', '2013-01-17 11:29:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100025', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3bae0015');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3c6a001a', '2013-01-17 11:29:52', '2013-01-17 11:29:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100026', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3c3b0018');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3d06001d', '2013-01-17 11:29:52', '2013-01-17 11:29:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100027', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3ce7001b');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3dd10020', '2013-01-17 11:29:52', '2013-01-17 11:29:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100028', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3db2001e');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3e6e0023', '2013-01-17 11:29:52', '2013-01-17 11:29:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100029', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3e3f0021');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3efa0026', '2013-01-17 11:29:52', '2013-01-17 11:29:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100030', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3edb0024');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e3f960029', '2013-01-17 11:29:53', '2013-01-17 11:29:53', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100031', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e3f770027');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e4052002c', '2013-01-17 11:29:53', '2013-01-17 11:29:53', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100032', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e4033002a');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e410d002f', '2013-01-17 11:29:53', '2013-01-17 11:29:53', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100033', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e40df002d');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c468e41b90032', '2013-01-17 11:29:53', '2013-01-17 11:29:53', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100034', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c468e419a0030');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c46905b520035', '2013-01-17 11:32:11', '2013-01-17 11:32:11', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100035', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c46905a780033');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c469218f00038', '2013-01-17 11:34:05', '2013-01-17 11:34:05', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100036', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c469218a20036');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c46921a19003b', '2013-01-17 11:34:05', '2013-01-17 11:34:05', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100037', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c469219ea0039');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c46921ac5003e', '2013-01-17 11:34:05', '2013-01-17 11:34:05', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100038', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c46921aa6003c');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c46921b810041', '2013-01-17 11:34:05', '2013-01-17 11:34:05', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100039', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c46921b61003f');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c46921c8a0044', '2013-01-17 11:34:06', '2013-01-17 11:34:06', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100040', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c46921c3c0042');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c469ecd810047', '2013-01-17 11:47:57', '2013-01-17 11:47:57', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100041', '0', '0', '30.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c469ecd520045');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c469f42c0004a', '2013-01-17 11:48:27', '2013-01-17 11:48:27', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100042', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '4028bc743c468c12013c469f42910048');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c469f5a40004d', '2013-01-17 11:48:33', '2013-01-17 11:48:33', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100043', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c469f5a11004b');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c469f5afb0050', '2013-01-17 11:48:34', '2013-01-17 11:48:34', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100044', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c469f5adc004e');
INSERT INTO `xx_payment` VALUES ('4028bc743c468c12013c46a08dde0053', '2013-01-17 11:49:52', '2013-01-17 11:49:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100045', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '4028bc743c468c12013c46a08d220051');

-- ----------------------------
-- Table structure for `xx_payment_config`
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_config`;
CREATE TABLE `xx_payment_config` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `bargainor_id` varchar(255) DEFAULT NULL,
  `bargainor_key` varchar(255) DEFAULT NULL,
  `description` longtext,
  `is_default` bit(1) NOT NULL,
  `is_enabled` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `payment_config_type` int(11) NOT NULL,
  `payment_fee` decimal(15,5) NOT NULL,
  `payment_fee_type` int(11) NOT NULL,
  `payment_product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_config
-- ----------------------------
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8729d0000', '2012-12-18 14:16:58', '2012-12-26 10:20:14', '10011842896', '09ocl8ku8todssltsgyicyai6p1c0d488kvnh1rt88q0s7sjwq0hb0n3mgi8', '<span style=\"color:#666666;font-family:\'tahoma, Arial, 宋体, Verdana, sans-serif\';\"><span style=\"line-height:25px;\">通道2</span></span>', '', '', '通道2', '2', '2', '0.00000', '0', 'yeepayforzy');
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8e1350001', '2012-12-18 14:17:27', '2013-01-04 09:57:03', 'A819109', '8B157oSJTv3cmlwXDejSokqbM8b5svsF', '<span style=\"color:#666666;font-family:\'tahoma, Arial, 宋体, Verdana, sans-serif\';\"><span style=\"line-height:25px;\">通道1</span></span>', '', '', '通道1', '1', '2', '0.00000', '0', 'ofpay');

-- ----------------------------
-- Table structure for `xx_payment_discount`
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_discount`;
CREATE TABLE `xx_payment_discount` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` decimal(19,4) DEFAULT NULL,
  `memo` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `face` longtext,
  PRIMARY KEY (`id`),
  KEY `FK512B8EB9115DF6A7` (`payment_config_id`),
  KEY `fk_payment_discount_payment_config` (`payment_config_id`),
  KEY `fk_payment_Discount_brand` (`brand_id`),
  CONSTRAINT `fk_payment_Discount_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `fk_payment_discount_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_discount
-- ----------------------------
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacaced380003', '2012-12-18 14:21:52', '2013-01-17 10:42:02', '000101', '0.9700', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743bac0d54013baca8e1350001', '10,20,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacad51510004', '2012-12-18 14:22:17', '2013-01-17 10:42:23', '000201', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8e1350001', '10,20,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb048980005', '2012-12-18 14:25:32', '2013-01-17 11:08:32', '000501', '0.8550', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8e1350001', '5,6,10,15,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb11b0b0006', '2012-12-18 14:26:26', '2013-01-17 10:43:28', '000601', '0.8700', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8e1350001', '5,10,15,25,30,35,45,50,100,300,350,1000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb174950007', '2012-12-18 14:26:49', '2013-01-17 10:43:54', '000701', '0.8150', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8e1350001', '5,10,15,30,60,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb1f9550008', '2012-12-18 14:27:23', '2013-01-17 10:44:20', '000801', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8e1350001', '15,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb2b5140009', '2012-12-18 14:28:11', '2013-01-17 10:44:52', '000901', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8e1350001', '10,15,20,25,30,50,60,100,300,468,500');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb31b9e000a', '2012-12-18 14:28:37', '2013-01-17 10:45:12', '001001', '0.8500', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8e1350001', '5,10,15,20,30,50');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb3a792000b', '2012-12-18 14:29:13', '2013-01-17 10:45:27', '001101', '0.8550', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8e1350001', '5,10,15,30,40,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb4087e000c', '2012-12-18 14:29:38', '2013-01-17 10:45:44', '001201', '0.8200', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8e1350001', '5,10,20,25,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6897e000f', '2012-12-18 14:49:50', '2013-01-17 11:31:55', 'szx-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6e4410010', '2012-12-18 14:50:13', '2012-12-18 14:50:13', 'unicom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc74c510011', '2012-12-18 14:50:40', '2012-12-18 14:50:40', 'telecom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc7e1db0012', '2012-12-18 14:51:18', '2012-12-18 14:51:18', 'junnet-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc821640013', '2012-12-18 14:51:35', '2012-12-18 14:51:35', 'sndacard-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc87f340014', '2012-12-18 14:51:59', '2012-12-18 14:51:59', 'zhengtu-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc8d9d70015', '2012-12-18 14:52:22', '2012-12-18 14:52:22', 'ypcard-net', '0.8900', null, 'admin', '8ae4839c3a887878013a88ad61df0008', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9340d0016', '2012-12-18 14:52:45', '2012-12-18 14:52:45', 'wanmei-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc991500017', '2012-12-18 14:53:09', '2012-12-18 14:53:09', 'sohu-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9e5a90018', '2012-12-18 14:53:30', '2012-12-18 14:53:30', 'tianxia-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae4be5000e', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca1b400019', '2012-12-18 14:53:44', '2012-12-18 14:53:44', 'zongyou-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae29c8000d', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca6885001a', '2012-12-18 14:54:04', '2012-12-18 14:54:04', 'tianhong-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae757d000f', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca9ec8001b', '2012-12-18 14:54:18', '2012-12-18 14:54:18', 'qqcard-net', '0.8200', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccae16f001c', '2012-12-18 14:54:35', '2012-12-18 14:54:35', 'jiuyou-net', '0.8100', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccb17d0001d', '2012-12-18 14:54:49', '2012-12-18 14:54:49', 'netease-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743c46743a013c467b38ec0000', '2013-01-17 11:09:06', '2013-01-17 11:09:23', '000301', '0.9600', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743bac0d54013baca8e1350001', '10,20,30,50,100');

-- ----------------------------
-- Table structure for `xx_product`
-- ----------------------------
DROP TABLE IF EXISTS `xx_product`;
CREATE TABLE `xx_product` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `specification_value_store` longtext,
  `cards_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_sn` (`product_sn`),
  KEY `fk_product_cards` (`cards_id`),
  CONSTRAINT `fk_product_cards` FOREIGN KEY (`cards_id`) REFERENCES `xx_cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product
-- ----------------------------
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb755fed20002', '2012-12-20 16:02:44', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [5元]', '5.00000', 'SN_A18F88A39EA3', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb75600880003', '2012-12-20 16:02:45', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [10元]', '10.00000', 'SN_EA47F87C7C44', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c51db950002', '2013-01-15 11:47:43', '2013-01-16 20:37:30', '', '', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1220001', '2013-01-17 11:11:43', '2013-01-17 11:11:43', '', '', '骏网一卡通 [5元]', '5.00000', 'SN_50903096ECAC', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1ae0002', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [6元]', '6.00000', 'SN_AB0FE0196582', '[{\"name\":\"6元\",\"id\":\"b782681bb2d84adfb44f7f52fc1865fe\",\"orderList\":3,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1be0003', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [10元]', '10.00000', 'SN_396B256EFC2D', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1ce0004', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [15元]', '15.00000', 'SN_255FADA5497B', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1ed0005', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [30元]', '30.00000', 'SN_C13BEA07D2ED', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da20c0006', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [50元]', '50.00000', 'SN_BACA644FEF93', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da22b0007', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [100元]', '100.00000', 'SN_97B9F95E285A', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4316949a0000', '2013-01-16 19:20:18', '2013-01-16 19:20:18', '', '', '网易一卡通 [10元]', '10.00000', 'SN_F67CE9DD9AA5', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431695c00001', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [15元]', '15.00000', 'SN_A5D5BD7BC6D4', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431696000002', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [20元]', '20.00000', 'SN_3A7B33D148FF', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431696290003', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [30元]', '30.00000', 'SN_7A44B45BA5B1', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431697970004', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [50元]', '50.00000', 'SN_BA1D9EBBDED1', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afcc40006', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [5元]', '5.00000', 'SN_DEACA0922E18', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afda80007', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [10元]', '10.00000', 'SN_A0DE687FE5D6', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afdd70008', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [30元]', '30.00000', 'SN_F3530C973FFB', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afdfc0009', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [50元]', '50.00000', 'SN_7E6D5C460594', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431caacb000b', '2013-01-16 19:26:57', '2013-01-16 19:26:57', '', '', '天宏一卡通 [5元]', '5.00000', 'SN_FFEBF1EC6F96', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cabea000c', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [10元]', '10.00000', 'SN_93494BA751BA', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac1c000d', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [15元]', '15.00000', 'SN_EC7D52E1FBCA', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac41000e', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [20元]', '20.00000', 'SN_4CEBF3D3D37D', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac6c000f', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [30元]', '30.00000', 'SN_BEB0597FD710', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac990010', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [50元]', '50.00000', 'SN_F0CB2B2438B8', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cacc70011', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [100元]', '100.00000', 'SN_C0F32C1417B2', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db51a0013', '2013-01-16 19:28:05', '2013-01-16 19:28:05', '', '', '纵游一卡通 [5元]', '5.00000', 'SN_C6BC682212A5', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db61f0014', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [10元]', '10.00000', 'SN_AACFB167DA20', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db64e0015', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [15元]', '15.00000', 'SN_9100DAAF4DB8', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db6760016', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [30元]', '30.00000', 'SN_80D11C11831F', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db69b0017', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [50元]', '50.00000', 'SN_9C5C4EB3CC2B', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db6bd0018', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [100元]', '100.00000', 'SN_54408A463BE6', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ecfb5001a', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [5元]', '5.00000', 'SN_08A46C1D6F75', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed0d5001b', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [10元]', '10.00000', 'SN_A110E47F697A', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed101001c', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [15元]', '15.00000', 'SN_F1BB8781EA63', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed12b001d', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [20元]', '20.00000', 'SN_A6FD3C3FC403', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed158001e', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [30元]', '30.00000', 'SN_1A492BBF6966', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed186001f', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [50元]', '50.00000', 'SN_EFB8028DDDBA', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed1a70020', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [100元]', '100.00000', 'SN_550C6D1600E4', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502c4f0022', '2013-01-16 20:23:13', '2013-01-16 20:23:13', '', '', '搜狐一卡通 [5元]', '5.00000', 'SN_01C4164A2680', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502d980023', '2013-01-16 20:23:13', '2013-01-16 20:23:13', '', '', '搜狐一卡通 [10元]', '10.00000', 'SN_D7452EE979DE', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502dc90024', '2013-01-16 20:23:13', '2013-01-16 20:23:13', '', '', '搜狐一卡通 [15元]', '15.00000', 'SN_6FB041C596A2', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502df10025', '2013-01-16 20:23:13', '2013-01-16 20:23:13', '', '', '搜狐一卡通 [30元]', '30.00000', 'SN_351EFEB1CFB0', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502e1e0026', '2013-01-16 20:23:13', '2013-01-16 20:23:13', '', '', '搜狐一卡通 [40元]', '40.00000', 'SN_7065A467B353', '[{\"name\":\"40元\",\"id\":\"0fb15579801b495aaec443489d1c29d3\",\"imagePath\":null,\"orderList\":13}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502e4b0027', '2013-01-16 20:23:13', '2013-01-16 20:23:13', '', '', '搜狐一卡通 [100元]', '100.00000', 'SN_85EAD9048763', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43511f6f0029', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4351207a002a', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [30元]', '30.00000', 'SN_1C2603EE7917', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4351209f002b', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435120cb002c', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [100元]', '100.00000', 'SN_1E5F52118675', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435498ac002e', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [2元]', '2.00000', 'SN_D5671C07FD14', '[{\"name\":\"2元\",\"id\":\"865f79cb441b4d96b78a726da915983a\",\"imagePath\":null,\"orderList\":1}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549a1e002f', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [5元]', '5.00000', 'SN_C10914462053', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549a640030', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [7元]', '7.00000', 'SN_F9773330109B', '[{\"name\":\"7元\",\"id\":\"5ee91ba755c94429b431e53062103395\",\"imagePath\":null,\"orderList\":4}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549a9d0031', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [9元]', '9.00000', 'SN_E60FC49DB545', '[{\"name\":\"9元\",\"id\":\"a0ac41cf920941f89dac8bf56536cdfb\",\"imagePath\":null,\"orderList\":5}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549ac70032', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [10元]', '10.00000', 'SN_56E2A7007B63', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549af40033', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [15元]', '15.00000', 'SN_8AE6B25840CF', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549b250034', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [20元]', '20.00000', 'SN_F81766CA9551', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549b570035', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [25元]', '25.00000', 'SN_C3ACD3B234E3', '[{\"name\":\"25元\",\"id\":\"41df081483264e2e961b5139380f4dc8\",\"imagePath\":null,\"orderList\":10}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549b850036', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [30元]', '30.00000', 'SN_3DF286995DFC', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549ba60037', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [50元]', '50.00000', 'SN_669F86EAD444', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549bd20038', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [100元]', '100.00000', 'SN_435B620B5B28', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ab19003a', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [5元]', '5.00000', 'SN_4051A5B93447', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac10003b', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [10元]', '10.00000', 'SN_B95DDBD3E3E7', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac2f003c', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [15元]', '15.00000', 'SN_8731B89F4554', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac59003d', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [18元]', '18.00000', 'SN_81C864017BF6', '[{\"name\":\"18元\",\"id\":\"ed813458e5554f68b7e0236395813aaa\",\"imagePath\":null,\"orderList\":8}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac80003e', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [20元]', '20.00000', 'SN_EBB978FA32E3', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357acaa003f', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [25元]', '25.00000', 'SN_764A7BC60991', '[{\"name\":\"25元\",\"id\":\"41df081483264e2e961b5139380f4dc8\",\"imagePath\":null,\"orderList\":10}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357acd60040', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [30元]', '30.00000', 'SN_C729BA08BFE1', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357acf70041', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [50元]', '50.00000', 'SN_7367ACF90E17', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ad190042', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [60元]', '60.00000', 'SN_F4680D684402', '[{\"name\":\"60元\",\"id\":\"bc51a8c55a0448a3b3b0399e2e849dad\",\"imagePath\":null,\"orderList\":16}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ad480043', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [68元]', '68.00000', 'SN_9DC24BD702BC', '[{\"name\":\"68元\",\"id\":\"e082743847604fc7b877334583949589\",\"imagePath\":null,\"orderList\":17}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ad790044', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [100元]', '100.00000', 'SN_25505C1933FF', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ada30045', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [120元]', '120.00000', 'SN_28118EECC168', '[{\"name\":\"120元\",\"id\":\"a5ad7d399b6545a884633fd61a3c1b64\",\"imagePath\":null,\"orderList\":19}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ade10046', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [180元]', '180.00000', 'SN_05D4FA2031B1', '[{\"name\":\"180元\",\"id\":\"39e664a67acc41efab0412d3d6da6514\",\"imagePath\":null,\"orderList\":20}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae0a0047', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [208元]', '208.00000', 'SN_F33A272C2FD0', '[{\"name\":\"208元\",\"id\":\"754c8ba67078496a9c316d17268c35bb\",\"imagePath\":null,\"orderList\":22}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae360048', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [250元]', '250.00000', 'SN_7B01E93C5910', '[{\"name\":\"250元\",\"id\":\"54c23e4ed7384e9283430df68b8864ec\",\"imagePath\":null,\"orderList\":23}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae620049', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [300元]', '300.00000', 'SN_47B54BE687A5', '[{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"imagePath\":null,\"orderList\":24}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae90004a', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [468元]', '468.00000', 'SN_6CFDAD77F9FE', '[{\"name\":\"468元\",\"id\":\"a7286eec8d63489383732ddc0e941f51\",\"imagePath\":null,\"orderList\":26}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357aebb004b', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [500元]', '500.00000', 'SN_A741AEF08975', '[{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"imagePath\":null,\"orderList\":27}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591cd4004d', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [5元]', '5.00000', 'SN_0B396FB86B5D', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e18004e', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [10元]', '10.00000', 'SN_893D968D4C29', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e42004f', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [30元]', '30.00000', 'SN_F69808C7B72E', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e6d0050', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [35元]', '35.00000', 'SN_85B2CB9666BF', '[{\"name\":\"35元\",\"id\":\"41993db6d27c443cae3fbd8737c2450a\",\"imagePath\":null,\"orderList\":12}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e980051', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [45元]', '45.00000', 'SN_D93C7D0D261F', '[{\"name\":\"45元\",\"id\":\"ec5ed899785245a8b59156a33a05fc8e\",\"imagePath\":null,\"orderList\":14}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591ec60052', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [100元]', '100.00000', 'SN_5B6C371E316E', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591ef60053', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [350元]', '350.00000', 'SN_5D08F1ADFF27', '[{\"name\":\"350元\",\"id\":\"ac638b8b77cb4cc8847db6da803a8eb5\",\"imagePath\":null,\"orderList\":25}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591f230054', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [1000元]', '1000.00000', 'SN_618E1D9D47B5', '[{\"name\":\"1000元\",\"id\":\"10fbd47637c941c7ba2b8809c93976ae\",\"imagePath\":null,\"orderList\":28}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435ac4de0056', '2013-01-16 20:34:47', '2013-01-16 20:34:47', '', '', '电信充值卡 [50元]', '50.00000', 'SN_A1CA1A9D7B1F', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435ac5ff0057', '2013-01-16 20:34:47', '2013-01-16 20:34:47', '', '', '电信充值卡 [100元]', '100.00000', 'SN_56B073FCF91A', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b979d0059', '2013-01-16 20:35:41', '2013-01-16 20:35:41', '', '', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b989e005a', '2013-01-16 20:35:41', '2013-01-16 20:35:41', '', '', '联通充值卡 [30元]', '30.00000', 'SN_453B3C4096A6', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b98c5005b', '2013-01-16 20:35:41', '2013-01-16 20:35:41', '', '', '联通充值卡 [50元]', '50.00000', 'SN_7AF8516D2A47', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b98ef005c', '2013-01-16 20:35:41', '2013-01-16 20:35:41', '', '', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b991b005d', '2013-01-16 20:35:41', '2013-01-16 20:35:41', '', '', '联通充值卡 [300元]', '300.00000', 'SN_9A32BF1BBBC3', '[{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"imagePath\":null,\"orderList\":24}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b9947005e', '2013-01-16 20:35:42', '2013-01-16 20:35:42', '', '', '联通充值卡 [500元]', '500.00000', 'SN_70ECC99B0493', '[{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"imagePath\":null,\"orderList\":27}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d42a60060', '2013-01-16 20:37:30', '2013-01-16 20:37:30', '', '', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d42c90061', '2013-01-16 20:37:30', '2013-01-16 20:37:30', '', '', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d42e70062', '2013-01-16 20:37:30', '2013-01-16 20:37:30', '', '', '移动充值卡 [50元]', '50.00000', 'SN_C31040D0C000', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d430a0063', '2013-01-16 20:37:31', '2013-01-16 20:37:31', '', '', '移动充值卡 [100元]', '100.00000', 'SN_5C0F8D8476A6', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d432c0064', '2013-01-16 20:37:31', '2013-01-16 20:37:31', '', '', '移动充值卡 [200元]', '200.00000', 'SN_3D5A67DF17BE', '[{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"imagePath\":null,\"orderList\":21}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d434f0065', '2013-01-16 20:37:31', '2013-01-16 20:37:31', '', '', '移动充值卡 [300元]', '300.00000', 'SN_2E6AC980F291', '[{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"imagePath\":null,\"orderList\":24}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d43790066', '2013-01-16 20:37:31', '2013-01-16 20:37:31', '', '', '移动充值卡 [500元]', '500.00000', 'SN_CE3D4FA7FA51', '[{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"imagePath\":null,\"orderList\":27}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d439b0067', '2013-01-16 20:37:31', '2013-01-16 20:37:31', '', '', '移动充值卡 [1000元]', '1000.00000', 'SN_651B5837687C', '[{\"name\":\"1000元\",\"id\":\"10fbd47637c941c7ba2b8809c93976ae\",\"imagePath\":null,\"orderList\":28}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868130000', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [15元]', '15.00000', 'SN_4D153F2E2F48', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868510001', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [20元]', '20.00000', 'SN_3B63B4B8594F', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868800002', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [30元]', '30.00000', 'SN_1F2B86B87E40', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868bd0003', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [60元]', '60.00000', 'SN_90564C5A38A6', '[{\"name\":\"60元\",\"id\":\"bc51a8c55a0448a3b3b0399e2e849dad\",\"orderList\":16,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868e80004', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [100元]', '100.00000', 'SN_E71907EE3833', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c4368691a0005', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [200元]', '200.00000', 'SN_7B8993EA98B5', '[{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"orderList\":21,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');

-- ----------------------------
-- Table structure for `xx_role`
-- ----------------------------
DROP TABLE IF EXISTS `xx_role`;
CREATE TABLE `xx_role` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `authority_list_store` longtext,
  `description` longtext,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_role
-- ----------------------------
INSERT INTO `xx_role` VALUES ('0731dcsoft2010031200000000000016', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '[\"ROLE_CARDS\",\"ROLE_CARDS_NOTIFY\",\"ROLE_CARDS_CATEGORY\",\"ROLE_CARDS_TYPE\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_PAYMENT\",\"ROLE_REFUND\",\"ROLE_SHIPPING\",\"ROLE_RESHIP\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_COMMENT\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_PRINT_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_DELIVERY_TYPE\",\"ROLE_AREA\",\"ROLE_DELIVERY_CORP\",\"ROLE_DELIVERY_CENTER\",\"ROLE_DELIVERY_TEMPLATE\",\"ROLE_BASE\"]', '拥有后台管理最高权限', '', '超级管理员');
INSERT INTO `xx_role` VALUES ('4028bc743ac000ea013ac00bc68c0000', '2012-11-02 15:35:28', '2013-01-08 14:17:09', '[\"ROLE_CARDS\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_WITHDRAW\",\"ROLE_PAYMENT\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_MEMBER_BANK\",\"ROLE_MEMBER_BUSINESS\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_BASE\"]', '', '', '管理员');

-- ----------------------------
-- Table structure for `xx_specification`
-- ----------------------------
DROP TABLE IF EXISTS `xx_specification`;
CREATE TABLE `xx_specification` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `specification_type` int(11) NOT NULL,
  `specification_value_store` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_specification
-- ----------------------------
INSERT INTO `xx_specification` VALUES ('8ae4839c3a887878013a889ad43a0000', '2012-10-22 21:12:59', '2012-10-22 21:12:59', '', '面额', '1', '0', '[{\"name\":\"2元\",\"id\":\"865f79cb441b4d96b78a726da915983a\",\"orderList\":1,\"imagePath\":null},{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null},{\"name\":\"6元\",\"id\":\"b782681bb2d84adfb44f7f52fc1865fe\",\"orderList\":3,\"imagePath\":null},{\"name\":\"7元\",\"id\":\"5ee91ba755c94429b431e53062103395\",\"orderList\":4,\"imagePath\":null},{\"name\":\"9元\",\"id\":\"a0ac41cf920941f89dac8bf56536cdfb\",\"orderList\":5,\"imagePath\":null},{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null},{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null},{\"name\":\"18元\",\"id\":\"ed813458e5554f68b7e0236395813aaa\",\"orderList\":8,\"imagePath\":null},{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null},{\"name\":\"25元\",\"id\":\"41df081483264e2e961b5139380f4dc8\",\"orderList\":10,\"imagePath\":null},{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null},{\"name\":\"35元\",\"id\":\"41993db6d27c443cae3fbd8737c2450a\",\"orderList\":12,\"imagePath\":null},{\"name\":\"40元\",\"id\":\"0fb15579801b495aaec443489d1c29d3\",\"orderList\":13,\"imagePath\":null},{\"name\":\"45元\",\"id\":\"ec5ed899785245a8b59156a33a05fc8e\",\"orderList\":14,\"imagePath\":null},{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null},{\"name\":\"60元\",\"id\":\"bc51a8c55a0448a3b3b0399e2e849dad\",\"orderList\":16,\"imagePath\":null},{\"name\":\"68元\",\"id\":\"e082743847604fc7b877334583949589\",\"orderList\":17,\"imagePath\":null},{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null},{\"name\":\"120元\",\"id\":\"a5ad7d399b6545a884633fd61a3c1b64\",\"orderList\":19,\"imagePath\":null},{\"name\":\"180元\",\"id\":\"39e664a67acc41efab0412d3d6da6514\",\"orderList\":20,\"imagePath\":null},{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"orderList\":21,\"imagePath\":null},{\"name\":\"208元\",\"id\":\"754c8ba67078496a9c316d17268c35bb\",\"orderList\":22,\"imagePath\":null},{\"name\":\"250元\",\"id\":\"54c23e4ed7384e9283430df68b8864ec\",\"orderList\":23,\"imagePath\":null},{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"orderList\":24,\"imagePath\":null},{\"name\":\"350元\",\"id\":\"ac638b8b77cb4cc8847db6da803a8eb5\",\"orderList\":25,\"imagePath\":null},{\"name\":\"468元\",\"id\":\"a7286eec8d63489383732ddc0e941f51\",\"orderList\":26,\"imagePath\":null},{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"orderList\":27,\"imagePath\":null},{\"name\":\"1000元\",\"id\":\"10fbd47637c941c7ba2b8809c93976ae\",\"orderList\":28,\"imagePath\":null}]');

-- ----------------------------
-- Table structure for `xx_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `xx_withdraw`;
CREATE TABLE `xx_withdraw` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `lossrate` decimal(19,2) NOT NULL,
  `memo` longtext,
  `message` longtext,
  `money` decimal(19,2) NOT NULL,
  `rememo` longtext,
  `total_money` decimal(19,2) NOT NULL,
  `withdraw_sn` varchar(255) NOT NULL,
  `withdraw_status` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `withdraw_sn` (`withdraw_sn`),
  KEY `fk_withdraw_member` (`member_id`),
  CONSTRAINT `fk_withdraw_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_withdraw
-- ----------------------------
INSERT INTO `xx_withdraw` VALUES ('297e62b93bd214af013bd21f47430005', '2012-12-25 20:52:43', '2013-01-04 10:07:59', '0.97', '222', '会员自主提现', '20.00', null, '19.40', 'TX100001', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c3d7a21013c3d8913d20000', '2013-01-15 17:27:39', '2013-01-15 17:31:10', '0.97', 'ttt', '会员自主提现', '45.00', null, '43.65', 'TX100008', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c3d7a21013c3d8a481c0001', '2013-01-15 17:28:58', '2013-01-15 17:31:05', '0.97', '44', '会员自主提现', '44.00', null, '42.68', 'TX100009', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c3d7a21013c3d8d26bb0005', '2013-01-15 17:32:06', '2013-01-16 17:43:52', '0.97', '9', '会员自主提现', '99.00', null, '96.03', 'TX100010', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c3d7a21013c3d8d3c270006', '2013-01-15 17:32:11', '2013-01-16 17:43:03', '0.97', '99', '会员自主提现', '99.00', null, '96.03', 'TX100011', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c3d7a21013c3d8d506b0007', '2013-01-15 17:32:16', '2013-01-16 17:40:39', '0.97', '99', '会员自主提现', '99.00', null, '96.03', 'TX100012', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c4286748d000b', '2013-01-16 16:42:53', '2013-01-16 17:43:37', '0.97', '345345', '会员自主提现', '5345.00', null, '5184.65', 'TX100013', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42ba6e750072', '2013-01-16 17:39:39', '2013-01-16 17:40:32', '0.97', '345', '会员自主提现', '345.00', null, '334.65', 'TX100014', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42ba81710073', '2013-01-16 17:39:44', '2013-01-16 17:40:22', '0.97', '44', '会员自主提现', '444.00', null, '430.68', 'TX100015', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42ba9ad50074', '2013-01-16 17:39:51', '2013-01-16 17:40:15', '0.97', '34', '会员自主提现', '345.00', null, '334.65', 'TX100016', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42c3a6c00079', '2013-01-16 17:49:44', '2013-01-16 17:49:51', '0.97', '1', '会员自主提现', '1.00', null, '0.97', 'TX100017', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42c4587c007b', '2013-01-16 17:50:29', '2013-01-16 17:50:41', '0.97', '5', '会员自主提现', '5.00', null, '4.85', 'TX100018', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42c556b2007d', '2013-01-16 17:51:34', '2013-01-16 17:55:54', '0.97', '', '会员自主提现', '2.00', null, '1.94', 'TX100019', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42c569cc007e', '2013-01-16 17:51:39', '2013-01-16 17:54:57', '0.97', '3', '会员自主提现', '43.00', null, '41.71', 'TX100020', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42c5791e007f', '2013-01-16 17:51:43', '2013-01-16 17:54:18', '0.97', '', '会员自主提现', '4.00', null, '3.88', 'TX100021', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42c58a160080', '2013-01-16 17:51:47', '2013-01-16 17:55:14', '0.97', '', '会员自主提现', '33.00', null, '32.01', 'TX100022', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c42784e013c42c598fa0081', '2013-01-16 17:51:51', '2013-01-16 17:52:02', '0.97', '', '会员自主提现', '54.00', null, '52.38', 'TX100023', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c4b1535013c4b16a4610000', '2013-01-18 08:37:20', '2013-01-18 08:37:20', '0.97', '45', '会员自主提现', '45.00', null, '43.65', 'TX100024', '0', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c4b1535013c4b16b6430001', '2013-01-18 08:37:25', '2013-01-18 08:37:25', '0.97', '45', '会员自主提现', '565.00', null, '548.05', 'TX100025', '0', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c331960013c3332f53a0000', '2013-01-13 17:17:23', '2013-01-13 17:32:24', '0.97', '999', '会员自主提现', '999.00', null, '969.03', 'TX100002', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c333b44013c33400f010000', '2013-01-13 17:31:41', '2013-01-13 17:32:16', '0.97', '666', '会员自主提现', '666.00', null, '646.02', 'TX100003', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c33448b013c3345bc860000', '2013-01-13 17:37:53', '2013-01-13 17:42:29', '0.97', 'uuu', '会员自主提现', '180.00', null, '174.60', 'TX100004', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c33448b013c33463cd90001', '2013-01-13 17:38:26', '2013-01-13 17:42:22', '0.97', 'yyy', '会员自主提现', '170.00', null, '164.90', 'TX100005', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c33448b013c334a38900004', '2013-01-13 17:42:47', '2013-01-15 17:31:18', '0.97', '444', '会员自主提现', '100.00', null, '97.00', 'TX100006', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c334d8d013c3358f28c0000', '2013-01-13 17:58:52', '2013-01-15 17:31:14', '0.97', '999', '会员自主提现', '200.00', null, '194.00', 'TX100007', '1', '8a9182fc3ba86bc8013ba9782de60001');
