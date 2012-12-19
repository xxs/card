/*
Navicat MySQL Data Transfer

Source Server         : JTM
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : card

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-12-19 17:39:45
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
INSERT INTO `xx_admin` VALUES ('0731dcsoft2010031200000000000017', '2011-01-01 00:00:00', '2012-12-19 16:49:36', '技术部', 'xxs@163.com', '', '', '', '', '2012-12-17 14:28:34', '2012-12-19 16:49:36', '0', '127.0.0.1', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'admin');

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
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88a15b0f0001', '2012-10-22 21:20:06', '2012-10-31 11:44:30', null, '', '骏网一卡通', '1', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ac6eb10002', '2012-10-22 21:32:12', '2012-10-31 11:49:24', null, '', '盛大卡', '2', '');
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
  `cards_attribute_value0` varchar(255) DEFAULT NULL,
  `cards_attribute_value1` varchar(255) DEFAULT NULL,
  `cards_attribute_value10` varchar(255) DEFAULT NULL,
  `cards_attribute_value11` varchar(255) DEFAULT NULL,
  `cards_attribute_value12` varchar(255) DEFAULT NULL,
  `cards_attribute_value13` varchar(255) DEFAULT NULL,
  `cards_attribute_value14` varchar(255) DEFAULT NULL,
  `cards_attribute_value15` varchar(255) DEFAULT NULL,
  `cards_attribute_value16` varchar(255) DEFAULT NULL,
  `cards_attribute_value17` varchar(255) DEFAULT NULL,
  `cards_attribute_value18` varchar(255) DEFAULT NULL,
  `cards_attribute_value19` varchar(255) DEFAULT NULL,
  `cards_attribute_value2` varchar(255) DEFAULT NULL,
  `cards_attribute_value3` varchar(255) DEFAULT NULL,
  `cards_attribute_value4` varchar(255) DEFAULT NULL,
  `cards_attribute_value5` varchar(255) DEFAULT NULL,
  `cards_attribute_value6` varchar(255) DEFAULT NULL,
  `cards_attribute_value7` varchar(255) DEFAULT NULL,
  `cards_attribute_value8` varchar(255) DEFAULT NULL,
  `cards_attribute_value9` varchar(255) DEFAULT NULL,
  `cards_image_store` longtext,
  `cards_parameter_value_store` longtext,
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
  `cards_category_id` varchar(32) NOT NULL,
  `cards_type_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cards_sn` (`cards_sn`),
  KEY `fk_cards_cards_type` (`cards_type_id`),
  KEY `fk_cards_cards_category` (`cards_category_id`),
  KEY `fk_cards_brand` (`brand_id`),
  CONSTRAINT `fk_cards_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `fk_cards_cards_category` FOREIGN KEY (`cards_category_id`) REFERENCES `xx_cards_category` (`id`),
  CONSTRAINT `fk_cards_cards_type` FOREIGN KEY (`cards_type_id`) REFERENCES `xx_cards_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_cards_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards_attribute`;
CREATE TABLE `xx_cards_attribute` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `attribute_type` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `option_store` varchar(255) DEFAULT NULL,
  `order_list` int(11) DEFAULT NULL,
  `property_index` int(11) NOT NULL,
  `cards_type_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cards_attribute_cards_type` (`cards_type_id`),
  CONSTRAINT `fk_cards_attribute_cards_type` FOREIGN KEY (`cards_type_id`) REFERENCES `xx_cards_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_cards_category`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards_category`;
CREATE TABLE `xx_cards_category` (
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
  `cards_type_id` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`),
  KEY `fk_cards_category_cards_type` (`cards_type_id`),
  KEY `fk_cards_category_parent` (`parent_id`),
  CONSTRAINT `fk_cards_category_cards_type` FOREIGN KEY (`cards_type_id`) REFERENCES `xx_cards_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_category
-- ----------------------------
INSERT INTO `xx_cards_category` VALUES ('4028bc743bb257ca013bb264d3560000', '2012-12-19 17:00:50', '2012-12-19 17:00:50', '0', '2', '2', '222', '15', '4028bc743bb257ca013bb264d3560000', '22', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88b9d9c10015', '2012-10-22 21:46:52', '2012-10-22 21:46:52', '0', null, null, '腾讯一卡通', '14', '8ae4839c3a887878013a88b9d9c10015', 'teng_xun', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88ba80150017', '2012-10-22 21:47:34', '2012-10-22 21:47:46', '0', null, null, '盛大一卡通', '13', '8ae4839c3a887878013a88ba80150017', 'sheng_da', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bafe98001a', '2012-10-22 21:48:07', '2012-10-22 21:48:07', '0', null, null, '骏网一卡通', '12', '8ae4839c3a887878013a88bafe98001a', 'jun_wang', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bb547e001c', '2012-10-22 21:48:29', '2012-10-22 21:48:29', '0', null, null, '完美一卡通', '11', '8ae4839c3a887878013a88bb547e001c', 'wan_mei', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bba8b4001e', '2012-10-22 21:48:50', '2012-10-22 21:48:50', '0', null, null, '搜狐一卡通', '10', '8ae4839c3a887878013a88bba8b4001e', 'sou_hu', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bc0e8b0020', '2012-10-22 21:49:16', '2012-10-22 21:49:16', '0', null, null, '征途一卡通', '9', '8ae4839c3a887878013a88bc0e8b0020', 'zheng_tu', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bc6dea0022', '2012-10-22 21:49:41', '2012-10-22 21:49:41', '0', null, null, '久游一卡通', '8', '8ae4839c3a887878013a88bc6dea0022', 'jiu_you', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bccd590024', '2012-10-22 21:50:05', '2012-10-22 21:50:05', '0', null, null, '网易一卡通', '7', '8ae4839c3a887878013a88bccd590024', 'wang_yi', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bd517a0026', '2012-10-22 21:50:39', '2012-10-22 21:50:39', '0', null, null, '电信充值卡', '6', '8ae4839c3a887878013a88bd517a0026', 'dian_xin', '8ae4839c3a887878013a88b6960e0014', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bdaf250028', '2012-10-22 21:51:03', '2012-10-22 21:51:03', '0', null, null, '联通充值卡', '5', '8ae4839c3a887878013a88bdaf250028', 'lian_tong', '8ae4839c3a887878013a88b6960e0014', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88be08aa002a', '2012-10-22 21:51:26', '2012-10-22 21:51:26', '0', null, null, '纵游一卡通', '4', '8ae4839c3a887878013a88be08aa002a', 'zong_you', '8ae4839c3a887878013a88b6960e0014', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88be6075002c', '2012-10-22 21:51:48', '2012-10-22 21:51:48', '0', null, null, '天宏一卡通', '3', '8ae4839c3a887878013a88be6075002c', 'tian_hong', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88beb496002e', '2012-10-22 21:52:10', '2012-10-22 21:52:10', '0', null, null, '天下通一卡通', '2', '8ae4839c3a887878013a88beb496002e', 'tianxia_tong', '8ae4839c3a887878013a88b39b6a0010', '');
INSERT INTO `xx_cards_category` VALUES ('8ae4839c3a887878013a88bf094e0030', '2012-10-22 21:52:32', '2012-10-22 21:52:32', '0', null, null, '移动充值卡', '1', '8ae4839c3a887878013a88bf094e0030', 'yi_dong', '8ae4839c3a887878013a88b6960e0014', '');

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
  CONSTRAINT `fk_specification_set` FOREIGN KEY (`cards_set_id`) REFERENCES `xx_cards` (`id`),
  CONSTRAINT `fk_specification_cards_set` FOREIGN KEY (`specification_set_id`) REFERENCES `xx_specification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_specification
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_cards_type`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards_type`;
CREATE TABLE `xx_cards_type` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `cards_parameter_store` longtext,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_type
-- ----------------------------
INSERT INTO `xx_cards_type` VALUES ('8ae4839c3a887878013a88b39b6a0010', '2012-10-22 21:40:03', '2012-10-22 21:42:41', null, '游戏点卡');
INSERT INTO `xx_cards_type` VALUES ('8ae4839c3a887878013a88b6960e0014', '2012-10-22 21:43:18', '2012-10-22 21:43:18', null, '手机充值卡');

-- ----------------------------
-- Table structure for `xx_cards_type_brand`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards_type_brand`;
CREATE TABLE `xx_cards_type_brand` (
  `cards_type_set_id` varchar(32) NOT NULL,
  `brand_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`cards_type_set_id`,`brand_set_id`),
  KEY `fk_cards_type_brand_set` (`cards_type_set_id`),
  KEY `fk_brand_cards_type_set` (`brand_set_id`),
  CONSTRAINT `fk_brand_cards_type_set` FOREIGN KEY (`brand_set_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `fk_cards_type_brand_set` FOREIGN KEY (`cards_type_set_id`) REFERENCES `xx_cards_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_type_brand
-- ----------------------------

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
INSERT INTO `xx_log` VALUES ('4028bc743bb257ca013bb264d4be0001', '2012-12-19 17:00:50', '2012-12-19 17:00:50', 'net.xxs.action.admin.CardsCategoryAction', 'save', '添加充值卡分类: 222', '127.0.0.1', '添加充值卡分类', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba9782e800002', '2012-12-17 23:25:23', '2012-12-17 23:25:23', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 123123', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba97939a00004', '2012-12-17 23:26:32', '2012-12-17 23:26:32', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');

-- ----------------------------
-- Table structure for `xx_member`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member`;
CREATE TABLE `xx_member` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area_store` varchar(255) DEFAULT NULL,
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
INSERT INTO `xx_member` VALUES ('8a9182fc3ba86bc8013ba9782de60001', '2012-12-17 23:25:23', '2012-12-19 16:50:08', null, null, null, '0.00000', '123@qq.com', null, '', '', null, '2012-12-19 16:50:08', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4297f44b13955235245b2497399d7a93', null, null, '', '127.0.0.1', null, null, '0', '123123', null, '402881833054c381013054d08bed0001');

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
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000004', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '地区', '', '4', '3', '3');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000005', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '地址', '', '5', '4', '4');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000006', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '邮编', '', '6', '5', '5');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000007', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '电话', '', '7', '6', '6');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000008', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '手机', '', '8', '7', '7');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000009', '2011-01-01 00:00:00', '2012-12-08 13:01:19', '0', '', '', '推荐人', '', '9', '8', '8');
INSERT INTO `xx_member_attribute` VALUES ('4028bc743a9c37c6013a9c4d24c80000', '2012-10-26 17:00:32', '2012-11-10 12:44:56', '0', '', '', '收款卡号', '', '11', '0', null);
INSERT INTO `xx_member_attribute` VALUES ('4028bc743ab48628013ab4bdae9c0001', '2012-10-31 10:54:20', '2012-11-10 12:44:38', '3', '', '', '账号类型', '[\"建设银行\",\"农业银行\",\"光大银行\",\"中信银行\"]', '10', '3', null);
INSERT INTO `xx_member_attribute` VALUES ('8a8f81133ae86694013ae8a020320000', '2012-11-10 12:42:19', '2012-11-10 12:42:35', '3', '', '', '开户银行所在地', '[\"北京市\",\"河南省\"]', '13', '1', null);
INSERT INTO `xx_member_attribute` VALUES ('8a8f81133ae86694013ae8a1ced50001', '2012-11-10 12:44:09', '2012-11-10 12:44:09', '0', '', '', '开户姓名', '', '12', '2', null);
INSERT INTO `xx_member_attribute` VALUES ('8a8f81133ae86694013ae8a30b0d0002', '2012-11-10 12:45:30', '2012-11-10 12:45:30', '0', '', '', '支行名称', '', '14', '4', null);

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
INSERT INTO `xx_member_rank` VALUES ('0731dcsoft2010031200000000000010', '2012-12-19 10:52:48', '2012-12-18 10:54:14', '0.01', '', '0.96', '普通会员', '100', '0');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d08bed0001', '2011-01-01 00:00:00', '2012-11-05 09:12:49', '0.01', '', '0.97', '一级会员', '100', '2000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d0bf800002', '2011-01-01 00:00:00', '2012-12-18 10:54:14', '0.01', '', '0.98', '二级会员', '100', '5000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d103ec0003', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0.01', '', '0.99', '三级会员', '100', '10000');

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
  CONSTRAINT `fk_message_to_member` FOREIGN KEY (`to_member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_message_from_member` FOREIGN KEY (`from_member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_message
-- ----------------------------

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
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb0f14000d', '2012-12-18 14:37:18', '2012-12-18 14:37:18', '', '', '首页', '1', '1', '${base}/');
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb688e000e', '2012-12-18 14:37:41', '2012-12-18 14:37:41', '', '', '新手导航', '0', '1', '${base}/');

-- ----------------------------
-- Table structure for `xx_order`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order`;
CREATE TABLE `xx_order` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `brand_id` varchar(255) NOT NULL,
  `cards_id_list_store` longtext,
  `memo` longtext,
  `order_sn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL,
  `paid_amount` decimal(15,5) NOT NULL,
  `pay_status` varchar(100) DEFAULT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `payment_fee` decimal(15,5) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `total_amount` decimal(15,5) NOT NULL,
  `total_product_price` decimal(15,5) NOT NULL,
  `total_product_quantity` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `amount_payable` decimal(15,5) NOT NULL,
  `card_num` varchar(255) NOT NULL,
  `card_pwd` varchar(255) NOT NULL,
  `cards_html_path` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `fk_order_member` (`member_id`),
  KEY `fk_order_payment_config` (`payment_config_id`),
  KEY `fk_order_product` (`product_id`),
  CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_order_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------

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
  `payment_fee` decimal(15,5) NOT NULL,
  `payment_sn` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `total_amount` decimal(15,5) NOT NULL,
  `deposit_id` varchar(32) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
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
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8729d0000', '2012-12-18 14:16:58', '2012-12-18 14:17:37', '1', '2', '<span style=\"color:#666666;font-family:tahoma, Arial, 宋体, Verdana, sans-serif;line-height:25px;background-color:#f6fafd;\">易宝非银行卡支付(专业版)</span>', '', '', '易宝非银行卡支付(专业版)', '2', '2', '0.00000', '0', 'yeepayforzy');
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8e1350001', '2012-12-18 14:17:27', '2012-12-18 14:17:27', '333', '444', '<span style=\"color:#666666;font-family:tahoma, Arial, 宋体, Verdana, sans-serif;line-height:25px;background-color:#f6fafd;\">殴飞消耗点卡接口</span>', '', '', '殴飞消耗点卡接口', '1', '2', '0.00000', '0', 'ofpay');
INSERT INTO `xx_payment_config` VALUES ('8a9182fc3ba86bc8013ba97620b30000', '2012-12-17 23:23:09', '2012-12-17 23:23:09', 'a', 'b', '<span style=\"color:#666666;font-family:tahoma, Arial, 宋体, Verdana, sans-serif;line-height:25px;background-color:#f6fafd;\">易宝支付</span>', '', '', '易宝支付', '3', '2', '0.00000', '0', 'yeepay');

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
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacaced380003', '2012-12-18 14:21:52', '2012-12-18 14:30:42', '000101', '0.9700', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacad51510004', '2012-12-18 14:22:17', '2012-12-18 14:31:35', '000201', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb048980005', '2012-12-18 14:25:32', '2012-12-18 14:25:32', '000501', '0.8550', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb11b0b0006', '2012-12-18 14:26:26', '2012-12-18 14:26:26', '000601', '0.8700', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb174950007', '2012-12-18 14:26:49', '2012-12-18 14:26:49', '000701', '0.8150', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb1f9550008', '2012-12-18 14:27:23', '2012-12-18 14:27:23', '000801', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb2b5140009', '2012-12-18 14:28:11', '2012-12-18 14:28:11', '000901', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb31b9e000a', '2012-12-18 14:28:37', '2012-12-18 14:28:37', '001001', '0.8500', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb3a792000b', '2012-12-18 14:29:13', '2012-12-18 14:29:13', '001101', '0.8550', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb4087e000c', '2012-12-18 14:29:38', '2012-12-18 14:29:38', '001201', '0.8200', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6897e000f', '2012-12-18 14:49:50', '2012-12-18 14:49:50', 'szx-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6e4410010', '2012-12-18 14:50:13', '2012-12-18 14:50:13', 'unicom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc74c510011', '2012-12-18 14:50:40', '2012-12-18 14:50:40', 'telecom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc7e1db0012', '2012-12-18 14:51:18', '2012-12-18 14:51:18', 'junnet-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc821640013', '2012-12-18 14:51:35', '2012-12-18 14:51:35', 'sndacard-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc87f340014', '2012-12-18 14:51:59', '2012-12-18 14:51:59', 'zhengtu-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc8d9d70015', '2012-12-18 14:52:22', '2012-12-18 14:52:22', 'ypcard-net', '0.8900', null, 'admin', '8ae4839c3a887878013a88ad61df0008', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9340d0016', '2012-12-18 14:52:45', '2012-12-18 14:52:45', 'wanmei-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc991500017', '2012-12-18 14:53:09', '2012-12-18 14:53:09', 'sohu-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9e5a90018', '2012-12-18 14:53:30', '2012-12-18 14:53:30', 'tianxia-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae4be5000e', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca1b400019', '2012-12-18 14:53:44', '2012-12-18 14:53:44', 'zongyou-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae29c8000d', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca6885001a', '2012-12-18 14:54:04', '2012-12-18 14:54:04', 'tianhong-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae757d000f', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca9ec8001b', '2012-12-18 14:54:18', '2012-12-18 14:54:18', 'qqcard-net', '0.8200', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccae16f001c', '2012-12-18 14:54:35', '2012-12-18 14:54:35', 'jiuyou-net', '0.8100', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccb17d0001d', '2012-12-18 14:54:49', '2012-12-18 14:54:49', 'netease-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8729d0000');

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
INSERT INTO `xx_role` VALUES ('4028bc743ac000ea013ac00bc68c0000', '2012-11-02 15:35:28', '2012-11-02 15:35:28', '[\"ROLE_CARDS\",\"ROLE_CARDS_NOTIFY\",\"ROLE_CARDS_CATEGORY\",\"ROLE_CARDS_TYPE\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_WITHDRAW\",\"ROLE_PAYMENT\",\"ROLE_REFUND\",\"ROLE_SHIPPING\",\"ROLE_RESHIP\",\"ROLE_DELIVERY_CENTER\",\"ROLE_DELIVERY_TEMPLATE\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_COMMENT\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_PRINT_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_DELIVERY_TYPE\",\"ROLE_AREA\",\"ROLE_DELIVERY_CORP\",\"ROLE_BASE\"]', null, '', '管理员');

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
