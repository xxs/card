/*
Navicat MySQL Data Transfer

Source Server         : JTM
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : card

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2013-01-16 17:57:53
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
INSERT INTO `xx_admin` VALUES ('0731dcsoft2010031200000000000017', '2011-01-01 00:00:00', '2013-01-16 16:37:20', '技术部', 'xxs@163.com', '', '', '', '', '2012-12-17 14:28:34', '2013-01-16 16:37:20', '0', '127.0.0.1', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'admin');

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
INSERT INTO `xx_cards` VALUES ('4028bc743bb6fee6013bb755fd4b0001', '2012-12-20 16:02:44', '2013-01-15 11:45:50', null, 'SN_B4A01EABE4F9', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡', '', '', '', '', '', 'Q币卡', 'Q币卡', '腾讯Q币卡', '10.00000', '0', '8ae4839c3a887878013a88acef930005');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c51dac90001', '2013-01-15 11:47:42', '2013-01-15 11:47:43', null, 'SN_D0126B004D0A', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '', '', '', '', '', '', '移动充值卡', '移动充值卡', '移动充值卡', '2.00000', '0', '8ae4839c3a887878013a88aca0800003');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5692200004', '2013-01-15 11:52:52', '2013-01-15 11:52:52', null, 'SN_F42E3ABC8BA1', '/html/201301/ab78d5c8c64443b5a8784e4462d4dd35.html', '', '', '', '', '', '', '联通充值卡', '联通充值卡', '联通充值卡', '0.00000', '0', '8ae4839c3a887878013a88ad18e10006');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c56fe760007', '2013-01-15 11:53:19', '2013-01-15 11:53:19', null, 'SN_18971B95668C', '/html/201301/a880c53a0504406c827c97f6d0b8558a.html', '', '', '', '', '', '', '电信充值卡', '电信充值卡', '电信充值卡', '0.00000', '0', '8ae4839c3a887878013a88ae0511000c');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c573891000a', '2013-01-15 11:53:34', '2013-01-15 11:53:34', null, 'SN_CAFA738E7712', '/html/201301/9a846286bb924d2e949e20fc7df3fcad.html', '', '', '', '', '', '', '骏网一卡通', '骏网一卡通', '骏网一卡通', '0.00000', '0', '8ae4839c3a887878013a88a15b0f0001');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5794ea000d', '2013-01-15 11:53:58', '2013-01-15 11:54:33', null, 'SN_9CA2F3FF4FC1', '/html/201301/ee17750e915c4a23ac5b1ae6f89b9c23.html', '', '', '', '', '', '', '盛大一卡通', '盛大一卡通', '盛大一卡通', '0.00000', '0', '8ae4839c3a887878013a88ac6eb10002');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c57dd7c0010', '2013-01-15 11:54:16', '2013-01-15 11:54:25', null, 'SN_D6018790CFE4', '/html/201301/926981d5c75c48788b3898c046ab1bca.html', '', '', '', '', '', '', '巨人(征途)一卡通', '巨人(征途)一卡通', '巨人(征途)一卡通', '0.00000', '0', '8ae4839c3a887878013a88acc1ef0004');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c58d71e0015', '2013-01-15 11:55:20', '2013-01-15 11:55:20', null, 'SN_9D312A3C7C81', '/html/201301/0b9d62c35e0643ada94b738b8e5d7ce9.html', '', '', '', '', '', '', '易宝e卡通', '易宝e卡通', '易宝e卡通', '0.00000', '0', '8ae4839c3a887878013a88ad61df0008');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5902060018', '2013-01-15 11:55:31', '2013-01-15 11:55:31', null, 'SN_E3D0639EC16F', '/html/201301/dd567ea9ba4e403e88812119dafad952.html', '', '', '', '', '', '', '完美一卡通', '完美一卡通', '完美一卡通', '0.00000', '0', '8ae4839c3a887878013a88ada7f6000a');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c593eb2001b', '2013-01-15 11:55:47', '2013-01-15 11:55:47', null, 'SN_B40AECA9CBB7', '/html/201301/8e4cccc882af4937bc899c21ef29d6de.html', '', '', '', '', '', '', '搜狐一卡通', '搜狐一卡通', '搜狐一卡通', '0.00000', '0', '8ae4839c3a887878013a88add167000b');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c597801001e', '2013-01-15 11:56:01', '2013-01-15 11:56:01', null, 'SN_5403A3D0491C', '/html/201301/afecf5917b7943eb8522358dc4995238.html', '', '', '', '', '', '', '天下通一卡通', '天下通一卡通', '天下通一卡通', '0.00000', '0', '8ae4839c3a887878013a88ae4be5000e');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c59ae340021', '2013-01-15 11:56:15', '2013-01-15 11:56:15', null, 'SN_0507F5D87570', '/html/201301/776d2824cf724f4c83fd850a84eddf25.html', '', '', '', '', '', '', '纵游一卡通', '纵游一卡通', '纵游一卡通', '0.00000', '0', '8ae4839c3a887878013a88ae29c8000d');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c59df180024', '2013-01-15 11:56:28', '2013-01-15 11:56:28', null, 'SN_7D6758D39206', '/html/201301/e0b899631c414de1801af4744aa1aebf.html', '', '', '', '', '', '', '天宏一卡通', '天宏一卡通', '天宏一卡通', '0.00000', '0', '8ae4839c3a887878013a88ae757d000f');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5a1c310027', '2013-01-15 11:56:43', '2013-01-15 11:56:43', null, 'SN_402A5B739469', '/html/201301/fd8f77ae780d4887bc79ce2506fb9e42.html', '', '', '', '', '', '', '久游一卡通', '久游一卡通', '久游一卡通', '0.00000', '0', '8ae4839c3a887878013a88ad3c100007');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5a4d05002a', '2013-01-15 11:56:56', '2013-01-15 11:56:56', null, 'SN_9A06259F2474', '/html/201301/744887a269a04ca2b3ce5f234a91443c.html', '', '', '', '', '', '', '网易一卡通', '网易一卡通', '网易一卡通', '0.00000', '0', '8ae4839c3a887878013a88ad845a0009');

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
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba9782e800002', '2012-12-17 23:25:23', '2012-12-17 23:25:23', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 123123', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba97939a00004', '2012-12-17 23:26:32', '2012-12-17 23:26:32', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
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
INSERT INTO `xx_member` VALUES ('8a9182fc3ba86bc8013ba9782de60001', '2012-12-17 23:25:23', '2013-01-16 17:55:54', 'www', '2012-12-20 00:00:00', '1922.00000', '123@qq.com', '0', '', '', null, '2013-01-16 16:41:07', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '123', '123', '4297f44b13955235245b2497399d7a93', null, '123', null, '127.0.0.1', 'www', 'qqq', '0', '123123', '213', '402881833054c381013054d08bed0001');

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
  `cards_html_path` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `ret_code` varchar(100) DEFAULT NULL,
  `ret_msg` varchar(100) DEFAULT NULL,
  `payment_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `fk_order_member` (`member_id`),
  KEY `fk_order_payment_config` (`payment_config_id`),
  KEY `fk_order_product` (`product_id`),
  KEY `fk_order_payment` (`payment_id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_order_payment` FOREIGN KEY (`payment_id`) REFERENCES `xx_payment` (`id`),
  CONSTRAINT `fk_order_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`),
  CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c427e39400006', '2013-01-16 16:33:53', '2013-01-16 16:38:21', '8ae4839c3a887878013a88aca0800003', null, 'DD100080', '2', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '2.00000', '23412', '13241234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c427e397e0008');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428885f8000c', '2013-01-16 16:45:08', '2013-01-16 16:45:09', '8ae4839c3a887878013a88acef930005', null, 'DD100081', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '1342', '234', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c42888685000e');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42892a27000f', '2013-01-16 16:45:51', '2013-01-16 16:45:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100082', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c42892a660011');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42892c890012', '2013-01-16 16:45:51', '2013-01-16 16:45:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100083', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c42892cb70014');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42892d730015', '2013-01-16 16:45:51', '2013-01-16 16:45:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100084', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c42892da20017');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42892e5d0018', '2013-01-16 16:45:52', '2013-01-16 16:45:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100085', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c42892e7d001a');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42892f57001b', '2013-01-16 16:45:52', '2013-01-16 16:45:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100086', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c42892f77001d');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42893061001e', '2013-01-16 16:45:52', '2013-01-16 16:45:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100087', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c428930900020');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c4289314b0021', '2013-01-16 16:45:52', '2013-01-16 16:45:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100088', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c4289316b0023');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428932260024', '2013-01-16 16:45:53', '2013-01-16 16:45:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100089', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c428932550026');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c4289334f0027', '2013-01-16 16:45:53', '2013-01-16 16:45:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100090', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c4289336e0029');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42893459002a', '2013-01-16 16:45:53', '2013-01-16 16:45:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100091', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c42893478002c');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c42893524002d', '2013-01-16 16:45:53', '2013-01-16 16:45:54', '8ae4839c3a887878013a88aca0800003', null, 'DD100092', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', '4028bc743c42784e013c42893553002f');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428935fe0030', '2013-01-16 16:45:54', '2013-01-16 16:45:54', '8ae4839c3a887878013a88aca0800003', null, 'DD100093', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '2.00000', '1342', '234', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '4028bc743c42784e013c4289363d0032');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a911a0033', '2013-01-16 16:47:22', '2013-01-16 16:47:23', '8ae4839c3a887878013a88acef930005', null, 'DD100094', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a91390035');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a91e50036', '2013-01-16 16:47:23', '2013-01-16 16:47:23', '8ae4839c3a887878013a88acef930005', null, 'DD100095', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a92040038');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a92910039', '2013-01-16 16:47:23', '2013-01-16 16:47:23', '8ae4839c3a887878013a88acef930005', null, 'DD100096', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a92b0003b');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a936c003c', '2013-01-16 16:47:23', '2013-01-16 16:47:23', '8ae4839c3a887878013a88acef930005', null, 'DD100097', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a939a003e');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9446003f', '2013-01-16 16:47:23', '2013-01-16 16:47:23', '8ae4839c3a887878013a88acef930005', null, 'DD100098', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a94750041');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a95020042', '2013-01-16 16:47:23', '2013-01-16 16:47:24', '8ae4839c3a887878013a88acef930005', null, 'DD100099', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a95310044');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a95cd0045', '2013-01-16 16:47:24', '2013-01-16 16:47:24', '8ae4839c3a887878013a88acef930005', null, 'DD100100', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a95fc0047');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a96980048', '2013-01-16 16:47:24', '2013-01-16 16:47:24', '8ae4839c3a887878013a88acef930005', null, 'DD100101', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a96b7004a');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9754004b', '2013-01-16 16:47:24', '2013-01-16 16:47:24', '8ae4839c3a887878013a88acef930005', null, 'DD100102', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a9773004d');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a981f004e', '2013-01-16 16:47:24', '2013-01-16 16:47:24', '8ae4839c3a887878013a88acef930005', null, 'DD100103', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a984e0050');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a98da0051', '2013-01-16 16:47:24', '2013-01-16 16:47:25', '8ae4839c3a887878013a88acef930005', null, 'DD100104', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a99280053');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a99d40054', '2013-01-16 16:47:25', '2013-01-16 16:47:25', '8ae4839c3a887878013a88acef930005', null, 'DD100105', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a99f30056');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9abf0057', '2013-01-16 16:47:25', '2013-01-16 16:47:25', '8ae4839c3a887878013a88acef930005', null, 'DD100106', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a9b2c0059');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9bd8005a', '2013-01-16 16:47:25', '2013-01-16 16:47:25', '8ae4839c3a887878013a88acef930005', null, 'DD100107', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a9c07005c');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9cb3005d', '2013-01-16 16:47:25', '2013-01-16 16:47:26', '8ae4839c3a887878013a88acef930005', null, 'DD100108', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a9ce1005f');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9d7e0060', '2013-01-16 16:47:26', '2013-01-16 16:47:26', '8ae4839c3a887878013a88acef930005', null, 'DD100109', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a9d9d0062');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9e680063', '2013-01-16 16:47:26', '2013-01-16 16:47:26', '8ae4839c3a887878013a88acef930005', null, 'DD100110', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a9e970065');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428a9f520066', '2013-01-16 16:47:26', '2013-01-16 16:47:26', '8ae4839c3a887878013a88acef930005', null, 'DD100111', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428a9f810068');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428aa02d0069', '2013-01-16 16:47:26', '2013-01-16 16:47:26', '8ae4839c3a887878013a88acef930005', null, 'DD100112', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428aa06c006b');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428aa118006c', '2013-01-16 16:47:27', '2013-01-16 16:47:27', '8ae4839c3a887878013a88acef930005', null, 'DD100113', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428aa146006e');
INSERT INTO `xx_order` VALUES ('4028bc743c42784e013c428aa1f2006f', '2013-01-16 16:47:27', '2013-01-16 16:47:27', '8ae4839c3a887878013a88acef930005', null, 'DD100114', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '50.00000', '55555', '222222', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '4028bc743bb6fee6013bb75600880003', '2002', '不支持该类卡或该面值', '4028bc743c42784e013c428aa2210071');

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
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c427e395f0007', '2013-01-16 16:33:54', '2013-01-16 16:33:54', null, null, '0', 'DD100080', '4028bc743c42784e013c427e39400006');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42824eb90009', '2013-01-16 16:38:21', '2013-01-16 16:38:21', '订单完成,获得积分: ', 'admin', '3', 'DD100080', '4028bc743c42784e013c427e39400006');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42888646000d', '2013-01-16 16:45:09', '2013-01-16 16:45:09', null, null, '0', 'DD100081', '4028bc743c42784e013c428885f8000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42892a460010', '2013-01-16 16:45:51', '2013-01-16 16:45:51', null, null, '0', 'DD100082', '4028bc743c42784e013c42892a27000f');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42892ca80013', '2013-01-16 16:45:51', '2013-01-16 16:45:51', null, null, '0', 'DD100083', '4028bc743c42784e013c42892c890012');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42892d920016', '2013-01-16 16:45:51', '2013-01-16 16:45:51', null, null, '0', 'DD100084', '4028bc743c42784e013c42892d730015');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42892e6d0019', '2013-01-16 16:45:52', '2013-01-16 16:45:52', null, null, '0', 'DD100085', '4028bc743c42784e013c42892e5d0018');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42892f67001c', '2013-01-16 16:45:52', '2013-01-16 16:45:52', null, null, '0', 'DD100086', '4028bc743c42784e013c42892f57001b');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42893071001f', '2013-01-16 16:45:52', '2013-01-16 16:45:52', null, null, '0', 'DD100087', '4028bc743c42784e013c42893061001e');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c4289315b0022', '2013-01-16 16:45:52', '2013-01-16 16:45:52', null, null, '0', 'DD100088', '4028bc743c42784e013c4289314b0021');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428932450025', '2013-01-16 16:45:53', '2013-01-16 16:45:53', null, null, '0', 'DD100089', '4028bc743c42784e013c428932260024');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c4289335f0028', '2013-01-16 16:45:53', '2013-01-16 16:45:53', null, null, '0', 'DD100090', '4028bc743c42784e013c4289334f0027');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42893468002b', '2013-01-16 16:45:53', '2013-01-16 16:45:53', null, null, '0', 'DD100091', '4028bc743c42784e013c42893459002a');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c42893543002e', '2013-01-16 16:45:53', '2013-01-16 16:45:53', null, null, '0', 'DD100092', '4028bc743c42784e013c42893524002d');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c4289361e0031', '2013-01-16 16:45:54', '2013-01-16 16:45:54', null, null, '0', 'DD100093', '4028bc743c42784e013c428935fe0030');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a91390034', '2013-01-16 16:47:22', '2013-01-16 16:47:22', null, null, '0', 'DD100094', '4028bc743c42784e013c428a911a0033');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a91f50037', '2013-01-16 16:47:23', '2013-01-16 16:47:23', null, null, '0', 'DD100095', '4028bc743c42784e013c428a91e50036');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a92b0003a', '2013-01-16 16:47:23', '2013-01-16 16:47:23', null, null, '0', 'DD100096', '4028bc743c42784e013c428a92910039');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a937b003d', '2013-01-16 16:47:23', '2013-01-16 16:47:23', null, null, '0', 'DD100097', '4028bc743c42784e013c428a936c003c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a94660040', '2013-01-16 16:47:23', '2013-01-16 16:47:23', null, null, '0', 'DD100098', '4028bc743c42784e013c428a9446003f');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a95110043', '2013-01-16 16:47:23', '2013-01-16 16:47:23', null, null, '0', 'DD100099', '4028bc743c42784e013c428a95020042');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a95dd0046', '2013-01-16 16:47:24', '2013-01-16 16:47:24', null, null, '0', 'DD100100', '4028bc743c42784e013c428a95cd0045');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a96a80049', '2013-01-16 16:47:24', '2013-01-16 16:47:24', null, null, '0', 'DD100101', '4028bc743c42784e013c428a96980048');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a9763004c', '2013-01-16 16:47:24', '2013-01-16 16:47:24', null, null, '0', 'DD100102', '4028bc743c42784e013c428a9754004b');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a982e004f', '2013-01-16 16:47:24', '2013-01-16 16:47:24', null, null, '0', 'DD100103', '4028bc743c42784e013c428a981f004e');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a98ea0052', '2013-01-16 16:47:24', '2013-01-16 16:47:24', null, null, '0', 'DD100104', '4028bc743c42784e013c428a98da0051');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a99e40055', '2013-01-16 16:47:25', '2013-01-16 16:47:25', null, null, '0', 'DD100105', '4028bc743c42784e013c428a99d40054');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a9ade0058', '2013-01-16 16:47:25', '2013-01-16 16:47:25', null, null, '0', 'DD100106', '4028bc743c42784e013c428a9abf0057');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a9bf7005b', '2013-01-16 16:47:25', '2013-01-16 16:47:25', null, null, '0', 'DD100107', '4028bc743c42784e013c428a9bd8005a');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a9cc2005e', '2013-01-16 16:47:25', '2013-01-16 16:47:25', null, null, '0', 'DD100108', '4028bc743c42784e013c428a9cb3005d');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a9d8d0061', '2013-01-16 16:47:26', '2013-01-16 16:47:26', null, null, '0', 'DD100109', '4028bc743c42784e013c428a9d7e0060');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a9e870064', '2013-01-16 16:47:26', '2013-01-16 16:47:26', null, null, '0', 'DD100110', '4028bc743c42784e013c428a9e680063');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428a9f720067', '2013-01-16 16:47:26', '2013-01-16 16:47:26', null, null, '0', 'DD100111', '4028bc743c42784e013c428a9f520066');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428aa04c006a', '2013-01-16 16:47:26', '2013-01-16 16:47:26', null, null, '0', 'DD100112', '4028bc743c42784e013c428aa02d0069');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428aa137006d', '2013-01-16 16:47:27', '2013-01-16 16:47:27', null, null, '0', 'DD100113', '4028bc743c42784e013c428aa118006c');
INSERT INTO `xx_order_log` VALUES ('4028bc743c42784e013c428aa2020070', '2013-01-16 16:47:27', '2013-01-16 16:47:27', null, null, '0', 'DD100114', '4028bc743c42784e013c428aa1f2006f');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_sn` (`payment_sn`),
  KEY `fk_payment_member` (`member_id`),
  KEY `fk_payment_deposit` (`deposit_id`),
  KEY `fk_payment_payment_config` (`payment_config_id`),
  CONSTRAINT `fk_payment_deposit` FOREIGN KEY (`deposit_id`) REFERENCES `xx_deposit` (`id`),
  CONSTRAINT `fk_payment_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_payment_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment
-- ----------------------------
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c427e397e0008', '2013-01-16 16:33:54', '2013-01-16 16:33:54', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100077', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42888685000e', '2013-01-16 16:45:09', '2013-01-16 16:45:09', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100078', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42892a660011', '2013-01-16 16:45:51', '2013-01-16 16:45:51', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100079', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42892cb70014', '2013-01-16 16:45:51', '2013-01-16 16:45:51', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100080', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42892da20017', '2013-01-16 16:45:51', '2013-01-16 16:45:51', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100081', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42892e7d001a', '2013-01-16 16:45:52', '2013-01-16 16:45:52', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100082', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42892f77001d', '2013-01-16 16:45:52', '2013-01-16 16:45:52', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100083', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428930900020', '2013-01-16 16:45:52', '2013-01-16 16:45:52', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100084', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c4289316b0023', '2013-01-16 16:45:52', '2013-01-16 16:45:52', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100085', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428932550026', '2013-01-16 16:45:53', '2013-01-16 16:45:53', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100086', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c4289336e0029', '2013-01-16 16:45:53', '2013-01-16 16:45:53', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100087', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42893478002c', '2013-01-16 16:45:53', '2013-01-16 16:45:53', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100088', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c42893553002f', '2013-01-16 16:45:53', '2013-01-16 16:45:53', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100089', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c4289363d0032', '2013-01-16 16:45:54', '2013-01-16 16:45:54', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100090', '0', '0', '2.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a91390035', '2013-01-16 16:47:22', '2013-01-16 16:47:22', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100091', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a92040038', '2013-01-16 16:47:23', '2013-01-16 16:47:23', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100092', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a92b0003b', '2013-01-16 16:47:23', '2013-01-16 16:47:23', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100093', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a939a003e', '2013-01-16 16:47:23', '2013-01-16 16:47:23', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100094', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a94750041', '2013-01-16 16:47:23', '2013-01-16 16:47:23', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100095', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a95310044', '2013-01-16 16:47:23', '2013-01-16 16:47:23', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100096', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a95fc0047', '2013-01-16 16:47:24', '2013-01-16 16:47:24', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100097', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a96b7004a', '2013-01-16 16:47:24', '2013-01-16 16:47:24', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100098', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a9773004d', '2013-01-16 16:47:24', '2013-01-16 16:47:24', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100099', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a984e0050', '2013-01-16 16:47:24', '2013-01-16 16:47:24', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100100', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a99280053', '2013-01-16 16:47:24', '2013-01-16 16:47:24', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100101', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a99f30056', '2013-01-16 16:47:25', '2013-01-16 16:47:25', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100102', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a9b2c0059', '2013-01-16 16:47:25', '2013-01-16 16:47:25', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100103', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a9c07005c', '2013-01-16 16:47:25', '2013-01-16 16:47:25', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100104', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a9ce1005f', '2013-01-16 16:47:25', '2013-01-16 16:47:25', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100105', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a9d9d0062', '2013-01-16 16:47:26', '2013-01-16 16:47:26', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100106', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a9e970065', '2013-01-16 16:47:26', '2013-01-16 16:47:26', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100107', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428a9f810068', '2013-01-16 16:47:26', '2013-01-16 16:47:26', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100108', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428aa06c006b', '2013-01-16 16:47:26', '2013-01-16 16:47:26', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100109', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428aa146006e', '2013-01-16 16:47:27', '2013-01-16 16:47:27', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100110', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743c42784e013c428aa2210071', '2013-01-16 16:47:27', '2013-01-16 16:47:27', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100111', '0', '0', '50.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');

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
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacaced380003', '2012-12-18 14:21:52', '2012-12-20 16:46:21', '000101', '0.9700', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743bac0d54013baca8e1350001', '10,20,30,40');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacad51510004', '2012-12-18 14:22:17', '2012-12-18 14:31:35', '000201', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb048980005', '2012-12-18 14:25:32', '2012-12-18 14:25:32', '000501', '0.8550', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb11b0b0006', '2012-12-18 14:26:26', '2012-12-18 14:26:26', '000601', '0.8700', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb174950007', '2012-12-18 14:26:49', '2012-12-18 14:26:49', '000701', '0.8150', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb1f9550008', '2012-12-18 14:27:23', '2012-12-18 14:27:23', '000801', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb2b5140009', '2012-12-18 14:28:11', '2012-12-18 14:28:11', '000901', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb31b9e000a', '2012-12-18 14:28:37', '2012-12-18 14:28:37', '001001', '0.8500', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb3a792000b', '2012-12-18 14:29:13', '2012-12-18 14:29:13', '001101', '0.8550', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb4087e000c', '2012-12-18 14:29:38', '2012-12-18 14:29:38', '001201', '0.8200', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6897e000f', '2012-12-18 14:49:50', '2012-12-18 14:49:50', 'szx-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6e4410010', '2012-12-18 14:50:13', '2012-12-18 14:50:13', 'unicom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc74c510011', '2012-12-18 14:50:40', '2012-12-18 14:50:40', 'telecom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc7e1db0012', '2012-12-18 14:51:18', '2012-12-18 14:51:18', 'junnet-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc821640013', '2012-12-18 14:51:35', '2012-12-18 14:51:35', 'sndacard-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc87f340014', '2012-12-18 14:51:59', '2012-12-18 14:51:59', 'zhengtu-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc8d9d70015', '2012-12-18 14:52:22', '2012-12-18 14:52:22', 'ypcard-net', '0.8900', null, 'admin', '8ae4839c3a887878013a88ad61df0008', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9340d0016', '2012-12-18 14:52:45', '2012-12-18 14:52:45', 'wanmei-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc991500017', '2012-12-18 14:53:09', '2012-12-18 14:53:09', 'sohu-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9e5a90018', '2012-12-18 14:53:30', '2012-12-18 14:53:30', 'tianxia-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae4be5000e', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca1b400019', '2012-12-18 14:53:44', '2012-12-18 14:53:44', 'zongyou-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae29c8000d', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca6885001a', '2012-12-18 14:54:04', '2012-12-18 14:54:04', 'tianhong-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae757d000f', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca9ec8001b', '2012-12-18 14:54:18', '2012-12-18 14:54:18', 'qqcard-net', '0.8200', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccae16f001c', '2012-12-18 14:54:35', '2012-12-18 14:54:35', 'jiuyou-net', '0.8100', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccb17d0001d', '2012-12-18 14:54:49', '2012-12-18 14:54:49', 'netease-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8729d0000', null);

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
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb755fed20002', '2012-12-20 16:02:44', '2013-01-15 11:45:50', '', '', '腾讯Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb75600880003', '2012-12-20 16:02:45', '2013-01-15 11:45:50', '', '', '腾讯Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c51db950002', '2013-01-15 11:47:43', '2013-01-15 11:47:43', '', '', '移动充值卡 [2元]', '2.00000', 'SN_0E1F5B480D30', '[{\"name\":\"2元\",\"id\":\"865f79cb441b4d96b78a726da915983a\",\"orderList\":1,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c56930a0005', '2013-01-15 11:52:52', '2013-01-15 11:52:52', '', '', '联通充值卡', '0.00000', 'SN_CA4BECB6E700', null, '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c56ffed0008', '2013-01-15 11:53:20', '2013-01-15 11:53:20', '', '', '电信充值卡', '0.00000', 'SN_F6618B38065F', null, '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c57396c000b', '2013-01-15 11:53:34', '2013-01-15 11:53:34', '', '', '骏网一卡通', '0.00000', 'SN_5B76DD8E3653', null, '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c5795b5000e', '2013-01-15 11:53:58', '2013-01-15 11:53:58', '', '', '盛大一卡通', '0.00000', 'SN_D27BB46CA811', null, '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c57dea50011', '2013-01-15 11:54:17', '2013-01-15 11:54:17', '', '', '巨人(征途)一卡通', '0.00000', 'SN_2C3A5D0EBE3B', null, '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c58d8180016', '2013-01-15 11:55:20', '2013-01-15 11:55:20', '', '', '易宝e卡通', '0.00000', 'SN_21EE77A404EC', null, '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c5903cb0019', '2013-01-15 11:55:32', '2013-01-15 11:55:32', '', '', '完美一卡通', '0.00000', 'SN_E2A106A77C18', null, '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c593fac001c', '2013-01-15 11:55:47', '2013-01-15 11:55:47', '', '', '搜狐一卡通', '0.00000', 'SN_168B561C49AD', null, '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c59793a001f', '2013-01-15 11:56:02', '2013-01-15 11:56:02', '', '', '天下通一卡通', '0.00000', 'SN_99432024A2D5', null, '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c59af4e0022', '2013-01-15 11:56:16', '2013-01-15 11:56:16', '', '', '纵游一卡通', '0.00000', 'SN_B4CAA651590F', null, '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c59dff30025', '2013-01-15 11:56:28', '2013-01-15 11:56:28', '', '', '天宏一卡通', '0.00000', 'SN_5218F04B09AF', null, '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c5a1d4a0028', '2013-01-15 11:56:44', '2013-01-15 11:56:44', '', '', '久游一卡通', '0.00000', 'SN_1B362B348208', null, '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c5a4e4d002b', '2013-01-15 11:56:56', '2013-01-15 11:56:56', '', '', '网易一卡通', '0.00000', 'SN_20CB9AB90F7A', null, '4028bc743c3c4340013c3c5a4d05002a');

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
INSERT INTO `xx_withdraw` VALUES ('8a9181263c331960013c3332f53a0000', '2013-01-13 17:17:23', '2013-01-13 17:32:24', '0.97', '999', '会员自主提现', '999.00', null, '969.03', 'TX100002', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c333b44013c33400f010000', '2013-01-13 17:31:41', '2013-01-13 17:32:16', '0.97', '666', '会员自主提现', '666.00', null, '646.02', 'TX100003', '2', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c33448b013c3345bc860000', '2013-01-13 17:37:53', '2013-01-13 17:42:29', '0.97', 'uuu', '会员自主提现', '180.00', null, '174.60', 'TX100004', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c33448b013c33463cd90001', '2013-01-13 17:38:26', '2013-01-13 17:42:22', '0.97', 'yyy', '会员自主提现', '170.00', null, '164.90', 'TX100005', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c33448b013c334a38900004', '2013-01-13 17:42:47', '2013-01-15 17:31:18', '0.97', '444', '会员自主提现', '100.00', null, '97.00', 'TX100006', '1', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_withdraw` VALUES ('8a9181263c334d8d013c3358f28c0000', '2013-01-13 17:58:52', '2013-01-15 17:31:14', '0.97', '999', '会员自主提现', '200.00', null, '194.00', 'TX100007', '1', '8a9182fc3ba86bc8013ba9782de60001');
