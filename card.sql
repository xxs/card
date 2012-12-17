/*
Navicat MySQL Data Transfer

Source Server         : xxs
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : card

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-12-17 23:34:48
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
INSERT INTO `xx_admin` VALUES ('0731dcsoft2010031200000000000017', '2011-01-01 00:00:00', '2012-12-17 23:25:04', '技术部', 'xxs@163.com', '', '', '', '', '2012-12-17 14:28:34', '2012-12-17 23:25:04', '0', '127.0.0.1', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'admin');

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
  CONSTRAINT `fk_cards_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `xx_cards_category` (`id`),
  CONSTRAINT `fk_cards_category_cards_type` FOREIGN KEY (`cards_type_id`) REFERENCES `xx_cards_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_category
-- ----------------------------

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
INSERT INTO `xx_member` VALUES ('8a9182fc3ba86bc8013ba9782de60001', '2012-12-17 23:25:23', '2012-12-17 23:30:29', null, null, null, '0.00000', '123@qq.com', null, '', '', null, '2012-12-17 23:30:29', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4297f44b13955235245b2497399d7a93', null, null, '', '127.0.0.1', null, null, '0', '123123', null, '');

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
INSERT INTO `xx_member_rank` VALUES ('', null, '2012-12-17 23:25:57', '0', '', '0', '1级', '0', '0');
INSERT INTO `xx_member_rank` VALUES ('8a9182fc3ba86bc8013ba978ff870003', '2012-12-17 23:26:17', '2012-12-17 23:26:17', '100', '', '100', '2级', '100', '1111');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `fk_order_member` (`member_id`),
  KEY `fk_order_payment_config` (`payment_config_id`),
  CONSTRAINT `fk_order_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_item`;
CREATE TABLE `xx_order_item` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `card_num` longtext NOT NULL,
  `card_pwd` longtext NOT NULL,
  `cards_html_path` varchar(255) NOT NULL,
  `delivery_quantity` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,5) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_order` (`order_id`),
  KEY `fk_order_item_product` (`product_id`),
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `fk_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_item
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
  `discount` decimal(19,2) DEFAULT NULL,
  `memo` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK512B8EB9115DF6A7` (`payment_config_id`),
  KEY `fk_payment_discount_payment_config` (`payment_config_id`),
  KEY `fk_payment_Discount_brand` (`brand_id`),
  CONSTRAINT `fk_payment_Discount_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `FK512B8EB9115DF6A7` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `fk_payment_discount_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_discount
-- ----------------------------

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
